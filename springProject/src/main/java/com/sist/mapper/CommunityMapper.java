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
		  +"SELECT no,id,subject,content,pwd,regdate,hit,filename,filesize,hstyle,hsize,rstyle,family,tags "
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
	 @Select("SELECT no,id,subject,content,pwd,regdate,hit,filename,filesize,hstyle,hsize,rstyle,family,tags "
	 		+ "FROM house_community "
	 		+ "WHERE tags like '%'||#{tag}||'%'")
	 public List<CommunityVO> communityTag(String tag);
}