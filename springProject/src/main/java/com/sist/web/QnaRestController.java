package com.sist.web;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.*;
import com.sist.vo.*;
@RestController
public class QnaRestController {
	@Autowired
	private QnADAO dao;
	
	//수정하기
	@PostMapping("qna/update_ok.do")
	public String qna_update_ok(int page,QnAVO vo) {
		String url="";
		int result=dao.qnaBoardUpdate(vo);
		if(result==1) { //비밀번호 일치
			url="<script>"
				+ "location.href=\"../qna/detail.do?no="+vo.getNo()+"&page="+page+"\";"
				+ "</script>";
		}else {
			url="<script>"
				+ "alert(\"비밀번호가 일치하지 않습니다.\");"
				+ "history.back();"
				+ "</script>";
		}
		return url;
	}
	
	//삭제하기
	@PostMapping("qna/delete_ok.do")
	public String qna_delete_ok(int no,int page,String pwd) {
		String url="";
		int result=dao.qnaBoardDelete(no, pwd);
		if(result==1) {//비밀번호 일치
			url="<script>"
				+ "location.href=\"../qna/list.do?page="+page+"\";"
				+ "</script>";
		}else {
			url="<script>"
					+ "alert(\"비밀번호가 일치하지 않습니다.\");"
					+ "history.back();"
					+ "</script>";
		}
		return url;
	}
	
	
}



