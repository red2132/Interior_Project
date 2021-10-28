package com.sist.web;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.NewItemDAO;
import com.sist.vo.NewItemVO;

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
	
	@RequestMapping("new/detail.do")
	public String detail(int no,Model model) {
		
		// 상품 정보
		NewItemVO vo=dao.nDetail(no);
		model.addAttribute("vo", vo);
		
		// 댓글
		
		
		model.addAttribute("main_jsp", "../new/detail.jsp");
		return "main/main";
	}
}
