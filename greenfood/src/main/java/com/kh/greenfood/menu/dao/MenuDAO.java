package com.kh.greenfood.menu.dao;

import java.util.List;

import com.kh.greenfood.menu.vo.MenuVO;

public interface MenuDAO {
	
	//그린정식 식단보기
	List<MenuVO> listJS();
	
	//그린덮밥 식단보기
	List<MenuVO> listRice();
	
	//그린스페셜 식단보기
	List<MenuVO> listSP();
	
	//그린다이어트 식단보기
	List<MenuVO> listDiet();
	
	//상품 선택
	int choiceMenu(MenuVO menuVO);
}
