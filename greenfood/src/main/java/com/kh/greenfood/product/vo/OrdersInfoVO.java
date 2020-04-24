package com.kh.greenfood.product.vo;

import java.security.Timestamp;
import java.util.List;

import lombok.Data;

@Data
public class OrdersInfoVO {
	private long fnum;						//수령인번호			FNUM	NUMBER(10,0)	No		1	수령인번호
	private String fid;						//아이디					FID	VARCHAR2(40 BYTE)	No		2	수령인아이디
	private String fname;					//수령인이름			FNAME	VARCHAR2(15 BYTE)	No		3	수령인이름
	private String ftel;					//수령인전화			FTEL	VARCHAR2(13 BYTE)	No		4	수령인전화
	private String faddress;			//수령인주소			FADDRESS	VARCHAR2(100 BYTE)	No		5	수령인주소

	private String address1;			//주소 1번(도로명) EX) 40446

	private String address2;      //주소 2번(주소) EX) 서울시 강남구
	
	private String address3;      //주소 3번(상세) 은빛빌라타워 503호
	
	private String fdm;						//배송메시지			FDM	VARCHAR2(150 BYTE)	No		6	배송메세지
	private Timestamp fcdate;			//주문일					FCDATE	TIMESTAMP(6)	No	systimestamp 	7	주문일
	private Timestamp fudate;			//수정일					FUDATE	TIMESTAMP(6)	Yes	systimestamp 	8	수정일
}
