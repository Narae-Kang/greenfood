package com.kh.greenfood.admin.dao;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.kh.greenfood.member.vo.MemberVO;
import com.kh.greenfood.menu.vo.MenuVO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	private final Logger logger
		= LoggerFactory.getLogger(AdminDAOImpl.class);
	
	@Inject
	SqlSessionTemplate sqlSession;
	
// --------------------------------------------------------------- 주문관리 페이지 시작		
	//관리자 페이지 회원 조회
	@Override
	public List<MemberVO> selectAdminMember() {
		logger.info("MemberDAOImplXML.List<MemberVO> selectAdminMember() 호출됨");
		return sqlSession.selectList("mappers.AdminDAO-mapper.selectAdminMember");
	}
	
	//관리자 페이지 검색어 있는 회원 조회
	@Override
	public List<MemberVO> selectAdminMember(int startRec, int endRec, String searchType, String keyword) {
		logger.info("DAO 주문관리 list 3 호출"+
				String.format("%d %d %s %s", startRec, endRec, searchType, keyword));
		Map<String,Object> map = new HashMap<>();
		
		map.put("startRec", startRec);
		map.put("endRec", endRec);
		map.put("searchType",searchType);
		if(keyword != null) {
			map.put("list",Arrays.asList(keyword.split("\\s+")));
		}
		return sqlSession.selectList("mappers.AdminDAO-mapper.selectAdminList3", map);
	}
	
	//관리자 페이지 총 레코드수
	@Override
	public int selectAdminTotalRecordCount(String searchType, String keyword) {
		logger.info("주문관리 총 레코드수 호출");
		logger.info("주문관리 검색어 : "  + keyword);
		Map<String,Object> map = new HashMap<>();
		map.put("searchType",searchType);
		if(keyword != null) {
			map.put("list", Arrays.asList(keyword.split("\\s+")));
		}
		logger.info("주문관리 검색어2 : " + map.get("selectAdminMember"));
		logger.info("map:"+map);
		int result = sqlSession.selectOne("mappers.AdminDAO-mapper.selectAdminTotalRecordCount", map);
		
		logger.info("result:"+result);
		return result;
	}
	
// --------------------------------------------------------------- 식단 페이지 시작	
	
	//관리자 페이지 주문상태 수정
	@Override
	public int adminStateModify(MemberVO memberVO) {
		logger.info("MemberDAOImplXML.adminStateModify(MemberVO memberVO) 호출됨");
		return sqlSession.update("mappers.AdminDAO-mapper.adminStateModify", memberVO);
	}
	
	//식단 작성
	@Override
	public int adminWrite(MenuVO menuVO) {
		return sqlSession.insert("mappers.AdminDAO-mapper.adminWrite", menuVO);
	}
	
	//식단 보기
	@Override
	public MenuVO adminView(String mnum) {
		return sqlSession.selectOne("mappers.AdminDAO-mapper.adminView", Long.valueOf(mnum));
	}
	
	//식단 수정
	@Override
	public int adminModify(MenuVO menuVO) {
		return sqlSession.update("mappers.AdminDAO-mapper.adminModify", menuVO);
	}
	
	//식단 삭제
	@Override
	public int adminDelete(String mnum) {
		return sqlSession.delete("mappers.AdminDAO-mapper.adminDelete", Long.valueOf(mnum));
	}
	//식단 목록
	@Override
	public List<MenuVO> adminMenuList() {
		logger.info("DAO list 1번 호출..");
		return sqlSession.selectList("mappers.AdminDAO-mapper.adminMenuList");
	}
	//검색어 없는 목록
//	@Override
//	public List<MenuVO> adminMenuList(int startRec, int endRec) {
//		logger.info("DAO list 2번 호출..");
//		Map<String,Object> map = new HashMap<>();
//		map.put("startRec", startRec);
//		map.put("endRec", endRec);
//		return sqlSession.selectList("mappers.AdminDAO-mapper.adminMenuList2", map);
//	}
	//검색어 있는 목록
	@Override
	public List<MenuVO> adminMenuList(int startRec, int endRec, String searchType, String keyword) {
		logger.info("DAO list 3번 호출.."+
				String.format("%d %d %s %s", startRec, endRec, searchType, keyword));
		Map<String,Object> map = new HashMap<>();
		
		map.put("startRec", startRec);
		map.put("endRec", endRec);
		map.put("searchType",searchType);
		if(keyword != null) {
			map.put("list",Arrays.asList(keyword.split("\\s+")));
		}
		return sqlSession.selectList("mappers.AdminDAO-mapper.adminMenuList3", map);
	}
	
	//총 레코드 수
	@Override
	public int totalRecordCount(String searchType, String keyword) {
		logger.info("식단관리 레코드수 호출");
		logger.info("검색어 : "  + keyword);
		Map<String,Object> map = new HashMap<>();
		map.put("searchType",searchType);
		if(keyword != null) {
			map.put("list", Arrays.asList(keyword.split("\\s+")));
		}
		logger.info("검색어2 : " + map.get("adminMenuList"));
		logger.info("map:"+map);
		int result = sqlSession.selectOne("mappers.AdminDAO-mapper.totalRecordCount", map);
		
		logger.info("result:"+result);
		return result;
	}


}
