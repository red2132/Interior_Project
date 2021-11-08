package com.sist.mapper;

import java.util.*;
import org.apache.ibatis.annotations.*;

import com.sist.vo.*;

public interface PageMapper {
	
	@Select("SELECT id, interesting_no, interesting_cate "
		  + "FROM mypage "
		  + "WHERE id = #{id}")
	public MypageVO myPageInterestingData(String id);
	
	@Select("SELECT /*+ INDEX_DESC(house_community b_no_pk)*/ no, subject, (TO_CHAR(regdate, 'YYYY-MM-DD')) as dbday "
		  + "FROM house_community "
		  + "WHERE id = #{id}")
	public List<MypageVO> myPageCommunityData(String id);
	
	@Select("SELECT /*+ INDEX_DESC(house_community b_no_pk)*/ no, msg, (TO_CHAR(regdate, 'YYYY-MM-DD')) as dbday "
		  + "FROM house_comm_reply "
		  + "WHERE id = #{id}")
	public List<MypageVO> myPageReplyData(String id);
	
	@Select("SELECT addr1 "
		  + "FROM member "
		  + "WHERE id = #{id}")
	public String myPageAddressData(String id);
	
	
	
}
