<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식단 목록</title>
<script src="<c:url value='/resources/js/root.js' />"></script>
<style>
    /* -----------------------관리자 페이지 이동 박스 */
    #adminMenuBox ul {
    	margin : 0; padding: 0;
    	margin-top : 80px;
    }
    #adminMenuBox ul li {
      width: 100px; height: 40px;
      display: inline-block;
      border: 1px solid #d3d3d3;
      text-align: center;
      margin: 15px 5px 25px 0;
    }
    #adminMenuBox ul li a {
    width: 100px; height:40px;
    padding: 0 10px;
    color: #d3d3d3;
    font-size: 15px;
    font-weight: 400;
    line-height: 40px;
    }
    
/* 페이징+검색 css */
td>a:hover {
	text-decoration: underline;
}
td>a { color : gray;}
.content { min-height: 64vh; }
.contents-inner {
	margin: 0 auto;
	max-width: 800px;
}
.title {
	color: #333;
	height : 50px;
	text-align: center;
}
.notice {
	display: inline-block;
	padding: 7px 14px;
	border-bottom: 1px solid #666;
	font-size: 15px;
}
table { width: 100%; }

table, th, td {
	border-spacing: 0;
	border: 0;
	border-collapse: collapse;
	vertical-align: middle;
}

thead { border-top: 1px solid #dbdbdb; }

th {
	font-size: 12px;
	padding: 10px 0;
	border-bottom: 1px solid #dbdbdb;
	background: #f7f7f7;
}
.tr-body { height: 50px; }

td {
	border-bottom: 1px solid #dbdbdb;
	font-size: 12px;
	color: #444;
}
.ta-c { text-align: center; }
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
	background:
		url("../img/icon_arrow_page_ll.png")
		no-repeat center center;
}

#l {
	background:
		url("../img/icon_arrow_page_l.png")
		no-repeat center center;
}

#r {
	background:
		url("../img/icon_arrow_page_r.png")
		no-repeat center center;
}

#rr {
	background:
		url("../img/icon_arrow_page_rr.png")
		no-repeat center center;
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
window.addEventListener("load", init, false);

function init() {
    changeColor(true);

	//글쓰기 버튼 클릭시
 <c:if test="${sessionScope.member.admin == 1 }"> 
	writeBtn.addEventListener("click",
			function(e) {
				e.preventDefault();
				let returnPage = e.target.getAttribute('data-returnPage');
				location.href = getContextPath() + "/admin/adminMenuWriteForm/"+returnPage;
			}, false);
 </c:if> 
	//검색버튼 클릭시
	searchBtn.addEventListener("click", function(e) {
		e.preventDefault();
		console.log("검색 버튼 클릭");
		// 검색어 입력값이 없으면
		if (keyword.value.trim().length == 0) {
			alert('검색어를 입력하세요!');
			keyword.value = "";
			keyword.focus();
			return false;
		}

		let stype = searchType.value; //검색유형
		let kword = keyword.value.trim(); //검색어

		location.href = getContextPath() + "/admin/adminMenuList"+"/1/" + stype + "/" + kword;
	}, false);
}

