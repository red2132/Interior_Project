package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.sist.mapper.NewItemMapper_imsi;
import com.sist.vo.NewItemVO;

@Repository
public class NewItemDAO_imsi {
	@Autowired
	private NewItemMapper_imsi mapper;
	
	//1. best 리스트 출력
	public List<NewItemVO> bestItemListData(Map map){
		return mapper.bestItemListData(map);
	}
}
