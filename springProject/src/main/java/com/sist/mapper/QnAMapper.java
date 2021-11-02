package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.*;

public interface QnAMapper {
	/*
	private int no,hit,g_id,g_step,g_tab,root,depth;
	private String id,subject,content,pwd,dbday;
	private Date regdate;
	*/
	
	//1. Q&A 게시글 리스트
	//1-1. 게시글 목록 출력하기
	@Select("SELECT no,subject,id,regdate,hit,g_tab,num "
			+ "FROM (SELECT no,subject,id,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,hit,g_tab,rownum as num "
			+ "FROM (SELECT no,subject,id,regdate,hit,g_tab "
			+ "FROM qna ORDER BY g_id DESC,g_step ASC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<QandAVO> qnaBoardListData(Map map);
	//1-2. 총페이지 설정
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM qna")
	public int qnaBoardTotalPage();
	
	
	
	//2. Q&A 게시글 작성
	//2-1. no 자동증가 시퀀스 설정, 게시글 추가
	@SelectKey(keyProperty="no", resultType=int.class,before=true,
			statement="SELECT NVL(MAX(no)+1,1) as no FROM qna")
	@Insert("INSERT INTO qna(no,id,subject,content,pwd,g_id) VALUES("
			+ "#{no},#{id},#{subject},#{content},#{pwd},(SELECT NVL(MAX(g_id)+1,1 FROM qna))")
	public void qnaBoardInsert(QandAVO vo);
	
	
	//3. Q&A 게시글/답변게시글 상세보기
	//3-1. 게시글 클릭 시 hit 증가
	@Update("UPDATE qna SET hit=hit+1 WHERE no=#{no}")
	public void hitIncrement(int no);
	//3-2. 게시글 상세보기
	@Select("SELECT no,id,subject,content,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') as dbday,hit "
			+ "FROM qna "
			+ "WHERE no=#{no}")
	public QandAVO qnaBoardDetailData(int no);
	
	
	
	//4. Q&A 답변게시글 작성
	//4-1. 답변할 게시글의 group_id,group_step,group_tab 읽어오기 => group_id는 그대로 첨부 , group_step,group_tab은 +1
	@Select("SELECT g_id,g_step,g_tab FROM qna WHERE no=#{no}")
	public QandAVO qnaParentInfoData(int no);
	//4-2. 답변 시 답변게시글의 group_step +1 증가
	@Select("UPDATE qna SET "
			+ "g_step=g_step+1 "
			+ "WHERE g_id=#{g_id} AND g_step>#{g_step}")
	public void qnaBoardGroupStepIncrement(QandAVO vo);
	//4-3. 실제 답변 게시글 추가(no 자동증가 시퀀스 설정, 게시글 추가)
	@SelectKey(keyProperty="no",resultType=int.class,before=true,
			statement="SELECT NVL(MAX(no)+1,1) as no FROM qna")
	@Insert("INSERT INTO qna(no,id,subject,content,pwd,g_id,g_step,g_tab,root,depth) VALUES("
			+ "#{no},#{id},#{subject},#{content},#{pwd},#{g_id},#{g_step},#{g_tab},#{root},0)")
	public void qnaBoardReplyInsert(QandAVO vo);
	//4-4. depth 증가
	@Update("UPDATE qna SET depth=depth+1 WHERE no=#{no}")
	public void qnaBoardDepthIncrement(int no);
	
	
	
	//5. Q&A 게시글/답변게시글 수정
	//5-1. 비밀번호 검색
	@Select("SELECT pwd FROM qna WHERE no=#{no}")
	public String qnaBoardGetPassword(int no);
	//5-2. 실제 게시글 수정
	@Update("UPDATE qna SET subject=#{subject},content=#{content} "
			+ "WHERE no=#{no}")
	public int qnaBoardUpdate(QandAVO vo);
	
	
	//6. Q&A 게시글/답변게시글 삭제
	//6-1. 비밀번호 검색=public String qnaBoardGetPassword(int no) 재사용
	//6-2. 비밀번호 일치 시 
	//6-2-1. root, depth 읽어오기
	@Select("SELECT root,depth FROM qna WHERE no=#{no}")
	public QandAVO qnaBoardGetDepth(int no);
	//6-2-2. depth==0(답변게시글이 없을 때): 삭제
	@Delete("DELETE FROM qna WHERE no=#{no}")
	public void qnaBoardDelete(int no);
	//6-2-3-1. depth!=0(답변게시글이 있을 때): 
	@Update("UPDATE qna SET subject=#{subject},content#{content} WHERE no=#{no}")
	public void qnaBoardDeleteUpdate(QandAVO vo);
	//6-2-3-2. depth 감소
	@Update("UPDATE qna SET depth=depth-1 WHERE no=#{no}")
	public void depthDecrement(int no);
	//6-2-4. depth 읽어오기
	@Select("SELECT depth FROM qna WHERE no=#{no}")
	public int qnaBoardRootGetDepth(int no);
	  
	
}
