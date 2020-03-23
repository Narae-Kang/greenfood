package com.kh.greenfood.member.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.greenfood.member.svc.MemberSVC;
import com.kh.greenfood.member.vo.MemberVO;

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
	
	//로그인 양식
	//@RequestMapping(value="/login",method=RequestMethod.GET)
	@GetMapping("/loginForm")
	public String greenlogin(
			@RequestParam(value="reqURI", required = false) String reqURI,
			Model model) {
		if(reqURI == null) {
			reqURI = "/";
		}
		model.addAttribute("reqURI", reqURI);
		return "/member/loginForm";
	}
	
	//로그인 처리
	@PostMapping("/login")
	public String greenloginOk(
			@RequestParam("id") String id, 
			@RequestParam("pw") String pw,
			@RequestParam("reqURI") String reqURI,
			HttpSession session, 
			Model model) {
		
		logger.info("id="+id);
		logger.info("pw="+pw);
		
		MemberVO memberVO = memberSVC.selectGreen(id);
		//1) 회원이 없는경우
		if(memberVO == null) {
			model.addAttribute("svr_msg", "가입된 회원정보가 없습니다.");
			//throw new BizException("가입된 회원정보가 없습니다.");
		}else {
		//2) 회원이 있는경우
			//2-1) 비밀번호가 일치하는경우
			if( pw.equals(memberVO.getPw())) {
				session.setAttribute("member", memberVO);
				return "redirect:/";

			}else {
			//2-2) 비밀번호가 다른경우
				model.addAttribute("svr_msg", "비밀번호가 일치하지 않습니다.");	
			}
		}	
		session.invalidate();
		return "/member/loginForm";
	}
	
	//로그아웃
	@GetMapping("/logout")
	public String greenlogout(HttpSession session) {
		
		session.invalidate(); 
		return "redirect:/";
	}
}








