package com.kh.greenfood.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.greenfood.member.svc.MemberSVC;
import com.kh.greenfood.member.vo.MemberVO;
import com.kh.greenfood.product.svc.CartSVC;

@Controller
@RequestMapping("/member")
public class MemberController {

	// ============참고하세요==============
	// ===컨트롤러 양식 : green+jsp이름=====
	// ===Mapping주소는 개인 포폴과 동일함===
	// ===ModelAttribute VO 객체: mvo=====
	// ===처리양식은 메서드명(ex:modify)====

	private static final Logger logger 
	= LoggerFactory.getLogger(MemberController.class);
	
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
	
	//회원가입양식
	@RequestMapping("/joinForm")
	public String greenJoinForm(Model model) {
		model.addAttribute("mvo", new MemberVO());
		return "member/memberJoinForm";
	}
	
	//회원등록
	@RequestMapping("/join")
	public String greenMemberJoin(
			@Valid @ModelAttribute("mvo") MemberVO memberVO,
			BindingResult result,
			Model model) {
		logger.info(memberVO.toString());
		
	// 1)유효성 오류체크 중 오류가 발견되면 회원가입페이지로 이동
		if(result.hasErrors()) { //에러가있는지 검사한다.
			return "member/memberJoinForm";
		}
			
		
		 // 2)회원 중복체크 
		if(memberSVC.selectGreen(memberVO.getId()) != null) {
		 model.addAttribute("svr_msg", "중복된 아이디입니다."); 
		 return "member/memberJoinForm"; 
		 }
		
		
		//3) 회원 가입처리
		int cnt = memberSVC.joinGreen(memberVO);
		if(cnt == 1) {
			return "member/memberLoginForm";	//충족시 가입완료 후 로그인 페이지
		}else {
			return "redirect:/";        //미충족시 가입 페이지 유지
		}
	}
	//회원수정 양식
	@GetMapping("modifyForm/{id:.+}")
	public String greenModifyForm(@PathVariable String id, Model model) {
		
		//1) 현재 로그인 상태의 회원정보 읽어오기
		MemberVO memberVO = memberSVC.selectGreen(id);
	  logger.info("memberVO:" + memberVO);
		//비밀번호 제거
		memberVO.setPw(null);
		model.addAttribute("mvo", memberVO);		
		return "member/memberModifyForm";
	}
	//회원수정
	@PostMapping("/modify")
	public String greenModify(
			@ModelAttribute("mvo") MemberVO memberVO,
			BindingResult result,
			HttpSession session,
			Model model) {
	
		logger.info("memberVO : " + memberVO.toString());
		//다음지도API로 입력된 주소 단위별로 호출하는 구간
		String aaa = memberVO.getAddress1();
	  aaa += "," + memberVO.getAddress2();
	  aaa += "," + memberVO.getAddress3();
	  memberVO.setAddress(aaa);
	  
	  if(result.hasErrors()) {
			logger.info(result.getAllErrors().toString());
			//비밀번호 제거
			memberVO.setPw(null);
			return "member/memberModifyForm";
		}		
	
	  int cnt = memberSVC.modifyGreen(memberVO);
	  logger.info("수정처리결과:"+cnt);
	  
	  //세션정보 수정
	  session.removeAttribute("member");
	  memberVO = memberSVC.selectGreen(memberVO.getId());
	  session.setAttribute("member", memberVO);
	  return "redirect:/";
	}
	//회원 탈퇴양식
	@GetMapping("/outForm")
	public String greenOutForm() {
		return "member/memberOutForm";
	}
	//회원탈퇴처리
	@PostMapping("/out")
	public String greenOut(
			@RequestParam("id") String id,
			@RequestParam("pw") String pw,
			HttpSession session,
			Model model) {
		
		int cnt = memberSVC.outGreen(id, pw);
		if(cnt == 1 ) {
			session.invalidate();
			return "redirect:/";
		}
		
		model.addAttribute("svr_msg", "비밀번호가 일치하지않습니다");
		return "member/memberOutForm";
	}
	
	//아이디찾기 양식
	@GetMapping("/findIDForm")
	public String greenFindIDForm() {
		
		return "member/memberFindIDForm";
	}
	
	//아이디 찾기 post방식
	@PostMapping(value="/id", produces = "application/json")
	@ResponseBody
	public ResponseEntity<Map> greenFindID(
			@RequestBody MemberVO memberVO
			){
			ResponseEntity<Map> res = null;
			String findID = null;
			logger.info("tel:"+memberVO.getTel());
			logger.info("birth:"+memberVO.getBirth());
			
		//java.sql.Date타입으로 변환
			memberVO.setBirth(java.sql.Date.valueOf(memberVO.getBirth().toString()));
			//아이디 찾기 service 호출
			findID = memberSVC.findID(memberVO.getTel(),memberVO.getBirth());
			Map<String,Object> map = new HashMap();
			if(findID != null) {
				map.put("success", true);
				map.put("id", findID);
				res = new ResponseEntity<Map>(map, HttpStatus.OK);  // 200
			}else {
				map.put("success",false);
				map.put("id",findID);
				map.put("msg","가입된 회원정보가 없습니다!");
				res = new ResponseEntity<Map>(map, HttpStatus.OK); //200
			}
			return res;
	}

}
