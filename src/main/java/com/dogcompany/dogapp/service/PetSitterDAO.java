package com.dogcompany.dogapp.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.dogcompany.dogapp.model.CareDTO;

@Repository
public class PetSitterDAO {
	@Resource(name = "template")
	private SqlSessionTemplate sqlMapper;

	public int insertPerSitter(Map map) {
		return sqlMapper.insert("insertPerSitter", map);
	}

	

	
}///////////class