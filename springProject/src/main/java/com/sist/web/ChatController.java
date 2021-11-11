package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {
   @RequestMapping("second/chat.do")
   public String chat_chat(String title,Model model)
   {
	   model.addAttribute("title",title);
	   return "second/chat";
   }
}
