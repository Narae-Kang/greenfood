package com.kh.greenfood.member.svc;

import java.sql.Date;
import java.util.List;

import com.kh.greenfood.member.vo.MemberVO;

public interface MemberSVC {

	// ============참고하세요==============
	// ===SVC양식 : 메서드 + Green=========
	// ===MemberDAO와 양식 동일함===========
	// ===나의 쇼핑정보는 현재 구현클래스X====
	// ===(객체, 생성자) 수업자료 동일함=====
	
	//회원가입
	int joinGreen(MemberVO memberVO);
	
	//회원정보수정
	int modifyGreen(MemberVO memberVO);
	
	//회원전체조회
	List<MemberVO> selectAllGreen();
	
	//회원 개별조회
	MemberVO selectGreen(String id);
	
	//회원탈퇴
	int outGreen(String id, String pw);
	
	//로그인
	MemberVO loginGreen(String id, String pw);
	
	//아이디찾기
	String findID(String tel, Date birth);
	
	/*
	 * //비밀번호 대상 찾기+ 변경 int findPW(MemberVO memberVO);
	 * 
	 * //비번 변경 int changePW(String id, String pw);
	 */
	//나의 쇼핑정보
	int ViewMyShopInfo(String id);
	
	//비밀번호 이메일 전송
	public void newPassword(MemberVO memberVO);

	
}
