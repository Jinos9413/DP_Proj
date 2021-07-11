package com.dogcompany.dogapp.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.dogcompany.dogapp.model.PhotoDTO;
import com.dogcompany.dogapp.web.ListPagingData;
import com.dogcompany.dogapp.web.PagingUtil;

@Service(value = "photoService")
public class PhotoService {
	
	@Autowired
	private PhotoDAO dao;
	
	
	public boolean isLogin(Map map) {
		
		return dao.isLogin(map);
	}
	
	private int pageSize = 12;
	private int blockPage = 5;

	
	public ListPagingData<PhotoDTO> selectList(Map map,HttpServletRequest req,int nowPage) {	
		
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
		String pagingString=PagingUtil.pagingBootStrapStyle(totalRecordCount,pageSize, blockPage, nowPage,req.getContextPath()+"/Community/Photo/P_Main.do?");
		
		ListPagingData<PhotoDTO> listPagingData = 
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
	public Map selectOne(Map map) {		
		return dao.selectOne(map);
	}
	public List<PhotoDTO> select(Map map) {		
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
	//좋아요
	public int likeInsert(Map map) {
		return dao.likeInsert(map);
	}
	public int likeDelete(Map map) {
		return dao.likeDelte(map);
	}
	public int getLike(Map map) {		
		return dao.getLike(map);
	}

	public int likeCheck(Map map) {
		return dao.likeCheck(map);
	}

	public int likeCount(Map map) {
		return dao.likeCount(map);
	}
	
	//댓글
	public List<Map> selectComment(Map map) {
		return dao.selectComment(map);

	}

	public String insertComment(Map map) {
		//영향받은 행의 수가 아니라 새로 입력된 레코드의 키값(lno)를 반환 받는다
		dao.insertCommnet(map);
		String name=dao.findNameById(map.get("id").toString());
		String n_c_no = dao.getlastNCNo(map);
		String commentcount = dao.commentCount(map);
		
		return name+"&"+n_c_no+"&"+commentcount;
	}

	public String deleteComment(Map map) {
		dao.deleteComment(map);
		String commentcount = dao.commentCount(map);
		return commentcount;
	}
	
	public int setCommentCount(Map map) {
		return dao.setCommentCount(map);
	}

	public int reportInsert(Map map) {
		return dao.reportInsert(map);
	}

}////////////