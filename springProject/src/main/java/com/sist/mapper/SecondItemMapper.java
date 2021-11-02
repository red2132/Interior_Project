package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Select;
//cate1 사무, cate2 의자 ,cate3 사원용의자
import com.sist.vo.*;

public interface SecondItemMapper {	
	
	@Select("SELECT DISTINCT cate1 FROM secondhand_item ORDER BY cate1")
	public List<String> sCategory();
	
	@Select("SELECT DISTINCT cate2 FROM secondhand_item WHERE cate1=#{s2}")
	public List<String> sCategory2(String s2);
	
	@Select("SELECT DISTINCT cate3 FROM secondhand_item WHERE cate2=#{s3}")
	public List<String> sCategory3(String s3);

	//리스트 출력
	@Select("SELECT no,img,title,price,num "
			+ "FROM (SELECT no,img,title,price,rownum as num "
			+ "FROM (SELECT no,img,title,price "
			+ "FROM secondhand_item WHERE cate1=#{cate1} AND cate2=#{cate2} AND cate3=#{cate3} ORDER BY no)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")	
	public List<SecondItemVO> secondListData(Map map);
	//게시물 수
	@Select("SELECT COUNT(*) FROM secondhand_item WHERE cate1=#{cate1} AND cate2=#{cate2} AND cate3=#{cate3}")
	public int secondItemCnt(Map map);
	
	//검색 결과 갯수
	 @Select({
		  "<script>"
		  +"SELECT COUNT(*) "
		  +"FROM secondhand_item "
		  +"WHERE "
		  +"<trim prefix=\"(\" suffix=\")\" prefixOverrides=\"OR\">"
	      +"<foreach collection=\"fsArr\" item=\"fd\">"
	        +"<trim prefix=\"OR\">"
	          +"<choose>"
	          +"<when test=\"fd=='T'.toString()\">"
	        		  +"title LIKE '%'||#{ss}||'%'"
	            +"</when>"
	            +"<when test=\"fd=='C'.toString()\">"
	            		+"cmt LIKE '%'||#{ss}||'%'"
	            +"</when>"	            
	          +"</choose>"
	        +"</trim>"
	      +"</foreach>"
	    +"</trim>"
		  +"</script>"
	  })
		public int secondItemFindcnt(Map map); // 매개변수는 1개 (여러개 => ~VO,~Map)
		
	@Select("SELECT CEIL(COUNT(*)/9.0) FROM secondhand_item "
			+ "WHERE cate1=#{cate1} AND cate2=#{cate2} AND cate3=#{cate3}")
	public int secondItemTotalPage(Map map);
			
	//검색
	  // 찾기 => 동적 쿼리 (마이바티스)
	  @Select({
		  "<script>"
		  +"SELECT no,img,title,price,cmt "
		  +"FROM secondhand_item "
		  +"WHERE "
		  +"<trim prefix=\"(\" suffix=\")\" prefixOverrides=\"OR\">"
	      +"<foreach collection=\"fsArr\" item=\"fd\">"
	        +"<trim prefix=\"OR\">"
	          +"<choose>"
	          +"<when test=\"fd=='T'.toString()\">"
	        		  +"title LIKE '%'||#{ss}||'%'"
	            +"</when>"
	            +"<when test=\"fd=='C'.toString()\">"
	            		+"cmt LIKE '%'||#{ss}||'%'"
	            +"</when>"	            
	          +"</choose>"
	        +"</trim>"
	      +"</foreach>"
	    +"</trim>"
		  +"</script>"
	  })
		public List<SecondItemVO> secondItemFindData(Map map); //검색 리스트		
	  
	  @Select("SELECT no,img,title,price,num "
				+ "FROM (SELECT no,img,title,price,rownum as num "
				+ "FROM (SELECT no,img,title,price "
				+ "FROM secondhand_item WHERE cate1=#{cate1} AND cate2=#{cate2} AND cate3=#{cate3} ORDER BY no)) "
				+ "WHERE num BETWEEN #{start} AND #{end} "
				+ "ORDER BY to_number(REGEXP_REPLACE(price,'[^0-9]'))")	
		public List<SecondItemVO> secondItemPriceASC(Map map);
	  
	  @Select("SELECT no,img,title,price,num "
				+ "FROM (SELECT no,img,title,price,rownum as num "
				+ "FROM (SELECT no,img,title,price "
				+ "FROM secondhand_item WHERE cate1=#{cate1} AND cate2=#{cate2} AND cate3=#{cate3} ORDER BY no)) "
				+ "WHERE num BETWEEN #{start} AND #{end} "
				+ "ORDER BY to_number(REGEXP_REPLACE(price,'[^0-9]')) DESC")	
		public List<SecondItemVO> secondItemPriceDESC(Map map);
	  
	  @Select({
			"<script>"
		   +"SELECT no,img,title,price,num "
		   +"FROM (SELECT no,img,title,price,rownum as num "
		   +"FROM (SELECT no,img,title,price "
		   +"FROM secondhand_item WHERE cate1=#{cate1} AND cate2=#{cate2} AND cate3=#{cate3} ORDER BY no)) "
		   +"WHERE "
		   +"<if test='aa==1'>"  //기본값
		   +"num BETWEEN #{start} AND #{end} "
		   +"</if>"
		   +"<if test='aa==2'>"  //가격높은순
		   +"num BETWEEN #{start} AND #{end} "
		   +"ORDER BY to_number(REGEXP_REPLACE(price,'[^0-9]'))"
		   +"</if>"
		   +"<if test='aa==3'>"  //가격낮은순
		   +"num BETWEEN #{start} AND #{end} "
		   +"ORDER BY to_number(REGEXP_REPLACE(price,'[^0-9]')) DESC"
		   +"</if>"		   
		   +"</script>"
		})
	    public List<SecondItemVO> categorySelectData(Map map);  //cate1,2,3, start,end 
	  
}
/*
 * 	SELECT title,price FROM secondhand_item
	ORDER BY to_number(REGEXP_REPLACE(price,'[^0-9]'));  가격낮은순
	
	
	SELECT title,price FROM secondhand_item
	ORDER BY to_number(REGEXP_REPLACE(price,'[^0-9]')) DESC; 가격 높은순
 */
	