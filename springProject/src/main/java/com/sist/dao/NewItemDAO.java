package com.sist.dao;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.NewItemMapper;
import com.sist.vo.NewItemVO;

@Repository



public class NewItemDAO {
	@Autowired
	private NewItemMapper mp;

	// 카테고리 목록
	public List<String> nCategory() {
		return mp.nCategory();
	}
	
	// 세부카테고리 목록
	public List<String> nCategory2(String s){
		return mp.nCategory2(s);
	}
	
	// 목록
	public List<NewItemVO> nList(Map map) {
		return mp.nList(map);
	}
	
	// 상품 갯수
	public int itemCnt(Map map) {
		return mp.itemCnt(map);
	}

	// 목록 - 페이지 나누기
	public int nTotalPage() {
		return mp.nTotalPage();
	}

	// 상세보기
	public NewItemVO nDetail(int no) {
		return mp.nDetail(no);
	}
}
