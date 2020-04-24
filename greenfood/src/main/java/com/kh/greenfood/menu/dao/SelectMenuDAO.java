package com.kh.greenfood.menu.dao;

import java.util.List;

import com.kh.greenfood.menu.vo.SelectMenuVO;

public interface SelectMenuDAO {
	
	//식단 선택 완료
//	int choiceMenu(SelectMenuVO selectMenuVO);
//	
	int choiceMenu(long mnum,String sid);
	
	//선택 식단목록 조회
	List<SelectMenuVO> listMenu();
	
	//선택 식단목록 취소
	int deleteMenu(String snum);
	
}
