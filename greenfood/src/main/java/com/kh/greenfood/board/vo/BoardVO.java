package com.kh.greenfood.board.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardVO {
	private long bnum; 							//게시글번호
	private String bid; 						//아이디
	private String bname; 					//이름
	private String btitle;					//제목
	private String bcontent;				//내용
	private int bhit;								//조회수
	private CategoryVO categoryVO;  //카테고리
	private Timestamp bcdate;				//등록일
	private Timestamp budate;				//수정일
	private int bgroup;							//답글그룹
	private int bindent;						//답변글의 들여쓰기
	private int bstep;							//답변글의 단계
}
