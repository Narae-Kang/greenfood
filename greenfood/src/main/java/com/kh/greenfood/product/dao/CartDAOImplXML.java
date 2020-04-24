package com.kh.greenfood.product.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.kh.greenfood.product.vo.CartVO;

@Repository
public class CartDAOImplXML implements CartDAO {
	private static final Logger logger = LoggerFactory.getLogger(CartDAOImplXML.class);
	@Inject
	SqlSessionTemplate sqlSession;
	
	//장바구니 리스트
	@Override
	public List<CartVO> CartList(String tid) {
		return sqlSession.selectList("mappers.CartDAO-mapper.CartList", tid);
	}
	//장바구니 담기
	@Override
	public int addCart(CartVO cartVO) {
		return sqlSession.insert("mappers.CartDAO-mapper.addCart", cartVO);
	}
	//장바구니 삭제
	@Override
	public int deleteCart(int tnum) {
		return sqlSession.delete("mappers.CartDAO-mapper.deleteCart", tnum);
	}
	//장바구니 전체 삭제
	@Override
	public int deleteAllCart(String tid) {
		logger.info("deleteAllCart(String tid):"+tid);
		return sqlSession.delete("mappers.CartDAO-mapper.deleteAllCart", tid);
	}
	//장바구니 상품 총액
	@Override
	public String sumPrice(String tid) {
		return sqlSession.selectOne("mappers.CartDAO-mapper.sumPrice", tid);
	}
	//장바구니 상품갯수
	@Override
	public int cartCnt(String tid) {
		return sqlSession.selectOne("mappers.CartDAO-mapper.cartCnt", tid);
	}
	//장바구니 중복 확인
	@Override
	public int overlapCart(String tid, int tpnum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tid", tid);
		map.put("tpnum", tpnum);
		return sqlSession.selectOne("mappers.CartDAO-mapper.overlapCart", map);
	}
	//중복된 상품 담으면 새로 갱신
	@Override
	public int updateCart(CartVO cartVO) {
		return sqlSession.update("mappers.CartDAO-mapper.updateCart", cartVO);
	}

}
