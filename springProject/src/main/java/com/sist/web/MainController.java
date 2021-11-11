package com.sist.web;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.NewItemDAO;
import com.sist.dao.SecondItemDAO;
import com.sist.vo.NewItemVO;

@Controller
public class MainController {
	@Autowired
	private NewItemDAO dao;
	@Autowired
	private SecondItemDAO sdao;
	
	@RequestMapping("main/main.do")
	public String main_main(Model model){
		List<String> cateList = dao.nCategory();
		List<String> secondCateList = sdao.sCategory();
		
		int row=3;
		int col=4;
		NewItemVO[][] ccArr = new NewItemVO[row][col];
		List<NewItemVO> l = dao.randData(row*col);
		for(int i=0;i<row;i++) {
			for(int j=0;j<col;j++) {
				ccArr[i][j]=l.get(i*col+j);
			}
		}
		model.addAttribute("ccArr",ccArr);
		
		model.addAttribute("cateList", cateList);
		model.addAttribute("secondCateList", secondCateList);
		model.addAttribute("main_jsp", "../main/home.jsp");
		return "main/main";
   }
}
