package com.kh.greenfood.admin.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.greenfood.member.svc.MemberSVC;
import com.kh.greenfood.member.vo.MemberVO;

@Controller
@RequestMapping("/admin")
public class AdminController {

	private static final Logger logger 
		= LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	MemberSVC memberSVC;
	
	//관리자 페이지 (회원 목록)
	@GetMapping("")
	public String adminMain(Model model) {
		List<MemberVO> memberList = memberSVC.selectAllGreen();		//회원 목록
//		List<ProductVO> productList = productSVC.selectAllProduct();  //상품 목록
		model.addAttribute("memberList", memberList);
//		model.addAttribute("productList", productList);
	
		return "admin/adminMain";
	}
	
	
}
