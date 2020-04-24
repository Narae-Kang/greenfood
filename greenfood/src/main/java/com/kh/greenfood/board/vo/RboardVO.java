package com.kh.greenfood.board.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class RboardVO {

	private long rnum; 					//댓글번호
	private long vnum; 					//게시글번호
	private String rid;  				//작성자ID
	private String rname; 			//작성자이름
	private Timestamp rcdate;	  //작성일
	private Timestamp rudate; 	//수정일
	private String rcontent; 		//본문내용
	private int rgroup; 				//답글그룹
	private int rstep; 					//답변글의 단계
	private int rindent; 				//답변글의 들여쓰기
	private int prnum;					//부모댓글번호
	private String prid;				//부모댓글아이디
	private String prname;			//부모댓글별칭
	
}
