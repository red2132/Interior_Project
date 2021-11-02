package com.sist.vo;

/*
  
   	  - 회원정보 관련 데이터 테이블 -
   
	    이름       널?       유형        비고   
	-------- -------- ------------- -------
	ID       NOT NULL VARCHAR2(30)  
	PWD      NOT NULL VARCHAR2(30)  
	NAME     NOT NULL VARCHAR2(34)  
	SEX      NOT NULL VARCHAR2(10)  
	BIRTHDAY NOT NULL DATE          
	EMAIL             VARCHAR2(100) UNIQUE
	ADDR1    NOT NULL VARCHAR2(200) 
	ADDR2    NOT NULL VARCHAR2(200) 
	TEL               VARCHAR2(20)  UNIQUE
	POST     NOT NULL VARCHAR2(7)   
	ADMIN             CHAR(1)      
	 
 */

public class MemberVO {

	private String id, pwd, name, sex, birthday,
				   email, post, addr1, addr2, tel,
				   admin;
	
	private String msg, tel1, tel2, tel3;
	// ※ tel = tel1 + tel2 + tel3
	
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getTel1() {
		return tel1;
	}

	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}

	public String getTel2() {
		return tel2;
	}

	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}

	public String getTel3() {
		return tel3;
	}

	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}

}
