<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GREEN FOOD</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/greenMain.css"/>" />
<style>

</style>
<link rel="stylesheet" href="<c:url value='/resources/css/BoardList.css' />">
<script src="<c:url value='/resources/js/root.js' />"></script>
<script>
window.addEventListener("load", init, false);

function init() {
	var star = $('.starRev');
    star.each(function(){
      var target = $(this).attr('data-score');
      $(this).find('i:nth-child(-n+' + target + ')').css({color:'#BCE074'});
    });
	//글쓰기 버튼 클릭시
<c:if test="${!empty member && boardName != 'NOTICE' || sessionScope.member.admin == 1 }">
	writeBtn.addEventListener("click",
			function(e) {
				e.preventDefault();
				let returnPage = e.target.getAttribute('data-returnPage');
				let boardName = e.target.getAttribute('data-boardName');
				location.href = getContextPath() + "/board/writeForm/" + boardName + "/" + returnPage;
			}, false);
</c:if>
	//검색버튼 클릭시
	searchBtn.addEventListener("click", function(e) {
		e.preventDefault();
		//console.log("검색!!");
		// 검색어 입력값이 없으면
		if (keyword.value.trim().length == 0) {
			alert('검색어를 입력하세요!');
			keyword.value = "";
			keyword.focus();
			return false;
		}

		let stype = searchType.value; //검색유형
		let kword = keyword.value.trim(); //검색어

		location.href = getContextPath() + "/board/list/"+"${boardName}" +"/1/" + stype + "/"
				+ kword;
	}, false);
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
						<h3 class="notice">${boardName }</h3>
					</div>
				</div>
				<table>
					<colgroup>
					  <col style="width: 10%" />
						<c:if test="${boardName == 'Q&A' }">
						<col style="width: 10%" />
						</c:if>
						<c:if test="${boardName == 'REVIEW' }">
						<col style="width: 15%" />
						</c:if>
						<col />
						<col style="width: 5%" />
						<col style="width: 15%" />
						<col style="width: 5%" />
					</colgroup>
					<thead>
						<tr>
<!-- 							<th>번호</th> -->
							<th>카테고리</th>
							<c:if test="${boardName == 'REVIEW' }">
							<th>평점</th>
							</c:if>
							<c:if test="${boardName == 'Q&A' }">
							<th>문의내용</th>
							</c:if>
							<th>제목</th>
							<th>아이디</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
						<tbody>
					<c:forEach var="rec" items="${list }">
						<fmt:formatDate value="${rec.bcdate }" pattern="yyyy-MM-dd HH:mm"
							var="cdate" />
							<tr class="tr-body">
								<td class="ta-c">${rec.boardCategoryVO.cname } </td>								
								<c:if test="${rec.boardCategoryVO.cname == 'Q&A' }">
								<td class="ta-c">
								${rec.boardCategoryVO.cname2 }
								</td>
								</c:if>
								
								<c:if test="${rec.boardCategoryVO.cname == 'REVIEW' }">
								<td class="ta-c">
								  <div class="starRev" data-score="${rec.grade }">
								    <i class="fas fa-star fa-lg" style="color:gray;"></i>
								    <i class="fas fa-star fa-lg" style="color:gray;"></i>
								    <i class="fas fa-star fa-lg" style="color:gray;"></i>
								    <i class="fas fa-star fa-lg" style="color:gray;"></i>
								    <i class="fas fa-star fa-lg" style="color:gray;"></i>
								  </div>
								  <div>
								  <b style="vertical-align: middle;">${rec.grade } / 5</b>
								  </div>
								</td>
								</c:if>
													
													
								<td><c:forEach begin="1" end="${rec.bindent }">&nbsp;&nbsp;</c:forEach>
									<c:if test="${rec.bindent > 0 }">
										<i class="fas fa-reply"></i>
									</c:if> 
										<a href="${pageContext.request.contextPath }/board/view/${pc.rc.reqPage }/${rec.bnum }"> ${rec.btitle } </a>
 									<c:if test="${rec.hasPicture eq 1}"><i class="fas fa-paperclip"></i></c:if>
								</td>
								<td class="ta-c">${rec.bname }</td>
								<td class="ta-c">${cdate }</td>
								<td class="ta-c">${rec.bhit }</td>
							</tr>
					</c:forEach>
						<c:if test="${pc.totalRec == 0 }">
						<tr class="tr-body"><td class="ta-c" colspan="6">등록된 게시글이 없습니다.</td></tr>
						</c:if>
						</tbody>
				</table>
				<div class="btn-area">
 				<c:if test="${!empty member && boardName != 'NOTICE' || sessionScope.member.admin == 1 }">
					<button id="writeBtn" data-boardName="${boardName }" data-returnPage="${pc.rc.reqPage }">WRITE</button>
 				</c:if>
				</div>
			</div>
			<ul class="paging">
					<!-- 처음페이지 / 이전페이지 이동 -->
					<c:if test="${pc.prev }">
						<li class="front-paging" id="ll"><a class="prev-next"
							href="${pageContext.request.contextPath }/board/list/${boardName }/1"> <img
								src="<c:url value='/resources/img/icon_arrow_page_ll.png' />"
								alt="" />
						</a></li>
						<li class="front-paging" id="l"><a class="prev-next"
							href="${pageContext.request.contextPath }/board/list/${boardName }/${pc.startPage-1}">
								<img
								src="<c:url value='/resources/img/icon_arrow_page_l.png' />"
								alt="" />
						</a></li>
					</c:if>

					<c:forEach var="pageNum" begin="${pc.startPage }"
						end="${pc.endPage }">
						<!-- 현재페이지와 요청페이지가 다르면 -->
						<c:if test="${pc.rc.reqPage != pageNum }">
							<li><a class="paging-number"
								href="${pageContext.request.contextPath }/board/list/${boardName }/${pageNum }/${pc.fc.searchType}/${pc.fc.keyword}">${pageNum }</a></li>
						</c:if>
						<!-- 현재페이지와 요청페이지가 같으면 -->
						<c:if test="${pc.rc.reqPage == pageNum }">
							<li id="pagingnumber"><a class="paging-number"
								href="${pageContext.request.contextPath }/board/list/${boardName }/${pageNum}/${pc.fc.searchType}/${pc.fc.keyword}">${pageNum }</a></li>
						</c:if>
					</c:forEach>
					<!-- 다음페이지 / 최종페이지 이동 -->
					<c:if test="${pc.next }">
						<li class="front-paging" id="r"><a class="prev-next"
							href="${pageContext.request.contextPath }/board/list/${boardName }/${pc.endPage+1}">
								<img
								src="<c:url value='/resources/img/icon_arrow_page_r.png' />"
								alt="" />
						</a></li>
						<li class="front-paging" id="rr"><a class="prev-next"
							href="${pageContext.request.contextPath }/board/list/${boardName }/${pc.finalEndPage}">
								<img
								src="<c:url value='/resources/img/icon_arrow_page_rr.png' />"
								alt="" />
						</a></li>
					</c:if>
				</ul>
			<form>
				<div class="search-area">
					<div class="search-item">
						<select name="searchType" id="searchType">
							<option value="TC"
								<c:out value="${pc.fc.searchType == 'TC' ? 'selected':'' }"/>>제목+내용</option>
							<option value="T"
								<c:out value="${pc.fc.searchType == 'T' ? 'selected':'' }"/>>제목</option>
							<option value="C"
								<c:out value="${pc.fc.searchType == 'C' ? 'selected':'' }"/>>내용</option>
							<option value="N"
								<c:out value="${pc.fc.searchType == 'N' ? 'selected':'' }"/>>작성자</option>
							<option value="I"
								<c:out value="${pc.fc.searchType == 'I' ? 'selected':'' }"/>>아이디</option>
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
		</div>
	</div>
			<%@ include file="../include/greenFooter.jsp" %>		
	</div>
</body>
</html>