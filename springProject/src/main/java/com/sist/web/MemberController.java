package com.sist.web;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.sist.dao.MemberDAO;
import com.sist.vo.MemberVO;

@Controller
@RequestMapping("member/")
public class MemberController {
	
   @Autowired
   private MemberDAO dao;
   
   
   @GetMapping("join.do")
   public String member_join(Model model)
   {
	   model.addAttribute("main_jsp", "../member/join.jsp");
	   return "main/main";
   }
   
   
   @PostMapping("login_ok.do")
   @ResponseBody
   public String member_login_ok(String id, String pwd, HttpSession session)
   {
	   String msg = "";
	   MemberVO vo = dao.isLogin(id, pwd);
	   if(vo.getMsg().equals("OK"))
	   {
		   session.setAttribute("id", vo.getId());
		   session.setAttribute("name", vo.getName());
	   }
	   msg = vo.getMsg();
	   return msg;
   }
   
   
   @GetMapping("logout.do")
   public String member_logout(HttpSession session)
   {
	   session.invalidate();
	   return "redirect:../main/main.do";
   }
   
   
   @PostMapping("join_ok.do")
   public String member_join_ok(MemberVO vo)
   {
	   vo.setTel(vo.getTel());
	   dao.memberInsert(vo);
	   return "redirect:../main/main.do";
   }
   
   
   @GetMapping("idcheck.do")
   @ResponseBody
   public String member_idcheck(String id)
   {
	   String msg = "";
	   int count = dao.memberIdCheck(id);
	   msg = String.valueOf(count);
	   return msg;
   }
   
   
   @GetMapping("join_delete.do")
   public String member_join_delete(HttpSession session)
   {
	   String id = (String)session.getAttribute("id");
	   dao.memberDelete(id);
	   session.invalidate();
	   return "member/delete";
   }
   
   
   @GetMapping("join_update.do")
   public String member_join_update(HttpSession session, Model model)
   {
	   String id = (String)session.getAttribute("id");
	   
	   MemberVO vo = dao.memberUpdateData(id);
	   String tel = vo.getTel();
	   tel = tel.substring(4);
	   vo.setTel(tel.trim());
	   model.addAttribute("vo", vo);
	   
	   model.addAttribute("main_jsp", "../member/join_update.jsp");
	   return "main/main";
   }
   
   @PostMapping("join_update_ok.do")
   public String member_join_update_ok(MemberVO vo, HttpSession session, Model model)
   {
	   vo.setTel(vo.getTel());
	   boolean bCheck = dao.memberJoinUpdate(vo);
	   if(bCheck == true)
	   {
		   session.setAttribute("name", vo.getName());
	   }
	   model.addAttribute("bCheck", bCheck);
	   return "member/join_update_ok";
   }

   
   @GetMapping("idfind.do")
   public String member_idfind(Model model)
   {
	   model.addAttribute("main_jsp", "../member/idfind.jsp");
	   return "main/main";
   }
   
   
   @PostMapping("idfind_tel_ok.do")
   @ResponseBody
   public String member_idfind_tel_ok(String tel)
   {
	   String msg = "";
	   msg = dao.memberIdFindTelData(tel);
	   return msg;
   }
   @PostMapping("idfind_email_ok.do")
   @ResponseBody
   public String member_idfind_email_ok(String email)
   {
	   String msg = "";
	   msg = dao.memberIdFindEmailData(email);
	   return msg;
   }
   
   
   @GetMapping("pwdfind.do")
   public String pwdfind(Model model)
   {
	   model.addAttribute("main_jsp", "../member/pwdfind.jsp");
	   return "main/main";
   }
   
   
   @PostMapping("pwdfind_find_ok.do")
   @ResponseBody
   public String member_pwdfind_ok(String id)
   {
	   String msg = "";
	   //DAO연결
	   msg = dao.memberPwdFindData(id);
	   return msg;
   }
   
}


