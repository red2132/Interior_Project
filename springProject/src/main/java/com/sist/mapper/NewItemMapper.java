package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.NewItemVO;

public interface NewItemMapper {
	////////////////////////////////////////////////////////////////////////////////
	
	//카테고리 목록
	@Select("SELECT DISTINCT cate1 FROM new_item ORDER BY cate1")
	public List<String> nCategory();
	//세부카테고리 목록
	@Select("SELECT DISTINCT cate2 FROM new_item WHERE cate1=#{s}")
	public List<String> nCategory2(String s);
	//목록
	@Select("SELECT no,reviewCnt,img,title,regdate,price,num "
			+ "FROM (SELECT no,reviewCnt,img,title,regdate,price,rownum as num "
			+ "FROM (SELECT no,reviewCnt,img,title,regdate,price "
			+ "FROM new_item WHERE cate1=#{cate1} AND cate2=#{cate2} ORDER BY no)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<NewItemVO> nList(Map map);
	//상품 갯수
	@Select("SELECT COUNT(*) FROM new_item WHERE cate1=#{cate1} AND cate2=#{cate2}")
	public int itemCnt(Map map);
	//목록 - 페이지 나누기
	@Select("SELECT CEIL(COUNT(*)/9.0) FROM new_item")
	public int nTotalPage();
	
	////////////////////////////////////////////////////////////////////////////////
	
	//상세보기
	@Select("SELECT no,reviewCnt,img,cate1,cate2,title,cmt,regdate,price,score "
			+ "FROM new_item WHERE no=#{no}")
	public NewItemVO nDetail(int no);
}
