package com.kh.greenfood.product.dao;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.kh.greenfood.product.vo.ProductVO;
import com.kh.greenfood.product.vo.ProductVO;

@Repository
public class ProductDAOImplXML implements ProductDAO {

	private static final Logger logger 
	= LoggerFactory.getLogger(ProductDAOImplXML.class);
	
	@Inject
	SqlSessionTemplate sqlSession;
	
	//상품 읽어오기
	@Override
	public List<ProductVO> getProduct() {

		return sqlSession.selectList("mappers.ProductDAO-mapper.getProduct");
	}

	//그린정식상품보기
	@Override
	public ProductVO viewGreenJS(String pnnum) {
		return sqlSession.selectOne("mappers.ProductDAO-mapper.viewGreenJS",  Long.valueOf(pnnum));
	}

	//그린덮밥상품보기
	@Override
	public ProductVO viewGreenRice(String pnnum) {
		return sqlSession.selectOne("mappers.ProductDAO-mapper.viewGreenRice",  Long.valueOf(pnnum));
	}

	@Override
	public ProductVO viewGreenSP(String pnnum) {
		return sqlSession.selectOne("mappers.ProductDAO-mapper.viewGreenSP",  Long.valueOf(pnnum));
	}

	@Override
	public ProductVO viewGreenDiet(String pnnum) {
		return sqlSession.selectOne("mappers.ProductDAO-mapper.viewGreenDiet",  Long.valueOf(pnnum));
	}

	//장바구니담기
	@Override
	public int inPocket(ProductVO pnVO) {
		return 0;
	}

	//목록
	@Override
	public List<ProductVO> list() {
		return null;
	}
}
