package com.kh.greenfood.menu.dao;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.kh.greenfood.menu.vo.MenuVO;

@Repository
public class MenuDAOImplXML implements MenuDAO {

	private static final Logger logger 
	= LoggerFactory.getLogger(MenuDAOImplXML.class);
	
	@Inject
	SqlSessionTemplate sqlSession;
	
	

	//그린정식
	@Override
	public List<MenuVO> listJS() {
		logger.info("MenuDAOImplXML.listJS() 호출!");
		return sqlSession.selectList("mappers.MenuDAO-mapper.listJS");
	}

	//그린덮밥 식단표 가져오기
	@Override
	public List<MenuVO> listRice() {
		return sqlSession.selectList("mappers.MenuDAO-mapper.listRice");
	}

	@Override
	public List<MenuVO> listSP() {
		return sqlSession.selectList("mappers.MenuDAO-mapper.listSP");
	}

	@Override
	public List<MenuVO> listDiet() {
		return sqlSession.selectList("mappers.MenuDAO-mapper.listDiet");
	}

	//식단선택
	@Override
	public int choiceMenu(MenuVO menuVO) {
		return 0;
	}
}
