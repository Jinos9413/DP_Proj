package com.dogcompany.dogapp.service;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dogcompany.dogapp.model.CareDTO;

@Service
public class AndroidService {
	
	@Autowired
	private AndroidDAO dao;
	
	public Map selectOneMember(Map map) {
		return dao.selectOneMember(map);
	}

	public List<Map> selectListCare1() {
		return dao.selectListCare1();
	}

	public Map selectOneCare1(Map map) {
		return dao.selectOneCare1(map);
	}
	public List<Map> selectCnoList(Map map) {
		List<Map> lists = dao.selectCnoList(map);
		List<Map> listMap = new Vector<Map>();
		for(Map cnoMap:lists) {
			Map oneList = dao.selectCnoListOne(cnoMap);
			listMap.add(oneList);
		}
		return listMap;
	}
	public List<Map> selecttnoList(Map map) {
		List<Map> lists = dao.selecttnoList(map);
		List<Map> listMap = new Vector<Map>();
		for(Map tnoMap:lists) {
			Map oneList = dao.selecttnoListOne(tnoMap);
			listMap.add(oneList);
		}
		return listMap;
	}
	
	
	
	
	
	
	
	
	////////////////////////////////////////////////웹뷰용///////////////////////////////////////////////
	public CareDTO selectCareMapState1(Map map) {
		return dao.selectCareMapState1(map);
	}


	public List<Map> selectChatList(Map map) {
		return dao.selectChatList(map);
	}

	public int updateRead_(Map map) {
		return dao.updateRead_(map);
	}

	public Map selectCnoPerson(Map map) {
		return dao.selectCnoPerson(map);
	}

	public Map selectTnoPerson(Map map) {
		return dao.selectTnoPerson(map);
	}
}////////////