package com.sist.vo;

public class CommunityVO {
	private int no;
	private String id,subject,content,pwd,regdate,hit,filename,filesize,hstyle,hsize,rstyle,fammily,tags;
	public String getRstyle() {
		return rstyle;
	}
	public void setRstyle(String rstyle) {
		this.rstyle = rstyle;
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
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
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
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getHit() {
		return hit;
	}
	public void setHit(String hit) {
		this.hit = hit;
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
	public String getHstyle() {
		return hstyle;
	}
	public void setHstyle(String hstyle) {
		this.hstyle = hstyle;
	}
	public String getHsize() {
		return hsize;
	}
	public void setHsize(String hsize) {
		this.hsize = hsize;
	}	
	public String getFammily() {
		return fammily;
	}
	public void setFammily(String fammily) {
		this.fammily = fammily;
	}
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}

}
