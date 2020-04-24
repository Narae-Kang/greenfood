<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 주문 관리</title>
<script src="<c:url value='/resources/js/common.js' />"></script>
<style>
#adminContainer {
	width: 100%;
	display: flex;
	justify-content: center;
	min-height: 64vh;
	margin-top: 100px;
}

#adminWrapper {
	width: 1200px;
}
/* -----------------------관리자 페이지 이동 박스 */
#adminMenuBox ul {
	margin: 0;
	padding: 0;
}

#adminMenuBox ul li {
	width: 100px;
	height: 40px;
	display: inline-block;
	border: 1px solid #d3d3d3;
	text-align: center;
	margin: 15px 5px 25px 0;
}

#adminMenuBox ul li a {
	width: 100px;
	height: 40px;
	padding: 0 10px;
	color: #d3d3d3;
	font-size: 15px;
	font-weight: 400;
	line-height: 40px;
}

/* ----------------------- 주문관리 */
#adminOrderList table {
	width: 100%;
	height: 20px;
	vertical-align: middle;
}

#saveBtn {
	float: right;
	padding: 5px 10px;
	margin-bottom: 10px;
	background-color: #BCE074;
	font-weight: bold;
}

#adminWrapper th, #adminWrapper td {
	border: 1px solid gray;
	text-align: center;
	vertical-align: middle;
	padding: 8px 1px;
	height: 20px;
}

#adminWrapper th {
	background-color: #BCE074;
	font-weight: bold;
	border: 1px solid gray;
}

#adminWrapper td {
	font-size: 13px;
}

/* 페이징+검색 css */
td>a:hover {
	text-decoration: underline;
}

td>a {
	color: gray;
}

.content {
	min-height: 64vh;
}

.contents-inner {
	margin: 0 auto;
	max-width: 800px;
}

.title {
	color: #333;
	height: 50px;
	text-align: center;
}

.notice {
	display: inline-block;
	padding: 7px 14px;
	border-bottom: 1px solid #666;
	font-size: 15px;
}

table {
	width: 100%;
}

table, th, td {
	border-spacing: 0;
	border: 0;
	border-collapse: collapse;
	vertical-align: middle;
}

thead {
	border-top: 1px solid #dbdbdb;
}

th {
	font-size: 12px;
	padding: 10px 0;
	border-bottom: 1px solid #dbdbdb;
	background: #f7f7f7;
}

.tr-body {
	height: 50px;
}

td {
	border-bottom: 1px solid #dbdbdb;
	font-size: 12px;
	color: #444;
}

.ta-c {
	text-align: center;
}

tbody {
	display: table-row-group;
	vertical-align: middle;
	border-color: inherit;
}

colgroup {
	display: table-column-group;
}

col {
	display: table-column;
}

.btn-area {
	display: flex;
	justify-content: flex-end;
}

#writeBtn {
	margin-top: 12px;
	width: 100px;
	height: 42px;
	line-height: 40px;
	font-size: 11px;
	background: #BCE074;
	border: 1px solid rgba(0, 0, 0, 0.212);
	color: #fff;
}

#writeBtn:hover, #searchBtn:hover {
	background: white;
	color: #222;
	transition: 0.3s;
}

nav {
	display: block;
}

.paging {
	padding: 12px 0 0;
	margin: 0;
	text-align: center;
}

.paging li {
	display: inline-block;
	margin: 0 2px;
}

.paging li a {
	height: 21px;
	text-align: center;
	display: block;
}

.front-paging {
	width: 27px;
	border: 1px solid #e0e0e0;
}

#ll {
	background: url("../img/icon_arrow_page_ll.png") no-repeat center center;
}

#l {
	background: url("../img/icon_arrow_page_l.png") no-repeat center center;
}

#r {
	background: url("../img/icon_arrow_page_r.png") no-repeat center center;
}

#rr {
	background: url("../img/icon_arrow_page_rr.png") no-repeat center center;
}

.paging-number {
	padding: 4px 10px 2px;
	font-size: 12px;
}

.search-area {
	padding: 10px;
	border: 1px solid #e8e8e8;
	border-left: 0;
	border-right: 0;
	background: #f7f7f7;
	margin-top: 12px !important;
	text-align: center;
}

.search-item {
	display: inline-block;
	background: #fff;
	vertical-align: middle;
}

#searchType {
	height: 28px;
	border: 1px solid #d0d0d0;
	font-size: 11px;
}

.search-item-keyword {
	width: 210px;
	height: 26px;
	border: 1px solid #d0d0d0;
}

#keyword {
	width: 100%;
	height: 24px;
	padding: 0;
	border: 1px solid #fff;
	color: #979797;
	line-height: 24px;
	font-size: 11px;
}

