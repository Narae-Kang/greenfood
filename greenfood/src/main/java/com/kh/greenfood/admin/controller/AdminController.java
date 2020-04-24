package com.kh.greenfood.admin.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.greenfood.admin.svc.AdminSVC;
import com.kh.greenfood.common.Code;
import com.kh.greenfood.member.svc.MemberSVC;
import com.kh.greenfood.member.vo.MemberVO;
import com.kh.greenfood.menu.vo.MenuVO;
import com.kh.greenfood.product.svc.CartSVC;

/* 관리자 페이지 
 * 1. adminMain - 주문관리 페이지 
 * 	  1-1. 주문 상태 수정 (ajax 사용)
 * 
 * 2. adminMenu - 식단 등록
 *    2-1. 식단 등록, 수정, 삭제, 검색 가능
 *    
 */

@Controller
@RequestMapping("/admin")
public class AdminController {

	private static final Logger logger 
		= LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	MemberSVC memberSVC;
	
	@Inject
	AdminSVC adminSVC;
	
	@Inject
	CartSVC cartSVC; 
	
	/* 관리자 페이지 
	 * 1. admin/adminMain (adminMain.jsp)
	 * 관리자 페이지 초기 접속시 회원 주문 목록 페이지로 이동 (기본페이지) 
	 * 2. admin/adminMenu (adminMenu.jsp)
	 * 다음페이지 메뉴(식단) 리스트 페이지
	 * */
	
	
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

// ----------------------------------------------- 주문 관리		
	
	@ModelAttribute
	public void initData(Model model) {
		//주문 상태
		List<Code> orderState = new ArrayList<>();
		orderState.add(new Code("미입금","미입금"));
		orderState.add(new Code("결제완료","결제완료"));
		orderState.add(new Code("진행","진행"));
		orderState.add(new Code("취소","취소"));
		orderState.add(new Code("완료","완료"));
		model.addAttribute("orderState", orderState);
	}
	
	
	//관리자 페이지 (주문 목록)
	@GetMapping({"adminMain", "/adminMain/{reqPage}",
 				"/adminMain/{reqPage}/{searchType}/{keyword}"})
	public String adminMain(
			@Valid @ModelAttribute("mvo") MemberVO memberVO,
			@PathVariable(required=false) String reqPage,
			@PathVariable(required=false) String searchType,
			@PathVariable(required=false) String keyword,
			HttpSession session,
			Model model
			) {
		logger.info("adminMain 주문정보 읽어오기");
		List<MemberVO> memberList = adminSVC.selectAdminMember(reqPage, searchType, keyword);		//회원 목록
		for(MemberVO member : memberList) {
			if(member.getState()!=null)
				member.setState(member.getState().trim());
		}
		
		model.addAttribute("memberList", memberList);
		//model.addAttribute("memberList", adminSVC.selectAdminMember(reqPage, searchType, keyword));
		model.addAttribute("pc", adminSVC.selectAdminPageCriteria(reqPage, searchType, keyword));
		
		
		logger.info("memberList.toString()"+memberList.toString());
	
		return "admin/adminMain";
	}
	
	//관리자 페이지 수정
		@PostMapping(value="/adminModify", produces="application/json; charset=utf-8")
		@ResponseBody
		public ResponseEntity<String> adminModyfy(
				@RequestBody(required=true) MemberVO memberVO
				) {
			ResponseEntity<String> res = null;
			logger.info("상태수정이 될까??"+memberVO.toString());
			adminSVC.adminStateModify(memberVO);
			//작성 성공
			if(memberVO.getState() != null) {
				adminSVC.adminStateModify(memberVO);
				//성공
				res = new ResponseEntity<String>("success", HttpStatus.OK);
			} else {
				//실패
				res = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
			}	
			return res;
		}			

// ----------------------------------------------- 식단 관리		
		
