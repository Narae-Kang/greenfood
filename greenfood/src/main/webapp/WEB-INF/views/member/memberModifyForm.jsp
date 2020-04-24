<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원수정</title>
<!-- 구글폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-1/css/all.min.css" />  

<link rel="stylesheet" href="<c:url value='/resources/css/greenMain.css' />">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet"
	href="<c:url value='/resources/css/memberModify.css' />">
	<script src="<c:url value='/resources/js/memberModify.js' />"></script>

</head>
<body>
<%@ include file="../include/greenHeader.jsp"%>

<form:form id="modifyFrm" method="post" modelAttribute="mvo"
					 action="${pageContext.request.contextPath }/member/modify">
    <h1>그린푸드 회원수정</h1>
<div class="container1">
	<div class="container2">
	<table>
		<tr>
		    <td class="col"><form:label path="id">아이디</form:label></td>
		    <td class="row">
		        <form:input type="text" class="id" path="id" readonly="true" />     
		    </td>
		</tr>
		<tr>
			<td></td>
			<td></td>
		</tr>
		<tr>
		    <td class="col"><form:label path="pw">비밀번호</form:label></td>
		    <td class="row">
		        <form:input type="password" path="pw" placeholder="비밀번호를 입력해주세요" />
		    </td>
		</tr>
		<tr>
			<td></td>
			<td colspan="2" class="errmsg" id="pw_errmsg"></td>
		</tr>
		<tr>
		    <td class="col"><label for="pwChk">비밀번호 확인</label></td>
		    <td class="row">
		        <input type="password" id="pwChk" placeholder="비밀번호를 다시 한번 입력해주세요" />
		    </td>
		</tr>
		<tr>
			<td></td>
			<td colspan="2" class="errmsg" id="pwChk_errmsg"></td>
		</tr>
		<tr>
		    <td class="col"><form:label path="name">이름</form:label></td>
		    <td class="row">
		        <form:input type="text" path="name" placeholder="이름을 입력해주세요" />
		    </td>
		</tr>
		<tr>
			<td></td>
			<td colspan="2" class="errmsg" id="name_errmsg"></td>
		</tr>
		<tr>
		    <td class="col"><form:label path="birth">생년월일</form:label></td>
		    <td class="row">
		        <form:input type="date" path="birth" />
		    </td>
		</tr>
		<tr>
			<td></td>
			<td colspan="2" class="errmsg" id="birth_errmsg"></td>
		</tr>
		<tr>
		    <td class="col"><form:label path="tel">휴대폰번호</form:label></td>
		    <td class="row">
		        <form:input type="text" path="tel" placeholder="전화번호를 입력해주세요" />
		    </td>
		</tr>
		<tr>
			<td></td>
			<td colspan="2" class="errmsg" id="tel_errmsg"></td>
		</tr>
		<tr class="form-group">
		    <td class="col"><form:label path="address">주소</form:label></td>
		    <td class="row">   
		 			<div class="addressApi">
				      	<div><form:input type="button" path="address" id="addressBtn" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"/></div>
				        <div><form:input type="text" path="address1" id="sample6_postcode" placeholder="우편번호" /></div>
				        <div><form:input type="text" path="address2" id="sample6_address" placeholder="주소"  /></div>
				        <div><form:input type="text" path="address3" id="sample6_detailAddress" placeholder="상세주소"/></div>
				     </div>
		    </td>
		</tr>		
		<tr>
			<td></td>
			<td colspan="2" class="errmsg" id="address_errmsg"></td>
		</tr>		
	</table>
	</div>
</div>
<div class="modifyClickBtn">
<button type="submit" id="modifyBTN">회원수정</button> 
</div>
</form:form>
<div class="modifyOutClickBtn">
<a href="${pageContext.request.contextPath }/member/outForm"><button id="modifyOutBTN">회원탈퇴</button></a>
</div>

<%@ include file="../include/greenFooter.jsp"%>
</body>

</html>