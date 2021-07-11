package com.dogcompany.dogapp.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.dogcompany.dogapp.model.CareDTO;

@Repository(value="careDao")
public class CareDAO {
	@Resource(name = "template")
	private SqlSessionTemplate sqlMapper;

	public boolean isLogin(Map map) {
		return (Integer)sqlMapper.selectOne("careIsLogin",map) == 1? true: false;
	}

	public List<CareDTO> selectList(Map map) {
		return sqlMapper.selectList("careSelectList",map);
	}
	public List<CareDTO> selectListByLike(Map map) {
		return sqlMapper.selectList("careselectListByLike", map);
	}
	public int getTotalRecord(Map map) {
		return sqlMapper.selectOne("careTotalCount",map);
	}
	public int getTotalRecordByLike(Map map) {
		return sqlMapper.selectOne("getTotalRecordByLike",map);
	}
	
	public CareDTO selectOne(Map map) {
		return sqlMapper.selectOne("careSelectOne",map);
	}
	public List<CareDTO> select(Map map) {
		return sqlMapper.selectList("careSelect",map);
	}

	public int insert(Map map) {
		return sqlMapper.insert("careInsert",map);
	}

	public int delete(Map map) {
		return sqlMapper.delete("careDelete",map);
	}

	public int update(Map map) {
		return sqlMapper.update("careUpdate",map);
	}

	public String findNameById(String id) {
		return sqlMapper.selectOne("careFindNameById", id);
	}

	public int insertcareServiceRating(Map map) {
		return sqlMapper.insert("careInsertcareServiceRating",map);
	}

	public int updateStateFinish(Map map) {
		return sqlMapper.update("careUpdateStateFinish", map);
	}

	public Map selectRateOne(Map map) {
		return sqlMapper.selectOne("careSelectRateOne", map);
	}

	public Map getAddress(Map map) {
		return sqlMapper.selectOne("careGetAddress", map);
	}

	public Integer selectCountCareLike(CareDTO item) {
		return sqlMapper.selectOne("careSelectCountCareLike", item);
	}

	public Integer selectCountCareChat(CareDTO item) {
		return sqlMapper.selectOne("careSelectCountCareChat", item);
	}

	public Integer selectCheckLike(CareDTO item) {
		return sqlMapper.selectOne("careSelectCheckLike", item);
	}


	public int insertLike(Map map) {
		return sqlMapper.insert("careInsertLike", map);
	}

	public int deleteLike(Map map) {
		return sqlMapper.delete("careDeleteLike", map);
	}

	public List<Map> selectReviewList(Map map) {
		return sqlMapper.selectList("trainerSelectReviewList", map);
	}

	public Map selectTrainerOne(Map map) {
		return sqlMapper.selectOne("trainerSelectTrainerOne", map);
	}


}///////////class