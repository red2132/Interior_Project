package com.sist.web;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sist.dao.CommunityDAO;
import com.sist.vo.CommReplyVO;
import com.sist.vo.CommunityVO;

@Controller
public class CommunityController {
	public static void main(String[] args) {
		
	}
	
	@Autowired
	private CommunityDAO dao;
	
	@GetMapping("comm/list.do")
	public String clist(String page,Model model,HttpServletRequest request)
	{
		//목록
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		int rowSize=5;
		int end=rowSize*curpage;
		int start=end-rowSize+1;
		map.put("start", start);
		map.put("end", end);
		List<CommunityVO> cList=dao.cList(map);
		
		//페이지 나누기
		int totalpage=dao.cTotalPage();
		final int BLOCK=5;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		
		
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage",totalpage);
		model.addAttribute("BLOCK", BLOCK);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("cList", cList);
		
		
		Cookie[] cookies=request.getCookies();
		List<CommunityVO> ccList=new ArrayList<CommunityVO>();
		   if(cookies!=null && cookies.length>0) //쿠키에 값이 존재 할때
		   {
			   for(int i=cookies.length-1;i>=0;i--) // 저장된 역순으로 (최신)
			   {
				   System.out.println(cookies[i].getName());
				   if(cookies[i].getName().startsWith("c"))
				   {					  
					   String no=cookies[i].getValue(); // 번호 
					   CommunityVO vo=dao.cDetail(Integer.parseInt(no));
					   ccList.add(vo);
				   }
			   }
		   }
		model.addAttribute("ccList",ccList);
		model.addAttribute("main_jsp", "../comm/list.jsp");
		return "main/main";
	}
	//쿠키 저장
	@GetMapping("comm/detail_before.do")
	public String detail_before(int no,int page, HttpServletResponse response,RedirectAttributes attr)
	{
		Cookie cookie=new Cookie("c"+no,String.valueOf(no));
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);
		attr.addAttribute("no",no);
		attr.addAttribute("page",page);
		return "redirect:../comm/detail.do";
	}
	
	//상세보기
	@GetMapping("comm/detail.do")
	public String detail(int no, int page, Model model)
	{		
		// 목록 정보
		//1. 게시물 상세보기 데이터
		CommunityVO vo=dao.cDetail(no);
		//2. 댓글 데이터
		List<CommReplyVO> rList=dao.replyListData(no);
		
		model.addAttribute("rList",rList);
		model.addAttribute("page",page);
		model.addAttribute("vo", vo);
		model.addAttribute("main_jsp", "../comm/detail.jsp");
		return "main/main";
	}
	
	//글쓰기
	@GetMapping("comm/insert.do")
	public String insert(Model model)
	{
		model.addAttribute("main_jsp","../comm/insert.jsp");
		return "main/main";
	}
	
	@PostMapping("comm/insert_ok.do")
	public String insert_ok(CommunityVO vo) throws Exception
	{
		File dir=new File("c:\\download");
    	if(!dir.exists())
    	{
    		dir.mkdir();
    	}

    	List<MultipartFile> list=vo.getFiles(); 
    	String files="";
    	String sizes="";
    	if(list!=null && list.size()>0) 
    	{
	    	for(MultipartFile mf:list) 
	    	{
	    		String fn=mf.getOriginalFilename();
	    		File file=new File("c:\\download\\"+fn);
	    		mf.transferTo(file);
	    		files+=fn+","; 
	    		sizes+=file.length()+",";
	    	}
	    	vo.setFilename("c:\\download\\"+files.substring(0,files.lastIndexOf(",")));
	    	vo.setFilesize(sizes.substring(0,sizes.lastIndexOf(",")));
    	}
    	else
    	{
    		vo.setFilename("");
    		vo.setFilesize("");
    	}
		dao.communityInsert(vo);
		return "redirect:../comm/list.do";
	}
	
	//수정하기
	@GetMapping("comm/update.do")
	public String update(int no,int page,Model model)
	{
		CommunityVO vo=dao.commUpdateDataRead(no);
		model.addAttribute("vo",vo);
		model.addAttribute("page",page);
		model.addAttribute("main_jsp","../comm/update.jsp");
		return "main/main";		
	}
	
	@PostMapping("comm/update_ok.do")
	@ResponseBody
	public String update_ok(int page,CommunityVO vo)
	{
		boolean bCheck=dao.communityUpdate(vo);
		String js="";
		if(bCheck==true)
		{
			js="<script>"
		      +"location.href=\"../comm/detail.do?no="+vo.getNo()+"&page="+page+"\";"
		      +"</script>";
		}
		else
		{
			js="<script>"
			  +"alert(\"비밀번호가 틀립니다...\");"
			  +"history.back();"
			  +"</script>";
		}
		return js;
	}
	
	//삭제
	@GetMapping("comm/delete_ok.do")
	@ResponseBody  
	   public String delete_ok(int no,String pwd)
	   {
		    System.out.println(no);
		    System.out.println(pwd);
		   int result=0;
		   result=dao.communityDelete(no, pwd);		 
		   return String.valueOf(result);
	   }
	
	//필터
	@PostMapping("comm/filter.do")
	 public String board_find(String fs1,String fs2,String fs3,Model model,HttpServletRequest request)
    {
		System.out.println("filter.do");
    	Map map=new HashMap();
    	map.put("fs1", fs1);
    	map.put("fs2", fs2);
    	map.put("fs3", fs3);
    	List<CommunityVO> flist=dao.communityFilter(map);
    	
    	String number=dao.numberFind(map);
    	
    	Cookie[] cookies=request.getCookies();
		List<CommunityVO> ccList=new ArrayList<CommunityVO>();
		   if(cookies!=null && cookies.length>0) //쿠키에 값이 존재 할때
		   {
			   for(int i=cookies.length-1;i>=0;i--) // 저장된 역순으로 (최신)
			   {
				   System.out.println(cookies[i].getName());
				   if(cookies[i].getName().startsWith("c"))
				   {					  
					   String no=cookies[i].getValue(); // 번호 
					   CommunityVO vo=dao.cDetail(Integer.parseInt(no));
					   ccList.add(vo);
				   }
			   }
		   }
		model.addAttribute("ccList",ccList);

    	model.addAttribute("flist", flist);
    	model.addAttribute("number",number);
    	model.addAttribute("main_jsp","../comm/filter_ok.jsp");
		
		return "main/main";
	}
	
	//태그검색
	@GetMapping("comm/tag.do")
	public String tag(String tag,Model model,HttpServletRequest request)
	{
		List<CommunityVO> tList=dao.communityTag(tag);
		
		String number=dao.numberTagFind(tag);
		
		Cookie[] cookies=request.getCookies();
		List<CommunityVO> ccList=new ArrayList<CommunityVO>();
		   if(cookies!=null && cookies.length>0) //쿠키에 값이 존재 할때
		   {
			   for(int i=cookies.length-1;i>=0;i--) // 저장된 역순으로 (최신)
			   {
				   System.out.println(cookies[i].getName());
				   if(cookies[i].getName().startsWith("c"))
				   {					  
					   String no=cookies[i].getValue(); // 번호 
					   CommunityVO vo=dao.cDetail(Integer.parseInt(no));
					   ccList.add(vo);
				   }
			   }
		   }
		model.addAttribute("ccList",ccList);
		
		model.addAttribute("tList",tList);
		model.addAttribute("number",number);
		model.addAttribute("main_jsp","../comm/tag_ok.jsp");
		return "main/main";
	}	
