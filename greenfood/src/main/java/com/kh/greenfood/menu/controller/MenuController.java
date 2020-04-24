//package com.kh.greenfood.menu.controller;
//
//import java.util.List;
//
//import javax.inject.Inject;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import com.kh.greenfood.menu.svc.MenuSVC;
//import com.kh.greenfood.menu.vo.MenuVO;
//
////@Controller
////@RequestMapping("/menu")
//public class MenuController {
//
//	private static final Logger logger
//	= LoggerFactory.getLogger(MenuController.class);
//	
//	@Inject
//	MenuSVC menuSVC;
//	
////	@ModelAttribute
////	public void list(Model model) {
////		List<MenuVO> menuVO1 = menuSVC.listJS();
////		List<MenuVO> menuVO2 = menuSVC.listRice();
////		List<MenuVO> menuVO3 = menuSVC.listSP();
////		List<MenuVO> menuVO4 = menuSVC.listDiet();
////		
////		logger.info("menuVO1 : " + menuSVC.listJS());
////		logger.info("menuVO2 : " + menuSVC.listRice());
////		logger.info("menuVO3 : " + menuSVC.listSP());
////		logger.info("menuVO4 : " + menuSVC.listDiet());
////	}
//
////	//그린정식 식단보기
////	@GetMapping("/greenJSList")
////	public String listJS(Model model) {
////		List<MenuVO> listJS = menuSVC.listJS();
////		logger.info("list : " + menuSVC.listJS());
////		model.addAttribute("listJS", listJS);
////		return "product/viewGreenJS";
////	}
//}
