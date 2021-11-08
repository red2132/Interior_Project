package com.sist.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.*;
import com.sist.vo.*;

@Repository
public class PageDAO {
	
	@Autowired
	private PageMapper mapper;
	
	public MypageVO myPageInterestingData(String id)
	{
		return mapper.myPageInterestingData(id);
	}
	
	public List<MypageVO> myPageCommunityData(String id)
	{
		return mapper.myPageCommunityData(id);
	}
	
	public List<MypageVO> myPageReplyData(String id)
	{
		return mapper.myPageReplyData(id);
	}
	
	public String myPageAddressData(String id)
	{
		return mapper.myPageAddressData(id);
	}

}
