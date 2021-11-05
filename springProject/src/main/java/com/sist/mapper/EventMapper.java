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
	
	// 댓글
	/*
	 *  NO         NOT NULL NUMBER       
	  	BNO                 NUMBER       
		ID                  VARCHAR2(20) 
		NAME       NOT NULL VARCHAR2(34) 
		MSG        NOT NULL CLOB         
		REGDATE             DATE         
		GROUP_ID            NUMBER       
		GROUP_STEP          NUMBER       
		GROUP_TAB           NUMBER       
		ROOT                NUMBER       
		DEPTH               NUMBER       
	 */
	
	// 댓글 리스트
	@Select("SELECT no,bno,id,name,msg,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') as dbday,group_tab "
			 +"FROM HOUSE_REPLY "
			 +"WHERE bno=#{bno}"  
			 +"ORDER BY group_id DESC , group_step ASC") // group_id DESC (최신순) group_step ASC(답변 순서)
	public List<HouseReplyVO> eventReplyListData(int bno);
	
	// 댓글 추가
	@Insert("INSERT INTO HOUSE_REPLY(no,bno,id,name,msg,group_id) VALUES("
			 +"hr_no_seq.nextval,#{bno},#{id},#{name},#{msg},"
			 +"(SELECT NVL(MAX(group_id)+1,1) FROM HOUSE_REPLY))")
	public void eventReplyInsert(HouseReplyVO vo);
	
	// 댓글 수정
	@Update("UPDATE HOUSE_REPLY SET "
			 +"msg=#{msg} "
			 +"WHERE no=#{no}")
	public void eventReplyUpdate(HouseReplyVO vo);
	
	// 대댓글 => 트랜잭션 
	// 1. 댓글 대상의 정보 : group_id,step,tab : SELECT
	@Select("SELECT group_id,group_step,group_tab "
			 +"FROM HOUSE_REPLY "
			 +"WHERE no=#{no}")
	public HouseReplyVO eventReplyParentInfoData(int no);
	// 2. step 변경  : UPDATE 
	@Update("UPDATE HOUSE_REPLY SET "
			 +"group_step=group_step+1 "
			 +"WHERE group_id=#{group_id} AND group_step>#{group_step}")
	public void eventReplyStepIncrement(HouseReplyVO vo);
	// 3. insert : INSERT
	@Insert("INSERT INTO HOUSE_REPLY(no,bno,id,name,msg,group_id,group_step,group_tab,root) "
			 +"VALUES(hr_no_seq.nextval,#{bno},#{id},#{name},#{msg},"
			 +"#{group_id},#{group_step},#{group_tab},#{root})")
	public void eventReply2Insert(HouseReplyVO vo);
	// 4. depth 증가 : UPDATE 
	@Update("UPDATE HOUSE_REPLY SET "
			 +"depth=depth+1 "
			 +"WHERE no=#{no}")
	public void eventReplyDepthIncrement(int no);
	
	// 삭제 => 트랜잭션
	// 1. depth,root 읽기  SELECT
	@Select("SELECT depth,root "
			 +"FROM HOUSE_REPLY "
			 +"WHERE no=#{no}")
	public HouseReplyVO eventDepthInfoData(int no);
	// 2. depth==0 삭제, depth!=0 수정  DELETE/UPADTE
	@Delete("DELETE FROM HOUSE_REPLY "
			 +"WHERE no=#{no}")
	public void eventReplyDelete(int no);
	@Update("UPDATE HOUSE_REPLY SET "
			 +"msg='삭제한 댓글입니다.' "
			 +"WHERE no=#{no}")
	public void eventReplyMsgUpdate(int no);
	// 3. depth 감소  UPDATE 
	@Update("UPDATE HOUSE_REPLY SET "
			 +"depth=depth-1 "
			 +"WHERE no=#{no}")
	public void eventReplyDepthDecrement(int no);
}
