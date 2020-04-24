package com.kh.greenfood.member.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.greenfood.member.svc.MemberSVC;
import com.kh.greenfood.member.vo.MemberVO;
import com.kh.greenfood.product.svc.CartSVC;


@Controller
public class LoginController {

	// ============참고하세요==============
	// ===컨트롤러 양식 : green+메서드명=====
	// ===Mapping주소는 개인 포폴과 동일함===
	// ===기타 메서드, 객체명 동일합니다롱====
	// ===저녁8시6분 멤버 백엔드다했지롱롱====
	
	private static final Logger logger 
		= LoggerFactory.getLogger(LoginController.class);
	
	@Inject
	MemberSVC memberSVC;
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
	
	//로그인 양식
	@GetMapping("/loginForm") 
	public String login(@RequestParam(value = "reqURI", required = false) String reqURI, Model model) {
		logger.info("reqURI:"+reqURI);
		if(reqURI == "/order/addcart") {
			reqURI = "/product/productList"; 
		}

		model.addAttribute("reqURI", reqURI);

		return "/member/memberLoginForm";
	}
	
//로그인 처리
	@PostMapping("/login")
	public String loginOk(
			@RequestParam("id") String id, //파라미터로 id pw받아옴 LoginForm에 name 
			@RequestParam("pw") String pw,
			@RequestParam("reqURI") String reqURI,
			HttpSession session,
			Model model) {
		logger.info("reqURI="+reqURI);
		logger.info("id="+id);
		logger.info("pw="+pw);
		
		MemberVO memberVO= memberSVC.selectGreen(id);
		
		if(reqURI.equals(""))  {
			reqURI = "/";
		}
		
		//1)회원이 없는경우
		if(memberVO == null) {
			model.addAttribute("svr_msg", "가입된 회원정보가 없습니다.");
			/* throw new BizException("가입된 회원정보가 없습니다"); */
		}else {
			
		//2)회원이 있는경우
			//2-1)비밀번호가 일치하는 경우 세션에 담음
			if(pw.equals(memberVO.getPw())) {
				session.setAttribute("member", memberVO);
				return "redirect:"+reqURI;
			}else {
			//2-2)비밀번호가 다른경우
				model.addAttribute("svr_msg", "비밀번호가 일치하지 않습니다.");
			}
		}
		session.invalidate(); //세션남은정보 제거.
		return "/member/memberLoginForm";
	}
	
	
	//로그아웃
	@GetMapping("/logout")
	public String greenlogout(HttpSession session) {
		
		session.invalidate(); 
		return "redirect:/";
	}
}








