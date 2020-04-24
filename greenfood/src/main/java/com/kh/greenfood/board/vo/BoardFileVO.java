package com.kh.greenfood.board.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardFileVO {
	private long fid;							//파일아이디
	private long bnum;						//게시글번호
	private String fname;					//파일명
	private long fsize;						//파일크기
	private String ftype;					//파일타입
	private byte[] fdata;					//첨부파일
	private Timestamp cdate;			//생성일
	private Timestamp udate;			//수정일
}
	