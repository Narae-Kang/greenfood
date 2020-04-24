<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>로그인</title>
<!-- 구글폰트 -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-1/css/all.min.css" />

<link rel="stylesheet" href="<c:url value='/resources/css/greenMain.css' />">
<link rel="stylesheet" href="<c:url value='/resources/css/memberLogin.css' />">
<script src="<c:url value='/resources/js/memberLogin.js' />"></script>
</head>
<body>
	<%@ include file="../include/greenHeader.jsp"%>

	<h2>그린푸드 로그인</h2>
	<form id="login" method="post" action="<c:url value='/login?reqURI=${reqURI }' />">
	 	<input type="hidden" name="backPage" value="${reqURI }" />
		<table>
			<tr>
				<td class="row id" colspan="2"><input type="text"
					placeholder="아이디를 입력해주세요" id="id" name="id"></td>
			</tr>

			<tr>
				<td colspan="2" id="idMsg" class="errmsg"></td>
			</tr>

			<tr>
				<td class="row pw" colspan="2"><input type="password"
					placeholder="비밀번호를 입력해주세요" id="pw" name="pw"></td>
			</tr>
			<tr>
				<td colspan="2" id="pwMsg" class="errmsg"><c:if
						test="${!empty svr_msg}">${svr_msg }</c:if></td>
			</tr>

			<tr>
				<td colspan="2" class="loginA"><a
					href="<c:url value='/member/findIDForm' />">아이디 찾기</a> <span>|</span>
					<a href="<c:url value='/member/findPasswordForm' />">비밀번호 찾기</a></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" name="loginBtn"
					id="loginBtn" value="로그인"></td>
			</tr>
			<tr>
				<td colspan="2"><a href="<c:url value='/member/joinForm' />"><input
						id="joinBtn" value="회원가입"></a></td>
			</tr>
		</table>
	</form>

	<%@ include file="../include/greenFooter.jsp"%>
</body>
</html>