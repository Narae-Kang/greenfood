package com.kh.greenfood.product.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import com.kh.greenfood.member.vo.MemberVO;
import com.kh.greenfood.menu.vo.SelectMenuVO;
import com.kh.greenfood.product.svc.CartSVC;
import com.kh.greenfood.product.svc.OrderSVC;
import com.kh.greenfood.product.vo.CartVO;
import com.kh.greenfood.product.vo.OrdersDetailVO;
import com.kh.greenfood.product.vo.OrdersInfoVO;
import com.kh.greenfood.product.vo.OrdersVO;

@Controller
@RequestMapping("/order")
public class OrderController {
   private static final Logger logger 
   = LoggerFactory.getLogger(OrderController.class);
   
   @Inject
   OrderSVC orderSVC;
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

   //주문서 작성양식
   @GetMapping("/allOrderWrite")
   public String allOrderWrite(HttpServletRequest request,
                         Model model,
                         @ModelAttribute OrdersVO ordersVO,
                         OrdersDetailVO ordersDetailVO,
                         CartVO product_CartVO,
                         @ModelAttribute OrdersInfoVO ordersInfoVO) {
      
      MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
      //로그인한 회원 정보
      ordersInfoVO.setFid(memberVO.getId());
      ordersInfoVO.setFname(memberVO.getName());
      ordersInfoVO.setFtel(memberVO.getTel());
      ordersInfoVO.setAddress1(memberVO.getAddress1());
      ordersInfoVO.setAddress2(memberVO.getAddress2());
      ordersInfoVO.setAddress3(memberVO.getAddress3());
      orderSVC.selectMember(memberVO.getId());
      model.addAttribute("info", ordersInfoVO);
   
      //로그인한 회원의 장바구니 들고오기
      product_CartVO.setTid(memberVO.getId());
      model.addAttribute("cart", orderSVC.selectCart(product_CartVO.getTid()));
      
      ordersDetailVO.setRid(memberVO.getId());
      return "product/allOrderWrite";
   }

   //주문서 작성
   @PostMapping("/allOrder")
   public String allOrder(OrdersVO ordersVO,
                     OrdersInfoVO ordersInfoVO,
                     OrdersDetailVO ordersDetailVO,
                     BindingResult result,
                     HttpServletRequest request,
                     Model model) {

      if(result.hasErrors()) {
         return "product/allOrderWrite";
      }
      
      MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
      
      ordersInfoVO.setFid(memberVO.getId());
      ordersVO.setOid(memberVO.getId());
      ordersDetailVO.setRid(memberVO.getId());   
      
      orderSVC.insertInfo(ordersInfoVO);      
      orderSVC.cartAllDelete(memberVO.getId());
      
      model.addAttribute("info", ordersInfoVO);
      model.addAttribute("orders", ordersVO);
      
      int cnt = orderSVC.insertOrders(ordersVO);
      if(cnt > 0) {
         return "redirect:/order/infoList";
      }else {
         return "redirect:/";
   }
}
   
   //바로결제하기 
   @GetMapping("/oneOrderWrite")
   public String oneOrderWrite(HttpServletRequest request,
                         Model model,
                         OrdersVO ordersVO,
                         OrdersDetailVO ordersDetailVO,
                         OrdersInfoVO ordersInfoVO,
                         CartVO product_CartVO) {
      
      MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
      //로그인한 회원 정보
      ordersInfoVO.setFid(memberVO.getId());
      ordersInfoVO.setFname(memberVO.getName());
      ordersInfoVO.setFtel(memberVO.getTel());
      ordersInfoVO.setAddress1(memberVO.getAddress1());
      ordersInfoVO.setAddress2(memberVO.getAddress2());
      ordersInfoVO.setAddress3(memberVO.getAddress3());
      
      orderSVC.selectMember(memberVO.getId());
      model.addAttribute("info", ordersInfoVO);
   
      ordersDetailVO.setFnum(ordersInfoVO.getFnum());
      //로그인한 회원의 장바구니 들고오기
      product_CartVO.setTid(memberVO.getId());
      logger.info(product_CartVO.toString());
      model.addAttribute("cart", orderSVC.oneCart(product_CartVO.getTid()));
      
      ordersDetailVO.setRid(memberVO.getId());
      return "product/oneOrderWrite";
   }
   
   //바로결제하기 주문서 작성
   @PostMapping("/oneOrder")
   public String oneOrder(OrdersVO ordersVO,
                      OrdersInfoVO ordersInfoVO,
                     OrdersDetailVO ordersDetailVO,
                     BindingResult result,
                     HttpServletRequest request,
                     Model model) {
      if(result.hasErrors()) {
         return "product/oneOrderWrite";
      }      
      MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
      ordersInfoVO.setFid(memberVO.getId());
      ordersVO.setOid(memberVO.getId());
      ordersDetailVO.setRid(memberVO.getId());   
      
      orderSVC.insertInfo(ordersInfoVO);      
      //장바구니 최근 한건만 삭제
      orderSVC.cartOneDelete(memberVO.getId());
      
      model.addAttribute("info", ordersInfoVO);
      model.addAttribute("orders", ordersVO);
      
      int cnt = orderSVC.insertOrders(ordersVO);
      if(cnt > 0) {
         return "redirect:/order/infoList";
      }else {
         return "redirect:/";
      }
   }

   @GetMapping("/orderReadForm")
   public String orderReadForm(OrdersVO ordersVO,
                        OrdersInfoVO ordersInfoVO,
                        OrdersDetailVO ordersDetailVO,
                        HttpServletRequest request,
                        @RequestParam(value = "onum") long onum,
                        Model model) {
      MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
      ordersInfoVO = orderSVC.selectMember(memberVO.getId());
      ordersDetailVO.setRid(memberVO.getId());
      ordersDetailVO.setOnum(onum);
      ordersVO.setOnum(onum);      
      
      model.addAttribute("info", ordersInfoVO);
      model.addAttribute("orders", orderSVC.selectOrders(memberVO.getId(),onum));
      model.addAttribute("ordersDetail", orderSVC.selectDetail(memberVO.getId(),onum));
      return "product/orderRead";
   }
      
   
   @GetMapping({"/infoList",
             "/infoList/{reqPage}"   ,
             "/infoList/{reqPage}/{searchType}/{keyword}"}) 
    public String infoList(HttpServletRequest request,
                     @PathVariable(required=false) String reqPage,
                     @PathVariable(required=false) String searchType,
                     @PathVariable(required=false) String keyword,
                           Model model,
                           SelectMenuVO selectMenuVO ) { 
   
      
       MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
       
       int Ordercnt = orderSVC.orderCnt(memberVO.getId());
       int MenuCnt = orderSVC.menuCnt(memberVO.getId());
       
       model.addAttribute("MenuCnt", MenuCnt);
       model.addAttribute("Ordercnt", Ordercnt);
       model.addAttribute("infoList",orderSVC.selectDetail(memberVO.getId())); 
       model.addAttribute("selectMenu", orderSVC.selectMenuList(memberVO.getId()));
       model.addAttribute("SelectmenuList", orderSVC.selectMenuList(reqPage, searchType, keyword,memberVO.getId()));
         model.addAttribute("pc", orderSVC.getPageCriteria(reqPage, searchType, keyword,memberVO.getId()));
         
     return "product/infoList"; 
     }
}


