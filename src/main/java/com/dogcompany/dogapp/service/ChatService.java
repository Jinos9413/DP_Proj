package com.dogcompany.dogapp.service;

import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service(value = "chatService") 
public class ChatService {
	@Autowired
	private ChatDAO dao;
	
	
	public int insertChatMessage(Map map) {
		return dao.insertChatMessage(map);
	}

	public List<Map> selectChatList(Map map) {
		return dao.selectChatList(map);
	}



	public List<Map> selectCnoList(Map map) {
		List<Map> lists = dao.selectCnoList(map);
		List<Map> listMap = new Vector<Map>();
		for(Map cnoMap:lists) {
			Map oneList = dao.selectCnoListOne(cnoMap);
			oneList.put("T_PHOTO", oneList.get("T_PHOTO").toString().split("/")[0]);
			listMap.add(oneList);
		}
		return listMap;
	}

	public List<Map> selecttnoList(Map map) {
		List<Map> lists = dao.selecttnoList(map);
		List<Map> listMap = new Vector<Map>();
		for(Map cnoMap:lists) {
			Map oneList = dao.selecttnoListOne(cnoMap);
			listMap.add(oneList);
		}
		return listMap;
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

	public int updateState(Map map) {
		return dao.updateState(map);
	}

	public String selectIdByCareNo(Map map) {
		return dao.selectIdByCareNo(map);
	}

	public String selectIdByTNo(Map map) {
		return dao.selectIdByTNo(map);
	}

}
