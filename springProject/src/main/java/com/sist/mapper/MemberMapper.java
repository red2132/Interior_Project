package com.sist.mapper;

import org.apache.ibatis.annotations.*;

import com.sist.vo.MemberVO;

public interface MemberMapper {
	
	// 1. 로그인 처리 
	// (1-1). ID존재여부 확인 
	@Select("SELECT COUNT(*) FROM project_member "
		  + "WHERE id = #{id}")
	public int memberIdCount(String id);
	// (1-2). 비밀번호 체크 
	@Select("SELECT pwd, name FROM project_member "
		  + "WHERE id = #{id}")
	public MemberVO memberGetPassword(String id);
	   
	// 2. 회원가입 
    @Insert("INSERT INTO project_member VALUES( "
		  + "#{id}, #{pwd}, #{name}, #{sex}, #{birthday}, "
		  + "#{email}, #{post}, #{addr1}, #{addr2}, #{tel}, 'n', #{content})")
	public void memberInsert(MemberVO vo);
	
    // 회원수정 
	@Select("SELECT * FROM project_member WHERE id = #{id}")
	public MemberVO memberUpdateData(String id);
	   
	@Update("UPDATE project_member SET "
	      + "name = #{name}, sex = #{sex}, birthday = #{birthday}, email = #{email}, "
		  + "post = #{post}, addr1 = #{addr1}, addr2 = #{addr2}, tel = #{tel}, content = #{content} "
		  + "WHERE id = #{id}")
	public void memberJoinUpdate(MemberVO vo);
	        

	// 회원 탈퇴 
	@Delete("DELETE FROM project_member WHERE id = #{id}")
	public void memberDelete(String id);

	@Select("SELECT COUNT(*) FROM project_member WHERE tel=#{tel}")
	public int memberIdFindTel(String tel);
	@Select("SELECT RPAD(SUBSTR(id, 1, 1), LENGTH(id), '#') FROM project_member WHERE tel = #{tel}")
	public String memberIdFindTelData(String tel);
	@Select("SELECT COUNT(*) FROM project_member WHERE email = #{email}")
	public int memberIdFindEmail(String email);
	@Select("SELECT RPAD(SUBSTR(id, 1, 1), LENGTH(id), '#') FROM project_member WHERE email = #{email}")
	public String memberIdFindEmailData(String email);
	@Select("SELECT RPAD(SUBSTR(pwd, 1, 1), LENGTH(pwd), '*') FROM project_member WHERE id = #{id}")
	public String memberPwdFindData(String id);

}
