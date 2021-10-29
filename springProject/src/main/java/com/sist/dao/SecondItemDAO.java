package com.sist.dao;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.SecondItemMapper;
import com.sist.vo.SecondItemVO;
@Repository
public class SecondItemDAO {
	@Autowired
	private SecondItemMapper mapper;
	public List<String> sCategory(){
		return mapper.sCategory();		
	}	
	public List<String> sCategory2(String s2){
		return mapper.sCategory2(s2);
	}		
	public List<String> sCategory3(String s3){
		return mapper.sCategory3(s3);
	}
	public List<SecondItemVO> secondListData(Map map){
		return mapper.secondListData(map);
	}	
	public int secondItemCnt(Map map){
		return mapper.secondItemCnt(map);
	}	
	public int secondTotalPage(Map map){
		return mapper.secondTotalPage(map);
	}
}
