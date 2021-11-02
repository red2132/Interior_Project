package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.CommunityMapper;
import com.sist.vo.CommunityVO;

@Repository
public class CommunityDAO {

	@Autowired
	private CommunityMapper mapper;
	
	public List<CommunityVO> cList(Map map)
	{
		return mapper.cList(map);
	}
	
	public int cTotalPage()
	{
		return mapper.cTotalPage();
	}
	public CommunityVO cDetail(int no)
	{
		mapper.hitIncrement(no);
		return mapper.cDetail(no);
	}
	public List<CommunityVO> home_cList()
	{
		return mapper.home_cList();
	}
	
	public void communityInsert(CommunityVO vo)
	{
		mapper.communityInsert(vo);
	}
	//수정 전 내용 출력
	public CommunityVO commUpdateDataRead(int no)
	{
		return mapper.cDetail(no);
	}
	
	 public boolean communityUpdate(CommunityVO vo)
	 {
		 boolean bCheck=false;
		   // 비밀번호 읽기 
		   String db_pwd=mapper.boardGetPassword(vo.getNo());
		   if(db_pwd.equals(vo.getPwd()))
		   {
			   bCheck=true;
			   mapper.communityUpdate(vo);
		   }
		   else
		   {
			   bCheck=false;
		   }
		   return bCheck;
	 }
	 public boolean communityDelete(int no,String pwd)
	 {
		 boolean bCheck=false; // default
		   // 비밀번호 검색 
		   String db_pwd=mapper.boardGetPassword(no);
		   System.out.println(pwd+"|"+db_pwd);
		   if(db_pwd.equals(pwd))
		   {
			   bCheck=true;
			   // 실제 삭제 
			   mapper.communityDelete(no);
		   }
		   return bCheck;
	 }
}
