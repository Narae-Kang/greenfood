package com.kh.greenfood.product.svc;

import java.util.List;

import com.kh.greenfood.product.vo.CartVO;

public interface CartSVC {

	//장바구니 리스트
		List<CartVO> CartList(String tid);
	//장바구니 담기
		int addCart(CartVO cartVO);
	//장바구니 삭제
		int deleteCart(int tnum);
	//장바구니 전체 삭제
		int deleteAllCart(String tid);
	//장바구니 전체 금액
		String sumPrice(String tid);
	//장바구니 상품 갯수
		int cartCnt(String tid);
	//장바구니 중복 확인
		int overlapCart(String tid, int tpnum);
	//중복된 상품 담으면 새로 갱신
		int updateCart(CartVO cartVO);
}
