package com.kh.greenfood;

import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.greenfood.board.svc.BoardSVC;
import com.kh.greenfood.member.vo.MemberVO;
import com.kh.greenfood.product.svc.CartSVC;

@Controller
public class HomeController {
	
	private final Logger logger
		= LoggerFactory.getLogger(HomeController.class);

	@Inject
	BoardSVC boardSVC;
	@Inject
	CartSVC cartSVC; 

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,
			HttpSession session
			) {
		
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		
		//게시글목록
		model.addAttribute("mainNotice", boardSVC.mainNotice());
		//페이지 제어

		return "index";
	}
	
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
}
