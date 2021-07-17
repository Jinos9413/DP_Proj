package com.dogcompany.dogapp.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class BackendService {
	
	@Autowired
	private BackendDAO dao;

	public List<Map> selectTrainerApplyList() {
		return dao.selectTrainerApplyList();
	}

	public List<Map> selectTrainerList() {
		return dao.selectTrainerList();
	}

	public Map selectOneTrainerApply(Map map) {
		return dao.selectOneTrainerApply(map);
	}

	public int trainerApplyOk(Map map) {
		return dao.trainerApplyOk(map);
	}

	public int trainerApplyNo(Map map) {
		return dao.trainerApplyNo(map);
	}

	public List<Map> selectReviewList(Map map) {
		return dao.selectReviewList(map);
	}

	public int trainerNo(Map map) {
		return dao.trainerNo(map);
	}
	public int trainerYes(Map map) {
		return dao.trainerYes(map);
	}
	public Map selectOneTrainer(Map map) {
		return dao.selectOneTrainerApply(map);
	}

	public List<Map> selectMemberList() {
		return dao.selectMemberList();
	}
	public List<Map> selectManagerList() {
		return dao.selectManagerList();
	}
	public Map selectOneMember(Map map) {
		return dao.selectOneMember(map);
	}
	public int memberNo(Map map) {
		return dao.memberNo(map);
	}
	public int memberYes(Map map) {
		return dao.memberYes(map);
	}

	public int managerNo(Map map) {
		return dao.managerNo(map);
	}

	public int managerYes(Map map) {
		return dao.managerYes(map);
	}
	
	//신고 관리
	public List<Map> selectP_ReportList() {
		return dao.selectP_ReportList();
	}

	public Map selectOneP_Report(Map map) {
		return dao.selectOneP_Report(map);
	}


	
}////////////