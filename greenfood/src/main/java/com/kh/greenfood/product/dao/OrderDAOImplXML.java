package com.kh.greenfood.product.dao;


import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.kh.greenfood.menu.vo.SelectMenuVO;
import com.kh.greenfood.product.vo.CartVO;
import com.kh.greenfood.product.vo.OrdersDetailVO;
import com.kh.greenfood.product.vo.OrdersInfoVO;
import com.kh.greenfood.product.vo.OrdersVO;

@Repository
public class OrderDAOImplXML implements OrderDAO {

   private static final Logger logger 
   = LoggerFactory.getLogger(OrderDAOImplXML.class);
   
   @Inject
   private SqlSession sqlSession;
   
   //장바구니 상품 목록 불러오기
   @Override
   public List<CartVO> selectCart(String tid){
      return sqlSession.selectList("mappers.OrderDAO-mapper.selectCart",tid);
   }
   
   //회원정보 불러오기
   @Override
   public OrdersInfoVO selectMember(String fid) {
      return sqlSession.selectOne("mappers.OrderDAO-mapper.selectMember", fid);
   }
   
   //수령인 정보 저장
   @Override
   public int insertInfo(OrdersInfoVO ordersInfoVO) {
      logger.info(ordersInfoVO.toString());
      return sqlSession.insert("mappers.OrderDAO-mapper.insertInfo", ordersInfoVO);
   }

   //총결제내역 저장
   @Override
   public int insertOrders(OrdersVO ordersVO) {
      logger.info(ordersVO.toString());
      return sqlSession.insert("mappers.OrderDAO-mapper.insertOrders", ordersVO);
   }
   
   //결제상세내역 저장
   @Override
   public int insertDetail(OrdersDetailVO ordersDetailVO){
      logger.info(ordersDetailVO.toString());
      return sqlSession.insert("mappers.OrderDAO-mapper.insertDetail", ordersDetailVO);
   }
   
   //결제상세
   @Override
   public List<OrdersDetailVO> selectDetail(String rid, long onum) {
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("rid", rid);
      map.put("onum", onum);
      logger.info("selectdetail2"+map.toString());
      return sqlSession.selectList("mappers.OrderDAO-mapper.selectDetail2", map);
   }
   
   @Override
   public List<OrdersDetailVO> selectDetail(String rid) {
      logger.info("selectdetail1"+rid);
      return sqlSession.selectList("mappers.OrderDAO-mapper.selectDetail1",rid);
   }
   
   
   //총결제내역
   @Override
   public OrdersVO selectOrders(String oid,long onum) {
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("oid", oid);
      map.put("onum", onum);
      logger.info("selectorders"+map.toString());
      return sqlSession.selectOne("mappers.OrderDAO-mapper.selectOrders", map);
   }
   
   //총결제내역 갯수
   @Override
   public int orderCnt(String oid) {
      return sqlSession.selectOne("mappers.OrderDAO-mapper.orderCnt", oid);
   }
   
   //총주문한 메뉴 갯수
   @Override
   public int menuCnt(String sid) {
      return sqlSession.selectOne("mappers.OrderDAO-mapper.menuCnt", sid);
   }

   //장바구니 비우기
   @Override
   public void cartAllDelete(String tid) {
      sqlSession.delete("mappers.OrderDAO-mapper.cartAllDelete", tid);
   }
   
   //바로결제하기
   @Override
   public List<CartVO> oneCart(String tid) {
      
      return sqlSession.selectList("mappers.OrderDAO-mapper.oneCart", tid);
   }
   
   //최근 장바구니 한건만 삭제 
   @Override
   public void cartOneDelete(String tid) {
      sqlSession.delete("mappers.OrderDAO-mapper.cartOneDelete", tid);   
   }
   
    //선택메뉴 불러오기
    @Override
    public List<SelectMenuVO> selectMenuList(String sid) {
      return sqlSession.selectList("mappers.OrderDAO-mapper.selectMenuList", sid);
    }
   
    //검색어 없는 목록
   @Override
   public List<SelectMenuVO> selectMenuList(int startRec, int endRec) {
      Map<String,Object> map = new HashMap<>();
      map.put("startRec", startRec);
      map.put("endRec", endRec);
      return sqlSession.selectList("mappers.OrderDAO-mapper.selectMenuList2",map);
   }
   
   //검색어 있는 목록
   @Override
   public List<SelectMenuVO> selectMenuList(int startRec, int endRec, String searchType, String keyword,String sid) {
      Map<String,Object> map = new HashMap<>();
      map.put("startRec", startRec);
      map.put("endRec", endRec);
      map.put("searchType", searchType);
      map.put("sid", sid);
      if(keyword != null) {
         map.put("list", Arrays.asList(keyword.split("\\s+")));
      }
      logger.info("검색어있는"+map.toString());
      return sqlSession.selectList("mappers.OrderDAO-mapper.selectMenuList3",map);
   }
   
   //총 레코드 수
   @Override
   public int SelectMenuTotalRecordCount(String searchType, String keyword,String sid) {
      Map<String,Object> map = new HashMap<>();
      map.put("searchType",searchType);
      map.put("sid",sid);
      if(keyword != null) {
         map.put("list", Arrays.asList(keyword.split("\\s+")));
      }
      int result = sqlSession.selectOne("mappers.OrderDAO-mapper.SelectMenuTotalRecordCount", map);
      logger.info("레코드"+map.toString());
      return result;
   }


}