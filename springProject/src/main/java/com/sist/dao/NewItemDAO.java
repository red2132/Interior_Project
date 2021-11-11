package com.sist.dao;

import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.NewItemMapper;
import com.sist.vo.NewItemVO;
import com.sist.vo.ReplyVO;
import com.sist.vo.CartVO;

@Repository

public class NewItemDAO {
	@Autowired
	private NewItemMapper mp;

	// 카테고리 목록
	public List<String> nCategory() {
		return mp.nCategory();
	}

	// 세부카테고리 목록
	public List<String> nCategory2(String s) {
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

	/////////////////  댓글
	
	// 댓글 갯수
	public int replyCnt(Map map) {
		return mp.replyCnt(map);
	}

	// 댓글가져오기
	public List<ReplyVO> replyData(Map map) {
		return mp.replyData(map);
	}

	// 댓글 입력
	public void replyInsert(ReplyVO rvo) {
		mp.replyInsert(rvo);
	}

	// 댓글수정
	public void replyUpdate(Map map) {
		mp.replyUpdate(map);
	}

	// 댓글 삭제
	public void replyDelete(int no) {
		mp.replyDelete(no);
	}
	
	public List<NewItemVO> categorySelectData(Map map){
		return mp.categorySelectData(map);
	}
	
	//////////////////////////////////////
	//////////////////////////////////////
	public void cartInsert(CartVO vo)
	{
		mp.cartInsert(vo);
	}
	public List<CartVO> cartListData(String id)
	{
		return mp.cartListData(id);
	}
	//////////////////////////////////////
	//////////////////////////////////////
	
	
	///////////////////////////////////////////////////
	//▼ 연관 새상품 추천
	//1-1. 해당 게시글의 category 정보 가져오기
	public NewItemVO newItemGetCategory(int no) {
	return mp.newItemGetCategory(no);
	}
	//1-2. best 리스트 출력
	public List<NewItemVO> bestItemListData(Map map2){
	return mp.bestItemListData(map2);
}
}
