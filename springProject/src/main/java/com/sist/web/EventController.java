package com.sist.web;

import java.io.*;
import java.net.URLEncoder;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.CookieValue;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.dao.*;
import com.sist.vo.*;

@Controller
@RequestMapping("event/")
public class EventController {
	@Autowired
	private EventDAO dao;
	
	// 목록 
	@RequestMapping("list.do")
	public String event_list(String page, Model model, HttpServletRequest request) {
		
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		int rowSize=10; // 목록 개수
		int start=(rowSize*curpage)-(rowSize-1);
		int end=(rowSize*curpage);
		map.put("start", start);
		map.put("end", end);
		List<EventVO> list=dao.eventListData(map);
		
		// 총 페이지
		int totalpage=dao.eventTotalPage();
		final int BLOCK=5;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		
		model.addAttribute("list", list);
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("BLOCK", BLOCK);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("main_jsp","../event/list.jsp");
		// 쿠키
		Cookie[] cookies=request.getCookies();
		List<EventVO> cList=new ArrayList<EventVO>();
		
		if(cookies!=null && cookies.length>0)
		   {
			   for(int i=cookies.length-1;i>=0;i--)
			   {
				   if(cookies[i].getName().startsWith("event"))
				   {
					   cookies[i].setPath("/");
					   String no=cookies[i].getValue();
					   EventVO vo=dao.eventDetailData(Integer.parseInt(no));
					   cList.add(vo);
				   }
			   }
		   }
		model.addAttribute("cList", cList);
		return "main/main";
	}
	
	// 상세보기
	@RequestMapping("detail.do")
	public String event_detail(int no,int page, Model model)
	{
		EventVO vo=dao.eventDetailData(no);
    	if(vo.getFilecount()>0) // 오류 방지 (예외처리 => 프로그램에서 구현이 어려운 상태)
    	{
	    	List<String> fList=new ArrayList<String>();
	    	List<String> sList=new ArrayList<String>();
	    	
	    	StringTokenizer st1=new StringTokenizer(vo.getFilename(),",");
	    	while(st1.hasMoreTokens())
	    	{
	    		fList.add(st1.nextToken());
	    	}
	    	
	    	st1=new StringTokenizer(vo.getFilesize(),",");
	    	while(st1.hasMoreTokens())
	    	{
	    		sList.add(st1.nextToken());
	    	}
	    	model.addAttribute("fList", fList);// a.jpg(1000bytes)
	    	model.addAttribute("sList", sList);
    	}
    	// 댓글
    	List<HouseReplyVO> list=dao.eventReplyListData(no);
    	model.addAttribute("list",list);
    	
    	// 댓글 갯수
    	int rcnt=dao.eventReplyCount(no);
    	model.addAttribute("rcnt",rcnt);
    	
		model.addAttribute("vo",vo);
		model.addAttribute("page",page);
		model.addAttribute("main_jsp","../event/detail.jsp");
		return "main/main";
	}
	
	// 글쓰기 폼
	@GetMapping("insert.do")
	public String event_insert(Model model)
	{
		model.addAttribute("main_jsp","../event/insert.jsp");
		return "main/main";
	}
	
	// 작성 값 전송 및 첨부파일 업로드
	@PostMapping("insert_ok.do")
	public String event_insert_ok(EventVO vo) throws Exception
	{
		File dir=new File("C:\\download"); // 파일 업로드 저장 폴더
    	if(!dir.exists())
    	{
    		dir.mkdir();
    	}
    	// 데이터 받기 
    	// 파일 
    	List<MultipartFile> list=vo.getFiles(); // 임시 저장 장소 (파일을 이동=> c:\\download)
    	String files="";
    	String sizes="";
    	// 업로드 => NOT NULL(X) => 올린/올리지 않은 경우 
    	if(list!=null && list.size()>0) // 파일을 업로드 한 경우 
    	{
	    	for(MultipartFile mf:list) // download로 이동 
	    	{
	    		String fn=mf.getOriginalFilename(); // 사용자가 올린 파일명 
	    		File file=new File("c:\\download\\"+fn);
	    		mf.transferTo(file); // 업로드 라이브러리 
	    		files+=fn+","; 
	    		sizes+=file.length()+","; 
	    	}
	    	vo.setFilename(files.substring(0,files.lastIndexOf(",")));
	    	vo.setFilesize(sizes.substring(0,sizes.lastIndexOf(",")));
	    	vo.setFilecount(list.size());
    	}
    	// /web/login/admin/1234
    	// https://sports.v.daum.net/v/20211012164726694  v?date=20211012164726694
    	// RedirectAttribute => sendRedirect
    	else // 업로드 안한 상태
    	{
    		vo.setFilename("");
    		vo.setFilesize("");
    		vo.setFilecount(0);
    	}
		// 기간 입력 받기
		vo.setPeriod(vo.getPeriod1()+"~"+vo.getPeriod2());
		// 입력폼 전송
		dao.eventInsert(vo);
		return "redirect:list.do";
	}
	
