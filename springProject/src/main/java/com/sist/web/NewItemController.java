package com.sist.web;

import java.util.*;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.w3c.dom.Attr;

import com.sist.dao.NewItemDAO;
import com.sist.vo.NewItemVO;
import com.sist.vo.ReplyVO;

@Controller
public class NewItemController {
	@Autowired
	private NewItemDAO dao;
	
	@RequestMapping("new/list.do")
	public String list(String page,String cate1,String cate2,Model model) {
		List<String> cateList = dao.nCategory();
		model.addAttribute("cateList", cateList);
		
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		
		//세부 카테고
		List<String> cate2List = dao.nCategory2(cate1);
		if(cate2==null)
			cate2=cate2List.get(0);
		model.addAttribute("cate2List", cate2List);
		
		// 목록
		Map map=new HashMap();
		int n=9;
		int end=n*curpage;
		int start=end-n+1;
		map.put("start", start);
		map.put("end", end);
		map.put("cate1", cate1);
		map.put("cate2", cate2);
		List<NewItemVO> nList=dao.nList(map);
		
		// 상품 갯수
		int cnt = dao.itemCnt(map);
		
		// pagination
		int totalpage=dao.nTotalPage();
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		
		
		model.addAttribute("cate1", cate1);
		model.addAttribute("cate2", cate2);
		model.addAttribute("cnt", cnt);
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage",totalpage);
		model.addAttribute("BLOCK", BLOCK);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("nList", nList);
		model.addAttribute("main_jsp", "../new/list.jsp");
		
		return "main/main";
	}
	
	@RequestMapping("new/detail.do") // 해당 위치로 데이터를 보낸다
	public String detail(int no,String cate1, String cate2,Model model) {
		
		// 상품 정보
		NewItemVO vo=dao.nDetail(no);
		model.addAttribute("vo", vo);
		
		model.addAttribute("cate1",cate1);
		model.addAttribute("cate2",cate2);
		
		Map map = new HashMap();
		map.put("cate", "new");
		map.put("item_no", no);
		
		
		//베스트상품 정보
		//1-1. 해당 게시글의 cate1, cate2 정보 불러와서 String cate1, cate2값으로 집어넣기
		NewItemVO cateData=dao.newItemGetCategory(no);
		cate1=cateData.getCate1();
		cate2=cateData.getCate2();
		Map map2=new HashMap();
		map2.put("cate1", cate1);
		map2.put("cate2", cate2);
		//1-2. 해당 게시글의 cate1, cate2가 일치하는 가구 목록 불러오기
		List<NewItemVO> bestList=dao.bestItemListData(map2);
		model.addAttribute("cateData", cateData);
		model.addAttribute("bestList", bestList);
		
		
		
		// 댓글전체
		List<ReplyVO> rList = dao.replyData(map);
		model.addAttribute("rList", rList);
		
		// 댓글 개수
		int rCnt = dao.replyCnt(map);
		model.addAttribute("rCnt", rCnt);
		
		model.addAttribute("main_jsp", "../new/detail.jsp");
		return "main/main";
	}
	// 댓글입력
	@PostMapping("new/replyInsert.do")
	public String new_replyInsert(ReplyVO rvo,RedirectAttributes attr) {
		dao.replyInsert(rvo);
		attr.addAttribute("no",rvo.getItem_no());
		return "redirect:../new/detail.do";
	}
	//댓글삭제
	@GetMapping("new/replyDelete.do" ) 
		public String new_replyDelete(int no,int rno, RedirectAttributes attr)
	{	
		dao.replyDelete(rno);
		attr.addAttribute("no",no);
		return "redirect:../new/detail.do";
	}
	
	
	
}
