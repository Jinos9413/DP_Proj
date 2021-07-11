package com.dogcompany.dogapp.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dogcompany.dogapp.model.CareDTO;

@Repository
public class AndroidDAO {
	
	@Autowired
	private SqlSessionTemplate template;

	public Map selectOneMember(Map map) {
		return template.selectOne("androidSelectOneMember", map);
	}

	public List<Map> selectListCare1() {
		return template.selectList("androidSelectCare1");
	}

	public Map selectOneCare1(Map map) {
		return template.selectOne("androidSelectOneCare1", map);
	}

	public List<Map> selectCnoList(Map map) {
		return template.selectList("androidChatSelectCnoList", map);
	}
	public Map selectCnoListOne(Map map) {
		return template.selectOne("androidChatSelectCnoListOne", map);
	}
	public List<Map> selecttnoList(Map map) {
		return template.selectList("androidChatSelecttnoList", map);
	}

	public Map selecttnoListOne(Map map) {
		return template.selectOne("androidChatSelecttnoListOne", map);
	}

	
	
	
	
	
	
	
	
	
	
	
	////////////////////////////웹뷰용////////////////////////////////////
	
	public CareDTO selectCareMapState1(Map map) {
		return template.selectOne("androidSelectCareMapState1",map);
	}
	
	public List<Map> selectChatList(Map map) {
		return template.selectList("androidChatSelectChatList", map);
	}
	
	public int updateRead_(Map map) {
		return template.update("androidChatupdateRead_", map);
	}

	public Map selectCnoPerson(Map map) {
		return template.selectOne("androidChatSelectCnoPerson", map);
	}

	public Map selectTnoPerson(Map map) {
		return template.selectOne("androidChatSelectTnoPerson", map);
	}

	
	/*
	public int insert(MemberDTO member) {
		return template.insert("memberInsert", member);
	}

	public List<MemberDTO> selectList() {
		return template.selectList("memberSelectList");
	}

	public MemberDTO selectOne(String username) {
		return template.selectOne("memberSelectOne",username);
	}

	public int update(MemberDTO dto) {
		return template.update("memberUpdate",dto);
	}

	public int delete(String username) {
		return template.delete("memberDelete",username);
	}

	public MemberDTO join(Map map) {
		return template.selectOne("memberJoin", map);
	}
	
	public List<Map> selectTokens() {
		return template.selectList("selectTokens");
	}
	*/
}
