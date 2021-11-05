package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sist.mapper.CommunityMapper;
import com.sist.vo.CommReplyVO;
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
		   String db_pwd=mapper.GetPassword(vo.getNo());
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
	 
	 
	 
	 public int communityDelete(int no,String pwd)
		{
		 int result=0;
		   String db_pwd=mapper.GetPassword(no);
		   if(db_pwd.equals(pwd))
		   {
			   result=1;
			   mapper.communityDelete(no);
		   }
		   else
		   {
			   result=0;
		   }
		   return result;
	   }
	 
	 public List<CommunityVO> communityFilter(Map map)
	 {
		return mapper.communityFilter(map);
	 }
	 
	 public List<CommunityVO> communityTag(String tag)
	 {
		 return mapper.communityTag(tag);
	 }
	 
	 public String numberFind(Map map)
	 {
		 return mapper.numberFind(map);
	 }
	 
	 public String numberTagFind(String tag)
	 {
		 return mapper.numberTagFind(tag);
	 }
	 
////////////////////////~여기서부터 댓글~/////////////////////////////////////////////
	 
	 public void replyInsert(CommReplyVO vo)
	 {
		 mapper.replyInsert(vo);
	 }
	 
	 public List<CommReplyVO> replyListData(int bno)
	 {
		 return mapper.replyListData(bno);
	 }
	 
	 public void replyUpdate(CommReplyVO vo)
	 {
		 mapper.replyUpdate(vo);
	 }	 		
}
