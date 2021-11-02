package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.CommunityVO;

public interface CommunityMapper {
	
	//커뮤니티 그냥 목록 출력
	@Select("SELECT no,id,subject,content,pwd,regdate,hit,filename,filesize,hstyle,hsize,rstyle,family,tags,num "
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
	 
	@Select("SELECT no,id,subject,content,pwd,regdate,hit,filename,filesize,hstyle,hsize,rstyle,family,tags "
			+ "FROM house_community WHERE no=#{no}")
	public CommunityVO cDetail(int no);
	
	//홈에 출력할 메뉴 출력
	@Select("SELECT no,id,subject,content,pwd,regdate,hit,filename,filesize,hstyle,hsize,rstyle,family,tags,num "
			+ "FROM (SELECT no,id,subject,content,pwd,regdate,hit,filename,filesize,hstyle,hsize,rstyle,family,tags,rownum as num "
			+ "FROM (SELECT no,id,subject,content,pwd,regdate,hit,filename,filesize,hstyle,hsize,rstyle,family,tags "
			+ "FROM house_community)) "
			+ "WHERE num BETWEEN 1 AND 5 "
			+ "ORDER BY hit desc")
	public List<CommunityVO> home_cList();
	
	//글 추가
	 @SelectKey(keyProperty="no", resultType=int.class, before=true,
		     statement="SELECT NVL(MAX(no)+1,1) as no FROM house_community")
   // 자동 증가 번호
   @Insert("INSERT INTO house_community VALUES("
		   //no,id,subject,content,pwd,regdate,hit,filename,filesize,hstyle,hsize,rstyle,family,tags
		  +"#{no},\"\",#{id},#{subject},#{content},#{pwd},#{filename},#{filesize} "
		  +"FROM house_community))")
   public void communityInsert(CommunityVO vo);
	
	//게시물 수정
	 //비번 검색
	 @Select("SELECT pwd FROM house_community WHERE no=#{no}")
	  public String boardGetPassword(int no);
	 //실제 수정
	 @Update("UPDATE house_community SET "
			 +"#{id},#{subject},#{content},#{filename},#{filesize},#{hstyle},#{hsize},#{rstyle},#{family},#{tags} "
			 +"WHERE no=#{no}")
	  public boolean communityUpdate(CommunityVO vo);
	 
	 //게시물 삭제
	 @Delete("DELETE FROM house_community WHERE no=#{no}")
	  public boolean communityDelete(int no);
	 
	 
}
