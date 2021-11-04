package com.sist.vo;
/*
 * NO    NOT NULL NUMBER         
IMG            VARCHAR2(300)  
TITLE          VARCHAR2(100)  
CMT            VARCHAR2(1000) 
PRICE          VARCHAR2(100)  
CATE1          VARCHAR2(100)  
CATE2          VARCHAR2(100)  
CATE3          VARCHAR2(100)  
C1NUM          NUMBER(2)      
C2NUM          NUMBER(4)      
C3NUM          NUMBER(6)      
 */
public class SecondItemVO {
	private int no,c1num,c2num,c3num;
	private String img,title,cmt,price,cate1,cate2,cate3;
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getC1num() {
		return c1num;
	}
	public void setC1num(int c1num) {
		this.c1num = c1num;
	}
	public int getC2num() {
		return c2num;
	}
	public void setC2num(int c2num) {
		this.c2num = c2num;
	}
	public int getC3num() {
		return c3num;
	}
	public void setC3num(int c3num) {
		this.c3num = c3num;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCmt() {
		return cmt;
	}
	public void setCmt(String cmt) {
		this.cmt = cmt;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getCate1() {
		return cate1;
	}
	public void setCate1(String cate1) {
		this.cate1 = cate1;
	}
	public String getCate2() {
		return cate2;
	}
	public void setCate2(String cate2) {
		this.cate2 = cate2;
	}
	public String getCate3() {
		return cate3;
	}
	public void setCate3(String cate3) {
		this.cate3 = cate3;
	}
	
}
