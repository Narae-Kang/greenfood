<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<!-- 구글폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-1/css/all.min.css" />  

<link rel="stylesheet" href="<c:url value='/resources/css/greenMain.css' />">
<link rel="stylesheet"
	href="<c:url value='/resources/css/memberPW.css' />">
<script src="<c:url value='/resources/js/memberPW.js' />"></script>
</head>
<body>
<%@ include file="../include/greenHeader.jsp"%>
<h1>임시 비밀번호 찾기</h1>
<form id="findpw"  method="post" action="${pageContext.request.contextPath }/member/findPassword">

<table>
<tr>
    <td class="row tel">
        <input type="text" name="id" id="id"  placeholder="아이디를 입력해주세요"> 
    </td>
</tr>
<tr>
	<td colspan="2" id="idMsg" class="errmsg"></td>
</tr>
<tr>   
    <td class="row name">
        <input type="text" name="name" id="name" placeholder="이름을 입력해주세요" > 
    </td>
</tr>
<tr>
	<td colspan="2" id="nameMsg" class="errmsg"></td>
</tr>
<tr>
	<td colspan="2">
	<input type="submit"id="findPWBtn" value="메일 전송">
	</td>
</tr>
</table>

</form>
<%@ include file="../include/greenFooter.jsp"%>
</body>
</html>