////////////////////////~여기서부터 댓글~/////////////////////////////////////////////
	
	//댓글 입력
	@PostMapping("comm/reply_insert.do")
	public String reply_insert(int page,CommReplyVO vo,HttpSession session,
			RedirectAttributes attr)
	{
		String id=(String)session.getAttribute("id");
		vo.setId(id);
		dao.replyInsert(vo);
		
		attr.addAttribute("no",vo.getBno());
		attr.addAttribute("page",page);
		return "redirect:../comm/detail.do";
	}
	
	//댓글 수정
	@PostMapping("comm/reply_update.do")
	public String reply_update(int page,CommReplyVO vo,RedirectAttributes attr)
	{
		dao.replyUpdate(vo);
		attr.addAttribute("no",vo.getBno());
		attr.addAttribute("page",page);
		return "redirect:../comm/detail.do";
	}
	
	//대댓글 입력
	@PostMapping("comm/reply_reply_insert.do")
	public String reply2_insert(int pno,int bno, int page, String msg,
			HttpSession session, RedirectAttributes attr)
	{
		CommReplyVO vo=new CommReplyVO();
		String id=(String)session.getAttribute("id");
		vo.setMsg(msg);
		vo.setId(id);
		vo.setBno(bno);
		
		dao.replyreplyInsert(pno, vo);
		attr.addAttribute("no",bno);
		attr.addAttribute("page",page);
		return "redirect:../comm/detail.do";
	}
	
	//댓글 삭제
	@GetMapping("comm/reply_delete.do")
	public String reply_delete(int no,int bno, int page, RedirectAttributes attr)
	{
		dao.replyDelelte(no);
		attr.addAttribute("no",bno);
		attr.addAttribute("page",page);
		return "redirect:../comm/detail.do";
	}
	
	
}
