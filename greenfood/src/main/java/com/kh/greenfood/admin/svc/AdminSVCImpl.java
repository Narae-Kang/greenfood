package com.kh.greenfood.admin.svc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.kh.greenfood.admin.dao.AdminDAO;
import com.kh.greenfood.common.FindCriteria;
import com.kh.greenfood.common.PageCriteria;
import com.kh.greenfood.common.RecordCriteria;
import com.kh.greenfood.member.vo.MemberVO;
import com.kh.greenfood.menu.vo.MenuVO;



@Service
public class AdminSVCImpl implements AdminSVC {
	
	private final Logger logger
	= LoggerFactory.getLogger(AdminSVCImpl.class);
	
	@Inject
	AdminDAO adminDAO;
	
	//관리자 페이지 회원 조회
	@Override
	public List<MemberVO> selectAdminMember() {
		logger.info("AdminSVCImpl.selectAdminMember() 호출됨");
		return adminDAO.selectAdminMember();
	}
	
	//관리자 페이지 검색어 있는 회원 조회
	@Override
	public List<MemberVO> selectAdminMember(String reqPage, String searchType, String keyword) {
		logger.info("SVC 주문관리 list 3 호출");
		int l_reqPage = 0;
		//요청 페이지 정보가 없으면 1로 초기화
		if(reqPage == null || reqPage.trim().isEmpty()) {
			l_reqPage =  1;
		}else {
			l_reqPage = Integer.parseInt(reqPage);
		}
		
		RecordCriteria recordCriteria = new RecordCriteria(l_reqPage);
		logger.info("recordCriteria:"+recordCriteria.toString());
		return adminDAO.selectAdminMember(
				recordCriteria.getStartRec(), 
				recordCriteria.getEndRec(), 
				searchType, keyword);
	}
	
	//페이지 제어
	@Override
	public PageCriteria selectAdminPageCriteria(String reqPage, String searchType, String keyword) {
		logger.info("페이지제어 1");
		PageCriteria pc=null;
		FindCriteria fc=null;
		
		int totalRec = 0;										//전체레코드 수
		int l_reqPage = 0;
		//요청 페이지 정보가 없으면 1로 초기화
		if(reqPage == null || reqPage.trim().isEmpty()) {
			l_reqPage =  1;
		}else {
			l_reqPage = Integer.parseInt(reqPage);
		}
			
		totalRec = adminDAO.selectAdminTotalRecordCount(searchType,keyword);
		
		fc = new FindCriteria(l_reqPage, searchType, keyword);
		pc = new PageCriteria(fc, totalRec);
		logger.info("페이지제어 2");
		logger.info("totalRec:"+totalRec, searchType, keyword);
		logger.info("fc:"+fc.toString());
		logger.info("rc:"+((RecordCriteria)fc).toString());
		logger.info("pc:"+pc.toString());
		return pc;
	}
	
	
	//관리자 페이지 주문상태 수정
	@Override
	public int adminStateModify(MemberVO memberVO) {
		logger.info("AdminSVCImpl.adminStateModify(MemberVO memberVO) 호출됨");
		return adminDAO.adminStateModify(memberVO);
	}
	
	//식단 작성
	@Override
	public int adminWrite(MenuVO menuVO) {
		int cnt = adminDAO.adminWrite(menuVO);
		return cnt;
	}
	
	//식단 보기
	@Override
	public Map<String,Object> adminView(String mnum) {
		MenuVO menuVO = adminDAO.adminView(mnum);
		
		Map<String,Object> map = new HashMap<>();
		map.put("menu", menuVO);
		return map;
	}
	
	//식단 수정
	@Override
	public int adminModify(MenuVO menuVO) {
		int cnt = adminDAO.adminModify(menuVO);
		return cnt;
	}
	
	//식단 삭제
	@Override
	public int adminDelete(String mnum) {
		int cnt = adminDAO.adminDelete(mnum);
		return cnt;
	}
	//식단 목록
	@Override
	public List<MenuVO> adminMenuList() {
		logger.info("SVC list 1번 호출..");
		return adminDAO.adminMenuList();
	}
	//검색어 없는 목록
	@Override
	public List<MenuVO> adminMenuList(int startRec, int endRec) {
		logger.info("SVC list 2번 호출..");
		return null;
	}
	//검색어 있는 목록
	@Override
	public List<MenuVO> adminMenuList(String reqPage, String searchType, String keyword) {	 
		logger.info("SVC list 3번 호출..");
		int l_reqPage = 0;
		//요청 페이지 정보가 없으면 1로 초기화
		if(reqPage == null || reqPage.trim().isEmpty()) {
			l_reqPage =  1;
		}else {
			l_reqPage = Integer.parseInt(reqPage);
		}
		
		RecordCriteria recordCriteria = new RecordCriteria(l_reqPage);
		logger.info("recordCriteria:"+recordCriteria.toString());
		return adminDAO.adminMenuList(
				recordCriteria.getStartRec(), 
				recordCriteria.getEndRec(), 
				searchType, keyword);
	}
	
	//페이지 제어
	@Override
	public PageCriteria getPageCriteria(String reqPage, String searchType, String keyword) {
		logger.info("페이지제어 1");
		PageCriteria pc=null;
		FindCriteria fc=null;
		
		int totalRec = 0;										//전체레코드 수
		int l_reqPage = 0;
		//요청 페이지 정보가 없으면 1로 초기화
		if(reqPage == null || reqPage.trim().isEmpty()) {
			l_reqPage =  1;
		}else {
			l_reqPage = Integer.parseInt(reqPage);
		}
			
		totalRec = adminDAO.totalRecordCount(searchType,keyword);
		
		fc = new FindCriteria(l_reqPage, searchType, keyword);
		pc = new PageCriteria(fc, totalRec);
		logger.info("페이지제어 2");
		logger.info("totalRec:"+totalRec, searchType, keyword);
		logger.info("fc:"+fc.toString());
		logger.info("rc:"+((RecordCriteria)fc).toString());
		logger.info("pc:"+pc.toString());
		return pc;
	}

}















