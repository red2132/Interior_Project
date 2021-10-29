package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.CommunityDAO;
import com.sist.vo.CommunityVO;

@Controller
public class CommunityController {
	@Autowired
	private CommunityDAO dao;
	
	@RequestMapping("comm/list.do")
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
	@RequestMapping("comm/detail.do")
	public String detail(int no,Model model)
	{		
		// 목록 정보
		CommunityVO vo=dao.cDetail(no);
		model.addAttribute("vo", vo);
		model.addAttribute("main_jsp", "../comm/detail.jsp");
		return "main/main";
	}

}
