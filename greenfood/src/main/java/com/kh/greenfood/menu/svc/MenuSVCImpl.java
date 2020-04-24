package com.kh.greenfood.menu.svc;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.kh.greenfood.menu.dao.MenuDAO;
import com.kh.greenfood.menu.vo.MenuVO;

@Service
public class MenuSVCImpl implements MenuSVC {

	private static final Logger logger 
	= LoggerFactory.getLogger(MenuSVCImpl.class);
	
	@Inject
	MenuDAO menuDAO;

	//그린정식 식단표 가져오기
	@Override
	public List<MenuVO> listJS() {
		logger.info("MenuSVCImpl.listJS() 호출!");
		return menuDAO.listJS();
	}

	@Override
	public List<MenuVO> listRice() {
		logger.info("MenuSVCImpl.listRice() 호출!");
		return menuDAO.listRice();
	}

	@Override
	public List<MenuVO> listSP() {
		logger.info("MenuSVCImpl.listSP() 호출!");
		return menuDAO.listSP();
	}

	@Override
	public List<MenuVO> listDiet() {
		logger.info("MenuSVCImpl.listDiet() 호출!");
		return menuDAO.listDiet();
	}

	@Override
	public int choiceMenu(MenuVO menuVO) {
		logger.info("MenuSVCImpl.listJS() 호출!");
		return 0;
	}
	
	

}
