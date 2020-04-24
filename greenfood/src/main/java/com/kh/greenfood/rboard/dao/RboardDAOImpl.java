package com.kh.greenfood.rboard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.kh.greenfood.rboard.vo.RboardVO;

@Repository
public class RboardDAOImpl implements RboardDAO {
	final private static Logger logger
	= LoggerFactory.getLogger(RboardDAOImpl.class);
	
	@Inject
	SqlSessionTemplate sqlSession;
	
	//댓글작성
	@Override
	public int replyWrite(RboardVO rboardVO) {
		return sqlSession.insert("mappers.RboardDAO-mapper.replyWrite", rboardVO);
	}
	//댓글 수정
	@Override
	public int replyModify(RboardVO rboardVO) {
		return sqlSession.update("mappers.RboardDAO-mapper.replyModify", rboardVO);
	}
	//댓글 삭제
	@Override
	public int replyDelete(String rnum) {
		return sqlSession.delete("mappers.RboardDAO-mapper.replyDelete", Long.valueOf(rnum));
	}
	//대댓글 작성
	@Override
	public int rereplyWrite(RboardVO rboardVO) {
		logger.info("DAO-rereplyWrite() 호출됨"); 
		return sqlSession.insert("mappers.RboardDAO-mapper.rereplyWrite", rboardVO);
	}
	//부모 댓글 step 업데이트
	@Override
	public int replyUpdateStep(int rgroup, int rstep) {
		Map<String, Object> map = new HashMap<>();
		map.put("rgroup", rgroup);
		map.put("rstep", rstep);
		return sqlSession.update("mappers.RboardDAO-mapper.replyUpdateStep", map);
	}
	//댓글 정보 읽어오기 (부모댓글 정보 가져오기)
	@Override
	public RboardVO replyView(long rnum) {
		return sqlSession.selectOne("mappers.RboardDAO-mapper.replyView", rnum);
	}
	//댓글 목록
	@Override
	public List<RboardVO> replyList(int bnum, int startRec, int endRec) {
		Map<String, Object> map = new HashMap<>();
		map.put("bnum", bnum);
		map.put("startRec", startRec);
		map.put("endRec", endRec);
		logger.info("RboardDAOImpl replyList의 map:"+map.toString());
		return sqlSession.selectList("mappers.RboardDAO-mapper.replyList", map);
	}
	//댓글 총계
	@Override
	public int replyAll(String bnum) {
		return sqlSession.selectOne("mappers.RboardDAO-mapper.replyAll", Long.valueOf(bnum));
	}

}




















