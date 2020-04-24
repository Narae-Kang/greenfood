<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<!-- 구글폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-1/css/all.min.css" />  

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/memberOut.css' />">
<script src="<c:url value='/resources/js/memberOut.js' />"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/greenMain.css' />">
</head>
<body>
<%@ include file="../include/greenHeader.jsp"%>

<h2 class="outH2">회원탈퇴</h2>
<form id="memberOUT" action="<c:url value='/member/out' />" method="post">
<table>
<tr>
    <td class="col id">아이디</td>
    <td class="row id">
        <input type="text" name="id" id="id"  value="${sessionScope.member.id }" readonly> 
    </td>
</tr>
<tr>
	<td></td>
	<td colspan="2" id="idMsg" class="errmsg"></td>
</tr>
<tr>
    <td class="col pw">비밀번호</td>
    <td class="row pw">
        <input type="password" placeholder="비밀번호를 입력해주세요" id="pw" name="pw">
    </td>
</tr>
<tr>
	<td></td>
	<td colspan="" id="pwMsg" class="errmsg">
	<c:if test="${!empty svr_msg}">${svr_msg }</c:if></td>
</tr>

<tr>
    <td colspan="2">
        <button id="memberOutBtn">회원탈퇴</button>
    </td>
</tr>
<tr>
    <td colspan="2">
       <a href="${pageContext.request.contextPath }" id="outCancelBtn">취소</a>
    </td>
</tr>
</table>
</form>
<%@ include file="../include/greenFooter.jsp"%>
</body>

</html>