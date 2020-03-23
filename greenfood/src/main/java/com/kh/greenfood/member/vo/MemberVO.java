package com.kh.greenfood.member.vo;

import java.sql.Date;
import java.sql.Timestamp;

import com.kh.greenfood.board.vo.Board_ReviewVO;

import lombok.Data;

@Data
public class MemberVO {
		
		private String id; 						//아이디(이메일)
		private String name;					//이름
		private String tel; 					//핸드폰번호
		private String pw;						//비밀번호
		private String address; 			//주소
		private Date birth; 					//생년월일
		private Timestamp cdate; 			//가입일
		private Timestamp udate; 			//수정일
		private int admin;						//관리자

	}
