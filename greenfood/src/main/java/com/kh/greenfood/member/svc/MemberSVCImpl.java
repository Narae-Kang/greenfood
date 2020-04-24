package com.kh.greenfood.member.svc;

import java.sql.Date;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kh.greenfood.member.dao.MemberDAO;
import com.kh.greenfood.member.vo.MemberVO;

// ============참고하세요==============
// ===SVCImpl양식 : green+jsp이름======
// ===apping주소는 개인 포폴과 동일함====
// ===해당클래스는 수업자료와 거의 동일====
// ===추가 궁금한건 역시 카톡으로 ^오^====

@Service
public class MemberSVCImpl implements MemberSVC {

	private static final Logger logger
		= LoggerFactory.getLogger(MemberSVCImpl.class);
	
	@Inject
	@Qualifier("memberDAOImplXML")
	MemberDAO memberDAO;
	
	//회원등록
	@Override
	public int joinGreen(MemberVO memberVO) {
		logger.info("MemberSVCImpl.joinGreen(MemberVO memberVO) 호출됨");
		return memberDAO.joinGreen(memberVO);
	}
	//회원수정
	@Override
	public int modifyGreen(MemberVO memberVO) {
		logger.info("MemberSVCImpl.modifyGreen(MemberVO memberVO) 호출됨");
		return memberDAO.modifyGreen(memberVO);
	}
	//회원 전체조회
	@Override
	public List<MemberVO> selectAllGreen() {
		logger.info("MemberSVCImpl.selectAllGreen() 호출됨");
		return memberDAO.selectAllGreen();
	}
	//회원 개별조회
	@Override
	public MemberVO selectGreen(String id) {
		logger.info("MemberSVCImpl.selectGreen(String id) 호출됨");
		return memberDAO.selectGreen(id);
	}
	//회원탈퇴
	@Override
	public int outGreen(String id, String pw) {
		logger.info("MemberSVCImpl.outGreen(String id, String pw) 호출됨");
		return memberDAO.outGreen(id, pw);
	}

	//로그인
	@Override
	public MemberVO loginGreen(String id, String pw) {
		logger.info("MemberSVCImpl.loginMember(String id, String pw) 호출됨");
		return memberDAO.loginGreen(id, pw);
	}
	//아이디찾기
	@Override
	public String findID(String tel, Date birth) {
		logger.info("MemberSVCImpl.findID(String tel, Date birth) 호출됨!"+birth);
		return memberDAO.findID(tel, birth);
	}

	/*
	 * //비밀번호 변경대상 찾기
	 * 
	 * @Override public int findPW(MemberVO memberVO) {
	 * logger.info("MemberSVCImpl.findPW(MemberVO memberVO) 호출됨"); return
	 * memberDAO.findPW(memberVO); } //비밀번호 변경
	 * 
	 * @Override public int changePW(String id, String pw) {
	 * logger.info("MemberSVCImpl.changePW(String id, String pw) 호출됨"); return
	 * memberDAO.changePW(id, pw); }
	 */
	@Override
	public int ViewMyShopInfo(String id) {
		return 0;
	}
	//비밀번호 이메일 전송
	@Override
	public void newPassword(MemberVO memebrVO){
		memberDAO.newPassword(memebrVO);
	}
	

}
