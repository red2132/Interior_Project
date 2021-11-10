package com.sist.web;

import java.util.*;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.sist.dao.*;
import com.sist.vo.*;

@Controller
@RequestMapping("page/")
public class PageController {
	
	@Autowired
	private PageDAO myDAO;
	
   
	@GetMapping("mypage.do")
	public String page_mypage(Model model, HttpSession session)
	{
		String interestingCate = "";
		String id = (String)session.getAttribute("id");
		
		List<MypageVO> cateList = myDAO.myNewCategoryData();
		
		List<MypageVO> cList = myDAO.myPageCommunityData(id);
		List<MypageVO> rList = myDAO.myPageReplyData(id);
		
		String address = myDAO.myPageAddressData(id);
		String[] array = address.split(" ");
		String addr_data1 = array[0];
		String addr_data2 = array[1];
		
		MypageVO pre_vo = myDAO.myPageInterestingData(id);
		if(pre_vo == null)
		{
			myDAO.myPageFirstInterestingInsert(id);
		}
		
		MypageVO vo = myDAO.myPageInterestingData(id);
		interestingCate = vo.getInteresting_cate();
				
		String[] cateArray = interestingCate.split(",");
		List<String> iList = Arrays.asList(cateArray);
		
		model.addAttribute("cateList", cateList);
		
		model.addAttribute("cList", cList);
		model.addAttribute("rList", rList);
		
		model.addAttribute("addr_data1", addr_data1);
		model.addAttribute("addr_data2", addr_data2);
		
		model.addAttribute("iList", iList);
		
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
	public String page_myinterestpage(Model model, HttpSession session)
	{
		String id = (String)session.getAttribute("id");
	   
		MypageVO vo = myDAO.myPageInterestingData(id);
	   
		model.addAttribute(vo);
		model.addAttribute("main_jsp", "../page/myinterestpage.jsp");
		return "main/main";
	}
	
	@PostMapping("interesting_cate_insert_ok.do")
	public String interesting_cate_insert_ok(String cate, HttpSession session)
	{
		String id = (String)session.getAttribute("id");
		
		MypageVO pre_vo = myDAO.myPageInterestingData(id);
		String previousData = pre_vo.getInteresting_cate();
		String insertData = previousData + "," + cate;
		
		Map map = new HashMap();
		map.put("id", id);
		map.put("interesting_cate", insertData);
		myDAO.myPageInterestingUpdate(map);
		
		return "redirect:../page/mypage.do";
	}
	
	@GetMapping("interesting_cate_delete_ok.do")
	public String interesting_cate_delete_ok(String interest, HttpSession session)
	{
		String id = (String)session.getAttribute("id");
		
		MypageVO pre_vo = myDAO.myPageInterestingData(id);
		String previousData = pre_vo.getInteresting_cate();
		String deleteData = interest + ",";
		String updateData = previousData.replace(deleteData, "");
		
		Map map = new HashMap();
		map.put("id", id);
		map.put("interesting_cate", updateData);
		myDAO.myPageInterestingUpdate(map);
		
		return "redirect:../page/mypage.do";
	}
   
}


