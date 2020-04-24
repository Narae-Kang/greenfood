package com.kh.greenfood.product.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.greenfood.member.vo.MemberVO;
import com.kh.greenfood.menu.svc.MenuSVC;
import com.kh.greenfood.menu.vo.MenuVO;
import com.kh.greenfood.product.svc.CartSVC;
import com.kh.greenfood.product.svc.ProductSVC;
import com.kh.greenfood.product.vo.CartVO;
import com.kh.greenfood.product.vo.ProductVO;

//컨트롤러 어노테이션
@Controller
//매핑경로
@RequestMapping("/product")
public class ProductController {

	private static final Logger logger
	= LoggerFactory.getLogger(ProductController.class);
	
	@Inject
	ProductSVC productNameSVC;
	@Inject
	CartSVC cartSVC;
	@Inject
	MenuSVC menuSVC;
	
	// 장바구니 아이콘에 수량 표시
   @ModelAttribute
   public void initData(Model model, HttpSession session) {
      MemberVO memberVO = (MemberVO)session.getAttribute("member");
       String tid; 
       if(memberVO != null) { 
          tid = memberVO.getId();
        model.addAttribute("cartCnt", cartSVC.cartCnt(tid)); 
        };
   }
	 
	//상품목록 리스트 model 객체 담기
	@ModelAttribute
	public void getProductCategory(Model model) {
		List<ProductVO> productVO = productNameSVC.getProduct();
		logger.info("category lsit :"+productVO.toString());
		model.addAttribute("productCategoryVO", productVO);
	}
	@GetMapping("/list")
	public String olist() {
		
		return "product/productList";
	}
	
	//그린정식 보기
	@GetMapping("/greenJs/{pnnum}")
	public String viewGreenJS(
			HttpSession session,
			CartVO cartVO,
			ProductVO productVO,
			@PathVariable("pnnum") String pnnum,
			Model model) {
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		String tid = null;
		if(memberVO != null) {
			tid = memberVO.getId();
		}
		//상품 상세정보 map에 담기
		Map<String, Object> map = productNameSVC.viewGreenJS(pnnum);
		List<MenuVO> listJS = menuSVC.listJS();
		
		ProductVO productVO1 = (ProductVO) map.get("product");
		logger.info(productVO.toString());
		logger.info("list : " + menuSVC.listJS());
		
		model.addAttribute("productVO", productVO1);
		model.addAttribute("listJS", listJS);
		model.addAttribute("tid", tid);
		logger.info(tid);
		return "product/viewGreenJS";
	}

	//그린덮밥 보기
	@GetMapping("/greenRice/{pnnum}")
	public String viewGreenRice(
			@ModelAttribute @PathVariable("pnnum") String pnnum,
			HttpSession session,
			Model model) {
		
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		String tid = null;
		if(memberVO != null) {
			tid = memberVO.getId();
		}
		
		Map<String, Object> map = productNameSVC.viewGreenRice(pnnum);
		List<MenuVO> listRice = menuSVC.listRice();
		
		ProductVO productVO = (ProductVO) map.get("product");
		logger.info(productVO.toString());
		logger.info("list : " + menuSVC.listRice());
		
		model.addAttribute("productVO", productVO);
		model.addAttribute("listRice", listRice);
		model.addAttribute("tid", tid);
		
		return "product/viewGreenRice";
	}
	
//그린스페셜 보기
	@GetMapping("/greenSP/{pnnum}")
	public String viewGreenSP(
			@ModelAttribute @PathVariable("pnnum") String pnnum,
			HttpSession session,
			Model model) {
		MemberVO memberVO = (MemberVO)session.getAttribute("member");

		String tid = null;
		if(memberVO != null) {
			tid = memberVO.getId();
		}
		Map<String, Object> map = productNameSVC.viewGreenSP(pnnum);
		List<MenuVO> listSP = menuSVC.listSP();
		ProductVO productVO = (ProductVO) map.get("product");
		
		logger.info(productVO.toString());
		logger.info("list : " + menuSVC.listSP());
		
		model.addAttribute("productVO", productVO);
		model.addAttribute("listSP", listSP);
		model.addAttribute("tid", tid);
		return "product/viewGreenSP";
	}

	//그린다욭 보기
	@GetMapping("/greenDiet/{pnnum}")
	public String viewGreenDiet(
			@ModelAttribute @PathVariable("pnnum") String pnnum,
			HttpSession session,
			Model model) {
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		String tid = null;
		if(memberVO != null) {
			tid = memberVO.getId();
		}
		Map<String, Object> map = productNameSVC.viewGreenDiet(pnnum);
		List<MenuVO> listDiet = menuSVC.listDiet();
		
		ProductVO productVO = (ProductVO) map.get("product");
		logger.info(productVO.toString());
		logger.info("list : " + menuSVC.listDiet());
		
		model.addAttribute("productVO", productVO);
		model.addAttribute("listDiet", listDiet);
		model.addAttribute("tid", tid);
		
		return "product/viewGreenDiet";
	}
}
