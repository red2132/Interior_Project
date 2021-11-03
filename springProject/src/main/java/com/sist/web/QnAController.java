package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;

@Controller
public class QnAController {
	@Autowired
	private QnADAO dao;
	
	//1. QandA 게시글 목록 출력
	@RequestMapping("qna/list.do")
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
	
	
	
	//2. Q&A 게시글 작성
	@RequestMapping("qna/insert.do")
	public String qnaBoardInsert(Model model) {
		model.addAttribute("main_jsp", "../qna/insert.jsp");
		return "main/main";
	}
	@PostMapping("qna/insert_ok.do")
	public String qnaBoardInsert_ok(QnAVO vo) {
		dao.qnaBoardInsert(vo);
		return "redirect:../qna/list.do";
	}
	
	
	//3. 상세보기
	@GetMapping("qna/detail.do")
	public String qnaBoardDetail(int page,int no,Model model) {
		model.addAttribute("main_jsp", "../qna/detail.jsp");
		return "main/main";
	}
	
	
	//4. 수정하기
	//4-1. 기존 게시글 데이터 읽어오기
	@GetMapping("qna/update.do")
	public String qna_update(int page,int no,Model model) {
		QnAVO vo=dao.qnaBoardUpdateData(no);
		
		model.addAttribute("vo",vo);
		model.addAttribute("page",page);
		model.addAttribute("main_jsp", "../qna/update.jsp");
		return "main/main";
	}
	//4-2. 비밀번호 일치여부 파악 후 실제 수정하기
	@RequestMapping("qna/update_ok.do")
	public String qna_update_ok() {
		
		return "return:../qna/detail.do";
	}
	
	
	
	//5. 삭제하기
	@GetMapping("qna/delete.do")
	public String qna_delete(int no,int page,Model model) {
		
		model.addAttribute("no",no);
		model.addAttribute("page",page);
		model.addAttribute("main_jsp","../qna/delete.jsp");
		return "main/main";
	}
	
	
}
