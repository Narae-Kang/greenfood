package com.kh.greenfood.product.svc;

import java.util.List;
import java.util.Map;

import com.kh.greenfood.product.vo.ProductVO;

public interface ProductSVC {
//상품 읽어오기
	List<ProductVO> getProduct();
	
	//그린정식상품보기
	Map<String, Object> viewGreenJS(String pnnum);
	
	//그린덮밥상품보기
	Map<String, Object> viewGreenRice(String pnnum);
	
	//그린스페셜상품보기
	Map<String, Object> viewGreenSP(String pnnum);
	
	//그린다이어트상품보기
	Map<String, Object> viewGreenDiet(String pnnum);
	
	//장바구니 담기
	int inPocket(ProductVO pnVO);
}
