package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.CommunityMapper;
import com.sist.vo.CommunityVO;

@Repository
public class CommunityDAO {

	@Autowired
	private CommunityMapper mapper;
	
	public List<CommunityVO> cList(Map map)
	{
		return mapper.cList(map);
	}
	
	public int cTotalPage()
	{
		return mapper.cTotalPage();
	}
	public CommunityVO cDetail(int no)
	{
		return mapper.cDetail(no);
	}
	public List<CommunityVO> home_cList()
	{
		return mapper.home_cList();
	}
}
