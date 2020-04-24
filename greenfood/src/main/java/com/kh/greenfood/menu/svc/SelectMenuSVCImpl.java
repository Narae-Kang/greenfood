package com.kh.greenfood.menu.svc;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.kh.greenfood.menu.dao.SelectMenuDAO;
import com.kh.greenfood.menu.vo.SelectMenuVO;

@Service
public class SelectMenuSVCImpl implements SelectMenuSVC {

	private static final Logger logger
		= LoggerFactory.getLogger(SelectMenuSVCImpl.class);
	
	@Inject
	SelectMenuDAO selectMenuDAO;
	
	//식단 선택 완료
	@Transactional
	@Override
	public int choiceMenu(SelectMenuVO selectMenuVO) {
		logger.info(selectMenuVO.toString());
		int cnt = selectMenuDAO.choiceMenu(selectMenuVO.getSmnum(),selectMenuVO.getSid());
		if(selectMenuVO.getSelects() !=null && selectMenuVO.getSelects().size() > 0) {
			try {
				choiceMenu(selectMenuVO.getSelects(), selectMenuVO.getSnum());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}

	//선택한 갯수만큼 메뉴집어넣기
	private void choiceMenu(List<SelectMenuVO> selects, long snum) throws IOException {
		for(SelectMenuVO menu : selects) {
			SelectMenuVO selectMenuVO = new SelectMenuVO();
			
			//조회번호
			selectMenuVO.setSnum(snum);
			//메뉴구성일
			selectMenuVO.setSdate(menu.getSdate());
			//구매자아이디
			selectMenuVO.setSid(menu.getSid());
			//구매메뉴번호
			selectMenuVO.setSmnum(menu.getSmnum());
			//구매메뉴
			selectMenuVO.setSmenu(menu.getSmenu());
			//저장
			if(menu.getSnum() > 0) {
				selectMenuDAO.choiceMenu(menu.getSmnum(),menu.getSid());
			}
		}
	}
	//선택 식단목록 조회
	@Override
	public List<SelectMenuVO> listMenu() {
		return selectMenuDAO.listMenu();
	}

	@Override
	public int deleteMenu(String snum) {
		int cnt = 0;
		cnt = selectMenuDAO.deleteMenu(snum);
		return cnt;
	}

}
