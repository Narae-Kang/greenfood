package com.kh.greenfood.board.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CategoryVO {
	private long cnum;				//카테고리번호
	private String cname;			//배송문의,상품문의,교환문의,환불문의
	private String cboard;		//공지사항,Q&A
}
