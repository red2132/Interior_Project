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
	
	@Select("SELECT CEIL(COUNT(*)/9.0) FROM secondhand_item")
	public int secondTotalPage(Map map);					
}
