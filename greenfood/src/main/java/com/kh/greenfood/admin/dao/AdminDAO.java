package com.kh.greenfood.admin.dao;

import java.util.List;

import com.kh.greenfood.member.vo.MemberVO;
import com.kh.greenfood.menu.vo.MenuVO;

public interface AdminDAO {
	
	
	//관리자 페이지 회원 조회
	List<MemberVO> selectAdminMember();
	
	//관리자 페이지 검색어 있는 회원 조회
	List<MemberVO> selectAdminMember(int startRec, int endRec, String searchType, String keyword);
	//관리자 페이지 총 레코드수
	int selectAdminTotalRecordCount(String searchType,String keyword);	
	
	//관리자 페이지 주문상태 수정
	int adminStateModify(MemberVO memberVO);
	
	
	//식단 작성
	int adminWrite(MenuVO menuVO);	
	//식단 보기
	MenuVO adminView(String mnum);	
	//식단 수정
	int adminModify(MenuVO menuVO);
	//식단 삭제
	int adminDelete(String mnum);
	//식단 목록
	List<MenuVO> adminMenuList();
	//검색어 없는 목록
	//List<MenuVO> adminMenuList(int startRec, int endRec);	
	//검색어 있는 목록
	List<MenuVO> adminMenuList(int startRec, int endRec, String searchType, String keyword);
	//총 레코드수
	int totalRecordCount(String searchType,String keyword);	
}
