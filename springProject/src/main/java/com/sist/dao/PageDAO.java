package com.sist.dao;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.*;
import com.sist.vo.*;

@Repository
public class PageDAO {
	
	@Autowired
	private PageMapper mapper;
	
	
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
	
	public MypageVO myPageInterestingData(String id)
	{
		return mapper.myPageInterestingData(id);
	}

	public List<MypageVO> myNewCategoryData()
	{
		return mapper.myNewCategoryData();
	}
	
	public void myPageInterestingUpdate(Map map)
	{
		mapper.myPageInterestingUpdate(map);
	}
	
	public void myPageFirstInterestingInsert(String id)
	{
		mapper.myPageFirstInterestingInsert(id);
	}

}
