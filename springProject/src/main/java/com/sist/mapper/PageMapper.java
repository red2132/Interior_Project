package com.sist.mapper;

import java.util.*;
import org.apache.ibatis.annotations.*;

import com.sist.vo.*;

public interface PageMapper {
	
	// 마이페이지 : 내가 쓴 커뮤니티 글 확인
	@Select("SELECT /*+ INDEX_DESC(house_community b_no_pk)*/ no, subject, "
		  + "(TO_CHAR(regdate, 'YYYY-MM-DD')) as dbday "
		  + "FROM house_community "
		  + "WHERE id = #{id}")
	public List<MypageVO> myPageCommunityData(String id);
	
	// 마이페이지 : 내가 쓴 덧글 확인
	@Select("SELECT /*+ INDEX_DESC(house_community b_no_pk)*/ no, msg, "
		  + "(TO_CHAR(regdate, 'YYYY-MM-DD')) as dbday "
		  + "FROM house_comm_reply "
		  + "WHERE id = #{id}")
	public List<MypageVO> myPageReplyData(String id);
	
	// 마이페이지 : 내 주소 확인 
	@Select("SELECT addr1 "
		  + "FROM member "
		  + "WHERE id = #{id}")
	public String myPageAddressData(String id);
	
	// 마이페이지 : 내 관심 카테고리 확인
	@Select("SELECT DISTINCT cate1, cate2 FROM new_item ORDER BY cate1")
	public List<MypageVO> myNewCategoryData();
	

	
	// ####################################################################
	
	// 관심페이지 : 내 관심 목록 확인
	@Select("SELECT id, interesting_no, interesting_cate "
		  + "FROM mypage "
		  + "WHERE id = #{id}")
	public MypageVO myPageInterestingData(String id);
	
	@Update("UPDATE mypage SET "
		  + "interesting_cate = #{interesting_cate} "
		  + "WHERE id = #{id}")
	public void myPageInterestingUpdate(Map map);
	
}
