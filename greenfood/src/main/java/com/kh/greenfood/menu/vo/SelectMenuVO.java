package com.kh.greenfood.menu.vo;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class SelectMenuVO {
	
	private long snum;  			// SNUM	NUMBER(10,0)	No		1	조회번호
	private Date sdate;  //SDATE	TIMESTAMP(6)	No		2	메뉴구성일
	private String sid;       //SID	VARCHAR2(40 BYTE)	No		3	구매자 아이디
	private long smnum;				//SMNUM	NUMBER(10,0)	No		5	구매한 메뉴번호
	private String smenu;			//SMENU	VARCHAR2(50 BYTE)	No		6	구매한 메뉴
	
	private List<SelectMenuVO> selects;
}
