package com.kh.greenfood.product.svc;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.kh.greenfood.board.controller.BoardController;
import com.kh.greenfood.product.dao.CartDAO;
import com.kh.greenfood.product.vo.CartVO;
@Service
public class CartSVCImpl implements CartSVC {
	private static final Logger logger
	= LoggerFactory.getLogger(CartSVCImpl.class);
	@Inject
	CartDAO cartDAO;
	
	//장바구니 리스트
	@Override
	public List<CartVO> CartList(String tid) {
		return cartDAO.CartList(tid);
	}
	//장바구니 담기
	@Override
	public int addCart(CartVO cartVO) {
		return cartDAO.addCart(cartVO);
	}
	//장바구니 삭제
	@Override
	public int deleteCart(int tnum) {
		return cartDAO.deleteCart(tnum);
	}
	//장바구니 전체 삭제
	@Override
	public int deleteAllCart(String tid) {
		logger.info("deleteAllCart(String tid):"+tid);
		return cartDAO.deleteAllCart(tid);
	}
	//장바구니 상품 총액
	@Override
	public String sumPrice(String tid) {
		return cartDAO.sumPrice(tid);
	}
	//장바구니 상품 갯수
	@Override
	public int cartCnt(String tid) {
		return cartDAO.cartCnt(tid);
	}
	//장바구니 중복 확인
	@Override
	public int overlapCart(String tid, int tpnum) {
		return cartDAO.overlapCart(tid, tpnum);
	}
	//중복된 상품 담으면 새로 갱신
	@Override
	public int updateCart(CartVO cartVO) {
		return cartDAO.updateCart(cartVO);
	}

}
