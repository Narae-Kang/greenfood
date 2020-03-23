package com.kh.greenfood.diet.vo;

import java.sql.Timestamp;


import lombok.Data;

@Data
public class Diet_NameVO {
	private long mnum;				//식단이름번호
	private String menu;			//메뉴(한식,다이어트,덮밥,스폐셜)
	private String maindish;	//메인요리
	private String ricd;			//밥
	private String side1;			//반찬1
	private String side2;			//반찬2
	private String side3;			//반찬3
	private String side_side;	//사이드(덮밥,스폐셜,한식)
	private String salad;			//샐러드(덮밥,스폐셜)
	private String dressing;	//드레싱(덮밥,스폐셜)
	private int cal;					//칼로리
	private Timestamp mcdate; //등록일
	private Timestamp mudate; //수정일
}
