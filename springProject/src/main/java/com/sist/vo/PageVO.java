package com.sist.vo;

import java.util.*;

/*
 		<MYPAGE 데이터 테이블>
	이름               널? 유형           
	---------------- -- ------------ 
	ID                  VARCHAR2(30) 
	BUY_NO              NUMBER       
	SELL_NO             NUMBER       
	INTERESTING_NO      CLOB         
	INTERESTING_CATE    CLOB   
	
		<CART 데이터 테이블>
	이름         널?       유형           
	---------- -------- ------------ 
	CART_ID    NOT NULL NUMBER       
	ID                  VARCHAR2(30) 
	PRODUCT_ID          NUMBER       
	AMOUNT              NUMBER       
	REGDATE             DATE         
	ISCHECK             NUMBER       
	ISSALE              NUMBER   
	
 */


public class PageVO {
	
	// 공통 사용
	private String id;
	
	//////////////////
	
	private int buy_no, sell_no;
	private String interesting_no, interesting_cate;
	
	//////////////////
	
	private int cart_id, product_id, amount,
				ischeck, issale;
	private Date regdate;
	
	//////////////////
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getIscheck() {
		return ischeck;
	}
	public void setIscheck(int ischeck) {
		this.ischeck = ischeck;
	}
	public int getIssale() {
		return issale;
	}
	public void setIssale(int issale) {
		this.issale = issale;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

}
