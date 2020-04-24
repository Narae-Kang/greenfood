<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식단 보기</title>
<script src="<c:url value="/resources/js/common.js"/>"></script>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/greenMain.css"/>" />
<style>
.content {
	height: auto;
	min-height : 64vh;
}
.contents-inner {
	margin: 0 auto;
	max-width: 600px;
}
.title {
	color: #333;
	margin: 0 0 20px;
	padding: 20px 0 10px;
	text-align: center;
}
.contentBox {
	width : 100%; min-height : 40px;
	display: flex;

	border-bottom: 2px solid #dbdbdb;
}
.contentBox:nth-child(1) {	border-top: 2px solid #dbdbdb;} 

.contentTitle {
	width : 40%; min-height : 35px;
	display: flex;
 	justify-content: center;
	align-items: center; 
	background: #f7f7f7;
	font-size: 15px;
	font-weight: 600;
	padding-left: 10px;
}

.contentInfo {
	width : 60%; min-height : 35px;
	display: flex;
	align-items: center; 
	padding: 10px 15px;
	font-size: 13px;
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

.textarea {
	padding: 10px;
	margin-right: 3px;
	border-width: 1px;
	border-style: solid;
	border-color: rgba(139, 139, 139, 0.3);
	background-color: #fff;
}
table {
	width: 100%;
	padding: 15px;
	background-color: #f7f7f7;
	border-bottom: 1px solid #dbdbdb;
	border-top: 1px solid #dbdbdb;
}

.content-area {
	width: auto;
	float: none;
	overflow: hidden;
	margin-right: 50px;
	max-width: none;
}
/* fontawesome 아이콘  색지정 */
.fa-thumbs-up:hover { color: dodgerblue; }
.fa-thumbs-down:hover { color: Tomato }
.m2 { margin-top : 80px}
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
		let modifyBtn = document.getElementById('modifyBtn');
		let deleteBtn = document.getElementById('deleteBtn');
		let listBtn = document.getElementById('listBtn');

	//수정
	<c:if test="${sessionScope.member.admin == 1 }">
		modifyBtn.addEventListener("click", function(e) {
			e.preventDefault();
			let returnPage = e.target.getAttribute('data-returnPage');
			let mnum = e.target.getAttribute('data-mnum');
			console.log(mnum + "번 게시물 수정클릭");
			location.href = getContextPath() + "/admin/adminMenuModifyForm/" + returnPage + "/" + mnum;
		}, false);
		//삭제
		deleteBtn.addEventListener("click", function(e) {
			e.preventDefault();
			let returnPage = e.target.getAttribute('data-returnPage');
			let mnum = e.target.getAttribute('data-mnum');
			console.log(mnum + "번 게시물 삭제클릭");
			if (confirm("삭제하시겠습니까?")) {
				location.href = getContextPath() + "/admin/adminMenuDelete/" + returnPage + "/" + mnum;
			}
		}, false);
	</c:if>
	//목록
	listBtn.addEventListener("click", function(e) {
		e.preventDefault();
		console.log("목록");
		let returnPage = e.target.getAttribute('data-returnPage');
		location.href = getContextPath() + "/admin/adminMenuList/"+ returnPage;
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
			<form:form action="${pageContext.request.contextPath }/admin/adminMenuModifyForm/${returnPage }"
								 enctype="multipart/form-data" method="post" modelAttribute="menuVO">
				<fmt:formatDate value="${menuVO.mdate }" pattern="yyyy-MM-dd" var="date" />
				<form:hidden path="mnum" />
				
				<div class="section">
					<div class="title">
						<h3 class="notice">식단</h3>
					</div>
					<div class="section-body">
						<div class="board-view">
						
							<div class="board-view-head">
							
								<div class="contentBox">
									<div class="contentTitle">date</div>
									<div class="contentInfo">${date }</div>
								</div>	
							
								<div class="contentBox">
									<div class="contentTitle">menu</div>
									<div class="contentInfo">${menuVO.menu }</div>
								</div>	
															
								<div class="contentBox">
									<div class="contentTitle">cal</div>
									<div class="contentInfo">${menuVO.cal }</div>
								</div>	
							
								<div class="contentBox">
									<div class="contentTitle">maindish</div>
									<div class="contentInfo">${menuVO.maindish }</div>
								</div>	
							
								<div class="contentBox">
									<div class="contentTitle">rice</div>
									<div class="contentInfo">${menuVO.rice }</div>
								</div>	
							
								<div class="contentBox">
									<div class="contentTitle">side1</div>
									<div class="contentInfo">${menuVO.side1 }</div>
								</div>	
							
								<div class="contentBox">
									<div class="contentTitle">side2</div>
									<div class="contentInfo">${menuVO.side2 }</div>
								</div>	
							
								<div class="contentBox">
									<div class="contentTitle">side3</div>
									<div class="contentInfo">${menuVO.side3 }</div>
								</div>	
							
								<div class="contentBox">
									<div class="contentTitle">side_side</div>
									<div class="contentInfo">${menuVO.side_side }</div>
								</div>	
							
								<div class="contentBox">
									<div class="contentTitle">salad</div>
									<div class="contentInfo">${menuVO.salad }</div>
								</div>	
							
								<div class="contentBox">
									<div class="contentTitle">soup</div>
									<div class="contentInfo">${menuVO.soup }</div>
								</div>	

							</div>											
						</div>
					</div>
					<div class="btns">
						<!-- 작성자만 수정,삭제 가능 시작 -->
						<c:if test="${sessionScope.member.admin == 1 }">
							<form:button class="btn" id="modifyBtn" data-returnPage="${returnPage }" data-mnum="${menuVO.mnum }">수정</form:button>
							<form:button class="btn" id="deleteBtn" data-returnPage="${returnPage }" data-mnum="${menuVO.mnum }">삭제</form:button>
						</c:if>
						<form:button class="btn" id="listBtn" data-returnPage="${returnPage }">목록</form:button>
					</div>
					</div>
				</div>
			</form:form>
		</div>
	</div>
				<%@ include file="../include/greenFooter.jsp" %>		
	</div>
</body>
</html>