package com.dogcompany.dogapp.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


@Repository
public class BackendDAO {
	
	@Resource(name = "template")
	private SqlSessionTemplate sqlMapper;

	public List<Map> selectTrainerApplyList() {
		return sqlMapper.selectList("backSelectTrainerApplyList");
	}

	public List<Map> selectTrainerList() {
		return sqlMapper.selectList("backSelectTrainerList");
	}

	public Map selectOneTrainerApply(Map map) {
		return sqlMapper.selectOne("backSelectOneTrainerApply", map);
	}

	public int trainerApplyOk(Map map) {
		return sqlMapper.update("backTrainerApplyOk", map);
	}

	public int trainerApplyNo(Map map) {
		return sqlMapper.delete("backTrainerApplyNo", map);
	}

	public List<Map> selectReviewList(Map map) {
		return sqlMapper.selectList("backSelectReviewList", map);
	}

	public int trainerNo(Map map) {
		return sqlMapper.update("backTrainerNo", map);
	}

	public int trainerYes(Map map) {
		return sqlMapper.update("backTrainerYes", map);
	}

	public List<Map> selectMemberList() {
		return sqlMapper.selectList("backSelectMemberList");
	}
	public List<Map> selectManagerList() {
		return sqlMapper.selectList("backSelectManagerList");
	}
	public Map selectOneMember(Map map) {
		return sqlMapper.selectOne("backSelectOneMember", map);
	}

	public int memberNo(Map map) {
		return sqlMapper.update("backMemberNo", map);
	}

	public int memberYes(Map map) {
		return sqlMapper.update("backMemberYes", map);
	}

	public int managerNo(Map map) {
		return sqlMapper.update("backManagerNo", map);
	}

	public int managerYes(Map map) {
		return sqlMapper.update("backManagerYes", map);
	}

	public List<Map> selectP_ReportList() {
		// TODO Auto-generated method stub
		return null;
	}

	public Map selectOneP_Report(Map map) {
		// TODO Auto-generated method stub
		return null;
	}
	
}///////////class