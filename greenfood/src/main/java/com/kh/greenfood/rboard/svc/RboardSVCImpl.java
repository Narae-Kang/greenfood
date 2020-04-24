package com.kh.greenfood.rboard.svc;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.kh.greenfood.rboard.dao.RboardDAO;
import com.kh.greenfood.rboard.vo.RboardVO;

@Service
public class RboardSVCImpl implements RboardSVC {
	
	private final static Logger logger
	 = LoggerFactory.getLogger(RboardSVCImpl.class);
	
	@Inject
	RboardDAO rboardDAO;
	
	//댓글 작성
	@Override
	public int replyWrite(RboardVO rboardVO) {
		return rboardDAO.replyWrite(rboardVO);
	}
	//댓글수정
	@Override
	public int replyModify(RboardVO rboardVO) {
		return rboardDAO.replyModify(rboardVO);
	}
	//댓글 삭제
	@Override
	public int replyDelete(String rnum) {
		return rboardDAO.replyDelete(rnum);
	}
	//대댓글 작성
	@Override
	public int rereplyWrite(RboardVO rboardVO) {
		//1) 부모 댓글 정보 읽어오기
		RboardVO parentRboardVO = rboardDAO.replyView(rboardVO.getPrnum());
		//2) 부모 댓글 step 업데이트
		rboardDAO.replyUpdateStep(parentRboardVO.getRgroup(), parentRboardVO.getRstep());
		//3) 대댓글 작성 
		   //부모댓글 정보를 받아와 대댓글 작성 정보로 저장하기
		rboardVO.setBnum(parentRboardVO.getBnum());		 //부모댓글 원게시물번호
		rboardVO.setRgroup(parentRboardVO.getRgroup());	 //부모댓글 그룹
		rboardVO.setRstep(parentRboardVO.getRstep());	 //부모댓글 스텝
		rboardVO.setRindent(parentRboardVO.getRindent());//부모댓글 들여쓰기
		rboardVO.setPrid(parentRboardVO.getRid());	 	 //부모댓글 아이디
		rboardVO.setPrname(parentRboardVO.getRname());	 //부모댓글 이름
		return rboardDAO.rereplyWrite(rboardVO);
	}
	//댓글 목록 보기
	@Override
	public List<RboardVO> replyList(int bnum, int startRec, int endRec) {
		return rboardDAO.replyList(bnum, startRec, endRec);
	}
	//댓글 총계
	@Override
	public int replyAll(String bnum) {
		return rboardDAO.replyAll(bnum);
	}

}






















