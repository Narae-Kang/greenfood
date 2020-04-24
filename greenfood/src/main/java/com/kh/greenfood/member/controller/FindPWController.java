package com.kh.greenfood.member.controller;

import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.greenfood.mail.Email;
import com.kh.greenfood.mail.EmailSender;
import com.kh.greenfood.member.svc.MemberSVC;
import com.kh.greenfood.member.vo.MemberVO;
import com.kh.greenfood.product.svc.CartSVC;


@Controller
@RequestMapping("/member")
public class FindPWController {

	private static final Logger logger 
	= LoggerFactory.getLogger(LoginController.class);

	@Inject
	MemberSVC memberSVC;
	@Inject
	CartSVC cartSVC; 
	
	@Autowired
	private EmailSender emailSender;
	@Autowired
	private Email email;
	
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
	
	//비밀번호 변경 화면
	@GetMapping("/findPasswordForm")
	public String greenFindFWForm() {
		logger.info("하이");
		return "member/memberFindPWForm";
	}
	
	//새로운 비밀번호가 생성된다.
	private String newPassword(){
		logger.info("하이2");
		Random r = new Random();
		int num = r.nextInt(89999) + 10000;
		String npassword = "greenfood" + Integer.toString(num);// 새로운 비밀번호 변경
		
		return npassword;
	}
	
	// 이메일로 비밀번호가 전송이된다.
	@RequestMapping("/findPassword")
	public String findPasswordOK(MemberVO memberVO, HttpSession session) throws Exception {
		
		logger.info("하이3"+memberVO.toString());
		memberVO.setPw(newPassword());
		memberSVC.newPassword(memberVO);
		
		logger.info("하이4"+memberVO.toString());
			email.setContent("새로운 비밀번호 " + memberVO.getPw() + " 입니다." );
			email.setReceiver(memberVO.getId());
			email.setSubject("안녕하세요"+memberVO.getId() +"님  재설정된 비밀번호를 확인해주세요");
			emailSender.SendEmail(email);
			System.out.println(email);

			return "member/memberLoginForm";
	}
}




