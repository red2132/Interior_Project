package com.sist.vo;

import org.springframework.web.multipart.MultipartFile;
import java.util.*;
/*
 *  NO       NOT NULL NUMBER         
	ID                VARCHAR2(30)   
	PWD      NOT NULL VARCHAR2(30)   
	TITLE             VARCHAR2(100)  
	CONTENT           CLOB           
	PERIOD            VARCHAR2(50)   
	STATE             VARCHAR2(10)   
	POSTER            VARCHAR2(4000) 
	FILENAME          VARCHAR2(4000) 
	FILESIZE          VARCHAR2(4000) 
	REGDATE           DATE           
 */
public class EventVO {
	private int no,filecount;
	private String id,pwd,title,content,regdate,state,filename,filesize,poster, period, period1, period2, img;
	private List<MultipartFile> files;
	
	
	public List<MultipartFile> getFiles() {
		return files;
	}
	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}
	
	public int getFilecount() {
		return filecount;
	}
	public void setFilecount(int filecount) {
		this.filecount = filecount;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getPeriod1() {
		return period1;
	}
	public void setPeriod1(String period1) {
		this.period1 = period1;
	}
	public String getPeriod2() {
		return period2;
	}
	public void setPeriod2(String period2) {
		this.period2 = period2;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFilesize() {
		return filesize;
	}
	public void setFilesize(String filesize) {
		this.filesize = filesize;
	}
	
}
