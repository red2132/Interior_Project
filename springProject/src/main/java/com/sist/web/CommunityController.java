package com.sist.web;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sist.dao.CommunityDAO;
import com.sist.vo.CommunityVO;

@Controller
public class CommunityController {
	public static void main(String[] args) {
		
	}
	
	@Autowired
	private CommunityDAO dao;
	
	@GetMapping("comm/list.do")
	public String clist(String page,Model model)
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
		model.addAttribute("main_jsp", "../comm/list.jsp");
		return "main/main";
	}
	
	//상세보기
	@GetMapping("comm/detail.do")
	public String detail(int no, int page, Model model)
	{		
		// 목록 정보
		CommunityVO vo=dao.cDetail(no);
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
	    	vo.setFilename(files.substring(0,files.lastIndexOf(",")));
	    	vo.setFilesize(sizes.substring(0,sizes.lastIndexOf(",")));
    	}
    	else
    	{
    		vo.setFilename("");
    		vo.setFilesize("");
    	}
		dao.communityInsert(vo);
		return "redirect:list.do";
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
	public String update_ok(CommunityVO vo)
	{
		boolean bCheck=dao.communityUpdate(vo);
		String js="";
		if(bCheck==true)
		{
			js="<script>"
		      +"location.href=\"detail.do?no="+vo.getNo()+"\""
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
	@GetMapping("comm/delete.do")
	public String delete(int no,Model model)
	{
		model.addAttribute("no", no);
		return "main/main";
	}
	@PostMapping("board/delete_ok.do")
	public String board_delete_ok(int no,String pwd,Model model,HttpServletRequest request)
	{
		 
		// Model model => JSP값을 전송하는 객체 (request)
		boolean bCheck=dao.communityDelete(no, pwd);
		model.addAttribute("bCheck", bCheck); 
		return "board/delete_ok";
	}
}
