package com.dogcompany.dogapp.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.dogcompany.dogapp.model.RecommendationDTO;

@Repository(value="recommendationDao")
public class RecommendationDAO {
	@Resource(name = "template")
	private SqlSessionTemplate sqlMapper;

	public boolean isLogin(Map map) {
		return (Integer)sqlMapper.selectOne("recommendationIsLogin",map) == 1? true: false;
	}

	public List<Map> selectList(Map map) {
		return sqlMapper.selectList("recommendationSelectList",map);
	}

	public int getTotalRecord(Map map) {
		return sqlMapper.selectOne("recommendationTotalCount",map);
	}
	
	public Map selectOne(Map map) {
		return sqlMapper.selectOne("recommendationSelectOne",map);
	}
	public List<Map> select(Map map) {
		return sqlMapper.selectList("recommendationSelect",map);
	}
	public int insert(Map map) {
		return sqlMapper.insert("recommendationInsert",map);
	}

	public int delete(Map map) {
		return sqlMapper.delete("recommendationDelete",map);
	}

	public int update(Map map) {
		return sqlMapper.update("recommendationUpdate",map);
	}

	public String findNameById(String id) {
		return sqlMapper.selectOne("recommendationFindNameById", id);
	}

	public Map selectOneView(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("recommendationSelectOneView", map);
	}
	//좋아요
	public int likeInsert(Map map) {
		return sqlMapper.insert("r_LikeInsert", map);
	}
	public int likeDelte(Map map) {
		return sqlMapper.delete("r_LikeDelete", map);
	}
	public int getLike(Map map) {
		return sqlMapper.update("r_GetLike",map);
	}

	public int likeCheck(Map map) {
		return sqlMapper.selectOne("r_LikeCheck",map);
	}

	public int likeCount(Map map) {
		return sqlMapper.selectOne("r_LikeCount",map);
	}
	//댓글
	public List<Map> selectComment(Map map) {
		return sqlMapper.selectList("r_SelectComment",map);

	}
	public int insertCommnet(Map map) {
		//insert는 무조건 영향받은 행의 수 반환 
		return  sqlMapper.insert("r_InsertComment",map);
	}
	public int deleteComment(Map map) {
		return sqlMapper.delete("r_DeleteComment",map);
	}

	public String getlastRCNo(Map map) {
		return sqlMapper.selectOne("r_getlastRCNo", map);
	}
	
	public int setCommentCount(Map map) {
		return sqlMapper.update("r_SetCommentCount",map);
	}
	public String commentCount(Map map) {
		return sqlMapper.selectOne("r_CommentCount",map);
	}
	//신고
	public int reportInsert(Map map) {
		return sqlMapper.insert("r_ReportInsert",map);
	}
	
}///////////class