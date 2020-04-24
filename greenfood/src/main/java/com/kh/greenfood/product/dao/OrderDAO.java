package com.kh.greenfood.product.dao;

import java.util.List;

import com.kh.greenfood.menu.vo.MenuVO;
import com.kh.greenfood.menu.vo.SelectMenuVO;
import com.kh.greenfood.product.vo.CartVO;
import com.kh.greenfood.product.vo.OrdersDetailVO;
import com.kh.greenfood.product.vo.OrdersInfoVO;
import com.kh.greenfood.product.vo.OrdersVO;

public interface OrderDAO {

   //장바구니 상품 목록 불러오기
   List<CartVO> selectCart(String tid);
   
   //회원정보 불러오기
   OrdersInfoVO selectMember(String fid);
   
   //수령인 정보 저장
   int insertInfo(OrdersInfoVO ordersInfoVO);
   
   //결제상세내역 저장
   int insertDetail(OrdersDetailVO ordersDetailVO);
   
   //총결제내역 저장
   int insertOrders(OrdersVO ordersVO);
   
   //결제 상세내역 
   List<OrdersDetailVO> selectDetail(String rid);
   List<OrdersDetailVO> selectDetail(String rid,long onum);
   
   //총결제
   OrdersVO selectOrders(String oid, long onum);
   
   //총결제내역 갯수
   public int orderCnt(String oid);
   
   //총주문한 메뉴 갯수
   public int menuCnt(String sid);
   
   //카트비우기
   public void cartAllDelete(String tid);
   
   //바로결제하기
   List<CartVO> oneCart(String tid);
   
   //최근 장바구니 한건만 삭제 
   public void cartOneDelete(String tid);

    //선택메뉴 불러오기
    List<SelectMenuVO> selectMenuList(String sid);
      
   //검색어 없는 목록
   List<SelectMenuVO> selectMenuList(int startRec, int endRec);   
   
   //검색어 있는 목록
   List<SelectMenuVO> selectMenuList(int startRec, int endRec, String searchType, String keyword,String sid);
   
   //총 레코드수
   int SelectMenuTotalRecordCount(String searchType,String keyword,String sid);   

}

