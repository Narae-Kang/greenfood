package com.kh.greenfood.menu.svc;

import java.util.List;

import com.kh.greenfood.menu.vo.SelectMenuVO;

public interface SelectMenuSVC {

	//식단 선택 완료
	int choiceMenu(SelectMenuVO selectMenuVO);
	
	//선택 식단목록 조회
	List<SelectMenuVO> listMenu();

	//선택 식단목록 취소
	int deleteMenu(String snum);
}