	// 다운로드
	@RequestMapping("download.do")
	public void event_download(String fn,HttpServletResponse response)
	{
		try
    	{
    		String path="C:\\download";
    		// 다운로드 창을 보여준다
    		File file=new File(path+"\\"+fn);
    		response.setContentLength((int)file.length());
    		response.setHeader("Content-Disposition", "attachment;filename="
    				     +URLEncoder.encode(fn, "UTF-8"));
    		// 실제 다운로드 완료
    		BufferedInputStream bis=new BufferedInputStream(new FileInputStream(file));
    		BufferedOutputStream bos=new BufferedOutputStream(response.getOutputStream());
    		byte[] buffer=new byte[1024];
    		int i=0;
    		while((i=bis.read(buffer, 0, 1024))!=-1)
    		{
    			bos.write(buffer, 0, i);
    		}
    		bis.close();
    		bos.close();
    	}catch(Exception ex){}
	}
	
	// 수정 폼 및 이전에 입력한 값 불러오기
	@RequestMapping("update.do")
	public String event_update(int no,int page,Model model)
	{
		// 이전에 입력한 데이터 가져오기
		EventVO vo=dao.eventDetailData(no);
		String period=vo.getPeriod();
		String[] arr=period.split("~");
		String period1=arr[0];
		String period2=arr[1];
		
		
		model.addAttribute("period1",period1);
		model.addAttribute("period2",period2);
		model.addAttribute("vo",vo);
		model.addAttribute("page",page);
		model.addAttribute("main_jsp", "../event/update.jsp");
		return "main/main";
	}
	
	// 글삭제
	@RequestMapping("delete.do")
	public String event_delete(int no,int page,Model model)
	{
		model.addAttribute("no", no);
		model.addAttribute("page",page);
		model.addAttribute("main_jsp", "../event/delete.jsp");
		return "main/main";
	}
	
	// 댓글
	// 댓글 목록 => 글 상세보기
	// 댓글 추가
	@PostMapping("reply_insert.do")
	public String event_reply_insert(int page,HouseReplyVO vo,HttpSession session,
			RedirectAttributes attr)
	{
		String id=(String)session.getAttribute("id");
		String name=(String)session.getAttribute("name"); 
		vo.setId(id);
		vo.setName(name);
		dao.eventReplyInsert(vo);
		attr.addAttribute("no", vo.getBno());
		attr.addAttribute("page", page);
		return "redirect:../event/detail.do";
	}
	
	// 댓글 수정
	@PostMapping("reply_update.do")
	public String event_reply_update(HouseReplyVO vo,int page,RedirectAttributes attr)
	{
		 dao.eventReplyUpdate(vo);
		 attr.addAttribute("no", vo.getBno());
		 attr.addAttribute("page", page);
		 return "redirect:../event/detail.do";
	}
	
	// 대댓글 추가
	@PostMapping("reply_reply_insert.do")
	public String event_reply2_insert(int pno,int bno,int page,String msg,
			HttpSession session,RedirectAttributes attr)
	{
		   // 댓글 -댓글 처리 
		   HouseReplyVO vo=new HouseReplyVO(); 
		   String id=(String)session.getAttribute("id");
		   String name=(String)session.getAttribute("name");
		   vo.setMsg(msg);
		   vo.setId(id);
		   vo.setName(name);
		   vo.setBno(bno);
		   // group_id , group_step , group_tab , root , depth : DAO
		   // 상세보기로 다시 이동 
		   dao.eventReplyReplyInsert(pno, vo);
		   attr.addAttribute("no", bno);
		   attr.addAttribute("page", page);
		   return "redirect:../event/detail.do";
	}
	
	// 댓글 삭제
	@GetMapping("reply_delete.do")
	public String event_reply_delete(int no,int bno,int page,RedirectAttributes attr)
	{
		   dao.eventReplyDelete(no);
		   attr.addAttribute("no", bno);
		   attr.addAttribute("page", page);
		   return "redirect:../event/detail.do";
	}
	
	// 쿠키
	@GetMapping("detail_before.do")
	public String event_detail_before(int no, int page, RedirectAttributes attr, HttpServletResponse response)
	{
		Cookie cookie=new Cookie("event"+no, String.valueOf(no));
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);
		attr.addAttribute("no", no);
		attr.addAttribute("page",page);
		return "redirect:../event/detail.do";
	}
	
	// 쿠키 삭제
	@GetMapping("event_cookie_delete.do")
	public String event_cookie_delete(HttpServletRequest request, HttpServletResponse response)
	{
		Cookie[] cookies=request.getCookies();
		if(cookies!=null && cookies.length>0)
		{
			for(int i=0;i<cookies.length;i++)
			{
				if(cookies[i].getName().startsWith("event"))
				{
					cookies[i].setPath("/");
					cookies[i].setMaxAge(0);
					response.addCookie(cookies[i]);
				}
			}
		}
		return "redirect:../event/list.do";
	}
	
	// 검색
	@RequestMapping("find.do")
	public String event_find(String[] fs, String ss, Model model)
	{
		
		Map map=new HashMap();
		map.put("ss", ss);
		map.put("fsArr", fs);
		List<EventVO> flist=dao.eventFindData(map);
		int fcnt=dao.eventFindCount(map);
		model.addAttribute("fsArr",fs);
		model.addAttribute("ss",ss);
		model.addAttribute("fcnt", fcnt);
		model.addAttribute("flist",flist);
		model.addAttribute("main_jsp", "../event/find.jsp");
		return "main/main";
	}
}
