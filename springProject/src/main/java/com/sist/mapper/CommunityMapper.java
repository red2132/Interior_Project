package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
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
	
}