//현재 페이지 박스 색상 변경
function changeColor(flag) {
  if(flag) {
    var menuBox = document.getElementById("menuBox");
    var menuBtn = document.getElementById("menuBtn");
    menuBox.style.border="1px solid black";
    menuBtn.style.color="black";
  }
}
</script>
</head>
<body>
	<div id="containerAll">
 		<%@ include file="../include/greenHeader.jsp" %>	
	<div class="content">
		<div class="contents-inner">
					<!-- 페이지 이동 박스 -->    
      <div id="adminMenuBox">
        <ul>
          <li id="orderBox"><a href="<c:url value="/admin/adminMain" />" id="orderBtn">주문 관리</a></li>
          <li id="menuBox"><a href="<c:url value="/admin/adminMenuList" />" id="menuBtn">식단 등록</a></li>
        </ul>
      </div>
			<div class="section m2">
				<div class="section">
					<div class="title">
						<h3 class="notice">식단 목록</h3>
					</div>
				</div>
				<table>
					<div class="btn-area" style="margin-bottom:15px;">
	<%--  				<c:if test="${sessionScope.member.admin == 1 }"> --%>
						<button id="writeBtn" data-returnPage="${pc.rc.reqPage }">
							WRITE</button>
	<%--  				</c:if> --%>
					</div>
					<colgroup>
					  <col style="width: 20%" />
						<col style="width: 20%" />
						<col style="width: 60%" />
					</colgroup>
					<thead>
						<tr>
							<th>DATE</th>
							<th>PRODUCT</th>
							<th>MENU</th>
						</tr>
					</thead>
						<tbody>
					<c:forEach var="rec" items="${menuList }">
						<fmt:formatDate value="${rec.mdate }" pattern="yyyy-MM-dd" var="mdate" />
							<tr class="tr-body">
								<td class="ta-c">${mdate }</td>
								<td class="ta-c">${rec.menu }</td>
								<td class="ta-c"><a href="${pageContext.request.contextPath }/admin/adminMenuView/${pc.rc.reqPage }/${rec.mnum }">${rec.maindish }</td></a>
							</tr>
					</c:forEach>
						<c:if test="${pc.totalRec == 0 }">
							<tr class="tr-body"><td class="ta-c" colspan="6">등록된 식단이 없습니다.</td></tr>
						</c:if>
						</tbody>
				</table>
			</div>
			<ul class="paging">
					<!-- 처음페이지 / 이전페이지 이동 -->
					<c:if test="${pc.prev }">
						<li class="front-paging" id="ll">
							<a class="prev-next" href="${pageContext.request.contextPath }/admin/adminMenuList/1"> 
								<img src="<c:url value='/resources/img/icon_arrow_page_ll.png' />" alt="" />
							</a>
						</li>
						<li class="front-paging" id="l">
							<a class="prev-next" href="${pageContext.request.contextPath }/admin/adminMenuList/${pc.startPage-1}">
								<img src="<c:url value='/resources/img/icon_arrow_page_l.png' />" alt="" />
							</a>
						</li>
					</c:if>

					<c:forEach var="pageNum" begin="${pc.startPage }" end="${pc.endPage }">
						<!-- 현재페이지와 요청페이지가 다르면 -->
						<c:if test="${pc.rc.reqPage != pageNum }">
							<li>
								<a class="paging-number" href="${pageContext.request.contextPath }/admin/adminMenuList/${pageNum }/${pc.fc.searchType}/${pc.fc.keyword}">${pageNum }</a>
							</li>
						</c:if>
						<!-- 현재페이지와 요청페이지가 같으면 -->
						<c:if test="${pc.rc.reqPage == pageNum }">
							<li id="pagingnumber">
								<a class="paging-number" href="${pageContext.request.contextPath }/admin/adminMenuList/${pageNum}/${pc.fc.searchType}/${pc.fc.keyword}">${pageNum }</a>
							</li>
						</c:if>
					</c:forEach>
					<!-- 다음페이지 / 최종페이지 이동 -->
					<c:if test="${pc.next }">
						<li class="front-paging" id="r">
							<a class="prev-next" href="${pageContext.request.contextPath }/admin/adminMenuList/${pc.endPage+1}">
								<img src="<c:url value='/resources/img/icon_arrow_page_r.png' />" alt="" />
							</a>
						</li>
						<li class="front-paging" id="rr">
							<a class="prev-next" href="${pageContext.request.contextPath }/admin/adminMenuList/${pc.finalEndPage}">
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
								<c:out value="${pc.fc.searchType == 'B' ? 'selected':'' }"/>>date</option>
							<option value="C"
								<c:out value="${pc.fc.searchType == 'C' ? 'selected':'' }"/>>menu</option>
							<option value="D"
								<c:out value="${pc.fc.searchType == 'D' ? 'selected':'' }"/>>maindish</option>
							<option value="E"
								<c:out value="${pc.fc.searchType == 'E' ? 'selected':'' }"/>>rice</option>
							<option value="F"
								<c:out value="${pc.fc.searchType == 'F' ? 'selected':'' }"/>>side1</option>
							<option value="G"
								<c:out value="${pc.fc.searchType == 'G' ? 'selected':'' }"/>>side2</option>
							<option value="H"
								<c:out value="${pc.fc.searchType == 'H' ? 'selected':'' }"/>>side3</option>
							<option value="I"
								<c:out value="${pc.fc.searchType == 'I' ? 'selected':'' }"/>>side_side</option>
							<option value="J"
								<c:out value="${pc.fc.searchType == 'J' ? 'selected':'' }"/>>salad</option>
							<option value="K"
								<c:out value="${pc.fc.searchType == 'K' ? 'selected':'' }"/>>soup</option>
						</select>
					</div>
					<div class="search-item">
						<div class="search-item-keyword">
							<input type="search" name="keyword" id="keyword" value="${pc.fc.keyword }" />
						</div>
					</div>
					<div class="search-item">
						<button id=searchBtn>검색</button>
					</div>
				</div>
			</form>
		</div>
	</div>
			<%@ include file="../include/greenFooter.jsp" %>		
	</div>
</body>
</html>