	//식단 목록
	@GetMapping({"/adminMenuList", 
				 "/adminMenuList/{reqPage}",
	 			 "/adminMenuList/{reqPage}/{searchType}/{keyword}"})
	public String adminMenuList(
			@PathVariable(required=false) String reqPage,
			@PathVariable(required=false) String searchType,
			@PathVariable(required=false) String keyword,
			HttpSession session,
			Model model
			) {
		
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		model.addAttribute("menuList", adminSVC.adminMenuList(reqPage,searchType,keyword));
		model.addAttribute("pc", adminSVC.getPageCriteria(reqPage, searchType, keyword));
		
		return "admin/adminMenuList";
	}
	
	//식단 등록 양식
	@GetMapping({"/adminMenuWriteForm",
				"/adminMenuWriteForm/{returnPage}"})
	public String adminMenuWriteForm(
			@ModelAttribute @PathVariable String returnPage,
			Model model, HttpServletRequest request
			) {
		
		logger.info("식단등록양식 호출!");
		
		model.addAttribute("menuVO", new MenuVO());
		return "/admin/adminMenuWrite";
	}
	
	//식단 등록
	@PostMapping("/adminMenuWrite/{returnPage}")
	public String adminMenuWrite(
			@PathVariable String returnPage,
			@Valid @ModelAttribute("menuVO") MenuVO menuVO,
			BindingResult result,
			HttpServletRequest request
			) {
		logger.info("식단 등록 : " + menuVO.toString());
		
		if(result.hasErrors()) {
			logger.info("errror: " + result.getAllErrors().toString());
		return "admin/adminMenuWrite";
		}
		
		adminSVC.adminWrite(menuVO);
		logger.info("mnum찾아 삼만리"+menuVO.getMnum());
		return "redirect:/admin/adminMenuView/"+returnPage+"/"+menuVO.getMnum();
	}
	
	//식단 보기
	@GetMapping("/adminMenuView/{returnPage}/{mnum}")
	public String adminMenuVeiw(
			@ModelAttribute @PathVariable String returnPage,
			@PathVariable String mnum, Model model
			) {
		
		logger.info(mnum+"번 식단보기 호출");
		Map<String,Object> map = adminSVC.adminView(mnum);
		MenuVO menuVO = (MenuVO)map.get("menu");
		logger.info("보려고 하는 식단 menuVO : " + menuVO.toString());
		
		model.addAttribute("menuVO", menuVO);
		
		return "admin/adminMenuRead";
	}

	//식단 삭제
	@GetMapping("/adminMenuDelete/{returnPage}/{mnum}")
	public String adminMenuDelete(
		@PathVariable String returnPage,
		@PathVariable String mnum,
		Model model) {
		
		adminSVC.adminDelete(mnum);
		model.addAttribute("adminMenuList", adminSVC.adminMenuList());
		return "redirect:/admin/adminMenuList/"+returnPage;
	}
	
	//식단 수정 양식
	@GetMapping("/adminMenuModifyForm/{returnPage}/{mnum}")
	public String adminMenuModifyForm(
			@ModelAttribute @PathVariable String returnPage,
			@PathVariable String mnum,
			Model model) {
		logger.info("식단 수정 양식 호출!");
		Map<String,Object> map = adminSVC.adminView(mnum);
		MenuVO menuVO = (MenuVO)map.get("menu");
		model.addAttribute("menuVO", menuVO);
		return "admin/adminMenuModify";
	}
	
	//식단 수정
	@PostMapping("/adminMenuModify/{returnPage}")
	public String adminMenuModify(
			@PathVariable String returnPage,
			@Valid @ModelAttribute("menuVO") MenuVO menuVO,
			BindingResult result
			) {
		logger.info("식단 수정 호출!");
		if(result.hasErrors()) {
			return "/admin/adminMenuModify";
		}
		logger.info("식단 수정 : " + menuVO.toString());
		adminSVC.adminModify(menuVO);
		return "redirect:/admin/adminMenuView/"+returnPage+"/"+menuVO.getMnum();
	}
	
}





























