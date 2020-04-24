package com.kh.greenfood.product.dao;

import java.util.List;

import com.kh.greenfood.product.vo.ProductVO;

public interface ProductDAO {

//상품 읽어오기
	List<ProductVO> getProduct();
	
	//상품목록
	List<ProductVO> list();
	
	//그린정식상품보기
	ProductVO viewGreenJS(String pnnum);
	
	//그린덮밥
	ProductVO viewGreenRice(String pnnum);
	
	//그린스페셜
	ProductVO viewGreenSP(String pnnum);
	
	//그린 다이어트
	ProductVO viewGreenDiet(String pnnum);
	
	//장바구니 담기
	int inPocket(ProductVO pnVO);
}
