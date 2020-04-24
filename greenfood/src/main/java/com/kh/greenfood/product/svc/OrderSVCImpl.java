package com.kh.greenfood.product.svc;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.kh.greenfood.common.FindCriteria;
import com.kh.greenfood.common.PageCriteria;
import com.kh.greenfood.common.RecordCriteria;
import com.kh.greenfood.menu.vo.SelectMenuVO;
import com.kh.greenfood.product.dao.OrderDAO;
import com.kh.greenfood.product.vo.CartVO;
import com.kh.greenfood.product.vo.OrdersDetailVO;
import com.kh.greenfood.product.vo.OrdersInfoVO;
import com.kh.greenfood.product.vo.OrdersVO;

@Service
public class OrderSVCImpl implements OrderSVC{

   private static final Logger logger
   = LoggerFactory.getLogger(OrderSVCImpl.class);

   @Inject
   OrderDAO orderDAO;
   
   //장바구니 상품 목록 불러오기
   @Override
   public List<CartVO> selectCart(String tid){
      return orderDAO.selectCart(tid);
   }
   
   //회원정보 불러오기
   @Override
   public OrdersInfoVO selectMember(String fid) {
      return orderDAO.selectMember(fid);
   }
   
   //수령인 정보 저장
   @Override
   public int insertInfo(OrdersInfoVO ordersInfoVO) {
      return orderDAO.insertInfo(ordersInfoVO);
   }
   
   //총결제내역 저장
   @Override
   public int insertOrders(OrdersVO ordersVO) {
      //총결제내역 저장
      int cnt = orderDAO.insertOrders(ordersVO);
      logger.info("1");
      //2) onum 가져오기 => mybatis: selectkey 사용
   
      
      if(ordersVO.getOrders() != null) {
         logger.info("orders"+ordersVO.getOrders().toString());
         insertDetail(ordersVO.getOrders(), ordersVO.getOnum());
      }
      return cnt;
   }
   //결제상세내역 저장
   private void insertDetail(List<OrdersDetailVO> orders, long onum) {
   
      for(OrdersDetailVO order : orders) {
         try {
            OrdersDetailVO ordersDetailVO = new OrdersDetailVO();
            //ORDERS의 주문번호
            ordersDetailVO.setOnum(onum);
            logger.info("2");
            //구매자아이디
            ordersDetailVO.setRid(order.getRid());
            //상품이름
            ordersDetailVO.setPname(order.getPname());
            //상품가격
            ordersDetailVO.setPrice(order.getPrice());
            //수량
            ordersDetailVO.setAmount(order.getAmount());
            //개별 정보 저장
            if(order.getAmount() > 0 ) {
               orderDAO.insertDetail(ordersDetailVO);   
               
           }   
          }catch(NullPointerException  e) {
               e.printStackTrace();
            }
       }
      }
   
   //결제 상세내역 
   @Override
   public List<OrdersDetailVO> selectDetail(String rid, long onum) {
      return orderDAO.selectDetail(rid,onum);
   }
   @Override
   public List<OrdersDetailVO> selectDetail(String rid) {
      return orderDAO.selectDetail(rid);
   }
   
   
   //총결제
   @Override
   public OrdersVO selectOrders(String oid,long onum) {
      return orderDAO.selectOrders(oid,onum);
   }
   
   //카트비우기
   @Override
   public void cartAllDelete(String tid) {
      orderDAO.cartAllDelete(tid);
      
   }
   //바로결제하기
   @Override
   public List<CartVO> oneCart(String tid) {
      return orderDAO.oneCart(tid);
   }
   
   //최근 장바구니 한건만 삭제 
   @Override
   public void cartOneDelete(String tid) {
      orderDAO.cartOneDelete(tid);
      
   }
   
   //선택메뉴 불러오기
   @Override
   public List<SelectMenuVO> selectMenuList(String sid) {
      logger.info(sid);
    return orderDAO.selectMenuList(sid);
   }
   //검색어 없는 목록
   @Override
   public List<SelectMenuVO> selectMenuList(int startRec, int endRec) {

      return null;
   }
   //검색어 있는 목록
   @Override
   public List<SelectMenuVO> selectMenuList(String reqPage, String searchType, String keyword,String sid) {
      int l_reqPage = 0;
      //요청페이지 정보가 없으면 1로 초기화
      if(reqPage == null || reqPage.trim().isEmpty()) {
         l_reqPage = 1;
      }else {
         l_reqPage = Integer.parseInt(reqPage);
      }
      RecordCriteria recordCriteria = new RecordCriteria(l_reqPage);
      logger.info("svc검색어있는"+l_reqPage);
      return orderDAO.selectMenuList(
                 recordCriteria.getStartRec(),
                 recordCriteria.getEndRec(),
                searchType,keyword,sid);
   }
   //페이지 제어
   @Override
   public PageCriteria getPageCriteria(String reqPage, String searchType, String keyword,String sid) {

      PageCriteria       pc = null;               //한페이지에 보여줄 페이징 계산하는 클래스
      FindCriteria       fc = null;               //PageCriteira + 검색타입, 검색어      
      
      int totalRec = 0;                              //전체레코드 수
      
      int l_reqPage = 0;
      
      //요청페이지가 정보가 없으면 1로 초기화
      if(reqPage == null || reqPage.trim().isEmpty()) {
         l_reqPage = 1;
      }else {
         l_reqPage = Integer.parseInt(reqPage);
      }
      totalRec = orderDAO.SelectMenuTotalRecordCount(searchType, keyword, sid);

      fc = new FindCriteria(l_reqPage, searchType, keyword);
      pc = new PageCriteria(fc, totalRec);
      logger.info("totalRec:"+totalRec, searchType, keyword);
      logger.info("fc:"+fc.toString());
      logger.info("rc:"+((RecordCriteria)fc).toString());
      logger.info("pc:"+pc.toString());
      return pc;
   }

   @Override
   public int orderCnt(String oid) {
      // TODO Auto-generated method stub
      return orderDAO.orderCnt(oid);
   }

   @Override
   public int menuCnt(String sid) {
      return orderDAO.menuCnt(sid);
   }

}









