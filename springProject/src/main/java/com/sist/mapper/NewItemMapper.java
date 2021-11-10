package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.NewItemVO;
import com.sist.vo.ReplyVO;
import com.sist.vo.SecondItemVO;

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
	
	//리스트 출력 - 동적쿼리
	@Select({ "<script>" 
			+ "SELECT no,img,title,price,reviewCnt,score,num " 
			+ "FROM (SELECT no,img,title,price,reviewCnt,score,rownum as num "
			+ "FROM (SELECT no,img,title,price,reviewCnt,score "
			+ "FROM new_item WHERE cate1=#{cate1} AND cate2=#{cate2} ORDER BY no)) "
			+ "WHERE num BETWEEN #{start} AND #{end} " 
			+ "<if test='sort==1'>ORDER BY to_number(REGEXP_REPLACE(price,'[^0-9]'))</if>"//가격낮은순
			+ "<if test='sort==2'>ORDER BY to_number(REGEXP_REPLACE(price,'[^0-9]')) DESC</if>"//가격높은순
			+ "<if test='sort==3'>ORDER BY reviewCnt DESC</if>"//리뷰많은순
			+ "<if test='sort==4'>ORDER BY score DESC</if>"//평점높은순
			+ "</script>" })
	public List<NewItemVO> categorySelectData(Map map);
	
	////////////////////////////////////////////////////////////////////////////////
	
	//상세보기
	@Select("SELECT no,reviewCnt,img,cate1,cate2,title,cmt,regdate,price,score "
			+ "FROM new_item WHERE no=#{no}")
	public NewItemVO nDetail(int no);
	//댓긇
	//댓글 출력
	
	//댓긋 갯수
	@Select("SELECT COUNT(*) FROM reply WHERE item_no=#{item_no} AND cate=#{cate}")
	public int replyCnt(Map map);
	
	// 댓글가져오기
		@Select("SELECT no,item_no,cate,content,pwd,id,TO_CHAR(regdate,'YYYY-MM-DD hh24:mi:ss') as dbday " + "FROM reply "
				+ "WHERE item_no=#{item_no} AND cate=#{cate}" + "ORDER BY regdate desc")
		public List<ReplyVO> replyData(Map map);

		// 댓글 입력
		@Insert("INSERT INTO reply(no,item_no,cate,content,pwd,id,regdate) VALUES("
				+ "(SELECT NVL(MAX(no)+1,1) FROM reply),#{item_no},#{cate},#{content},#{pwd},#{id},SYSDATE)")
		public void replyInsert(ReplyVO rvo);

		// 댓글 수정 -> 하는중
		@Update("UPDATE reply SET content=#{content} WHERE no=#{no}")
		public void replyUpdate(Map map);

		// 댓글 삭제
		@Delete("DELETE FROM reply WHERE no=#{no}")
		public void replyDelete(int no);
	
	
}
