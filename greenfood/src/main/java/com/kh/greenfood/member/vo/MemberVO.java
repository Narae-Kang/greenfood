package com.kh.greenfood.member.vo;

import java.sql.Date;
import java.sql.Timestamp;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;


import lombok.Data;

@Data
@Valid
public class MemberVO {
	// ============참고하세요==============
	// ===VO 양식 : 기존 수업양식과 동일=====
	// ===오류메시지는 자바스크립트 전송======
	// ===address1  : 다음 지도 API 1번====
	// ===address2  : 다음 지도 API 2번====
	// ===address3  : 다음 지도 API 3번====
	// ===처리양식은 메서드명(ex:modify)====
	  
		private String id; 						//아이디(이메일)

		private String pw;						//비밀번호
		
		private String tel; 					//핸드폰번호
		
		private String name;					//이름
		
		private String address; 			//주소
		
		private String address1;			//주소 1번(도로명) EX) 40446

		private String address2;      //주소 2번(주소) EX) 서울시 강남구
		
		private String address3;      //주소 3번(상세) 은빛빌라타워 503호
		
		private Date birth; 					//생년월일
		
		private Timestamp cdate; 			//가입일
		
		private Timestamp udate; 			//수정일
		
		private int admin;						//관리자
		
		//관리자 페이지 -주문 관리
		private int rnum;
		private Date rcdate;
		private String pname;
		private String state;


	}
