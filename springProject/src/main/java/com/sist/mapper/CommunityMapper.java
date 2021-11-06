package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.CommReplyVO;
import com.sist.vo.CommunityVO;

public interface CommunityMapper {
	
	//커뮤니티 그냥 목록 출력
	@Select("SELECT no,id,subject,content,pwd,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,hit,filename,filesize,hstyle,hsize,rstyle,family,tags,num "
			+ "FROM (SELECT no,id,subject,content,pwd,regdate,hit,filename,filesize,hstyle,hsize,rstyle,family,tags,rownum as num "
			+ "FROM (SELECT no,id,subject,content,pwd,regdate,hit,filename,filesize,hstyle,hsize,rstyle,family,tags "
			+ "FROM house_community)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<CommunityVO> cList(Map map);
	
	//목록 - 페이지 나누기
	@Select("SELECT CEIL(COUNT(*)/5.0) FROM house_community")
	public int cTotalPage();
	
	//상세보기
	 @Update("UPDATE house_community SET "
			  +"hit=hit+1 "
			  +"WHERE no=#{no}")
	public void hitIncrement(int no);
	 
	@Select("SELECT no,id,subject,content,pwd,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,hit,filename,filesize,hstyle,hsize,rstyle,family,tags "
			+ "FROM house_community WHERE no=#{no}")
	public CommunityVO cDetail(int no);
	
	//홈에 출력할 메뉴 출력
	@Select("SELECT no,id,subject,content,pwd,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,hit,filename,filesize,hstyle,hsize,rstyle,family,tags,num "
			+ "FROM (SELECT no,id,subject,content,pwd,regdate,hit,filename,filesize,hstyle,hsize,rstyle,family,tags,rownum as num "
			+ "FROM (SELECT no,id,subject,content,pwd,regdate,hit,filename,filesize,hstyle,hsize,rstyle,family,tags "
			+ "FROM house_community)) "
			+ "WHERE num BETWEEN 1 AND 4 "
			+ "ORDER BY hit desc")
	public List<CommunityVO> home_cList();
	
	//글 추가
	 @SelectKey(keyProperty="no", resultType=int.class, before=true,
		     statement="SELECT NVL(MAX(no)+1,1) as no FROM house_community")
   // 자동 증가 번호
   @Insert("INSERT INTO house_community(no,id,subject,content,pwd,regdate,hit,filename,filesize,hstyle,hsize,rstyle,family,tags) VALUES("
   		+ "#{no},#{id},#{subject},#{content},#{pwd},SYSDATE,0,#{filename},#{filesize},#{hstyle},#{hsize},#{rstyle},#{family},#{tags})")
	 public void communityInsert(CommunityVO vo);
	
	//게시물 수정
	 //비번 검색
	 @Select("SELECT pwd FROM house_community WHERE no=#{no}")
	  public String GetPassword(int no);
	 //실제 수정
	 @Update("UPDATE house_community SET "
			 +"id=#{id}, subject=#{subject}, content=#{content}, "
			 + "hstyle=#{hstyle}, hsize=#{hsize}, rstyle=#{rstyle}, family=#{family}, tags=#{tags} "
			 +"WHERE no=#{no}")
	  public void communityUpdate(CommunityVO vo);
	 
	 //게시물 삭제
	 @Delete("DELETE FROM house_community WHERE no=#{no}")
	 public void communityDelete(int no);
	 
	  // 필터 => 동적 쿼리 (마이바티스)
	 @Select({
		  "<script>"
		  +"SELECT no,id,subject,content,pwd,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,hit,filename,filesize,hstyle,hsize,rstyle,family,tags "
		  +"FROM house_community WHERE hit>=0 "
		  + "<if test=\"fs1 !='a'.toString()\">"
		  + "AND hstyle like '%'||#{fs1}||'%'"
		  + "</if>"
		  + "<if test=\"fs2 !='b'.toString()\">"
		  + "AND rstyle like '%'||#{fs2}||'%'"
		  + "</if>"
		  + "<if test=\"fs3 !='c'.toString()\">"
		  + "AND family like '%'||#{fs3}||'%'"
		  + "</if>"	
		  +"</script>"
	  })
	  public List<CommunityVO> communityFilter(Map map);	 
		 
	 //태그검색
	 @Select("SELECT no,id,subject,content,pwd,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,hit,filename,filesize,hstyle,hsize,rstyle,family,tags "
	 		+ "FROM house_community "
	 		+ "WHERE tags like '%'||#{tag}||'%'")
	 public List<CommunityVO> communityTag(String tag);
	 
	 //필터 개수 검색
	 @Select({
		 "<script>"
		 +"SELECT COUNT(*) from house_community "
		 +"WHERE hit>=0 "
				  + "<if test=\"fs1 !='a'.toString()\">"
				  + "AND hstyle like '%'||#{fs1}||'%'"
				  + "</if>"
				  + "<if test=\"fs2 !='b'.toString()\">"
				  + "AND rstyle like '%'||#{fs2}||'%'"
				  + "</if>"
				  + "<if test=\"fs3 !='c'.toString()\">"
				  + "AND family like '%'||#{fs3}||'%'"
				  + "</if>"	
				  +"</script>"
	 })
	 public String numberFind(Map map);
	 
	 //태그 개수 검색
	 @Select("SELECT COUNT(*) from house_community "
		 		+ "WHERE tags like '%'||#{tag}||'%'")
	 public String numberTagFind(String tag);
	 
////////////////////////~여기서부터 댓글~/////////////////////////////////////////////	 	 
	 //댓글 올리기
	 @SelectKey(keyProperty="no", resultType=int.class, before=true,
		     statement="SELECT NVL(MAX(no)+1,1) as no FROM house_comm_reply")
	 @Insert("INSERT INTO house_comm_reply(no,bno,id,msg,group_id) VALUES("
	 		+ "#{no},#{bno},#{id},#{msg},"
	 		+ "(SELECT NVL(MAX(group_id)+1,1) FROM house_comm_reply))")
	 public void replyInsert(CommReplyVO vo);
	 
	 //댓글 읽어오기
	 @Select("SELECT no,bno,id,msg,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') as dbday,group_id,group_step,group_tab,root,depth "
			 +"FROM house_comm_reply "
			 +"WHERE bno=#{bno}"  
			 +"ORDER BY group_id ASC , group_step ASC") // group_id DESC (최신순) group_step ASC(답변 순서)
	  public List<CommReplyVO> replyListData(int bno);
	 
	 //댓글 수정
	 @Update("UPDATE house_comm_reply SET "
			 +"msg=#{msg} "
			 +"WHERE no=#{no}")
	  public void replyUpdate(CommReplyVO vo);
	 
	// 댓글 - 댓글  => Tansaction 처리 
	  // 1. 댓글 대상의 정보 : group_id,step,tab : SELECT
	  @Select("SELECT group_id,group_step,group_tab "
			 +"FROM house_comm_reply "
			 +"WHERE no=#{no}")
	  public CommReplyVO replyParentInfoData(int no);
	  // 2. step 변경  : UPDATE 
	  @Update("UPDATE house_comm_reply SET "
			 +"group_step=group_step+1 "
			 +"WHERE group_id=#{group_id} AND group_step>#{group_step}")
	  public void replyStepIncrement(CommReplyVO vo);
	  // 3. insert : INSERT
	  @Insert("INSERT INTO house_comm_reply(no,bno,id,msg,group_id,group_step,group_tab,root) "
			 +"VALUES(srp_no_seq.nextval,#{bno},#{id},#{msg},"
			 +"#{group_id},#{group_step},#{group_tab},#{root})")
	  public void reply2Insert(CommReplyVO vo);
	  // 4. depth 증가 : UPDATE 
	  @Update("UPDATE house_comm_reply SET "
			 +"depth=depth+1 "
			 +"WHERE no=#{no}")
	  public void replyDepthIncrement(int no);
	  
	  // 댓글 삭제  트랜잭션 대상 
	  // 1. depth,root 읽기  SELECT
	  @Select("SELECT depth,root "
			 +"FROM house_comm_reply "
			 +"WHERE no=#{no}")
	  public CommReplyVO replyDepthInfoData(int no);
	  // 2. depth==0 삭제  , depth!=0 수정  DELETE/UPADTE
	  @Delete("DELETE FROM house_comm_reply "
			 +"WHERE no=#{no}")
	  public void replyDelete(int no);
	  @Update("UPDATE house_comm_reply SET "
			 +"msg='삭제된 댓글입니다.' "
			 +"WHERE no=#{no}")
	  public void replyMsgUpdate(int no);
	  // 3. depth 감소  UPDATE 
	  @Update("UPDATE house_comm_reply SET "
			 +"depth=depth-1 "
			 +"WHERE no=#{no}")
	  public void replyDepthDecrement(int no);
	  
	
}