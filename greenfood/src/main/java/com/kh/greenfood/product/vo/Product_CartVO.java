package com.kh.greenfood.product.vo;

import java.sql.Timestamp;

import com.kh.greenfood.board.vo.Board_ReviewVO;

import lombok.Data;
@Data
public class Product_CartVO {
	private long snum;				//장바구니번호
	private String sid;				//아이디
	private long spnum;				//상품번호
	private Timestamp scdate;	//등록일
	private Timestamp sudate;	//수정일
	private int amount;				//수량
}
