package com.kh.greenfood.admin.svc;

import java.util.List;
import java.util.Map;

import com.kh.greenfood.common.PageCriteria;
import com.kh.greenfood.member.vo.MemberVO;
import com.kh.greenfood.menu.vo.MenuVO;

public interface AdminSVC {
	
	
	//관리자 페이지 회원 조회
	List<MemberVO> selectAdminMember();
	
	//관리자 페이지 검색어 있는 회원 조회
	List<MemberVO> selectAdminMember(String reqPage, String searchType, String keyword);
	//페이지 제어
	PageCriteria selectAdminPageCriteria(String reqPage, String searchType,String keyword);
	
	
	//관리자 페이지 주문상태 수정
	int adminStateModify(MemberVO memberVO);
	
	//식단 작성
	int adminWrite(MenuVO menuVO);
	
	//식단 보기
	Map<String,Object> adminView(String mnum);
	
	//식단 수정
	int adminModify(MenuVO menuVO);
	
	//식단 삭제
	int adminDelete(String mnum);
	
	//식단 목록
	List<MenuVO> adminMenuList();
	//검색어 없는 목록
	List<MenuVO> adminMenuList(int startRec, int endRec);	
	//검색어 있는 목록
	List<MenuVO> adminMenuList(String reqPage, String searchType, String keyword);	
	//페이지 제어
	PageCriteria getPageCriteria(String reqPage, String searchType,String keyword);
}
