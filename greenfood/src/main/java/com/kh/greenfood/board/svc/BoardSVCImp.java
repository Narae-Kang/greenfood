package com.kh.greenfood.board.svc;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.greenfood.board.dao.BoardDAO;
import com.kh.greenfood.board.vo.BoardCategoryVO;
import com.kh.greenfood.board.vo.BoardFileVO;
import com.kh.greenfood.board.vo.BoardVO;
import com.kh.greenfood.common.FindCriteria;
import com.kh.greenfood.common.PageCriteria;
import com.kh.greenfood.common.RecordCriteria;

@Service
public class BoardSVCImp implements BoardSVC {
	
	public static final Logger logger 
		= LoggerFactory.getLogger(BoardSVCImp.class);
	
	@Inject
	BoardDAO boardDAO;
	
	//카테고리 읽어오기
	@Override
	public List<BoardCategoryVO> getCategory() {
		return boardDAO.getCategory();
	}
	//게시글작성
	@Transactional
	@Override
	public int write(BoardVO boardVO) {
		//1) 게시글 작성
		int cnt = boardDAO.write(boardVO);

		//2) bnum 가져오기 => mybatis: selectkey 사용
		
		//3) 첨부파일 있는경우
		logger.info("첨부갯수:"+boardVO.getFiles().size());
		if(boardVO.getFiles() != null && boardVO.getFiles().size() > 0) {
			fileWrite(boardVO.getFiles(),boardVO.getBnum());
		}
		return cnt;
	}
	//첨부파일 저장
	private void fileWrite(List<MultipartFile> files, long bnum) {
		for(MultipartFile file : files) {			
			try {
				logger.info("파일 첨부: " + file.getOriginalFilename());
				BoardFileVO boardFileVO = new BoardFileVO();
				//게시글번호
				boardFileVO.setBnum(bnum);
				//첨부파일명
				boardFileVO.setFname(file.getOriginalFilename());
				//첨부파일 크기
				boardFileVO.setFsize(file.getSize());
				//첨부파일 타입
				boardFileVO.setFtype(file.getContentType());
				//첨부파일
				boardFileVO.setFdata(file.getBytes());
				//첨부파일 저장
				if( file.getSize() > 0) {
					boardDAO.fileWrite(boardFileVO);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	//게시글수정
	@Transactional
	@Override
	public int modify(BoardVO boardVO) {
		//1) 게시글 수정
		int cnt = boardDAO.modify(boardVO);
		//2) 첨부파일 추가
		if(boardVO.getFiles() != null && boardVO.getFiles().size() > 0) {
			fileWrite(boardVO.getFiles(),boardVO.getBnum());
		}
		return cnt;
	}
	//게시글삭제
	@Transactional
	@Override
	public int delete(String bnum) {
		int cnt = 0;
		boardDAO.filesDelete(bnum);
		cnt = boardDAO.delete(bnum);
		return cnt;
	}

	//첨부파일1건 삭제
	@Override
	public int fileDelete(String fid) {
		return boardDAO.fileDelete(fid);
	}
	
	//게시글보기
	@Transactional
	@Override
	public Map<String,Object> view(String bnum) {
		//1) 게시글 가져오기
		BoardVO boardVO = boardDAO.view(bnum);
		//2) 첨부파일 가져오기
		List<BoardFileVO> files = boardDAO.fileViews(bnum);
		//3) 조회수 +1증가
		boardDAO.updateHit(bnum);
		
		Map<String,Object> map = new HashMap<>();
		map.put("board", boardVO);
		if(files != null && files.size() > 0) {
			map.put("files", files);
		}
		return map;
	}
	//게시글목록
	//1)전체
	@Override
	public List<BoardVO> list() {
		return boardDAO.list();
	}
	//2)검색어 없는 게시글페이징
	@Override
	public List<BoardVO> list(int startRec, int endRec) {
		// TODO Auto-generated method stub
		return null;
	}
	//3)검색어 있는 게시글검색(요청페이지,검색유형,검색어)
	@Override
	public List<BoardVO> list(String boardName, String reqPage, String searchType, String keyword) {			 
		int l_reqPage = 0;
		
		//요청 페이지 정보가 없으면 1로 초기화
		if(reqPage == null || reqPage.trim().isEmpty()) {
			l_reqPage =  1;
		}else {
			l_reqPage = Integer.parseInt(reqPage);
		}		
		RecordCriteria recordCriteria = new RecordCriteria(l_reqPage);
		
		return boardDAO.list(
				boardName,
				recordCriteria.getStartRec(), 
				recordCriteria.getEndRec(), 
				searchType, keyword);
	}
	
	//페이지 제어
	@Override
	public PageCriteria getPageCriteria(String boardName, String reqPage, String searchType, String keyword) {
		
		PageCriteria 		pc = null;					//한페이지에 보여줄 페이징 계산하는 클래스
		FindCriteria 		fc = null;					//PageCriteira + 검색타입, 검색어		
		
		int totalRec = 0;										//전체레코드 수
		
		int l_reqPage = 0;
		
		//요청 페이지 정보가 없으면 1로 초기화
		if(reqPage == null || reqPage.trim().isEmpty()) {
			l_reqPage =  1;
		}else {
			l_reqPage = Integer.parseInt(reqPage);
		}
			
		totalRec = boardDAO.totalRecordCount(boardName,searchType,keyword);
		
		fc = new FindCriteria(l_reqPage, searchType, keyword);
		pc = new PageCriteria(fc, totalRec);
		logger.info("totalRec:"+totalRec, searchType, keyword);
		logger.info("fc:"+fc.toString());
		logger.info("rc:"+((RecordCriteria)fc).toString());
		logger.info("pc:"+pc.toString());
		return pc;
	}
	
	//게시글답글작성
	@Transactional
	@Override
	public int reply(BoardVO boardVO) {
		//1) 게시글 답글 작성
		int cnt = boardDAO.reply(boardVO);

		//2) bnum 가져오기 => mybatis: selectkey 사용
		
		//3) 첨부파일 있는경우
		logger.info("첨부갯수:"+boardVO.getFiles().size());
		if(boardVO.getFiles() != null && boardVO.getFiles().size() > 0) {
			fileWrite(boardVO.getFiles(),boardVO.getBnum());
		}
		return cnt;
	}

	//첨부파일조회
	@Override
	public BoardFileVO fileView(String fid) {
		return boardDAO.fileView(fid);
	}
	
	//메인화면 공지사항
	@Override
	public List<BoardVO> mainNotice() {
		return boardDAO.mainNotice();
	}

}




