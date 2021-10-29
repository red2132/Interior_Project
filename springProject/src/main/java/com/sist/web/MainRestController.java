package com.sist.web;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.CommunityDAO;
import com.sist.vo.CommunityVO;

@RestController
public class MainRestController {
	@Autowired
	private CommunityDAO dao;

	@RequestMapping(value="main/rest_comm.do",produces="text/plain;charset=UTF-8")
	public String community()
	{
		String json="";
		try
		{
			List<CommunityVO> list=dao.home_cList();
			JSONArray arr=new JSONArray();
			for(CommunityVO vo:list)
			{
				//no,id,subject,content,pwd,regdate,hit,filename,filesize,hstyle,hsize,rstyle,family,tags
				JSONObject obj=new JSONObject();
				obj.put("no", vo.getNo());
				obj.put("filename", vo.getFilename());
				obj.put("id", vo.getId());
				obj.put("subject", vo.getSubject());
				arr.add(obj);				
			}
			json=arr.toJSONString();
		}catch (Exception e) {}
		return json;
	}
}

