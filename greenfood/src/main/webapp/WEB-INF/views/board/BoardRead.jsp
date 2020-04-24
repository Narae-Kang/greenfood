<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/greenMain.css"/>" />
<style>
.contents-inner {
	margin: 0 auto;
	max-width: 1200px;
}

.content {
  min-height: 64vh;
}

.m2 {
	margin-top: 80px;
}
.title {
	color: #333;
	margin: 0 0 20px;
	padding: 0 0 20px;
	text-align: center;
}

.notice {
	display: inline-block;
	padding: 7px 14px;
	border-bottom: 1px solid #666;
	font-size: 13px;
}

.board-view-head .board-view-title {
	overflow: hidden;
	background: #f7f7f7;
	border-top: 1px solid #dbdbdb;
	/* height: 20px; */
	padding: 15px;
	border-bottom: 1px solid #dbdbdb;
}

.board-title {
	font-size: 13px;
	font-weight: 600;
}

.board-view-info {
	padding: 10px 15px;
	border-bottom: 1px solid #dbdbdb;
	overflow: hidden;
}

.author {
	float: left;
	color: #111;
}

.board-id {
	font-size: 12px;
}

.divide-bar {
	vertical-align: middle;
	width: 1px;
	height: 16px;
	display: inline-block;
	background: #dbdbdb;
	margin: 0 10px;
}

.board-view-info .hit {
	float: right;
}

.board-view-body .textfield {
	border-bottom: 1px solid #dbdbdb;
	padding: 30px 16px;
	line-height: 1.8;
	font-size: 12px;
}

.btns {
	display: flex;
	justify-content: flex-end;
	margin-top: 16px;
	margin-bottom: 16px;
}

#replyBtn {
	background: #BCE074;
	border: 1px solid rgba(0, 0, 0, 0.212);
	color: #fff;
}

#modifyBtn {
	background: white;
	border: 1px solid #dbdbdb;
	color: #222;
}

#deleteBtn {
	background: #BCE074;
	border: 1px solid rgba(0, 0, 0, 0.212);
	color: #fff;
}

#listBtn {
	background: white;
	border: 1px solid #dbdbdb;
	color: #222;
}

#replyBtn:hover, #deleteBtn:hover {
	background: white;
	color: #222;
	transition: 0.3s;
}

#modifyBtn:hover, #listBtn:hover {
	border: 1px solid #222;
	transition: 0.3s;
}

#replyBtn1:hover {
	background: #464646;
	transition: 0.3s;
}

.btn {
	margin-right: 5px;
	width: 80px;
	height: 42px;
	line-height: 40px;
	font-size: 11px;
}

.col-1 {
	font-size: 12px;
}

.fileList {
	font-size: 11px;
}

.board-view-comment {
	padding: 15px 0;
}

.reply_comment {
	background-color: #f7f7f7;
}

.comment {
	border-top: 1px solid #dbdbdb;
}

.area-comment {
	position: relative;
	overflow: hidden;
	padding: 15px;
}

.pic {
	float: left;
	max-width: 105px;
	padding: 0 20px 0 0;
	color: #444;
	word-wrap: break-word;
	height: 40px;
}

.recontent {
	width: auto;
	float: none;
	overflow: hidden;
	margin-right: 70px;
	max-width: none;
	font-size: 12px;
}

.reply-btn {
	position: absolute;
	top: 15px;
	right: 15px;
}

.textarea {
	padding: 10px;
	margin-right: 3px;
	border-width: 1px;
	border-style: solid;
	border-color: rgba(139, 139, 139, 0.3);
	background-color: #fff;
}

#rcontent, .rrcontent {
	overflow: hidden;
	line-height: 14px;
	height: 65px;
	width: 100%;
	resize: none;
	font-size: 12px;
	margin-left: 2px;
}

table {
	width: 100%;
	padding: 15px;
	background-color: #f7f7f7;
	border-bottom: 1px solid #dbdbdb;
	border-top: 1px solid #dbdbdb;
}

