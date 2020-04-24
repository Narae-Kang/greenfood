package com.kh.greenfood.diet.vo;

import java.sql.Timestamp;


import lombok.Data;
@Data
public class Order_DietVO {
	private long dnum;					//주문번호
	private String id;					//아이디
	private String name;				//이름
	private String address;			//주소
	private String tel;					//전화번호
	private String dname;				//수령인
	private String dtel;				//수령인HP
	private String daddress;		//실배송지
	private String dm;					//배송메세지
	private long pnum;					//상품번호
	private Timestamp dcdate;		//주문일
	private Timestamp dudate;		//수정일
}
