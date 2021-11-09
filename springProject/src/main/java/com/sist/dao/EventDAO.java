package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.sist.mapper.*;
import com.sist.vo.*;
import java.util.*;
@Repository
public class EventDAO {
	
	@Autowired
	private EventMapper mapper;
	
	// 목록
	public List<EventVO> eventListData(Map map)
	{
		return mapper.eventListData(map);
	}
	// 페이징
	public int eventTotalPage()
	{
		return mapper.eventTotalPage();
	}
	// 상세보기
	public EventVO eventDetailData(int no)
	{
		return mapper.eventDetailData(no);
	}
	// 글쓰기
	public void eventInsert(EventVO vo)
	{
		mapper.eventInsert(vo);
	}
	// 첨부 파일 데이터 
	public EventVO eventFileInfoData(int no)
	{
		return mapper.eventFileInfoData(no);
	}
	
	// 수정 전 폼에 값 불러오기
	public EventVO eventUpdateData(int no)
	{
		return mapper.eventDetailData(no);
	}
	// 수정
	public boolean eventUpadate(EventVO vo)
	{
		boolean bCheck=false;
		
		// 비밀번호 체크
		String m_pwd=mapper.eventGetPassword(vo.getNo());
		// 비밀번호가 일치한다면	
		if(m_pwd.equals(vo.getPwd())) 	
		{
			bCheck=true;
			mapper.eventUpdate(vo);
		}
		else // 비밀번호가 틀리다면
		{
			bCheck=false;
		}
		return bCheck;
	}
	
	// 삭제
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	public boolean eventDelete(int no,String pwd)
	{
		boolean bCheck=false;
		
		// 비밀번호 체크
		String m_pwd=mapper.eventGetPassword(no);
		
		if(m_pwd.equals(pwd)) // 비밀번호 O
		{
			bCheck=true;
			mapper.eventDelete(no);
		}
		else // 비밀번호 X
		{
			bCheck=false;
		}
		return bCheck;
	}
	
	// 댓글
	// 댓글 목록
	public List<HouseReplyVO> eventReplyListData(int bno)
	{
		return mapper.eventReplyListData(bno);
	}
	// 댓글 갯수
	public int eventReplyCount(int no)
	{
		return mapper.eventReplyCount(no);
	}
	// 댓글 추가
	public void eventReplyInsert(HouseReplyVO vo)
	{
		mapper.eventReplyInsert(vo);
	}
	// 댓글 수정
	public void eventReplyUpdate(HouseReplyVO vo)
	{
		mapper.eventReplyUpdate(vo);
	}
	
	// 대댓글 추가
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	  public void eventReplyReplyInsert(int pno,HouseReplyVO vo)
	  {
		  HouseReplyVO pvo=mapper.eventReplyParentInfoData(pno);
		  vo.setGroup_id(pvo.getGroup_id());
		  vo.setGroup_step(pvo.getGroup_step()+1); // 출력 순서 
		  vo.setGroup_tab(pvo.getGroup_tab()+1); // => 간격 
		  vo.setRoot(pno);
		  mapper.eventReplyStepIncrement(pvo);
		  mapper.eventReply2Insert(vo);
		  mapper.eventReplyDepthIncrement(pno);
	  }
	
	// 댓글 삭제
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	public void eventReplyDelete(int no)
	{
		 HouseReplyVO vo=mapper.eventDepthInfoData(no);
		 if(vo.getDepth()==0)
		 {
			 mapper.eventDelete(no);
		 }
		 else
		 {
			 mapper.eventReplyMsgUpdate(no);
		 }
		  mapper.eventReplyDepthDecrement(vo.getRoot());
	}
	
	// 검색
	public List<EventVO> eventFindData(Map map)
	{
		return mapper.eventFindData(map);
	}
	
	// 검색 결과 갯수
	public int eventFindCount(Map map)
	{
		return mapper.eventFindCount(map);
	}
}
