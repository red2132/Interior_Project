package com.sist.vo;
/*
 * create table reply(
	no number,	———> pk
	item_or_case_no,	———> 상품관련 댓글일 경우 상품 번호 포함(리뷰 몇개인지 표시할 때 필요)
	cate varchar2(50),	———>	여러 종류 댓글이 있는 경우 cate에 관련 댓글 정보 입력
	content clob,
	regdate date,
	pwd varchar2(30),
	id varchar2(30)	———> 내가 쓴거 가져올때 필요
);
 */

import java.util.*;

public class ReplyVO {
	private int no, item_no;
	private String cate,content,pwd,id,dbday;
	private Date regdate;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getItem_no() {
		return item_no;
	}
	public void setItem_no(int ino) {
		this.item_no = ino;
	}
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDbday() {
		return dbday;
	}
	public void setDbday(String dbday) {
		this.dbday = dbday;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
}