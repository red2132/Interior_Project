package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

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
	// 수정하기(값 불러오기)
	public EventVO eventUpdateData(int no)
	{
		return mapper.eventDetailData(no);
	}
	// 실제 수정
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
	
}
