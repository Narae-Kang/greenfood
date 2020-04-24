package com.kh.greenfood.rboard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.greenfood.common.PageCriteria;
import com.kh.greenfood.common.RecordCriteria;
import com.kh.greenfood.member.vo.MemberVO;
import com.kh.greenfood.product.svc.CartSVC;
import com.kh.greenfood.rboard.svc.RboardSVC;
import com.kh.greenfood.rboard.vo.RboardVO;

@RestController
@RequestMapping("/rboard")
public class RboardController {
	private static Logger logger 
	= LoggerFactory.getLogger(RboardController.class);
	
	@Inject
	RboardSVC rboardSVC;
	
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
	 
	//댓글 작성
	@PostMapping(value="", produces="application/json") 
	public ResponseEntity<String> replyWrite(
			@RequestBody(required=true) RboardVO rboardVO
			) {
		ResponseEntity res = null;
		logger.info("replyWrite() 호출됨");
		
		//유효성 체크
		if(rboardVO.getBnum() > 0 &&	//게시글 번호
		   rboardVO.getRid() != null &&
		   rboardVO.getRname()	 != null &&			
		   rboardVO.getRcontent() != null			
			) {
			
			//유효성체크 통과하면 댓글 작성
			rboardSVC.replyWrite(rboardVO);
			//작성 성공
			res = new ResponseEntity<String>("success", HttpStatus.OK);
		} else {
			//작성 실패
			res = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		return res;
	}
	
	//댓글 수정
	@PutMapping(value="", produces="application/json")
	public ResponseEntity<String> replyModify(
			@RequestBody(required=true) RboardVO rboardVO){
		ResponseEntity<String> res = null;
		logger.info("replyModify() 호출됨"); 
		
		//유효성 체크
		if(rboardVO.getRcontent() != null &&
		   rboardVO.getRnum() > 0) {
			
			//유효성 체크 통과하면 댓글 수정
			rboardSVC.replyModify(rboardVO);
			//수정 성공
			res = new ResponseEntity<String>("success", HttpStatus.OK);
		} else {
			//수정 실패
			res = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		return res;
	}
	
	//댓글 삭제
	@DeleteMapping(value="/{rnum}", produces="application/json;charset=utf-8")
	public ResponseEntity<String> replyDelete(
			@PathVariable(required=true) String rnum){
		ResponseEntity<String> res = null;
		logger.info("replyDelete() 호출됨"); 
		int cnt = rboardSVC.replyDelete(rnum);
		
		if(cnt==1) {
			res = new ResponseEntity<String>("success",HttpStatus.OK);	//200
		}else {
			res = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST); //400
		}
		return res;
	}
	
	//대댓글 작성
	@PostMapping(value="/reply", produces="application/json")
	public ResponseEntity<String> rereplyWrite(
			@RequestBody(required=true) RboardVO rboardVO){
		ResponseEntity res = null;
		logger.info("rereplyWrite() 호출됨"); 
		
		//유효성 체크
		if(rboardVO.getPrnum() > 0 &&	//부모댓글번호
		   rboardVO.getRid() !=null &&
		   rboardVO.getRname() !=null &&
		   rboardVO.getRcontent() !=null) {
			//유효성 체크 통과하면 대댓글 작성
			rboardSVC.rereplyWrite(rboardVO);
			//작성 성공
			res = new ResponseEntity<String>("success",HttpStatus.OK);	//200
		}else {
			//작성 실패
			res = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST); //400
		}
		return res;
	}
	
	//전체 댓글 조회
	@GetMapping(value="/{page}/{bnum}", produces="application/json")
	public ResponseEntity<Map<String,Object>> replyList(
			@PathVariable String page,
			@PathVariable(required=true) String bnum
			){
		ResponseEntity<Map<String,Object>> res = null;
		Map<String,Object> map = new HashMap<>();
		logger.info("replyList() 호출됨");
		
		try {
			//페이징
			RecordCriteria rc = new RecordCriteria(Integer.valueOf(page));	 //페이지당 시작댓글, 종료댓글
			PageCriteria pc = new PageCriteria(rc, rboardSVC.replyAll(bnum));//페이지 계산
			
			//댓글목록
			logger.info("rboardSVC.replyList 호출함...");
			List<RboardVO> list = rboardSVC.replyList(Integer.valueOf(bnum), 
													  rc.getStartRec(), 
													  rc.getEndRec());
			map.put("pc", pc);
			map.put("list", list);
			logger.info("컨트롤러의map:"+map.toString());
			res = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
			logger.info("★★★현재 페이지 댓글 리스트 : " + list.toString());
		}catch(Exception e) {
			e.printStackTrace();
			res = new ResponseEntity<Map<String,Object>>(map, HttpStatus.BAD_REQUEST);
		}
		return res;		
	}
	
	
}

