#commentBtn {
	width: 80px;
	height: 67px;
	line-height: 40px;
	font-size: 11px;
	background: #c7c7c7;
	border: 1px solid #c7c7c7;
	color: #fff;
}

/* 별점 */
.starRev {
		display: inline-block;
    width: 180px;
    text-align: right;
}
/* 공통 */
.lm-1 {
	margin-left: 10px;
}

.lm-2 {
	margin-left: 20px;
}

.lm-3 {
	margin-left: 30px;
}

.lm-4 {
	margin-left: 40px;
}

.lm-5 {
	margin-left: 50px;
}

.lm-6 {
	margin-left: 60px;
}

.lm-7 {
	margin-left: 38px;
	padding: 0 15px 15px 0;
}

.lm-8 {
	margin-left: 80px;
}

.lm-9 {
	margin-left: 90px;
}

.lm-10 {
	margin-left: 100px;
}

.fw-1 {
	min-width: 10px;
}

.fw-2 {
	min-width: 20px;
}

.fw-3 {
	min-width: 30px;
}

.fw-4 {
	min-width: 40px;
}

.fw-5 {
	min-width: 50px;
}

.fw-6 {
	min-width: 60px;
}

.fw-8 {
	min-width: 80px;
}

.fw-9 {
	min-width: 90px;
}

.fw-10 {
	min-width: 100px;
}

.fw-14 {
	min-width: 65px;
}

.fw-15 {
	min-width: 150px;
}

.pw-1 {
	width: 10%;
}

.pw-2 {
	width: 20%;
}

.pw-3 {
	width: 30%;
}

.pw-4 {
	width: 40%;
}

.pw-5 {
	width: 50%;
}

.pw-6 {
	width: 60%;
}

.pw-7 {
	width: 70%;
}

.pw-8 {
	width: 80%;
}

.pw-9 {
	width: 90%;
}

.pw-10 {
	width: 100%;
}

#reply .row, #replyList .row {
	display: flex;
}

/* 댓글작성 */
#reply {
	width: 100%;
}

.write1 {
	padding: 15px;
}

#reply .row {
	display: flex;
}

#reply #rcontent {
	width: 100%;
}

#replyBtn1, .rreplyBtn, .rreplyModifyBtn {
	width: 80px;
	height: 67px;
	margin-left: 5px;
	line-height: 40px;
	font-size: 11px;
	background: #c7c7c7;
	border: 1px solid #c7c7c7;
	color: #fff;
}

/* 댓글 목록 */
#replyList {
	width: 100%;
}

#replyList .row {
	display: flex;
}

#replyList .row.header .col:nth-child(4) {
	display: flex;
	justify-content: flex-end;
}

.content-area {
	width: auto;
	float: none;
	overflow: hidden;
	margin-right: 50px;
	max-width: none;
}
/* 페이징 */
#paging {
	border-top: 1px solid #dbdbdb;
	display: flex;
	justify-content: center;
}

#paging a {
	padding: 3px;
	margin: 0 3px;
}

#paging .active {
	background-color: #444;
	color: white;
}

.reply-icon {
	font-size: 13px;
}

.reply-icon .votes {
	color: gray;
}

.replyfont {
	font-size: 14px;
}

.reply-count {
	border-top: 1px solid #dbdbdb;
	padding: 10px 15px;
}

.reply-area1 {
	border-top: 1px solid #dbdbdb;
	border-bottom: 1px solid #dbdbdb;
	background: #F8F8F8;
}

.replyarea1 {
	border-top: 1px solid #dbdbdb;
	padding: 15px;
}
/* fontawesome 아이콘  색지정 */
.fa-thumbs-up:hover {
	color: dodgerblue;
}

