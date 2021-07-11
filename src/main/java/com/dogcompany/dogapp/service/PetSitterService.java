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

@Service
public class PetSitterService {
	
	@Autowired
	private PetSitterDAO dao;

	public int insertPerSitter(Map map) {
		return dao.insertPerSitter(map);
	}
	
	
	
	
}////////////