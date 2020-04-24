package com.kh.greenfood.product.svc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.kh.greenfood.product.dao.ProductDAO;
import com.kh.greenfood.product.vo.ProductVO;

@Service
public class ProductSVCImpl implements ProductSVC {

	public static final Logger logger
		= LoggerFactory.getLogger(ProductSVCImpl.class);
	
	@Inject
	ProductDAO productDAO;
	
	//상품 읽어오기
	@Override
	public List<ProductVO> getProduct() {
		return productDAO.getProduct();
	}

	//그린정식상품보기
@Transactional
	@Override
	public Map<String, Object> viewGreenJS(String pnnum) {
		//1)그린정식 상품 가져오기
		ProductVO productVO = productDAO.viewGreenJS(pnnum);
		logger.info("productVO = " + productDAO.viewGreenJS(pnnum));
		Map<String, Object> map = new HashMap<>();
		map.put("product", productVO);
		return map;
	}

	//그린덮밥상품보기
	@Override
	public Map<String, Object> viewGreenRice(String pnnum) {
	//1)그린덮밥 상품 가져오기
			ProductVO productVO = productDAO.viewGreenRice(pnnum);
			
			Map<String, Object> map = new HashMap<>();
			map.put("product", productVO);
			return map;
	}

	//그린스페셜상품보기
	@Override
	public Map<String, Object> viewGreenSP(String pnnum) {
		//1)그린덮밥 상품 가져오기
		ProductVO productVO = productDAO.viewGreenSP(pnnum);
		
		Map<String, Object> map = new HashMap<>();
		map.put("product", productVO);
		return map;
	}

	//그린다이어트상품보기
	@Override
	public Map<String, Object> viewGreenDiet(String pnnum) {
		//1)그린덮밥 상품 가져오기
		ProductVO productVO = productDAO.viewGreenDiet(pnnum);
		
		Map<String, Object> map = new HashMap<>();
		map.put("product", productVO);
		return map;
	}

	//장바구니 담기
	@Override
	public int inPocket(ProductVO pnVO) {
		// TODO Auto-generated method stub
		return 0;
	}

}