#searchBtn {
	width: 50px;
	height: 28px;
	line-height: 26px;
	font-size: 11px;
	background: #BCE074;
	border: 1px solid rgba(0, 0, 0, 0.212);
	color: #fff;
}

#pagingnumber {
	border: 1px solid #3e3d3c;
}

.prev-next {
	padding: 0 0 6px;
}

/* 페이징+검색 css 끝 */

</style>
<script>
window.addEventListener("load", init3, false);

function init3() {
  //박스 색상 변경
  changeColor(true);
  let stateTags = document.getElementsByClassName('state');

  
  Array.from(stateTags,function(element){
	  element.addEventListener("change", function(e){
    	  changeState(e.target);
	  }, false);
  });


	//검색버튼 클릭시
	searchBtn.addEventListener("click", function(e) {
		e.preventDefault();
		console.log("검색 버튼 클릭");
		// 검색어 입력값이 없으면 ======>> 주문 관리에서는 없어도 검색이 되야 하는데..ㅠ
		if (keyword.value.trim().length == 0) {
			alert('검색어를 입력하세요!');
			keyword.value = "";
			keyword.focus();
			return false;
		} 

		let stype = searchType.value; //검색유형
		let kword = keyword.value.trim(); //검색어

		location.href = getContextPath() + "/admin/adminMain"+"/1/" + stype + "/" + kword;
	}, false);
  //state.addEventListener("change", changeState, false);
  //상태 변경 저장
/*        saveBtn.addEventListener("click", function(e){
    e.preventDefault();
    alert("변경사항을 저장 하시겠습니까?")
    document.getElementById("saveBtn").submit(); 
  },false); */
	
}

	//상태 변경시 ajax 저장
/*      function stateModify() {
		var mstate = document.getElementById("state").value; */

		/*		}  */
	
	//AJAX CALL
		function changeState(element) {
		var xhttp = new XMLHttpRequest();
		xhttp.addEventListener("readystatechange", ajaxCall, false);

		function ajaxCall() {
			if (this.readyState == 4 && this.status == 200) {
				console.log("this.responseText:"+this.responseText);
				var jsonObj = JSON.parse(this.responseText)
				if(jsonObj.success) {
					console.log('성공..');
				} else {
					console.log('실패ㅠㅠ');
				}
			}
		}
		var sendData = {};
		let stateTag = element;
		//주문상태
		sendData.state = stateTag.value;
		sendData.id = stateTag.parentElement.previousElementSibling.previousElementSibling
													 .previousElementSibling.previousElementSibling.textContent;			
		//주문번호
		sendData.rnum = stateTag.parentElement.previousElementSibling.previousElementSibling
													.previousElementSibling.previousElementSibling.previousElementSibling
													.previousElementSibling.previousElementSibling.textContent;
		var result = JSON.stringify(sendData);
		console.log("result:"+result);
		xhttp.open("POST", "http://localhost:9080/greenfood/admin/adminModify", true);
	  xhttp.setRequestHeader("Content-Type","application/json; charset=utf-8"); 
	  xhttp.send(result);		


	  
	} 	

		
//현재 페이지 박스 색상 변경
function changeColor(flag) {
  if(flag) {
    var orderBox = document.getElementById("orderBox");
    var orderBtn = document.getElementById("orderBtn");
    orderBox.style.border="1px solid black";
    orderBtn.style.color="black";
  }
}

</script>

