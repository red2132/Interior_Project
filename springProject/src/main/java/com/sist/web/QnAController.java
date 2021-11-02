package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;

@Controller
public class QnAController {
	@Autowired
	private QnADAO dao;
	
	//1. QandA 게시글 목록 출력
	@RequestMapping("qna/list1.do")
	public String qnaList(String page,Model model) {
		//1-1. 페이지 설정
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		int rowSize=5;
		int end=(rowSize*curpage);
		int start=end-rowSize+1;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<QnAVO> qnaList=dao.qnaBoardListData(map);
		
		//1-2. 페이지나누기
		int totalpage=dao.qnaBoardTotalPage();
		final int BLOCK=5;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		
		//1-3. MODEL이용하여 JSP에서 출력할 값 전송
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("BLOCK", BLOCK);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("main_jsp", "../qna/list.jsp");
		return "main/main";
	}
	
	//임시
	@RequestMapping("qna/list.do")
	public String list_do(Model model) {
		model.addAttribute("main_jsp", "../qna/list.jsp");
		return "main/main";
	}
	
}
