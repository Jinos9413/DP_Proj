package com.dogcompany.dogapp.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.dogcompany.dogapp.model.CareDTO;
import com.dogcompany.dogapp.model.PhotoDTO;

@Repository(value="photoDao")
public class PhotoDAO {
	@Resource(name = "template")
	private SqlSessionTemplate sqlMapper;

	public boolean isLogin(Map map) {
		return (Integer)sqlMapper.selectOne("p_IsLogin",map) == 1? true: false;
	}

	public List<PhotoDTO> selectList(Map map) {
		return sqlMapper.selectList("p_SelectList",map);
	}

	public int getTotalRecord(Map map) {
		return sqlMapper.selectOne("p_TotalCount",map);
	}
	
	public Map selectOne(Map map) {
		return sqlMapper.selectOne("p_SelectOne",map);
	}
	public List<PhotoDTO> select(Map map) {
		return sqlMapper.selectList("p_Select",map);
	}
	public int insert(Map map) {
		return sqlMapper.insert("p_Insert",map);
	}

	public int delete(Map map) {
		return sqlMapper.delete("p_Delete",map);
	}

	public int update(Map map) {
		return sqlMapper.update("p_Update",map);
	}

	public String findNameById(String id) {
		return sqlMapper.selectOne("p_FindNameById", id);
	}
	
	//좋아요 dao
	public int likeInsert(Map map) {
		return sqlMapper.insert("p_LikeInsert", map);
	}
	public int likeDelte(Map map) {
		return sqlMapper.delete("p_LikeDelete", map);
	}
	public int getLike(Map map) {
		return sqlMapper.update("p_GetLike",map);
	}

	public int likeCheck(Map map) {
		return sqlMapper.selectOne("p_LikeCheck",map);
	}

	public int likeCount(Map map) {
		return sqlMapper.selectOne("p_LikeCount",map);
	}

	//댓글 dao
	public List<Map> selectComment(Map map) {
		return sqlMapper.selectList("p_SelectComment",map);
	}

	public int insertCommnet(Map map) {
		return  sqlMapper.insert("p_InsertComment",map);
	}

	public int deleteComment(Map map) {
		return sqlMapper.delete("p_DeleteComment",map);
	}

	public String getlastNCNo(Map map) {
		return sqlMapper.selectOne("p_getlastNCNo", map);
	}
	
	public int setCommentCount(Map map) {
		return sqlMapper.update("p_SetCommentCount",map);

	}

	public String commentCount(Map map) {
		return sqlMapper.selectOne("p_CommentCount",map);
	}

	public int reportInsert(Map map) {
		return sqlMapper.insert("p_ReportInsert",map);
	}

	
	
}///////////class