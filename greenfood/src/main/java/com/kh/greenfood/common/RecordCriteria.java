package com.kh.greenfood.common;

import org.springframework.stereotype.Component;

/*
 * 페이징에서 요청페이지를 입력받아 시작레코드와 종료레코드를 구하는 클래스
 */
public class RecordCriteria {
	private int reqPage;			//요청페이지
	private int numPerPage;		//한페이지에 보여줄 레코드수
	private final int NUM_PER_PAGE = 10;  // 한페이지에 보여줄 레코드수 디폴트값
	
	public RecordCriteria(int reqPage) {	
		this.reqPage = reqPage;
		this.numPerPage = NUM_PER_PAGE;
	}

	public int getReqPage() {
		return reqPage;
	}
	public void setReqPage(int reqPage) {
		this.reqPage = reqPage;
	}
	public int getNumPerPage() {
		return numPerPage;
	}
	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}
	
	//시작레코드
	//(요청페이지-1) * 한페이지에보여줄 레코드수 + 1
	public int getStartRec() {
		
		return (this.reqPage - 1) * this.numPerPage + 1;
	}
	
	//종료레코드
	//요청페이지 * 한페이지에 보여줄 레코드수
	public int getEndRec() {
		return this.reqPage * this.numPerPage;
	}
	
	@Override
	public String toString() {
		return "RecordCriteria [reqPage=" + reqPage + ", numPerPage=" + numPerPage + ", NUM_PER_PAGE=" + NUM_PER_PAGE + "]";
	}
}









