package com.sist.web;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.*;
import com.sist.vo.*;

@RestController
@RequestMapping("event/")
public class EventRestController {
	@Autowired
	private EventDAO dao;
	
	@PostMapping("update_ok.do")
	public String event_update_ok(int page, EventVO vo)
	{	
		// 날짜 고쳐야함
		String url="";
		boolean bCheck=dao.eventUpadate(vo);
		if(bCheck==true)
		{
			url="<script>"
				+"location.href=\"../event/detail.do?no="+vo.getNo()+"&page="+page+"\";"
				+"</script>";
		}
		else
		{
			url="<script>"
				+"alert(\"비밀번호가 일치하지 않습니다.\");"
				+"history.back();"
				+"</script>";	
		}
		return url;
	}
	
	@PostMapping("delete_ok.do")
	public String event_delete_ok(int no, int page, String pwd)
	{	
		String url="";
		boolean bCheck=dao.eventDelete(no, pwd);
		if(bCheck==true)
		{
			url="<script>"
				+"location.href=\"../event/list.do?page="+page+"\";"
				+"</script>";
		}
		else
		{
			url="<script>"
				+"alert(\"비밀번호가 일치하지 않습니다.\");"
				+"history.back();"
				+"</script>";	
		}
		return url;
	}
}
