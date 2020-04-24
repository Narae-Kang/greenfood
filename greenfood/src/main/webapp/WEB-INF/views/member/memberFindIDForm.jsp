<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<!-- 구글폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-1/css/all.min.css" />  
<link rel="stylesheet" href="<c:url value='/resources/css/greenMain.css' />">
<link rel="stylesheet"
	href="<c:url value='/resources/css/memberID.css' />">
<script src="<c:url value='/resources/js/memberID.js' />"></script>
</head>
<body>
<%@ include file="../include/greenHeader.jsp"%>


  <h2>아이디 찾기</h2>
<form id="frm">
<table>
<tr>
    <td class="col">전화번호</td>
    <td class="row tel">
        <input type="text" name="tel" id="tel"  placeholder="ID"> 
    </td>
</tr>
<tr>
	<td></td>
	<td colspan="2" class="errmsg" id="telMsg"></td>
</tr>
<tr>
    <td class="col">생년월일</td>
    <td class="row birth">
        <input type="date" placeholder="PW" id="birth" name="birth">
    </td>
</tr>
<tr>
	<td></td>
	<td colspan="2" class="errmsg" id="birthMsg"></td>
</tr>

<tr>
    <td colspan="2" class="findID">
        <input type="text" placeholder="찾은아이디" name="id" id="id" readOnly="readonly" >
    </td>
</tr>
<tr>
    <td colspan="2" class="findIDA">
        <a href="<c:url value='/loginForm' />">로그인</a> <span> | </span> <a href="<c:url value='/member/findPasswordForm' />">비밀번호 찾기</a>
    </td>
</tr>
<tr>
    <td colspan="2">
        <input type="button" id="findIDBtn2" value="아이디찾기">
    </td>
</tr>
</table>
</form>
<%@ include file="../include/greenFooter.jsp"%>
</body>
</html>