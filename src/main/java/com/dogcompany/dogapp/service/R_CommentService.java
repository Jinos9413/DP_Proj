package com.dogcompany.dogapp.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.dogcompany.dogapp.model.RecommendationDTO;
import com.dogcompany.dogapp.web.ListPagingData;
import com.dogcompany.dogapp.web.PagingUtil;

@Service(value = "r_commentService")
public class R_CommentService {
	
	@Autowired
	private RecommendationDAO dao;
	
	
	public boolean isLogin(Map map) {
		
		return dao.isLogin(map);
	}
	
	private int pageSize = 4;
	private int blockPage = 5;

	
	public ListPagingData<Map> selectListPaging(Map map,HttpServletRequest req,int nowPage) {	
		
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
		String pagingString=PagingUtil.pagingBootStrapStyle(totalRecordCount,pageSize, blockPage, nowPage,req.getContextPath()+"/Community/Recommendation/R_Main.do?");
		
		ListPagingData<Map> listPagingData = 
				ListPagingData.builder()
					.lists(lists)
					.nowPage(nowPage)
					.pageSize(pageSize)
					.pagingString(pagingString)
					.TotalRecordCount(totalRecordCount)
					.build();
		
		return listPagingData;
	}
	
	public List<Map> selectList(Map map) {		
		return dao.select(map);
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
	
	public String insert(Map map) {
		//영향받은 행의 수가 아니라 새로 입력된 레코드의 키값(lno)를 반환 받는다
		int r_c_no = dao.insert(map);
		String name = dao.findNameById(map.get("id").toString());
		return name+":"+r_c_no;
	}
	
}////////////