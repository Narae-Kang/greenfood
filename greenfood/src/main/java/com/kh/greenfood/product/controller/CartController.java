package com.kh.greenfood.product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.tomcat.jni.Mmap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.greenfood.board.controller.BoardController;
import com.kh.greenfood.member.vo.MemberVO;
import com.kh.greenfood.product.svc.CartSVC;
import com.kh.greenfood.product.vo.CartVO;

@Controller
@RequestMapping("/order")
public class CartController {
	
	private static final Logger logger
	= LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	CartSVC cartSVC;
	
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
	 
	//바로주문하기
	@PostMapping(value = "/noworder")
	public String nowOrder(CartVO cartVO,Model model,HttpSession session) {
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
    String tid = memberVO.getId();
		
		
    int overlapcnt = cartSVC.overlapCart(tid, cartVO.getTpnum());
    model.addAttribute("cartVO", cartVO);
    if(overlapcnt == 0) {
    	cartSVC.addCart(cartVO);
    }
    else {
    	cartSVC.updateCart(cartVO);
    }
		return "redirect:/order/oneOrderWrite";
	}
	
	//장바구니 담기
	@PostMapping(value = "/addcart")
	public String addCart(CartVO cartVO,Model model,HttpSession session) {
		
		logger.info("cartvo:"+cartVO.toString());
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
    String tid = memberVO.getId();
    
    int overlapcnt = cartSVC.overlapCart(tid, cartVO.getTpnum());
    model.addAttribute("cartVO", cartVO);
    if(overlapcnt == 0) {
    	cartSVC.addCart(cartVO);
    }
    else {
    	cartSVC.updateCart(cartVO);
    }
    return "redirect:/order/cartlist";
	}
	
	//장바구니 리스트
	@GetMapping("/cartlist")
	public String CartList(HttpSession session, Model model) {
		
		
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		String tid = memberVO.getId();
		

		List<CartVO> cartList = cartSVC.CartList(tid);
		String sumPrice = cartSVC.sumPrice(tid);
		int cartCnt = cartSVC.cartCnt(tid);
		
		model.addAttribute("cartCnt", cartCnt);
		model.addAttribute("sumPrice", sumPrice);
		model.addAttribute("cartList", cartList);
		if(cartList != null && cartList.size() > 0) {
		model.addAttribute("tid", cartList.get(0).getTid());
		}
		
		return "product/CartList";
	}
	
	//장바구니 삭제
	@GetMapping("/deletecart/{tnum}")
	public String deleteCart(@PathVariable int tnum) {
		cartSVC.deleteCart(tnum);
		
		return "redirect:/order/cartlist";
	}
	
	//장바구니 전체 삭제
	@GetMapping("/deleteAllcart")
	public String deleteAllCart(@RequestParam(name = "tid") String tid) {
		logger.info("tid:"+tid);
		logger.info("deleteAllCart(@PathVariable String tid)");
		cartSVC.deleteAllCart(tid);
		return "redirect:/order/cartlist";
	}
	
	
	
	
}
