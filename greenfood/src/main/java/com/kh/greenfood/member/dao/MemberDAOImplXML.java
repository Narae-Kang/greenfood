package com.kh.greenfood.member.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.kh.greenfood.member.vo.MemberVO;

// ============참고하세요==============
// ===DAOImplXML 양식 : 메서드+Green===
// ===객체 및 생성자 수업자료와 동일함====
// ===map 컬렉션 사용 양식도 동일함======
// ===99번줄 메서드 일단 보류중==========

@Repository
public class MemberDAOImplXML implements MemberDAO {

	private static final Logger logger 
	= LoggerFactory.getLogger(MemberDAOImplXML.class);
	
	@Inject
	private SqlSession sqlSession;
	
	//회원등록
	@Override
	public int joinGreen(MemberVO memberVO) {
		logger.info("MemberDAOImplXML.joinGreen(MemberVO memberVO) 호출됨!");
		return sqlSession.insert("mappers.MemberDAO-mapper.joinGreen", memberVO);
	}
	//회원수정
	@Override
	public int modifyGreen(MemberVO memberVO) {
		logger.info("MemberDAOImplXML.modifyGreen(MemberVO memberVO) 호출됨!");
		return sqlSession.update("mappers.MemberDAO-mapper.modifyGreen", memberVO);
	}
	//회원 전체조회
	@Override
	public List<MemberVO> selectAllGreen() {
		logger.info("MemberDAOImplXML.List<MemberVO> selectAllGreen() 호출됨");
		return sqlSession.selectList("mappers.MemberDAO-mapper.selectAllGreen");
	}
	//회원 개별조회
	@Override
	public MemberVO selectGreen(String id) {
		logger.info("MemberDAOImplXML.selectGreen(String id) 호출됨!");
		return sqlSession.selectOne("mappers.MemberDAO-mapper.selectGreen", id);
	}
	//회원 탈퇴
	@Override
	public int outGreen(String id, String pw) {
		logger.info("MemberDAOImplXML.outGreen(String id, String pw) 호출됨!");
		Map<String,String> map = new HashMap<>();
		map.put("id", id);
		map.put("pw", pw);
		return sqlSession.delete("mappers.MemberDAO-mapper.outGreen", map);
	}
	//로그인
	@Override
	public MemberVO loginGreen(String id, String pw) {
		logger.info("MemberDAOImplXML.loginGreen(String id, String pw) 호출됨!");
		MemberVO memberVO = new MemberVO();
		memberVO.setId(id);
		memberVO.setPw(pw);
		logger.info("입력아이디 : "+		id);
		logger.info("입력 비번 : "+		pw);
		return sqlSession.selectOne("mappers.MemberDAO-mapper.loginGreen", memberVO);
	}
	//아이디 찾기
	@Override
	public String findID(String tel, Date birth) {
		logger.info("MemberDAOImplXML.findID(String tel, Date birth) 호출됨!");
		MemberVO memberVO = new MemberVO();
		memberVO.setTel(tel);
		memberVO.setBirth(birth);		
		return sqlSession.selectOne("mappers.MemberDAO-mapper.findID", memberVO);
	}
	/*
	 * //비밀번호 대상 찾기
	 * 
	 * @Override public int findPW(MemberVO memberVO) {
	 * logger.info("MemberDAOImplXML.findPW(MemberVO memberVO) 호출됨!"); return
	 * sqlSession.selectOne("mappers.MemberDAO-mapper.findPW", memberVO); } //비밀번호
	 * 변경
	 * 
	 * @Override public int changePW(String id, String pw) {
	 * logger.info("MemberDAOImplXML.changePW(String tel, String pw) 호출됨!");
	 * MemberVO memberVO = new MemberVO(); memberVO.setId(id); memberVO.setPw(pw);
	 * return sqlSession.update("mappers.MemberDAO-mapper.changePW", memberVO); }
	 */

	@Override
	public int ViewMyShopInfo(String id) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	//비밀번호
	@Override
	public void newPassword(MemberVO memberVO) {
		String pw = memberVO.getPw();
		memberVO.setPw(pw);
		sqlSession.update("newPassword", memberVO);
	}
	

}
