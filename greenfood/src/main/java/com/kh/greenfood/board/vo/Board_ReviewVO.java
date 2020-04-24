package com.kh.greenfood.board.vo;

import java.sql.Timestamp;

import lombok.Data;
@Data
public class Board_ReviewVO {
	private long vnum;					//게시글번호
	private String vid;					//작성자아이디
	private String vname;				//작성자이름
	private long dnum;					//주문번호
	private long opnum;					//상품번호
	private long mnum;					//식단이름번호
	private int grade;					//평점
	private String vtitle;			//제목
	private String vcontent;		//내용
	private Timestamp vcdate;		//작성일
	private Timestamp vudate;		//수정일
	private int vhit;						//조회수
}
