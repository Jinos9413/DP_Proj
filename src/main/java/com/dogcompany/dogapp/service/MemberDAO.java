package com.dogcompany.dogapp.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dogcompany.dogapp.model.MemberDTO;


@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlMapper;

	public int join(Map map) {
		int result = 0;
		try {
			result=sqlMapper.insert("memberJoin",map);
		}
		catch(Exception e) {
			System.out.println("에러: " + e.getMessage());
			return -2;
		}
		return result;
	}
	public int isExistMember(Map map) {
		return sqlMapper.selectOne("memberExist",map);
	}
	public int idChk(MemberDTO dto) throws Exception {
		int result = sqlMapper.selectOne("memberidChk",dto);
		return result;
	}
	public int nickChk(MemberDTO dto) {
		int result = sqlMapper.selectOne("membernickChk",dto);
		return result;
	}
	public int isMember(Map map) {
		return sqlMapper.selectOne("memberIsMember",map);
	}
	
	public Map getPower(Map map) {
		return sqlMapper.selectOne("memberGetPower", map);
	}
	public boolean isAuthMember(Map map) {
		return (Integer)sqlMapper.selectOne("memberExist", map) == 1? true:false;
	}
	public int selectTrainer(Map map) {
		return sqlMapper.selectOne("selectTrainer",map)==null?-1:sqlMapper.selectOne("selectTrainer",map);
	}
	public Map getAddr(Map map) {
		return sqlMapper.selectOne("memberGetAddr", map);
	}
	
	////////////////////////////////////////////////////////////마이페이지
	public Map selectList(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("memberList",map);
	}
	public int updateProfile(Map map) {
		int result = sqlMapper.update("updateProfile",map);
		return result;
	}
	public int insertdog(Map map) {
		int result = 0;
		try {
			result=sqlMapper.insert("dogJoin",map);
		}
		catch(Exception e) {
			System.out.println("에러: " + e.getMessage());
			return -2;
		}
		return result;
	}
	public List<Map> selectDogList(Map map) {
		return sqlMapper.selectList("dogList",map);
	}
	public Map selectDogOne(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("dogSelectDogOne", map);
	}
	public int updateMypet(Map map) {
		int result = sqlMapper.update("updateMypet",map);
		return result;
	}
	public Map selectOneMember(Map map) {
		return sqlMapper.selectOne("memberSelectOneMember", map);
	}
}
