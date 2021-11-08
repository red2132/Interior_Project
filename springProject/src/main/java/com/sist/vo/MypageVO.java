package com.sist.vo;

import java.util.*;

/*
 *     id VARCHAR2(30),
	   buy_no NUMBER,
	   sell_no NUMBER,
	   interesting_no CLOB,
	   interesting_cate CLOB
 */ 
public class MypageVO {

	private int no;
	private String regdate, dbday;
	
	private String id, interesting_no, interesting_cate;
	private int buy_no,sell_no;
	
	private String subject;
	
	private String msg;
	
	private String addr1, address;
	

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getInteresting_no() {
		return interesting_no;
	}
	public void setInteresting_no(String interesting_no) {
		this.interesting_no = interesting_no;
	}
	public String getInteresting_cate() {
		return interesting_cate;
	}
	public void setInteresting_cate(String interesting_cate) {
		this.interesting_cate = interesting_cate;
	}
	public int getBuy_no() {
		return buy_no;
	}
	public void setBuy_no(int buy_no) {
		this.buy_no = buy_no;
	}
	public int getSell_no() {
		return sell_no;
	}
	public void setSell_no(int sell_no) {
		this.sell_no = sell_no;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getDbday() {
		return dbday;
	}
	public void setDbday(String dbday) {
		this.dbday = dbday;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
}
