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

@Service(value = "careService")
public class CareService {
	
	@Autowired
	private CareDAO dao;
	
	
	public boolean isLogin(Map map) {
		
		return dao.isLogin(map);
	}
	
	private int pageSize = 9;
	private int blockPage = 10;

	public ListPagingData<CareDTO> selectListByLike(Map map, HttpServletRequest req, int nowPage) {
		int totalRecordCount=dao.getTotalRecordByLike(map);
		int totalPage =(int)Math.ceil((double)totalRecordCount/pageSize);
		int start = (nowPage -1)*pageSize+1;
		int end = nowPage * pageSize;
		map.put("start", start);
		map.put("end", end);
		List lists=dao.selectListByLike(map);
		String pagingString=PagingUtil.pagingBootStrapStyle(totalRecordCount,pageSize, blockPage, nowPage,req.getContextPath()+"/Care/CareServiceMain.do?");
		ListPagingData<CareDTO> listPagingData = 
				ListPagingData.builder()
					.lists(lists)
					.nowPage(nowPage)
					.pageSize(pageSize)
					.pagingString(pagingString)
					.TotalRecordCount(totalRecordCount)
					.build();
		return listPagingData;
	}
	
	public ListPagingData<CareDTO> selectList(Map map,HttpServletRequest req,int nowPage) {	
		
		//페이징을 위한 로직 시작]
		//전체 레코드수	
		int totalRecordCount=dao.getTotalRecord(map);		
		//전체 페이지수
		int totalPage =(int)Math.ceil((double)totalRecordCount/pageSize);		
		//시작 및 끝 ROWNUM구하기
		int start = (nowPage -1)*pageSize+1;
		int end = nowPage * pageSize;	
		//페이징을 위한 로직 끝]
		map.put("start", start);
		map.put("end", end);
		//글 전체 목록 얻기
		List lists=dao.selectList(map);		
		String pagingString=PagingUtil.pagingBootStrapStyle(totalRecordCount,pageSize, blockPage, nowPage,req.getContextPath()+"/Care/CareServiceMain.do?");
		
		ListPagingData<CareDTO> listPagingData = 
				ListPagingData.builder()
					.lists(lists)
					.nowPage(nowPage)
					.pageSize(pageSize)
					.pagingString(pagingString)
					.TotalRecordCount(totalRecordCount)
					.build();
		
		return listPagingData;
	}
	
	public int getTotalRecord(Map map) {		
		return dao.getTotalRecord(map);
	}
	public CareDTO selectOne(Map map) {		
		return dao.selectOne(map);
	}
	public List<CareDTO> select(Map map) {		
		return dao.select(map);
	}
	public int insert(Map map) {
		return dao.insert(map);
	}

	public int delete(Map map) {		
		return dao.delete(map);
	}

	public int update(Map map) {		
		return dao.update(map);
	}

	public String findNameById(String id) {		
		return dao.findNameById(id);
	}

	public int insertcareServiceRating(Map map) {
		return dao.insertcareServiceRating(map);
	}

	public int updateStateFinish(Map map) {
		return dao.updateStateFinish(map);
	}

	public Map selectRateOne(Map map) {
		return dao.selectRateOne(map);
	}

	public Map getAddress(Map map) {
		return dao.getAddress(map);
	}

	public Integer selectCountCareLike(CareDTO item) {
		return dao.selectCountCareLike(item);
	}

	public Integer selectCountCareChat(CareDTO item) {
		return dao.selectCountCareChat(item);
	}

	public Integer selectCheckLike(CareDTO item) {
		return dao.selectCheckLike(item);
	}

	public int insertLike(Map map) {
		return dao.insertLike(map);
	}

	public int deleteLike(Map map) {
		return dao.deleteLike(map);
	}


	public List<Map> selectReviewList(Map map) {
		return dao.selectReviewList(map);
	}

	public Map selectTrainerOne(Map map) {
		return dao.selectTrainerOne(map);
	}

	
	
}////////////