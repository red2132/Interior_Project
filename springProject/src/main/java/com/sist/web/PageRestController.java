package com.sist.web;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.*;
import com.sist.vo.*;

@RestController
public class PageRestController {
	
	@Autowired
	private PageDAO myDAO;
	
	@RequestMapping(value = "page/interesting_cate_data.do", produces = "text/plain;charset=UTF-8")
	public String interesting_cate_data(String insert_cate, HttpSession session)
	{
		String id = (String)session.getAttribute("id");
		
		System.out.println("아이디 : " + id);
		System.out.println("넣을 값 : " + insert_cate);
		
		String json = "";
		try
		{			 				
			MypageVO pre_vo = myDAO.myPageInterestingData(id);
			String previousData = pre_vo.getInteresting_cate();
			
			Map map = new HashMap();
			map.put("id", id);
			map.put("interesting_cate", (previousData+","+insert_cate));
			myDAO.myPageInterestingUpdate(map);
			
			JSONObject obj = new JSONObject();
			MypageVO vo = myDAO.myPageInterestingData(id);
			String interesting_cate = vo.getInteresting_cate();
			obj.put("interesting_cate", interesting_cate);			
			json = obj.toJSONString();
			System.out.println("json : " + json);
		}
		catch(Exception ex) { }
		
		return json;
	}
	
}
			   
			   
	