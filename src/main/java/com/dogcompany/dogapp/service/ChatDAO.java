package com.dogcompany.dogapp.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ChatDAO {
	@Resource(name = "template")
	private SqlSessionTemplate sqlMapper;
	
	public int insertChatMessage(Map map) {
		return sqlMapper.insert("doginsertChatMessage", map);
	}

	public List<Map> selectChatList(Map map) {
		return sqlMapper.selectList("dogSelectChatList", map);
	}



	public List<Map> selectCnoList(Map map) {
		return sqlMapper.selectList("chatSelectCnoList", map);
	}

	public Map<String, String> selectCnoListOne(Map map) {
		return sqlMapper.selectOne("chatSelectCnoListOne", map);
	}
	
	public List<Map> selecttnoList(Map map) {
		return sqlMapper.selectList("chatSelecttnoList", map);
	}

	public Map<String, String> selecttnoListOne(Map map) {
		return sqlMapper.selectOne("chatSelecttnoListOne", map);
	}

	public int updateRead_(Map map) {
		return sqlMapper.update("charupdateRead_", map);
	}

	public Map selectCnoPerson(Map map) {
		return sqlMapper.selectOne("chatSelectCnoPerson", map);
	}

	public Map selectTnoPerson(Map map) {
		return sqlMapper.selectOne("chatSelectTnoPerson", map);
	}

	public int updateState(Map map) {
		return sqlMapper.update("chatUpdateState", map);
	}

	public String selectIdByCareNo(Map map) {
		return sqlMapper.selectOne("chatSelectIdByCareNo", map);
	}

	public String selectIdByTNo(Map map) {
		return sqlMapper.selectOne("chatSelectIdByTNo", map);
	}


}
