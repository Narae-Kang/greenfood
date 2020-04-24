<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>주문 상세내역</title>
<!-- 구글폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-1/css/all.min.css" />  

<link rel="stylesheet" href="<c:url value='/resources/css/greenMain.css' />">
<link rel="stylesheet"
	href="<c:url value='/resources/css/orderRead.css' />">
</head>
<script type="text/javascript">
window.addEventListener("load",init, false);
function init(){
	let mmodifyBtn = document.getElementById('menu_modify_btn');
	let mchangeBtn = document.getElementById('menu_change_btn');
	let mcancleBtn = document.getElementById('menu_cancle_btn');
	
	mmodifyBtn.addEventListener("click",function(e){
		e.preventDefault();
		location.href = "/greenfood/board/list/Q&A";
		},false);

	mchangeBtn.addEventListener("click",function(e){
		e.preventDefault();
		location.href = "/greenfood/board/list/Q&A";
		},false);

	mcancleBtn.addEventListener("click",function(e){
		e.preventDefault();
		location.href = "/greenfood/board/list/Q&A";
		},false);
	
}
</script>
<body>
<!-- header -->
<%@ include file="../include/greenHeader.jsp"%>
<div class="orderRead">
  <form id="orderReadForm" method="post"  >
    <table class="buy_tbl">
        <caption>주문 상세내역</caption>
        <colgroup>
          <col style="width:50px">
        	<col style="width:140px">
        	<col style="width:50px">
        	<col style="width:60px">
        </colgroup>
        <thead>
        <tr>
        		<th>주문번호</th>
            <th>상품명</th>
            <th>수량</th>
            <th>가격</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${ordersDetail }" var="ordersDetail">
        <tr>
            <td>${ordersDetail.onum }</td>
            <td>${ordersDetail.pname }</td>
            <td>${ordersDetail.amount }</td>
            <td>${ordersDetail.price }</td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
    <table class="delivery_tbl">
        <caption>배송정보</caption>
        <tr>
            <th>이름</th>
 		 				<td>${info.fname }</td>
        </tr>
        <tr>
            <th>전화번호</th>
            <td>${info.ftel }</td>
        </tr>
        <tr>
            <th>배송지</th>
		    		<td>${info.address1 }, ${info.address2 }, ${info.address3 }</td>
				</tr>		
        <tr>
            <th>요청사항</th>
            <td>${info.fdm }</td>
        </tr>
    </table>

    <table class="pay_tbl">
        <caption>결제방법</caption>
       
        <tr class="total_tr">
            <th colspan="2">총 주문금액</th>
            <td>${orders.totalprice }원</td>
        </tr>
        <tr>
            <th colspan="2">결제방법</th>
            <td>${orders.payment }</td>
        </tr>
        <c:if test="${orders.payment eq '무통장입금'}">
        <tr>
            <th colspan="2">입금 계좌</th>
            <td>신한은행 112-7461-45775-12 (주)그린푸드 이한별</td>
        </tr>
        </c:if>

    </table>
    <div class="menu_btn">
    <button id="menu_modify_btn">주문 식단표 수정</button>
    <button id="menu_change_btn">주문 정보 변경</button>
    <button id="menu_cancle_btn">취소신청</button>
    </div>
    
    </form>
    </div>
<!-- footer -->
<%@ include file="../include/greenFooter.jsp"%>
</body>
</html>