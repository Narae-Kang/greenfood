package com.kh.greenfood;

<<<<<<< HEAD
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
=======
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);		
		String formattedDate = dateFormat.format(date);		
		model.addAttribute("serverTime", formattedDate );
		
		return "index";
	}
	
}


/* 3/23 강나래 index 연결
 *
 * 
 * 
 * 
 * 
 */
>>>>>>> refs/remotes/origin/master