.fa-thumbs-down:hover {
	color: Tomato
}
</style>
<script src="<c:url value='/resources/js/root.js' />"></script>
<script>
window.addEventListener("load", init, false);
function init() {
	var star = $('.starRev');
    star.each(function(){
      var target = $(this).attr('data-score');
      $(this).find('i:nth-child(-n+' + target + ')').css({color:'#BCE074'});
    });
	<c:if test="${!empty member && boardVO.boardCategoryVO.cname != '공지사항' || sessionScope.member.admin == 1}">
	let modifyBtn = document.getElementById('modifyBtn');
	let deleteBtn = document.getElementById('deleteBtn');
	let replyBtn = document.getElementById('replyBtn');
	let listBtn = document.getElementById('listBtn');
	<c:if test="${boardVO.boardCategoryVO.cname == 'Q&A' }">
	//답글
	replyBtn.addEventListener("click", function(e) {
		e.preventDefault();
		console.log("답글");
		let returnPage = e.target.getAttribute('data-returnPage');
		let bnum = e.target.getAttribute('data-bnum');
		location.href = getContextPath() + "/board/replyForm/" + returnPage
				+ "/" + bnum;
	}, false);
	</c:if>

	//수정
	<c:if test="${sessionScope.member.id == boardVO.bid || sessionScope.member.admin == 1 }">
	modifyBtn.addEventListener("click", function(e) {
		e.preventDefault();
		console.log("수정");
		let returnPage = e.target.getAttribute('data-returnPage');
		let bnum = e.target.getAttribute('data-bnum');
		location.href = getContextPath() + "/board/modifyForm/"
				+ returnPage + "/" + bnum;
	}, false);
	//삭제
	deleteBtn.addEventListener("click", function(e) {
		e.preventDefault();
		//console.log("삭제"+e.target.getAttribute('data-bnum'));

		if (confirm("삭제하시겠습니까?")) {
			let returnPage = e.target.getAttribute('data-returnPage');
			let bnum = e.target.getAttribute('data-bnum');
			location.href = getContextPath() + "/board/delete/" +"${boardVO.boardCategoryVO.cname}/" 
					+ returnPage + "/" + bnum;
		}
	}, false);
	</c:if>
 </c:if>
	//목록
	listBtn.addEventListener("click", function(e) {
		e.preventDefault();
		console.log("목록");
		let returnPage = e.target.getAttribute('data-returnPage');
		location.href = getContextPath() + "/board/list/"+"${boardVO.boardCategoryVO.cname }" +"/"+ returnPage;
	}, false);



	//첨부파일 1건 삭제 : Ajax로 구현함.
	let fileList = document.getElementById('fileList');
	if (fileList != null) {
		fileList
				.addEventListener(
						"click",
						function(e) {
							console.log(e.target); //이벤트가 발생된 요소
							console.log(e.currentTarget);//이벤트가 등록된 요소
							console.log(e.target.tagName);
							//선택된 요소가 첨부파일 삭제 아이콘일때만 삭제처리 수행
							if (e.target.tagName != 'I')
								return false;
							if (!confirm('삭제 하시겠습니까?'))
								return false;
							//실제 이벤트가 발생한요소의 data-del_file속성값 읽어오기
							let fid = e.target
									.getAttribute('data-del_file');

							//AJAX 사용
							//1) XMLHttpRequest객체 생성	
							var xhttp = new XMLHttpRequest();

							//2) 서버응답처리
							xhttp.addEventListener("readystatechange",
									ajaxCall, false);
							function ajaxCall() {
								if (this.readyState == 4
										&& this.status == 200) {
									console.log(this.responseText);
									if (this.responseText == "success") {
										console.log('성공!!');
										//삭제대상 요소 찾기
										let delTag = e.target.parentElement.parentElement.parentElement;
										//부모요소에서 삭제대상 요소 제거
										fileList.removeChild(delTag);
									} else {
										console.log('실패!!');
									}
								}
							}

							//post방식
							xhttp.open("DELETE",
									"http://localhost:9080/greenfood/board/file/"
											+ fid, true);
							xhttp.send();
						}, false);
	}
}
</script>
</head>
<body>
	<div id="containerAll">
		<%@ include file="../include/greenHeader.jsp" %>
	<div class="content">
		<div class="contents-inner">
		<div class="section m2">
			<form:form
				action="${pageContext.request.contextPath }/board/modify/${returnPage }"
				enctype="multipart/form-data" method="post" modelAttribute="boardVO">
				<fmt:formatDate value="${boardVO.bcdate }"
					pattern="yyyy-MM-dd HH:mm" var="cdate" />
				<form:hidden path="bnum" />
				<div class="section">
					<div class="title">
						<h3 class="notice">${boardVO.boardCategoryVO.cname }</h3>
					</div>
					<div class="section-body">
						<div class="board-view">
							<div class="board-view-head">
								<div class="board-view-title">
									 <span class="board-title">${boardVO.btitle }</span>
								</div>
								<div class="board-view-info">
									<div class="author">
										<span class="board-id"> <strong>${boardVO.bname }</strong>
										</span> <span class="divide-bar">&nbsp;</span> <span class="board-id">${cdate }</span>
									</div>
									<div class="hit">
										<span class="board-id"><strong>조회수</strong>
											${boardVO.bhit }</span>
									</div>
								</div>
								<!-- 첨부목록 -->
								<c:if test="${!empty files}">
								
									<div class="board-view-info">
										<strong class="col-1"><i class="fas fa-paperclip"></i>첨부파일</strong>
										<c:forEach var="file" items="${files }">
											<a class="fileList"
												style="text-decoration: underline; color: #777;"
												href="${pageContext.request.contextPath }/board/file/${file.fid }">@${file.fname }</a>
										</c:forEach>
									</div>
								</c:if>
							</div>
							<div class="board-view-body">
								<div class="textfield">
								<c:if test="${!empty files }">
								<c:forEach var="file" items="${files }">
								<img  src="${pageContext.request.contextPath }/board/file/${file.fid }" style="max-width: 1168px;" />
								</c:forEach>
								</c:if>
									<p>${boardVO.bcontent }</p>
								</div>
							</div>
							
							<c:if test="${boardVO.boardCategoryVO.cname == 'REVIEW' }">
								<div class="board-view-info">
								<div class="author">
										<strong class="col-1">평점</strong>
											<div class="starRev" data-score="${boardVO.grade }">
										    <i class="fas fa-star fa-lg" style="color:gray;"></i>
										    <i class="fas fa-star fa-lg" style="color:gray;"></i>
										    <i class="fas fa-star fa-lg" style="color:gray;"></i>
										    <i class="fas fa-star fa-lg" style="color:gray;"></i>
										    <i class="fas fa-star fa-lg" style="color:gray;"></i>
										    <b>${boardVO.grade } / 5</b>
										  </div>
										 </div>
									</div>
								</c:if>
								
						</div>
					</div>
					<div class="btns">
						<c:if test="${!empty member && boardVO.boardCategoryVO.cname != '공지사항' || sessionScope.member.admin == 1}">
							<c:if test="${boardVO.boardCategoryVO.cname == 'Q&A' }">
							<form:button class="btn" id="replyBtn"
								data-returnPage="${returnPage }" data-bnum="${boardVO.bnum }">답글</form:button>
							</c:if>
							<!-- 작성자만 수정,삭제 가능 시작 -->
							<c:if
								test="${sessionScope.member.id == boardVO.bid || sessionScope.member.admin == 1 }">
								<form:button class="btn" id="modifyBtn"
									data-returnPage="${returnPage }" data-bnum="${boardVO.bnum }">수정</form:button>
								<form:button class="btn" id="deleteBtn"
									data-returnPage="${returnPage }" data-bnum="${boardVO.bnum }">삭제</form:button>
							</c:if>
						</c:if>
						<!-- 작성자만 수정,삭제 가능 끝 -->
						<form:button class="btn" id="listBtn"
							data-returnPage="${returnPage }">목록</form:button>
					</div>
				</div>
			</form:form>
			<c:if test="${boardVO.boardCategoryVO.cname == 'REVIEW' }">
				<%@ include file="../rboard/reply.jsp" %>
			</c:if>
			</div>
		</div>
	</div>
				<%@ include file="../include/greenFooter.jsp" %>		
	</div>
</body>
</html>