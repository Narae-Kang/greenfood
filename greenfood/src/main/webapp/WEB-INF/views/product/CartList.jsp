<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>GREEN FOOD</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/greenMain.css"/>" />
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/CartList.css"/>" />
<style>

</style>
<script src="<c:url value='/resources/js/root.js' />"></script>
<script>
window.addEventListener("load", init, false);
function init() {
	let deleteBtn = document.querySelectorAll('.deleteBtn');
	let cleanBtn = document.getElementById('cleanBtn');
	let orderBtn = document.getElementById('orderBtn');
	let mainBtn = document.getElementById('mainBtn');

		//계속 쇼핑하기(메인페이지 이동)
		mainBtn.addEventListener("click", function(e){
			e.preventDefault();
			location.href = getContextPath();
			},false);
    // 삭제
		[].forEach.call(deleteBtn,function(del){
			del.addEventListener("click", function(e){
					e.preventDefault();
					/* console.log('클릭됨'); */
					if (confirm("해당 상품을 장바구니에서 삭제하시겠습니까?")) {
						let tnum = e.target.getAttribute('data-tnum');
						location.href = getContextPath() + "/order/deletecart/" + tnum;
					}
				},false);
			});
		//전체 삭제
		cleanBtn.addEventListener("click", function(e){
			e.preventDefault();
				let cnt = e.target.getAttribute('data-cnt');
			if(cnt == 0) {
/* 				console.log('비어있다'); */
				alert('장바구니가 비어있습니다.');
				}
			if (cnt != 0 && confirm("장바구니를 비우시겠습니까?")) {
				let tid = e.target.getAttribute('data-tid');
				location.href = getContextPath() + "/order/deleteAllcart?tid=" + tid;
				}
			},false);

		orderBtn.addEventListener("click", function(e){
			e.preventDefault();
			let amount = e.target.getAttribute('data-amount');
			if(amount > 0 && confirm("전체 상품주문을 진행 하시겠습니까?")){
				location.href = getContextPath() +"/order/allOrderWrite";
			}else if(amount == 0){
				alert('장바구니가 비어있습니다.');
			}
			},false);
}
</script>
</head>
<body>
	<div id="containerAll">
		<%@ include file="../include/greenHeader.jsp" %>
		    <div class="content">
        <div class="contents-inner">
            <div class="section c2">
                <div class="section">
                	<div class="title">
<%--                 		<c:forEach items="${cartList}" var=""></c:forEach> --%>
                    <h3 class="notice">장바구니</h3>
                  </div>
                    <div class="present-root">
                        <span class="root" id="one">장바구니</span> <i class="fas fa-angle-double-right fa-lg one"></i> 
                        <span class="root" id="two">주문서 작성/결제</span> <i class="fas fa-angle-double-right fa-lg two"></i> 
                        <span class="root"id="three">식단 선택</span>
                    </div>
                </div>
                <table class="cart-table">
                    <colgroup>
                        <col style="width: 10%;" />
                        <col />
                        <col style="width: 10%;" />
                        <col style="width: 20%;" />
                        <col style="width: 10%;" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th class="cart-th" scope="col" colspan="2">상품명</th>
                            <th class="cart-th" scope="col">수량</th>
                            <th class="cart-th" scope="col">가격</th>
                            <th class="cart-th" scope="col">상태</th>
                        </tr>
                    </thead>
                    <c:forEach var="rec" items="${cartList }">
                    <tbody>
                        <tr class="tr-body">
													<c:if test="${rec.tpnum == 1  }">
                            <td class="td-record"><a href="${pageContext.request.contextPath }/product/greenJs/1"><img src="<c:url value='/resources/img/koreanfood.jpg' />" alt="사진" width="100px" height="90px" ></a></td>
                            <td class="td-record">
                                <div class="product-name"><a href="${pageContext.request.contextPath }/product/greenJs/1">${rec.pname }</a> <br>
                                <span class="detail-area">${rec.pdetail }</span>
                                </div>
                            </td>
                           </c:if>
                           <c:if test="${rec.tpnum == 2  }">
                            <td class="td-record"><a href="${pageContext.request.contextPath }/product/greenRice/4"><img src="<c:url value='/resources/img/rice.jpg' />" alt="사진" width="100px" height="90px" ></a></td>
                            <td class="td-record">
                                <div class="product-name"><a href="${pageContext.request.contextPath }/product/greenRice/4">${rec.pname }</a> <br>
                                <span class="detail-area">${rec.pdetail }</span>
                                </div>
                            </td>
                           </c:if>
                           <c:if test="${rec.tpnum == 3  }">
                            <td class="td-record"><a href="${pageContext.request.contextPath }/product/greenSP/7"><img src="<c:url value='/resources/img/greenspecial.jpg' />" alt="사진" width="100px" height="90px" ></a></td>
                            <td class="td-record">
                                <div class="product-name"><a href="${pageContext.request.contextPath }/product/greenSP/7">${rec.pname }</a> <br>
                                <span class="detail-area">${rec.pdetail }</span>
                                </div>
                            </td>
                           </c:if>
                           <c:if test="${rec.tpnum == 4  }">
                            <td class="td-record"><a href="${pageContext.request.contextPath }/product/greenDiet/10"><img src="<c:url value='/resources/img/diet.jpg' />" alt="사진" width="100px" height="90px" ></a></td>
                            <td class="td-record">
                                <div class="product-name"><a href="${pageContext.request.contextPath }/product/greenDiet/10">${rec.pname }</a> <br>
                                <span class="detail-area">${rec.pdetail }</span>
                                </div>
                            </td>
                           </c:if>
                            <td class="td-record">${rec.amount }</td>
                            <td class="td-record"><span class="cart-price">${rec.price }</span>원</td>
                            <td class="td-record"><button class="deleteBtn" data-tnum="${rec.tnum }">삭제</button></td>
                        </tr>
                    </tbody>
                    </c:forEach>
	                        <c:if test="${cartCnt == 0 }">
		                     	  <tbody>
			                        <tr class="tr-body">
			                            <td class="td-record" colspan="5">장바구니가 비었습니다.</td>
			                        </tr>
		                        </tbody>
	                        </c:if>
                </table>
                <div class="price-area">
                    <p style="font-size: 14px;">그린푸드의 모든 상품은 <strong style="color: orangered;">* 무료배송</strong> 입니다.</p>
                     <table class="price-table">
                        <colgroup>
                            <col style="width: 35%;" />
                            <col style="width: 35%;" />
                        </colgroup>
                        <c:if test="${cartCnt != 0 }">
                        <tbody>
                            <tr class="price-tr">	
                                <th class="price-th">총 결제 금액</th>
                                <td class="price-td"><span class="all-price">${sumPrice }</span>원</td>
                            </tr>
                        </tbody>
                        </c:if>
                    </table>
                </div>
                <div class="btn-area">
                    <div class="btn-area1">
                    	
                        <button id="cleanBtn" data-tid="${tid }" data-cnt="${cartCnt }">장바구니 비우기 </button>
                    </div>
                    <div class="btn-area2">
                        <button id="mainBtn">계속 쇼핑하기</button>
                        <button id="orderBtn" data-amount="${cartCnt }">전체상품 주문하기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
		<%@ include file="../include/greenFooter.jsp" %>		
	</div>	
</body>
</html>