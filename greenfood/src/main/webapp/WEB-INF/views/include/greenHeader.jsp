<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 외부 css 링크 -->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/greenMain.css"/>">

<!-- 제이쿼리 구글 CDN -->
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<!-- 메인화면 제이쿼리 -->
<script
	src="<c:url value="/resources/js/vendor/modernizr.custom.min.js"/>"></script>
<script src="<c:url value="/resources/js/vendor/jquery-1.10.2.min.js"/>"></script>
<script
	src="<c:url value="/resources/js/vendor/jquery-ui-1.10.3.custom.min.js"/>"></script>
<script src="<c:url value="/resources/js/greenMain.js"/>"></script>
<!-- 메인화면 제이쿼리 끝-->

<!-- google font -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap"
	rel="stylesheet">
<!-- font-awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-1/css/all.min.css" />

<header id="header">
	<div id="headerContainerAll">
		<div id="headerContainer">

			<div class="headerItem headerLogo">
				<a href="<c:url value="/" />"><img
					src="<c:url value="/resources/img/logo.png"/>"></a>
			</div>

			<div class="headerItem headerNav">
				<ul>
					<li><a href="${pageContext.request.contextPath }/product/list">맛있는 한끼</a>
						<ul class="sub1">
							<li class="sub1-1"><a href="${pageContext.request.contextPath }/product/greenJs/1">그린 정식</a></li>
							<li class="sub1-2"><a href="${pageContext.request.contextPath }/product/greenRice/4">그린 덮밥</a></li>
							<li class="sub1-3"><a href="${pageContext.request.contextPath }/product/greenSP/7">그린 스페셜</a></li>
							<li class="sub1-4"><a href="${pageContext.request.contextPath }/product/greenDiet/10">그린 다이어트</a></li>
						</ul></li>
					<li><a href="${pageContext.request.contextPath }/">고객 센터</a>
						<ul class="sub2">
							<li class="sub2-3"><a href="<c:url value='/board/list/NOTICE' />">NOTICE</a></li>
							<li class="sub2-1"><a href="<c:url value='/board/list/REVIEW' />">REVIEW</a></li>
							<li class="sub2-2"><a href="<c:url value='/board/list/Q&A' />">Q & A</a></li>
						</ul></li>
				</ul>
			</div>
			<!--headerNav-->
			<div class="headerItem rightMenu">
				<!-- 로그인 전 -->
				<c:if test="${empty member }">
					<div class="memberMenu">
						<div class="join">
							<a href="<c:url value="/member/joinForm" />">JOIN</a>
						</div>
						<div class="login">
							<a href="<c:url value="/loginForm" />">LOGIN</a>
						</div>
					</div>
					<div class="iconMenu">
						<div class="mypage">
							<a href="<c:url value="/order/infoList" />"><i class="fas fa-user-edit fa-2x"></i></a>
						</div>
						<div class="cart">
							<a href="<c:url value="/order/cartlist" />"><i class="fas fa-shopping-cart fa-2x"></i></a>
						</div>
					</div>
				</c:if>
				<!-- 로그인 후 -->
				<c:if test="${!empty member }">
					<div class="memberMenu">
						<c:choose>
							<c:when test="${sessionScope.member.admin > 0 }">
								<!-- 관리자면 관리자페이지로 -->
								<div class="join">
									<a href="<c:url value='/admin/adminMain' />">${sessionScope.member.name }</a>
								</div>
							</c:when>
							<c:otherwise>
								<!-- 회원이면 회원정보 수정 페이지로 -->
								<div class="join">
									<a href="<c:url value="/member/modifyForm/${sessionScope.member.id }" />">${sessionScope.member.name }님</a>
								</div>
							</c:otherwise>
						</c:choose>
						<div class="login">
							<a href="<c:url value="/logout" />">LOGOUT</a>
						</div>
					</div>
					<div class="iconMenu">
						<div class="mypage">
							<a href="<c:url value="/order/infoList" />"><i class="fas fa-user-edit fa-2x"></i></a>
						</div>
						<!-- 나의쇼핑정보주소 -->
              <div class="cart">
              <a href="<c:url value="/order/cartlist" />">
              <i class="fas fa-shopping-cart fa-2x"></i>
              </a><span class="cartCnt-area1">${cartCnt }</span>
              </div> <!-- 카트주소 -->
					</div>
				</c:if>

			</div>

		</div>
		<!--headerWrapper 끝-->
	</div>
	<!--headerContainer 끝-->
</header>

