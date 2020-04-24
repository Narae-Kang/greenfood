<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식단 수정</title>
<script src="<c:url value="/resources/js/common.js"/>"></script>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/greenMain.css"/>" />
<style>
.m2 {
	margin-top: 80px;
}

#ja, #area {
	width: 100%;
	box-sizing: border-box;
}

#area {
	resize: none;
}

.textfield {
	line-height: 24px;
}

.textfield input {
	width: 100%;
	min-height : 30px: 
}
.contents-inner {
	margin: 0 auto;
	max-width: 600px;
}

* {
	margin: 0;
	padding: 0;
}

div {
	display: block;
}

table {
	border-collapse: collapse;
	width: 100%;
}

.tailfield {
	display: flex;
	justify-content: flex-end;
	margin-top: 16px;
}

.tail {
	margin-right: 5px;
	width: 100px;
	height: 42px;
	line-height: 40px;
	font-size: 11px;
}

#writeBtn {
	background: #BCE074;
	border: 1px solid rgba(0, 0, 0, 0.212);
	color: #fff;
}

#cancelBtn {
	background: #dbdbdb;
	border: 1px solid #dbdbdb;
	color: #222;
}

#listBtn {
	background: white;
	border: 1px solid #dbdbdb;
	color: #222;
}

#writeBtn:hover, #cancelBtn:hover {
	opacity: 0.6;
	transition: .3s;
}

#listBtn:hover {
	border: 1px solid #222;
	transition: .3s;
}

.title {
	color: #333;
	margin: 0 0 20px;
	padding: 20px 0 20px;
	text-align: center;
}

.ta {
	vertical-align: middle;
}

.write {
	display: inline-block;
	padding: 7px 14px;
	border-bottom: 1px solid #666;
	font-size: 15px;
}

th {
	padding: 10px;
	color: #777;
	background-color: #f9f9f9;
	border-bottom: 1px solid #dbdbdb;
	font-size: 15px;
}

td {
	padding: 10px;
	border-bottom: 1px solid #dbdbdb;
}

table, th, td {
	border-spacing: 0;
}

.cate {
	border-top: 1px solid #dbdbdb;
}

#cate1 {
	border-top: 1px solid #dbdbdb;
}

.errmsg {
	color: red;
	font-Size: 0.7em;
}
</style>
<script>
window.addEventListener("load", init, false);
function init() {

	//등록버튼 클릭시
	writeBtn.addEventListener("click", function(e) {
		e.preventDefault();
		console.log('수정 버튼 클릭');
		//유효성 체크 없이
			if(confirm('수정 하시겠습니까?')) {
			document.getElementById("menuVO").submit();
			}
		//유효성체크
/* 		if(checkValid()){
			confirm('등록 하시겠습니까?');
			document.getElementById("menuVO").submit();
		}*/
	}, false);   
	
	//취소버튼 클릭시	
	 cancelBtn.addEventListener("click", function(e) {
		e.preventDefault();
		console.log("취소버튼 클릭");
		document.getElementById("menuVO").reset();
	}, false); 
		
	//목록버튼 클릭시
	 listBtn.addEventListener("click", function(e) {
			e.preventDefault();
			let returnPage = e.target.getAttribute('data-returnPage');
			location.href = getContextPath() + "/admin/adminMenuList/"+returnPage;
		}, false);
}	/* init 끝 */

function checkValid() {
	var mdateEle = document.getElementById('mdate');
	var menuEle = document.getElementById('menu');
	var maindishEle = document.getElementById('maindish');
	var calEle = document.getElementById('cal');


	var flag = true;

	//일자
/*  	if(!isText(mdateEle.value)) {
		mdate_errmsg.innerHTML = "필수 입력사항입니다."
		flag = flag && false;
		} else {
			mdate_errmsg.innerHTML = "";
			}  */
	//상품명
/*  	if(!isText(menuEle.value)) {
		menu_errmsg.innerHTML = "필수 입력사항입니다."
		flag = flag && false;
		} else {
			menu_errmsg.innerHTML = "";
			}
	//식단명
	if(!isText(maindishEle.value)) {
		maindish_errmsg.innerHTML = "필수 입력사항입니다."
		flag = flag && false;
		} else {
			maindish_errmsg.innerHTML = "";
			}
	if(!isText(calEle.value)) {
		cal_errmsg.innerHTML = "필수 입력사항입니다."
		flag = flag && false;
		} else {
			cal_errmsg.innerHTML = "";
			} */
} 

function isText(asValue) {
	var regExp = /^.{1,50}$/;     //모든 글자 1글자이상 50글자 이하
	return regExp.test(asValue);
}

</script>

