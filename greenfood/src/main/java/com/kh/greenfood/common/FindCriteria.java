package com.kh.greenfood.common;

import lombok.Data;

@Data
public class FindCriteria extends RecordCriteria{

	private String searchType;			//검색유형
	private String keyword;					//검색어
	

	public FindCriteria(int reqPage) {
		super(reqPage);
	}

	public FindCriteria(int reqPage, String searchType, String keyword) {
		this(reqPage);
		this.searchType = searchType;
		this.keyword = keyword;
	}
}
