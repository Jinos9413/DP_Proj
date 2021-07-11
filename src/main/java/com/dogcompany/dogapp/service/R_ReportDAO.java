package com.dogcompany.dogapp.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.dogcompany.dogapp.model.RecommendationDTO;

@Repository(value="r_reportDao")
public class R_ReportDAO {
	@Resource(name = "template")
	private SqlSessionTemplate sqlMapper;

	public int insert(Map map) {
		return sqlMapper.insert("r_reportInsert",map);
	}
		
}///////////class