</head>
<body>
	<div id="containerAll">
		<%@ include file="../include/greenHeader.jsp" %>
	<div class="content">
		<div class="contents-inner">
			<div class="section m2">
				<div class="section">
					<div class="title">
						<h2 class="write">식단 수정</h2>
					</div>
				</div>
				<form:form action="${pageContext.request.contextPath }/admin/adminMenuModify/${returnPage }"
					method="post" modelAttribute="menuVO">
					<form:hidden path="mnum" />
					<div class="section-body">
						<div class="table1 board-write">
							<table>
								<colgroup>
									<col style="width: 133px;">
								</colgroup>
								<tbody>
									
 									<tr>
										<th class="ta"><form:label path="mdate">date</form:label></th>
										<td>
											<div class="textfield">
												<form:input type="date" id="mdate" path="mdate" value="${menuVO.mdate }" />
												<div>
													<span class="errmsg" id="mdate_errmsg"></span>
													<%-- <form:errors cssClass="errmsg" path="mdate" /> --%>
												</div>
											</div>
										</td>
									</tr>
									
 									<tr>
										<th class="ta"><form:label path="menu">menu</form:label></th>
										<td>
											<div class="textfield">
												<form:input type="text" id="menu" path="menu" value="${menuVO.menu }" />
												<div>
													<span class="errmsg" id="menu_errmsg"></span>
													<form:errors cssClass="errmsg" path="menu" />
												</div>
											</div>
										</td>
									</tr>
									
 									<tr>
										<th class="ta"><form:label path="cal">cal</form:label></th>
										<td>
											<div class="textfield">
												<form:input type="text" id="cal" path="cal" value="${menuVO.cal }" />
												<div>
													<span class="errmsg" id="cal_errmsg"></span>
													<form:errors cssClass="errmsg" path="cal" />
												</div>
											</div>
										</td>
									</tr>
																		
 									<tr>
										<th class="ta"><form:label path="maindish">maindish</form:label></th>
										<td>
											<div class="textfield">
												<form:input type="text" id="maindish" path="maindish" value="${menuVO.maindish }" />
												<div>
													<span class="errmsg" id="maindish_errmsg"></span>
													<form:errors cssClass="errmsg" path="maindish" />
												</div>
											</div>
										</td>
									</tr>
									
 									<tr>
										<th class="ta"><form:label path="rice">rice</form:label></th>
										<td>
											<div class="textfield">
												<form:input type="text" id="rice" path="rice" value="${menuVO.rice }" />
												<div>
													<span class="errmsg" id="title_errmsg"></span>
													<form:errors cssClass="errmsg" path="rice" />
												</div>
											</div>
										</td>
									</tr>
									
 									<tr>
										<th class="ta"><form:label path="side1">side1</form:label></th>
										<td>
											<div class="textfield">
												<form:input type="text" id="side1" path="side1" value="${menuVO.side1 }" />
												<div>
													<span class="errmsg" id="title_errmsg"></span>
													<form:errors cssClass="errmsg" path="side1" />
												</div>
											</div>
										</td>
									</tr>
									
 									<tr>
										<th class="ta"><form:label path="side2">side2</form:label></th>
										<td>
											<div class="textfield">
												<form:input type="text" id="side2" path="side2" value="${menuVO.side2 }" />
												<div>
													<span class="errmsg" id="title_errmsg"></span>
													<form:errors cssClass="errmsg" path="side2" />
												</div>
											</div>
										</td>
									</tr>
									
 									<tr>
										<th class="ta"><form:label path="side3">side3</form:label></th>
										<td>
											<div class="textfield">
												<form:input type="text" id="side3" path="side3" value="${menuVO.side3 }" />
												<div>
													<span class="errmsg" id="title_errmsg"></span>
													<form:errors cssClass="errmsg" path="side3" />
												</div>
											</div>
										</td>
									</tr>
									
 									<tr>
										<th class="ta"><form:label path="side_side">side_side</form:label></th>
										<td>
											<div class="textfield">
												<form:input type="text" id="side_side" path="side_side" value="${menuVO.side_side }" />
												<div>
													<span class="errmsg" id="title_errmsg"></span>
													<form:errors cssClass="errmsg" path="side_side" />
												</div>
											</div>
										</td>
									</tr>
									
 									<tr>
										<th class="ta"><form:label path="soup">soup</form:label></th>
										<td>
											<div class="textfield">
												<form:input type="text" id="soup" path="soup" value="${menuVO.soup }" />
												<div>
													<span class="errmsg" id="soup_errmsg"></span>
													<form:errors cssClass="errmsg" path="soup" />
												</div>
											</div>
										</td>
									</tr>
									
 									<tr>
										<th class="ta"><form:label path="salad">salad</form:label></th>
										<td>
											<div class="textfield">
												<form:input type="text" id="salad" path="salad" value="${menuVO.salad }" />
												<div>
													<span class="errmsg" id="title_errmsg"></span>
													<form:errors cssClass="errmsg" path="salad" />
												</div>
											</div>
										</td>
									</tr>

								</tbody>
							</table>
						</div>
					</div>
					
					<div class="textfield">
						<div class="tailfield">
							<button type="submit" class="tail" id="writeBtn" data-returnPage="${returnPage }" data-mnum="${menuVO.mnum }">수정</button>
							<form:button class="tail" id="cancelBtn" data-returnPage="${returnPage }">취소</form:button>
							<form:button class="tail" id="listBtn" data-returnPage="${returnPage }">목록</form:button>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
					<%@ include file="../include/greenFooter.jsp" %>		
	</div>
</body>
</html>