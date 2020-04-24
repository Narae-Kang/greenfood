package com.kh.greenfood.product.vo;

import javax.persistence.Entity;

import lombok.Data;

@Data
public class ProductVO {
	
	private long pnnum;		//상품이름번호
	private long pnum;			//상품번호
	private String pname;		//상품이름
	private String price;			//가격
	private String pdetail; //상품설명
	
}
