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
	
	public int secondItemFindcnt(Map map){
		return mapper.secondItemFindcnt(map);
	}
	
	public int secondItemTotalPage(Map map){
		return mapper.secondItemTotalPage(map);
	}

	public List<SecondItemVO> secondItemFindData(Map map){
		return mapper.secondItemFindData(map);
	}
	
	public List<SecondItemVO> secondItemPriceASC(Map map){
		return mapper.secondItemPriceASC(map);
	}
	
	public List<SecondItemVO> secondItemPriceDESC(Map map){
		return mapper.secondItemPriceDESC(map);
	}
	
	public List<SecondItemVO> categorySelectData(Map map){
		return mapper.categorySelectData(map);
	}
	public SecondItemVO secondItemData(int no) {
		return mapper.secondItemData(no);
	}

}
