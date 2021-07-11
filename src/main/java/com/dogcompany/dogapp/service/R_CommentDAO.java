package com.dogcompany.dogapp.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.dogcompany.dogapp.model.RecommendationDTO;

@Repository(value="r_commentDao")
public class R_CommentDAO {
	@Resource(name = "template")
	private SqlSessionTemplate sqlMapper;

	public boolean isLogin(Map map) {
		return (Integer)sqlMapper.selectOne("r_commentIsLogin",map) == 1? true: false;
	}

	public List<Map> selectList(Map map) {
		return sqlMapper.selectList("r_commentSelectList",map);
	}

	public int insert(Map map) {
		 sqlMapper.insert("r_commentInsert",map);
		 return Integer.parseInt(map.get("r_c_no").toString());
	}
	
	public String findNameById(String id) {
		return sqlMapper.selectOne("r_commentFindNameById", id);
	}
	
	public int delete(Map map) {
		return sqlMapper.delete("r_commentDelete",map);
	}

	public int update(Map map) {
		return sqlMapper.update("r_commentUpdate",map);
	}

	
}///////////class