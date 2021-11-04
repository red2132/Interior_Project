package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.*;
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
public interface EventMapper {
	// 이벤트 목록 출력
	@Select("SELECT no,poster,state,regdate,period,num "
			+"FROM (SELECT no,poster,state,regdate,period,rownum as num "
			+"FROM (SELECT no,poster,state,regdate,period "
			+"FROM HOUSE_EVENT ORDER BY no DESC)) "
			+"WHERE num BETWEEN #{start} AND #{end}")
	public List<EventVO> eventListData(Map map);
	
	// 페이지 나누기
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM HOUSE_EVENT")
	public int eventTotalPage();
	
	// 상세보기
	@Select("SELECT no,filename,id,title,content,regdate,state,period,img,filesize,filecount,poster "
			+ "FROM HOUSE_EVENT "
			+ "WHERE no=#{no}")
	public EventVO eventDetailData(int no);
	
	// 자동 증가 번호
	@SelectKey(keyProperty="no", resultType=int.class , before=true,
			statement="SELECT NVL(MAX(no)+1,1) as no FROM HOUSE_EVENT")
	
	// 글쓰기
	@Insert("INSERT INTO HOUSE_EVENT(no, id, pwd, title, content, period, state, filename, regdate, poster, img, filesize, filecount) VALUES("
			  +"#{no}, 'admin', #{pwd}, #{title}, #{content}, #{period}, '진행중', #{filename}, SYSDATE, #{poster}, #{img}, #{filesize}, #{filecount})")
	public void eventInsert(EventVO vo);
	
	// 다운로드
	@Select("SELECT filename,filesize,filecount FROM HOUSE_EVENT "
			 +"WHERE no=#{no}")
	public EventVO eventFileInfoData(int no);
	
	// 글 삭제/수정시 비밀번호 필요(비밀번호 체크)
	@Select("SELECT pwd FROM HOUSE_EVENT "
			+"WHERE no=#{no}")
	public String eventGetPassword(int no);
	
	// 수정
	@Update("UPDATE HOUSE_EVENT SET "
			+"title=#{title}, content=#{content}, state=#{state}, poster=#{poster}, img=#{img} "
			+"WHERE no=#{no}")
	public void eventUpdate(EventVO vo);
	
	// 삭제
	@Delete("DELETE FROM HOUSE_EVENT WHERE no=#{no}")
	public void eventDelete(int no);
}
