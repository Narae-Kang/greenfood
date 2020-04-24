package com.kh.greenfood.menu.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.greenfood.member.vo.MemberVO;
import com.kh.greenfood.menu.svc.MenuSVC;
import com.kh.greenfood.menu.svc.SelectMenuSVC;
import com.kh.greenfood.menu.vo.MenuVO;
import com.kh.greenfood.menu.vo.SelectMenuVO;
import com.kh.greenfood.product.svc.ProductSVC;
import com.kh.greenfood.product.vo.ProductVO;

@Controller
@RequestMapping("/menu")
public class SelectMenuController {
	
	private final Logger logger
	= LoggerFactory.getLogger(SelectMenuController.class);
	
	@Inject
	MenuSVC menuSVC;
	@Inject
	ProductSVC productSVC;
	@Inject
	SelectMenuSVC selectMenuSVC;
	
	//그린정식 식단선택
	@PostMapping("/selectJS")
	public String selectJS(
			HttpServletRequest request,
			@ModelAttribute("selectMenuVO") SelectMenuVO selectMenuVO,
			@RequestParam(value="seldate") List<String> sdate,
			@RequestParam(value="selectedDate") List<String> smnum,
			@RequestParam(value="menu") String menu
			) {
		logger.info("selectMenuVO:"+selectMenuVO);
		MemberVO memberVO = (MemberVO) request.getSession().getAttribute("member");
		selectMenuVO.setSid(memberVO.getId());
	
		selectMenuSVC.choiceMenu(selectMenuVO);

		logger.info("selectedDate : " + smnum);
		logger.info("seldate : " + sdate);
		logger.info("menu : " + menu);
		logger.info("id : " + memberVO.getId());
		
		return "redirect:/";
	}

	
	//그린정식 불러오기
	@GetMapping("/selectJS")
	public String selectJS(Model model) {
		
		List<MenuVO> list = menuSVC.listJS();
		model.addAttribute("list", list);
		model.addAttribute("selectMenuVO",new SelectMenuVO());
		return "menu/selectMenu";
	}
	

	//그린덮밥 식단선택
	@PostMapping("/selectRice")
	public String selectRice(
			@Valid @ModelAttribute("selectMenuVO") SelectMenuVO selectMenuVO,
			BindingResult result,
			HttpServletRequest request,
			Model model) throws Exception {
		
		if(result.hasErrors()) {
			return "/menu/selectRice";
		}
		model.addAttribute("selectMenuVO", selectMenuVO);
		
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
		selectMenuVO.setSid(memberVO.getId());
		logger.info("주문상품 : " + selectMenuVO.toString());
		selectMenuSVC.choiceMenu(selectMenuVO);
		return "redirect:/";
	}
	
	//그린덮밥 식단표 선택/불러오기
	@GetMapping("/selectRice")
	public String greenRice(
			Model model) {
		List<MenuVO> list = menuSVC.listRice();
		
		model.addAttribute("list", list);
		return "menu/selectMenu";
	}
	
	//그린스페셜 식단선택
	@PostMapping("/selectSP")
	public String selectSP(
			@Valid @ModelAttribute("selectMenuVO") SelectMenuVO selectMenuVO,
			BindingResult result,
			HttpServletRequest request,
			Model model) {
		
		if(result.hasErrors()) {
			return "/menu/selectSP";
		}
		model.addAttribute("selectMenuVO", new SelectMenuVO());
		
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
		selectMenuVO.setSid(memberVO.getId());
		logger.info("주문상품 : " + selectMenuVO.toString());
		selectMenuSVC.choiceMenu(selectMenuVO);
		return "redirect:/";
	}
	
	//그린스페셜 식단표 선택/불러오기
	@GetMapping("/selectSP")
	public String greenSP(
			Model model) {
		List<MenuVO> list = menuSVC.listSP();
		
		model.addAttribute("list", list);
		return "menu/selectMenu";
	}
	
	//그린다이어트 식단 선택
	@PostMapping("/selectDiet")
	public String selectDiet(
			@Valid @ModelAttribute("selectMenuVO") SelectMenuVO selectMenuVO,
			BindingResult result,
			HttpServletRequest request,
			Model model) {
		
		if(result.hasErrors()) {
			return "/menu/selectDiet";
		}
		model.addAttribute("selectMenuVO", new SelectMenuVO());
		
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
		selectMenuVO.setSid(memberVO.getId());
		logger.info("주문상품 : " + selectMenuVO.toString());
		selectMenuSVC.choiceMenu(selectMenuVO);
		return "redirect:/";
	}
	
	//그린다이어트 식단표 선택/불러오기
	@GetMapping("/selectDiet")
	public String greenDiet(
			Model model) {
		List<MenuVO> list = menuSVC.listDiet();
		
		model.addAttribute("list", list);
		return "menu/selectMenu";
	}
}
