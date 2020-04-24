package com.kh.greenfood.product.vo;

import java.security.Timestamp;

import lombok.Data;

@Data
public class OrdersDetailVO {
	private long rnum;				//주문상세번호		RNUM	NUMBER(10,0)	No		1	주문상세번호
	private long onum;				//주문번호		ONUM	NUMBER(10,0)	No		2	주문번호	
	private long fnum;				//주문번호		ONUM	NUMBER(10,0)	No		2	주문번호	
	private String rid;				//구매자아이디		PNAME	VARCHAR2(40 BYTE)	No		3	상품이름
	private String pname;			//상품이름		PNAME	VARCHAR2(40 BYTE)	No		3	상품이름
	private String price;				//가격			RPRICE	NUMBER(10,0)	No		4	가격
	private String state;			//진행상태		STATE	CHAR(50 BYTE)	No		8	진행상태
	private int amount;				//수량
	private Timestamp rcdate;	//주문일			RCDATE	TIMESTAMP(6)	No	systimestamp 	6	
	private Timestamp rudate;	//수정일			RUDATE	TIMESTAMP(6)	Yes	systimestamp 	7	
}
