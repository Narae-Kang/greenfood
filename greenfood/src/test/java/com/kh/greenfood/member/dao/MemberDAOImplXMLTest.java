package com.kh.greenfood.member.dao;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;

import javax.inject.Inject;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.kh.greenfood.member.vo.MemberVO;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class MemberDAOImplXMLTest {
	private final static Logger logger
	= LoggerFactory.getLogger(MemberDAOImplXMLTest.class);
	
	@Inject
	@Qualifier("memberDAOImplXML")
	MemberDAO memberDAO;
	
	@Test
	@DisplayName("회원등록여부")
	@Disabled
	void joinGreen() {
		MemberVO memberVO = new MemberVO();
		
		memberVO.setId("ddd@naver.com");
		memberVO.setPw("admin1234");
		memberVO.setName("이한별");
		memberVO.setTel("010-4850-0569");
		memberVO.setAddress("가입할 주소");
		memberVO.setBirth(new java.sql.Date(1993-12-13));
		memberVO.setAdmin(1);
		int cnt = memberDAO.joinGreen(memberVO);
		assertEquals(1, cnt);
	}
	
	@Test
	@DisplayName("회원수정")
	@Disabled
	void modifyGreen() {
		MemberVO memberVO = new MemberVO();
		memberVO.setId("수정할 아이디");
		memberVO.setTel("수정할 전번");
		memberVO.setName("수정할 이름");
		memberVO.setAddress1("수정할 주소1");
		memberVO.setAddress2("수정할 주소2");
		memberVO.setAddress3("수정할 주소3");
		memberVO.setBirth(java.sql.Date.valueOf("수정할 생일"));		
		int cnt = memberDAO.modifyGreen(memberVO);
		assertEquals(1, cnt);
	}
	@Test
	@DisplayName("회원 전체조회")
	@Disabled
	void selectAllMember() {
		List<MemberVO> list = memberDAO.selectAllGreen();
		assertNotNull(list);
		logger.info(list.toString());
	}
	
	@Test
	@DisplayName("회원 개별조회")
	void selectMember() {
		MemberVO memberVO = memberDAO.selectGreen("ddd@naver.com");
		assertEquals("ddd@naver.com", memberVO.getId());
		logger.info(memberVO.toString());
	}
	@Test
	@DisplayName("회원 탈퇴")
	@Disabled
	void outMember() {
		int cnt = memberDAO.outGreen("탈퇴할 아이디", "탈퇴할 비번");
		assertEquals(1,cnt);
	}
	@Test
	@DisplayName("로그인")
	@Disabled
	void loginMember() {
		MemberVO memberVO = memberDAO.loginGreen("admin@google.com", "gudwns12");
		assertEquals("admin@google.com", memberVO.getId());
		logger.info(memberVO.toString());
	}
	@Test
	@DisplayName("아이디 찾기")
	@Disabled
	void findID() {
		String id = memberDAO.findID("전번", java.sql.Date.valueOf("생일"));
		assertEquals("찾을 아이디", id);
	}
	/*
	 * @Test
	 * 
	 * @DisplayName("비밀번호 변경")
	 * 
	 * @Disabled void changePW() { int cnt = memberDAO.changePW("이멜", "비번");
	 * assertEquals(1, cnt); }
	 * 
	 * @Test
	 * 
	 * @DisplayName("비밀번호 변경 대상 찾기")
	 * 
	 * @Disabled void findPW() { MemberVO memberVO = new MemberVO();
	 * memberVO.setId("아디"); memberVO.setTel("전번");
	 * memberVO.setBirth(java.sql.Date.valueOf("생일")); int cnt =
	 * memberDAO.findPW(memberVO); assertEquals(1, cnt); }
	 */
}
