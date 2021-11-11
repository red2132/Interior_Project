package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.NewItemVO;
import com.sist.vo.ReplyVO;
import com.sist.vo.SecondItemVO;
import com.sist.vo.CartVO;

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
	

	/////////////////////////////////////////////////////////////////////////
	//▼ 연관 새상품 추천 목록 출력
	//1-1. 해당 번호의 카테고리1, 카테고리2 가져오기
	@Select("SELECT cate1, cate2 FROM new_item WHERE no=#{no}")
	public NewItemVO newItemGetCategory(int no);
	//1-2. 목록출력
	@Select("SELECT no,reviewCnt,score,img,title,price,num " 
			+ "FROM (SELECT no,reviewCnt,score,img,title,price,rownum as num " 
			+ "FROM (SELECT no,reviewCnt,score,img,title,price "
			+ "FROM new_item WHERE cate1=#{cate1} AND cate2=#{cate2} ORDER BY score DESC, reviewCnt DESC)) " 
			+ "WHERE num BETWEEN 1 AND 10")
	public List<NewItemVO> bestItemListData(Map map2);
	/////////////////////////////////////////////////////////////////////////
	
	
	
	/////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////
	
	// 장바구니 등록 
	@Insert("INSERT INTO cart VALUES("
		  + "(SELECT NVL(MAX(cart_id)+1,1) FROM cart),#{id},#{product_id},#{amount},SYSDATE,0,0)")
	public void cartInsert(CartVO vo);
	
	// 마이페이지 => 취소/결제 => 결제(이메일로 전송)
	@Select("SELECT /*+ INDEX_DESC(cart cart_id_pk)*/ cart_id,id,amount,ischeck,issale, "
		  + "(SELECT title FROM new_item WHERE new_item.no=cart.product_id) as product_name, "
		  + "(SELECT img FROM new_item WHERE new_item.no=cart.product_id) as product_poster, "
		  + "(REPLACE ((SELECT price FROM new_item WHERE new_item.no=cart.product_id), ',', '')) as product_price "
		  + "FROM cart "
		  + "WHERE id=#{id}")
	public List<CartVO> cartListData(String id);
	
	// 구매요청 
	@Update("UPDATE cart SET "
		  + "issale=1 "
		  + "WHERE cart_id = #{cart_id}")
	public void cartSaleUpdate(int cart_id);
	
	// 구매취소 
	@Delete("DELETE FROM cart "
		  + "WHERE cart_id = #{cart_id}")
	public void cartSaleDelete(int cart_id);
	
	// 어드민 페이지에서 결제 
	@Select("SELECT /*+ INDEX_DESC(cart cart_id_pk)*/ cart_id,id,amount,ischeck,issale,"
		  + "(SELECT title FROM new_item WHERE new_item.no=cart.product_id) as product_name,"
		  + "(SELECT img FROM new_item WHERE new_item.no=cart.product_id) as product_poster,"
		  + "(REPLACE ((SELECT price FROM new_item WHERE new_item.no=cart.product_id), ',', '')) as product_price "
		  + "FROM cart "
		  + "WHERE issale=1")
	public List<CartVO> cartAdminListData();
	   
	@Update("UPDATE cart SET "
		  + "ischeck=1 "
		  + "WHERE cart_id=#{cart_id}")
	public void goodsAdminYes(int cart_id);
	   
	@Select("SELECT /*+ INDEX_DESC(cart cart_id_pk)*/ cart_id,id,amount,ischeck,issale,"
		  + "(SELECT title FROM new_item WHERE new_item.no=cart.product_id) as product_name,"
		  + "(SELECT img FROM new_item WHERE new_item.no=cart.product_id) as product_poster,"
		  + "(REPLACE ((SELECT price FROM new_item WHERE new_item.no=cart.product_id), ',', '')) as product_price "
		  + "FROM cart "
		  + "WHERE cart_id=#{cart_id}")
	public CartVO cartYesData(int cart_id);
	
	/////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////
	@Select("SELECT no,img,title,price,num "
			+ "FROM(SELECT no,img,title,price,rownum as num "
			+ "FROM(SELECT no,img,title,price "
			+ "FROM new_item ORDER BY dbms_random.random))"
			+ "WHERE num <= #{n}")
	public List<NewItemVO> randData(int n);
}
