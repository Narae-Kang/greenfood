<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>주문서 작성 결제</title>
<!-- 구글폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-1/css/all.min.css" />  
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/greenMain.css' />">
<link rel="stylesheet"
	href="<c:url value='/resources/css/orderWrite.css' />">
<script src="<c:url value='/resources/js/orderWrite.js' />"></script>
</head>
<body>
<!-- header -->
<%@ include file="../include/greenHeader.jsp"%>
<div class="aaa">
  <form id="cartForm" method="post" 
  action="${pageContext.request.contextPath }/order/allOrder">
  <h2>장바구니 > <b style="color: rgb(188, 224, 116);">주문서 작성/결제</b> > 식단고르기</h2>
    <table class="buy_tbl">
        <caption>상품정보</caption>
        <colgroup>
        	<col style="width:3%">
        	<col style="width:200px">
        	<col style="width:50px">
        	<col style="width:60px">
        </colgroup>
        <thead>
        <tr>
        		<!-- <th><label for="onum" >주문번호</label></th> -->
            <th colspan="2">상품명</th>
            <th>수량</th>
            <th>가격</th>
        </tr>
        </thead>
        <tbody>
        <c:set var = "sum" value = "0" />
        <c:forEach items="${cart }" var="cart" varStatus="status">
            <input type="hidden" name="onum" value="${cart.tnum }" readonly/>
        <tr class="cart-area">
        		<c:if test="${cart.tpnum == 1  }">
             <td class="td-cartord"><a href="${pageContext.request.contextPath }/product/greenJs/1"><img src="<c:url value='/resources/img/koreanfood.jpg' />" alt="사진" width="100px" height="90px" ></a></td>
            </c:if>
            <c:if test="${cart.tpnum == 2  }">
             <td class="td-cartord"><a href="${pageContext.request.contextPath }/product/greenRice/4"><img src="<c:url value='/resources/img/rice.jpg' />" alt="사진" width="100px" height="90px" ></a></td>
            </c:if>
            <c:if test="${cart.tpnum == 3  }">
             <td class="td-cartord"><a href="${pageContext.request.contextPath }/product/greenSP/7"><img src="<c:url value='/resources/img/greenspecial.jpg' />" alt="사진" width="100px" height="90px" ></a></td>
            </c:if>
            <c:if test="${cart.tpnum == 4  }">
             <td class="td-cartord"><a href="${pageContext.request.contextPath }/product/greenDiet/10"><img src="<c:url value='/resources/img/diet.jpg' />" alt="사진" width="100px" height="90px" ></a></td>
            </c:if>
            <td>
            <input name="orders[${status.index}].pname" value="${cart.pname }"  readonly/>
            <input name="" value="${cart.pdetail }"  readonly/>
            </td>
            <td><input name="orders[${status.index}].amount" value="${cart.amount }" readonly /></td>
            <td><input name="orders[${status.index}].price" value="${cart.tprice*cart.amount }"  readonly/></td>
        </tr>
            <input type="hidden"  name="orders[${status.index}].rid" value="${cart.tid }"  readonly/>
        <c:set var= "sum" value="${sum + cart.tprice *cart.amount }"/>
        </c:forEach>
        </tbody>
    </table> 
    <table class="delivery_tbl">
        <caption>받는 사람 정보</caption>
        <tr>
            <th><label for="fname">이름</label></th>
            <td><input id="fname" name="fname" value="${info.fname }" />
             <span class="errmsg" id="name_errmsg"></span>
            </td>
        </tr>

        <tr>
            <th><label for="ftel">전화번호</label></th>
            <td><input id="ftel" name="ftel" value="${info.ftel }" />
            <span class="errmsg" id="tel_errmsg"></span>
            </td>
        </tr>
     
		    <tr class="form-group">
		           <th><label for="faddress">배송지</label></th>
			    		<td class="row">   
			 				 <div class="addressApi">
					      	<div><input type="button" name="faddress" id="addressBtn" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"/></div>
					        <div><input type="text" name=faddress id="sample6_postcode" placeholder="우편번호"  value="${info.address1 }" /></div>
					        <div><input type="text" name="faddress" id="sample6_address" placeholder="주소" value="${info.address2 }"  /></div>
					        <div><input type="text" name="faddress" id="sample6_detailAddress" placeholder="상세주소" value="${info.address3 }" />
					        <span class="errmsg" id="address_errmsg"></span>
					        </div>
					     </div>
            			</td>
			 </tr>	
        <tr>
            <th><label for="fdm">요청사항</label></th>
            <td><textarea id="fdm" name="fdm" placeholder="배송메세지를 입력해주세요" rows="30" cols="10" ></textarea></td>
        </tr>
    </table>

    <table class="pay_tbl">
        <caption>결제정보</caption>
        <tr>
             <th colspan="2"><label for="payment">결제방법</label></th>
            <td><input type="radio" name="payment" value="카드결제" checked="checked">카드결제
            		<input type="radio" name="payment" value="무통장입금">무통장입금
            </td>
        </tr>

        <tr class="total_tr">
            <th colspan="2"><label for="totalprice">총 주문금액</label></th>
            <td><input style="max-width: 50px;" id="totalprice" name="totalprice" value="${sum}" />원</td>
        </tr>
    </table>
    <div class="shopping_btn">
    <button id="shopping_cancle_btn">취소</button>
    <button id="shopping_buy_btn">결제</button>
    </div>
    
    </form>
    </div>
<!-- footer -->
<%@ include file="../include/greenFooter.jsp"%>
</body>
</html>