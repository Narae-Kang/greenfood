package com.kh.greenfood.product.vo;

import java.security.Timestamp;
import java.util.List;

import lombok.Data;

@Data
public class OrdersVO {
	private long onum; 						//주문번호 	ONUM	NUMBER(10,0)	No		1	주문번호
	private String oid;						//아이디		OID	VARCHAR2(40 BYTE)	No		2	구매자
	private int totalprice;				//총가격		OPRICE	NUMBER(10,0)	No		3	총가격
	private String payment;				//결제수단	PAYMENT	CHAR(20 BYTE)	No		6	결제수단
	private Timestamp ocdate;			//주문일 		OCDATE	TIMESTAMP(6)	No	systimestamp 	4	
	private Timestamp oudate;			//수정일		OUDATE	TIMESTAMP(6)	Yes	systimestamp 	5	

	private List<OrdersDetailVO> orders;
}
