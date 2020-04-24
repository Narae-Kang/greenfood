package com.kh.greenfood.board.vo;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Entity
@Data
public class BoardCategoryVO {
	private int level;				//카테고리 차수
	private long cnum;				//카테고리번호
	private long ccode;				//카테고리2차번호
	private String cname;			//배송문의,상품문의,교환문의,환불문의
	private String cname2;			//배송문의,상품문의,교환문의,환불문의
}
