package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import java.util.*;
import javax.servlet.http.HttpSession;
import com.sist.dao.*;
import com.sist.vo.*;

@Controller
@RequestMapping("qna/")
public class QnAController {
	@Autowired
	private QnADAO dao;
	
	//1. Q&A 게시글 목록 출력
	@GetMapping("list.do")
	public String qnaList(String page,Model model) {
		//1-1. 페이지 설정
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		int rowSize=10;
		int end=(rowSize*curpage);
		int start=end-rowSize+1;
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
	@RequestMapping("insert.do")
	public String qnaBoardInsert(Model model) {
		model.addAttribute("main_jsp", "../qna/insert.jsp");
		return "main/main";
	}
	@PostMapping("qna/insert_ok.do")
	public String qnaBoardInsert_ok(QnAVO vo) {
		dao.qnaBoardInsert(vo);
		return "redirect:../qna/list.do";
	}
	
	
	//3. Q&A 게시글/답변게시글 상세보기
	@GetMapping("detail.do")
	public String qnaBoardDetail(int page,int no,Model model) {
		//1. 게시물 상세보기 데이터 전송
		QnAVO vo=dao.qnaBoardDetailData(no);
		//2. 게시물의 댓글 전송
//		List<QnaReplyVO> list=dao.qnaBoardReplyList(no);
		
		model.addAttribute("vo",vo);
//		model.addAttribute("list",list);
		model.addAttribute("page",page);
		model.addAttribute("main_jsp", "../qna/detail.jsp");
		return "main/main";
	}
	
	
	//4. Q&A 게시글/답변게시글 수정하기
	//4-1. 기존 게시글 데이터 읽어오기
	@GetMapping("update.do")
	public String qna_update(int page,int no,Model model) {
		QnAVO vo=dao.qnaBoardUpdateData(no);
		
		model.addAttribute("vo",vo);
		model.addAttribute("no",no);
		model.addAttribute("page",page);
		model.addAttribute("main_jsp", "../qna/update.jsp");
		return "main/main";
	}
	//4-2. 비밀번호 일치여부 파악 후 실제 수정하기
	@GetMapping("update_ok.do")
	@ResponseBody
	public String qna_update_ok(int page,QnAVO vo) {
		int no=0;
		no=dao.qnaBoardUpdate(vo);
		return String.valueOf(no);
	}
	
	
	
	//5. Q&A 게시글/답변게시글 삭제하기
	@GetMapping("delete.do")
	public String qna_delete(int no,int page,Model model) {
		
		model.addAttribute("no",no);
		model.addAttribute("page",page);
		model.addAttribute("main_jsp","../qna/delete.jsp");
		return "main/main";
	}
	
	
	
	//6. Q&A 답변게시글 작성
	//6-1. 답변게시글 작성폼
	@GetMapping("reply.do")
	public String ReplyBoardInsert(int no,int page,Model model) {
		QnAVO vo=dao.qnaBoardDetailData(no);
		model.addAttribute("vo",vo);
		model.addAttribute("no",no);
		model.addAttribute("page",page);
		model.addAttribute("main_jsp","../qna/reply.jsp");
		return "main/main";
	}
	//6-2. 실제 답변게시글 작성하기
	@PostMapping("reply_ok.do")
	public String ReplyBoardInsert_ok(int pno,int page,QnAVO vo,RedirectAttributes attr) {
		dao.qnaBoardReplyBoardInsert(pno, vo);
		attr.addAttribute("page", page);
		return "redirect:../qna/list.do";
	}
	
	
	
	
	////////////////////////////////////////////////
	
	//2. 댓글 추가
	@PostMapping("reply_insert.do")
	public String qna_reply_insert(int page,QnaReplyVO vo,HttpSession session,RedirectAttributes attr) {
		//2-1. 오라클에 id, name 추가
		String id=(String)session.getAttribute("id");
		String name=(String)session.getAttribute("name");
		vo.setId(id);
		vo.setName(name);
		dao.qnaBoardReplyInsert(vo);
		
		attr.addAttribute("no",vo.getBno());
		attr.addAttribute("page",page);
		return "redirect:../qna/detail.do";
	}
	
	//3. 댓글 수정
	@PostMapping("reply_update.do")
	public String qna_reply_update(int page,QnaReplyVO vo,RedirectAttributes attr) {
		//1. dao 연결
		dao.qnaBoardReplyUpdate(vo);
		
		attr.addAttribute("no", vo.getBno());
		attr.addAttribute("page",page);
		return "redirect:../qna/detail.do";
	}
	
	//4. 대댓글
	@PostMapping("reply_reply_insert.do")
	public String qna_reply_reply_insert(int pno,int bno,int page,String msg,HttpSession session,RedirectAttributes attr) {
		//1. dao 연결
		QnaReplyVO vo=new QnaReplyVO();
		String id=(String)session.getAttribute("id");
		String name=(String)session.getAttribute("name");
		vo.setId(id);
		vo.setName(name);
		vo.setMsg(msg);
		vo.setBno(bno);
		//2. g_id,g_step,g_tab,root,depth 수정
		dao.qnaBoareReplyReplyInsert(pno, vo);
		
		attr.addAttribute("no", bno);
		attr.addAttribute("page",page);
		return "redirect:../qna/detail.do";
	}
	
	
	//5. 댓글 삭제
	@GetMapping("reply_delete.do")
	public String qna_reply_delete(int no,int bno,int page,RedirectAttributes attr) {
		//1. dao 연동
		dao.qnaBoardReplyDelete(no);
		attr.addAttribute("no", bno);
		attr.addAttribute("page",page);
		return "redirect:../qna/detail.do";
	}
}
