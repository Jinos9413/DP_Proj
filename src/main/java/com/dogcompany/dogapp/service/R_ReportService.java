package com.dogcompany.dogapp.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.dogcompany.dogapp.model.CareDTO;
import com.dogcompany.dogapp.web.ListPagingData;
import com.dogcompany.dogapp.web.PagingUtil;

@Service(value = "r_reportService")
public class R_ReportService {
	
	@Autowired
	private R_ReportDAO dao;

	public int insert(Map map) {
		return dao.insert(map);
	}
	
//	public List<Object> map(Map map){
//		return dao.selectList(map);
//	}
	
}////////////