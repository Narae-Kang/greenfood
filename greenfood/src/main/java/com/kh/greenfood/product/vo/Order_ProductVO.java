package com.kh.greenfood.product.vo;

import java.sql.Timestamp;

import com.kh.greenfood.board.vo.Board_ReviewVO;

import lombok.Data;
@Data
public class Order_ProductVO {
	private long onum;				//구매번호
	private long pnum;				//상품번호
	private String oid;							//아이디
	private int saleprice;		//구매가격
	private String state;			//상태정보
	private Timestamp ocdate; //구매일
	private Timestamp oudate; //수정일
}
