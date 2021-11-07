package com.sist.web;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.sist.dao.*;
import com.sist.vo.*;
import java.util.*;
@RestController
public class SecondItemRestController {
	 @Autowired
	 private SecondItemDAO dao;
	 @RequestMapping(value="second/rest_cate.do",produces="text/plain;charset=UTF-8")
	 public String second_rest_cate(int page,String cate1,String cate2, String cate3,int n){
		 System.out.println("n="+n);
		 String json="";
		 try{			 				
			 int curpage=page;
			 int rowSize=9;
			 int start=(rowSize*curpage)-(rowSize-1);
			 int end=(rowSize*curpage);
			   
			 Map map=new HashMap();
			 map.put("n", n);
			 map.put("cate1", cate1);
			 map.put("cate2", cate2);
			 map.put("cate3", cate3);
			 map.put("start", start);
			 map.put("end", end);
			 
			 			 
			 List<SecondItemVO> list=dao.categorySelectData(map);
			 
			 int totalpage=dao.secondItemTotalPage(map);
			 
			 JSONArray arr=new JSONArray();
			 int i=0;
			 for(SecondItemVO vo:list){
				 JSONObject obj=new JSONObject();
				 //no,img,title,price
				 obj.put("no", vo.getNo());
				 obj.put("img", vo.getImg());
				 obj.put("title", vo.getTitle());
				 obj.put("price", vo.getPrice());
				 if(i==0)
				   {
					   obj.put("curpage", curpage);
					   obj.put("totalpage", totalpage);
				   }
				   arr.add(obj);
				   i++;				 		
			 }
			 json=arr.toJSONString();
			 System.out.println("json:"+json);
		 }catch(Exception ex){}
		 return json;
	 }
	 	 	
}
	 
	  