</head>
<body>
	<%@ include file="../include/greenHeader.jsp"%>

	<div id="adminContainer">
		<div id="adminWrapper">
			<!-- 페이지 이동 박스 -->
			<div id="adminMenuBox">
				<ul>
					<li id="orderBox"><a href="<c:url value="/admin/adminMain" />" id="orderBtn">주문 관리</a></li>
					<li id="menuBox"><a href="<c:url value="/admin/adminMenuList" />" id="menuBtn">식단 등록</a></li>
				</ul>
			</div>

			<form:form id="adminOrderFrm" modelAttribute="mvo"
				action="${pageContext.request.contextPath }/admin/adminMain"
				method="post">
				<div id="adminOrderList">
					<table>
						<colgroup>
							<col width="8%">
							<col width="10%">
							<col width="15%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="27%">
							<col width="10%">
						</colgroup>
						<thead>
							<tr>
								<th>주문번호</th>
								<th>주문일</th>
								<th>상품명</th>
								<th>아이디</th>
								<th>이름</th>
								<th>전화번호</th>
								<th>주소</th>
								<th>주문상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="member" items="${memberList }">
								<tr>
									<c:choose>
										<c:when test="${member.rnum  == 0}">
											<td></td>
										</c:when>
										<c:otherwise>
											<td>${member.rnum }</td>
										</c:otherwise>
									</c:choose>
									<td>${member.rcdate }</td>
									<td>${member.pname }</td>
									<td>${member.id }</td>
									<td>${member.name }</td>
									<td>${member.tel }</td>
									<td>${member.address }</td>
									<td><form:select path="state" class="state">
											<form:option value="0">주문전</form:option>
												<c:forEach items="${orderState}" var="state">
													<option value="${state.code}" name="${state.label}" ${(member.state != state.label)?'':'selected'}>
														${state.label}
													</option>
												</c:forEach>
										</form:select>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- adminOrderList 끝 -->
				      </form:form> 
				<ul class="paging">
					<!-- 처음페이지 / 이전페이지 이동 -->
					<c:if test="${pc.prev }">
						<li class="front-paging" id="ll"><a class="prev-next" href="${pageContext.request.contextPath }/admin/adminMain/1">
								<img src="<c:url value='/resources/img/icon_arrow_page_ll.png' />" alt="" />
						</a></li>
						<li class="front-paging" id="l"><a class="prev-next" href="${pageContext.request.contextPath }/admin/adminMain/${pc.startPage-1}">
								<img src="<c:url value='/resources/img/icon_arrow_page_l.png' />" alt="" />
						</a></li>
					</c:if>

					<c:forEach var="pageNum" begin="${pc.startPage }"
						end="${pc.endPage }">
						<!-- 현재페이지와 요청페이지가 다르면 -->
						<c:if test="${pc.rc.reqPage != pageNum }">
							<li>
								<a class="paging-number" href="${pageContext.request.contextPath }/admin/adminMain/${pageNum }/${pc.fc.searchType}/${pc.fc.keyword}">${pageNum }</a>
							</li>
						</c:if>
						<!-- 현재페이지와 요청페이지가 같으면 -->
						<c:if test="${pc.rc.reqPage == pageNum }">
							<li id="pagingnumber">
								<a class="paging-number" href="${pageContext.request.contextPath }/admin/adminMain/${pageNum}/${pc.fc.searchType}/${pc.fc.keyword}">${pageNum }</a>
							</li>
						</c:if>
					</c:forEach>
					<!-- 다음페이지 / 최종페이지 이동 -->
					<c:if test="${pc.next }">
						<li class="front-paging" id="r">
							<a class="prev-next" href="${pageContext.request.contextPath }/admin/adminMain/${pc.endPage+1}"> </a>
						</li>
						<li class="front-paging" id="rr">
							<a class="prev-next" href="${pageContext.request.contextPath }/admin/adminMain/${pc.finalEndPage}">
								<img src="<c:url value='/resources/img/icon_arrow_page_rr.png' />" alt="" />
							</a>
						</li>
					</c:if>
				</ul>
				<form>
					<div class="search-area">
						<div class="search-item">
							<select name="searchType" id="searchType">
								<option value="A"
									<c:out value="${pc.fc.searchType == 'A' ? 'selected':'' }"/>>전체</option>
								<option value="B"
									<c:out value="${pc.fc.searchType == 'B' ? 'selected':'' }"/>>주문번호</option>
								<option value="C"
									<c:out value="${pc.fc.searchType == 'C' ? 'selected':'' }"/>>주문일</option>
								<option value="D"
									<c:out value="${pc.fc.searchType == 'D' ? 'selected':'' }"/>>상품명</option>
								<option value="E"
									<c:out value="${pc.fc.searchType == 'E' ? 'selected':'' }"/>>아이디</option>
								<option value="F"
									<c:out value="${pc.fc.searchType == 'F' ? 'selected':'' }"/>>이름</option>
								<option value="G"
									<c:out value="${pc.fc.searchType == 'G' ? 'selected':'' }"/>>전화번호</option>
								<option value="H"
									<c:out value="${pc.fc.searchType == 'H' ? 'selected':'' }"/>>주소</option>
								<option value="I"
									<c:out value="${pc.fc.searchType == 'I' ? 'selected':'' }"/>>주문상태</option>
							</select>
						</div>
						<div class="search-item">
							<div class="search-item-keyword">
								<input type="search" name="keyword" id="keyword"
									value="${pc.fc.keyword }" />
							</div>
						</div>
						<div class="search-item">
							<button id=searchBtn>검색</button>
						</div>
					</div>
				</form>
<%-- 			</form:form> --%>




		</div>
		<!--adminWrapper끝-->
	</div>
	<!--adminContainer 끝-->

	<%@ include file="../include/greenFooter.jsp"%>
</body>
</html>