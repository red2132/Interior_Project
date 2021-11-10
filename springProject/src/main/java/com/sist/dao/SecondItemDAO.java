package com.sist.dao;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.SecondItemMapper;
import com.sist.vo.ReplyVO;
import com.sist.vo.SecondItemVO;

@Repository
public class SecondItemDAO {
	@Autowired
	private SecondItemMapper mapper;

	public List<String> sCategory() {
		return mapper.sCategory();
	}

	public List<String> sCategory2(String s2) {
		return mapper.sCategory2(s2);
	}

	public List<String> sCategory3(String s3) {
		return mapper.sCategory3(s3);
	}

	public int secondItemCnt(Map map) {
		return mapper.secondItemCnt(map);
	}

	public int secondItemFindcnt(Map map) {
		return mapper.secondItemFindcnt(map);
	}

	public int secondItemTotalPage(Map map) {
		return mapper.secondItemTotalPage(map);
	}

	public List<SecondItemVO> secondItemFindData(Map map) {
		return mapper.secondItemFindData(map);
	}

	public List<SecondItemVO> categorySelectData(Map map) {
		return mapper.categorySelectData(map);
	}
	
	public List<SecondItemVO> recommendData(Map map){
		return mapper.recommendData(map);
	}
	
	public SecondItemVO secondItemData(int no) {
		return mapper.secondItemData(no);
	}
	
	public void secondItemInsert(SecondItemVO vo){
		 mapper.secondItemInsert(vo);
	}
	
	public void secondItemDelete(int no){
		mapper.secondItemDelete(no);
	}

	/////////////// 댓글

	// 댓글 개수
	public int replyCnt(Map map) {
		return mapper.replyCnt(map);
	}

	// 댓글 출력
	public List<ReplyVO> replyData(Map map) {
		return mapper.replyData(map);
	}

	// 댓글 입력
	public void replyInsert(ReplyVO rvo) {
		mapper.replyInsert(rvo);
	}

	
	//// 댓글 수정
	 public void replyUpdate(Map map) {
		 mapper.replyUpdate(map);
	 }

	// 댓글 삭제
	public void replyDelete(int no) {
		mapper.replyDelete(no);
	}

}
