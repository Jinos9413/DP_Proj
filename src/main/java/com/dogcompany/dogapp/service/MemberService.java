package com.dogcompany.dogapp.service;



import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dogcompany.dogapp.model.MemberDTO;


@Service
public class MemberService{
	
	@Autowired
	private MemberDAO dao;
	
	public int insert(Map map) {
		//회원 아이디 중복 체크
		int count = dao.isExistMember(map);
		//증복X -> insert / 중복 -> -1반환
		if(count == 1) return -1;
		return dao.join(map);
	}
	public int idChk(MemberDTO dto) throws Exception {
		int result = dao.idChk(dto);
		return result;
	}
	public int nickChk(MemberDTO dto) {
		int result = dao.nickChk(dto);
		return result;
	}
	public int isMember(Map map) {
		return dao.isMember(map);
	}
	public Map getPower(Map map) {
		return dao.getPower(map);
	}
	public boolean isAuthMember(Map map) {
		if(dao.isAuthMember(map)) return true;
		else return false;
	}
	public int selectTrainer(Map map) {
		return dao.selectTrainer(map);
	}
	public Map getAddr(Map map) {
		return dao.getAddr(map);
	}
	
	//////////////////////////////////////////////////////////////마이페이지
	public Map selectList(Map map) {
		// TODO Auto-generated method stub
		return dao.selectList(map);
	}
	public int MyProfileModi(Map map) {
		// TODO Auto-generated method stub
		return dao.updateProfile(map);
	}
	public int insertdog(Map map) {
		// TODO Auto-generated method stub
		return dao.insertdog(map);
	}
	public List<Map> selectDogList(Map map) {
		// TODO Auto-generated method stub
		return dao.selectDogList(map);
	}
	public Map selectDogOne(Map map) {
		// TODO Auto-generated method stub
		return dao.selectDogOne(map);
	}
	public int petModi(Map map) {
		// TODO Auto-generated method stub
		return dao.updateMypet(map);
	}
	public Map selectOneMember(Map map) {
		return dao.selectOneMember(map);
	}
}
