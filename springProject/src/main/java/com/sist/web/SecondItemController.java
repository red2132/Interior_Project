package com.sist.web;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.*;
import com.sist.vo.*;

@Controller
public class SecondItemController {
	@Autowired
	private SecondItemDAO dao;
	
	@RequestMapping("second/list.do")
	public String second_list(String page,String cate1,String cate2,String cate3,Model model) {
		List<String> secondCateList = dao.sCategory();
		model.addAttribute("secondCateList", secondCateList);
		
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		

		//세부 카테고
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
		int rowSize=9;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=(rowSize*curpage);
		map.put("start", start);
		map.put("end", end);
		map.put("cate1", cate1);
		map.put("cate2", cate2);
		map.put("cate3", cate3);
		List<SecondItemVO> clist=dao.secondListData(map);
		
		List<SecondItemVO> pASClist=dao.secondItemPriceASC(map);
		model.addAttribute("pASClist",pASClist);
		
		// 상품 갯수
		int cnt = dao.secondItemCnt(map);
		
		// pagination
		int totalpage=dao.secondItemTotalPage(map);
		final int BLOCK=5;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		
		model.addAttribute("cate1", cate1);
		model.addAttribute("cate2", cate2);
		model.addAttribute("cate3", cate3);
		model.addAttribute("cnt", cnt);
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage",totalpage);
		model.addAttribute("BLOCK", BLOCK);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("clist", clist);
		model.addAttribute("main_jsp", "../second/list.jsp");
		
		
		
		return "main/main";
				
	}		
	
	 @RequestMapping("second/find.do")
	   public String second_find(String[] fs,String ss,String page,String cate1,Model model)
	   {
		   // DAO => SQL문장 
		 	List<String> secondCateList = dao.sCategory();
			model.addAttribute("secondCateList", secondCateList);
			
//		 if(page==null)
//				page="1";
//			int curpage=Integer.parseInt(page);
		   Map map=new HashMap();
//		    int rowSize=9;
//			int start=(rowSize*curpage)-(rowSize-1);
//			int end=(rowSize*curpage);
//			map.put("start", start);
//			map.put("end", end);
		    map.put("fsArr", fs);
		    map.put("ss", ss);
		   List<SecondItemVO> flist=dao.secondItemFindData(map);
		   
//		   int totalpage=dao.foodFindTotalPage(map);
//			final int BLOCK=5;
//			int startPage=((curpage-1)/BLOCK*BLOCK)+1;
//			int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
//			if(endPage>totalpage)
//				endPage=totalpage;
		    int fcnt = dao.secondItemFindcnt(map);
			
			model.addAttribute("fsArr",fs);
			model.addAttribute("ss",ss);
			model.addAttribute("fcnt", fcnt);
//			model.addAttribute("curpage", curpage);
//			model.addAttribute("totalpage",totalpage);
//			model.addAttribute("BLOCK", BLOCK);
//			model.addAttribute("startPage",startPage);
//			model.addAttribute("endPage", endPage);
		   model.addAttribute("flist", flist);
		   model.addAttribute("main_jsp", "../second/find.jsp");
	
		   return "main/main";
	   }	
}
