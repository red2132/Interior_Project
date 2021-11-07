package com.sist.vo;

import java.util.List;
import org.springframework.web.multipart.MultipartFile;

public class CommunityVO {
	private int no;
	private String id,subject,content,pwd,dbday,hit,filename,filesize,hstyle,hsize,rstyle,family,tags;
	private List<MultipartFile> files;
	private int cnt;
	
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public List<MultipartFile> getFiles() {
		return files;
	}
	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}
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
	public String getdbday() {
		return dbday;
	}
	public void setdbday(String dbday) {
		this.dbday = dbday;
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
	public String getFamily() {
		return family;
	}
	public void setFamily(String family) {
		this.family = family;
	}
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}

}