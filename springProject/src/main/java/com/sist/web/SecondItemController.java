package com.sist.web;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sist.dao.*;
import com.sist.vo.*;

@Controller
public class SecondItemController {
	@Autowired
	private SecondItemDAO dao;

	@RequestMapping("second/list.do")
	public String second_list(String cate1,String cate2,String cate3,Model model) {
		List<String> secondCateList = dao.sCategory();
		model.addAttribute("secondCateList", secondCateList);

		//세부 카테고리
		List<String> secondCate2List = dao.sCategory2(cate1);
		if(cate2==null)
			cate2=secondCate2List.get(0);
		model.addAttribute("secondCate2List", secondCate2List);
		
		List<String> secondCate3List = dao.sCategory3(cate2);
		if(cate3==null)
			cate3=secondCate3List.get(0);
		model.addAttribute("secondCate3List", secondCate3List);
		
		// 목록		
		Map map=new HashMap();
		map.put("cate1", cate1);
		map.put("cate2", cate2);
		map.put("cate3", cate3);
		
		List<SecondItemVO> rlist=dao.recommendData(map);
		model.addAttribute("rlist",rlist);
		// 상품 갯수
		int cnt = dao.secondItemCnt(map);
		
		model.addAttribute("cate1", cate1);
		model.addAttribute("cate2", cate2);
		model.addAttribute("cate3", cate3);
		model.addAttribute("cnt", cnt);
		model.addAttribute("main_jsp", "../second/list.jsp");
				
		return "main/main";				
	}

	@RequestMapping("second/find.do")
	   public String second_find(String[] fs,String ss,String page,String cate1,Model model)
	   {
		   // DAO => SQL문장 
		 	List<String> secondCateList = dao.sCategory();
			model.addAttribute("secondCateList", secondCateList);
			

		   Map map=new HashMap();
		    map.put("fsArr", fs);
		    map.put("ss", ss);
		   List<SecondItemVO> flist=dao.secondItemFindData(map);
		   
		    int fcnt = dao.secondItemFindcnt(map);
			
			model.addAttribute("fsArr",fs);
			model.addAttribute("ss",ss);
			model.addAttribute("fcnt", fcnt);
		    model.addAttribute("flist", flist);
		    model.addAttribute("main_jsp", "../second/find.jsp");
	
		    return "main/main";
	   }

	// 상세페이지 댓글, ...
	@RequestMapping("second/detail.do")
	public String second_detail(Model model, int no, HttpSession session) {
		SecondItemVO vo = dao.secondItemData(no);
		model.addAttribute("vo", vo);
		
		Map map = new HashMap();
		map.put("cate", "second");
		map.put("item_no", no);
		// 댓글 전체
		List<ReplyVO> rList = dao.replyData(map);
		model.addAttribute("rList", rList);
		// 댓글 개수
		int rCnt = dao.replyCnt(map);
		model.addAttribute("rCnt", rCnt);
		model.addAttribute("main_jsp", "../second/detail.jsp");
		return "main/main";
	}

	// 댓글입력
	@PostMapping("second/replyInsert.do")
	public String second_replyInsert(ReplyVO rvo, RedirectAttributes attr) {
		dao.replyInsert(rvo);
		attr.addAttribute("no", rvo.getItem_no());
		return "redirect:../second/detail.do";
	}

	// 댓글삭제
	@GetMapping("second/replyDelete.do")
	public String second_replyDelete(int no, int rno, RedirectAttributes attr) {
		dao.replyDelete(rno);
		attr.addAttribute("no", no);
		return "redirect:../second/detail.do";
	}

	// 댓글수정
	@PostMapping("second/replyUpdate.do")
	public String second_replyUpdate(int no,String content,int rno, RedirectAttributes attr) {
		Map map = new HashMap();
		map.put("content", content);
		map.put("no", rno);
		dao.replyUpdate(map);
		attr.addAttribute("no", no);
		return "redirect:../second/detail.do";
	}
}
