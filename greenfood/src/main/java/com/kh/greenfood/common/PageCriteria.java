package com.kh.greenfood.common;
/*
 * 현재 페이지에 보여줄 페이지 계산
 * (시작페이지,종료페이지,다음,이전,마지막페이지 이동,처음페이지 이동)
 */
public class PageCriteria {

	private int pageNumPerPage; 	//	한페이지에 보여줄 페이지수(상수:10)
	private int startPage;				//	한페이지의 시작페이지
	private int endPage;					//	한페이지의 종료페이지
	
	private int totalRec;					//	전체레코드수
	private int finalEndPage;			//	최종페이지
		
	private boolean prev;					//	이전페이지
	private boolean next;					//	다음페이지

	private RecordCriteria rc;		//  한페이지에 보여줄 레코드 수, 요청페이지
	
	private final int PAGE_NUM_PER_PAGE = 10; //한페이지에 보여줄 페이지수(상수:10)
	
	public PageCriteria(RecordCriteria rc, int totalRec) {
		this.rc = rc;
		this.totalRec = totalRec;	
		this.pageNumPerPage = PAGE_NUM_PER_PAGE;
		init();		
	}
	
	private void init() {
	  //요청페이지의 종료페이지 계산:올림(요청페이지/한페이지에보여줄 페이지수)*한페이지에보여줄 페이지수
		this.endPage = (int)Math.ceil((this.rc.getReqPage() / (double)this.pageNumPerPage)) * this.pageNumPerPage;
		
		//요청페이지의 시작페이지 계산:한페이지의 종료페이지 - 한페이지에 보여줄 페이지수 + 1
		this.startPage = this.endPage - this.pageNumPerPage + 1;
		
		//최종페이지 계산  : 올림(전체레코드수/한페이지에 보여줄 레코드수)
		this.finalEndPage = (int)Math.ceil((totalRec / (double)this.rc.getNumPerPage()));
		if(this.finalEndPage < this.endPage  ) {
			this.endPage = this.finalEndPage; 
		}		
	}

	public int getStartPage() {
		return this.startPage;
	}

	public int getEndPage() {
		return this.endPage;
	}
	public int getTotalRec() {
		return this.totalRec;
	}
	public int getFinalEndPage() {
		return this.finalEndPage;
	}
	//이전 페이지 보여줄지 판단 : 요청페이지의 시작페이지 1 이 아닌경우만 보여줌.
	public boolean isPrev() {
		return this.getStartPage() == 1 ? false: true;
	}	
	//다음 페이지 보여줄지 판단 : 전체 레코드수가 요청페이지의 종료페이지보다 큰경우 보여줌.
	public boolean isNext() {
		return this.totalRec > this.getEndPage() * rc.getNumPerPage() ? true:false;
	}
	
	//getter() : RecordCriteria
	public RecordCriteria getRc() {
		return rc;
	}
	
	//getter() : FindCriteria
	public FindCriteria getFc() {
		
		if(rc instanceof FindCriteria) {
			return (FindCriteria)rc; 
		}
		
		return null;
	}
	
	@Override
	public String toString() {
		return "PageCriteria [pageNumPerPage=" + pageNumPerPage + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", totalRec=" + totalRec + ", finalEndPage=" + finalEndPage + ", prev=" + prev + ", next=" + next + ", rc="
				+ rc  + "]";
	}	
}






