package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.QandAMapper;

@Repository
public class QandADAO {
	@Autowired
	private QandAMapper mapper;
	
	
}
