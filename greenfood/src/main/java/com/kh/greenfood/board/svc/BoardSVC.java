package com.kh.greenfood.board.svc;

import java.util.List;
import java.util.Map;

import com.kh.greenfood.board.vo.BoardCategoryVO;
import com.kh.greenfood.board.vo.BoardFileVO;
import com.kh.greenfood.board.vo.BoardVO;
import com.kh.greenfood.common.PageCriteria;

public interface BoardSVC {
	//카테고리 읽어오기
	List<BoardCategoryVO> getCategory();
	
	//게시글작성
	int write(BoardVO boardVO);

	//게시글수정
	int modify(BoardVO boardVO);

	//게시글삭제
	int delete(String bnum);
	
	//첨부파일1건 삭제
	int fileDelete(String fid);
	
	//게시글보기
	Map<String,Object> view(String bnum);

	//게시글목록
	//1)전체
	List<BoardVO> list();
	//2)검색어 없는 게시글페이징
	List<BoardVO> list( int startRec, int endRec);	
	//3)검색어 있는 게시글검색(요청페이지, 검색유형, 검색어)
	List<BoardVO> list(String boardName, String reqPage, String searchType,String keyword);
	
	//페이지 제어
	PageCriteria getPageCriteria(String boardName, String reqPage, String searchType,String keyword);
		
	//게시글답글작성
	int reply(BoardVO boardVO);
	//첨부파일조회
	BoardFileVO fileView(String fid);	
	
	//메인화면 공지사항
	List<BoardVO> mainNotice();
}
















