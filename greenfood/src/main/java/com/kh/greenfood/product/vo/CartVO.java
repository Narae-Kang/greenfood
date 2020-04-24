package com.kh.greenfood.product.vo;

import java.sql.Timestamp;


import lombok.Data;
@Data
public class CartVO {
	private long tnum;				//장바구니번호
	private int tpnum;				//상품번호
	private String tid;				//아이디
	private String pname;				//상품이름
	private Timestamp tcdate;	//등록일
	private int amount;				//수량
	private int tprice;				//상품 단가
	private String price;				//수량 * 상품단가
	private String pdetail; 	//상품 설명
	
//	private int sumPrice; //장바구니 금액 합계
}
