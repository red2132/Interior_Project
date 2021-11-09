package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;

public interface NewItemMapper_imsi {
	//1. 베스트 목록 출력
	@Select("SELECT no,img,title,cate1,cate2,price,score,reviewCnt "
			+ "FROM new_item "
			+ "GROUP BY no,img,title,cate1,cate2,price,score,reviewCnt "
			+ "HAVING cate1=#{cate1} AND cate2=#{cate2} "
			+ "ORDER BY score DESC, reviewCnt DESC")
	public List<NewItemVO> bestItemListData(Map map);
}
