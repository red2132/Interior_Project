package com.sist.web;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.NewItemDAO;
import com.sist.vo.NewItemVO;

@Controller
public class MainController {
	@Autowired
	private NewItemDAO dao;
	
	@RequestMapping("main/main.do")
	public String main_main(Model model){
		List<String> cateList = dao.nCategory();
		model.addAttribute("cateList", cateList);
		model.addAttribute("main_jsp", "../main/home.jsp");
		return "main/main";
   }
}
