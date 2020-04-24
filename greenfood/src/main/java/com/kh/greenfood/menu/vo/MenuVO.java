package com.kh.greenfood.menu.vo;

import java.sql.Date;
import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class MenuVO {

	private long mnum; 				//	NUMBER(10,0)	No		1	식단이름번호
	private String menu; 			//	VARCHAR2(50 BYTE)	No		2	메뉴(한식,다이어트,덮밥,스폐셜)
	private String maindish;  //	MAINDISH	VARCHAR2(50 BYTE)	No		3	메인요리
	private String rice;      //	RICE	VARCHAR2(50 BYTE)	Yes		4	밥
	private String side1;     //	SIDE1	VARCHAR2(50 BYTE)	Yes		5	반찬1
	private String side2;     //	SIDE2	VARCHAR2(50 BYTE)	Yes		6	반찬2
	private String side3; 		//  SIDE3	VARCHAR2(50 BYTE)	Yes		7	반찬3
	private String side_side; //  SIDE_SIDE	VARCHAR2(50 BYTE)	Yes		8	사이드(덮밥,스폐셜,한식)
	private String salad;     //  SALAD	VARCHAR2(50 BYTE)	Yes		9	샐러드(덮밥,스폐셜)
	private String dressing;  //  DRESSING	VARCHAR2(50 BYTE)	Yes		10	드레싱(덮밥,스폐셜)
	private long cal;         //  CAL	NUMBER(10,0)	No		11	칼로리
	private Timestamp mcdate;	//	MCDATE	TIMESTAMP(6)	No	SYSTIMESTAMP 	12	등록일
	private Timestamp mudate;	//  MUDATE	TIMESTAMP(6)	Yes	SYSTIMESTAMP	13	수정일
	
//	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date mdate; 	//	MDATE	TIMESTAMP(6)	No		14	식단구성일
	private String soup; 			//	SOUP	VARCHAR2(50 BYTE)	Yes		15	국
		
}
