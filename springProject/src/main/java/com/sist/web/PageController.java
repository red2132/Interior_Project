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
   
   @GetMapping("adminpage.do")
   public String page_adminpage(Model model)
   {
	   model.addAttribute("main_jsp", "../page/adminpage.jsp");
	   return "main/main";
   }
   
   @GetMapping("mycartpage.do")
   public String page_mycartpage(Model model)
   {
	   model.addAttribute("main_jsp", "../page/mycartpage.jsp");
	   return "main/main";
   }
   
   @GetMapping("mybuypage.do")
   public String page_mybuypage(Model model)
   {
	   model.addAttribute("main_jsp", "../page/mybuypage.jsp");
	   return "main/main";
   }
   
   @GetMapping("mysellpage.do")
   public String page_mysellpage(Model model)
   {
	   model.addAttribute("main_jsp", "../page/mysellpage.jsp");
	   return "main/main";
   }
   
   @GetMapping("myinterestpage.do")
   public String page_myinterestpage(Model model)
   {
	   model.addAttribute("main_jsp", "../page/myinterestpage.jsp");
	   return "main/main";
   }
}


