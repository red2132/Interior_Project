package com.sist.web;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.sist.dao.MemberDAO;
import com.sist.vo.MemberVO;

@Controller
@RequestMapping("page/")
public class PageController {
	
   @Autowired
   private MemberDAO dao;
   
   
   
   @GetMapping("mypage.do")
   public String page_mypage(Model model)
   {
	   model.addAttribute("main_jsp", "../page/mypage.jsp");
	   return "main/main";
   }
   
}


