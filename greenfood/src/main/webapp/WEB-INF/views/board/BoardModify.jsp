<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>GREEN FOOD</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/greenMain.css"/>" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="<c:url value='/resources/js/root.js' />"></script>
<script src="<c:url value='/resources/ckeditor/ckeditor.js' />"></script>
<style>
#ja, #area {
	width: 100%;
	box-sizing: border-box;
}

.textfield, #category, #ja, #use {
	line-height: 24px;
}

.m2 {
	margin-top: 80px;
}

#category {
	width: 200px;
	padding: 4px;
	box-sizing: border-box;
}

#use {
	width: 200px;
	box-sizing: border-box;
}

.contents-inner {
	margin: 0 auto;
	max-width: 1200px;
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
	background: #222;
	border: 1px solid #222;
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
	padding: 0 0 20px;
	text-align: center;
}

.write {
	display: inline-block;
	padding: 7px 14px;
	border-bottom: 1px solid #666;
	font-size: 13px;
}

th {
	padding: 10px;
	color: #777;
	background-color: #f9f9f9;
	border-bottom: 1px solid #dbdbdb;
	font-size: 12px;
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
#fileList {
font-size: 12px;
}
#filecontent1, #filecontent2 {
	font-size: 12px;
}
#filecontent2 {
	font-size: 14px;
}
</style>
<script>
	window.addEventListener("load", init, false);
	function init() {
		$(function(){

			  $("#categoryid1").on("change", function(){
			    if($("#categoryid1").val() != "3000") {
			      $("#categoryid2").attr("disabled", "disabled");
			      $("#categoryid1").attr("name", "boardCategoryVO.cnum");
			    } else {
			      $("#categoryid2").removeAttr("disabled");
			      $("#categoryid1").removeAttr("name");
			    }  // - if end
			  });  // - on change end
			});  // - $function end
		//등록버튼 클릭시
		writeBtn.addEventListener("click", function(e) {
			e.preventDefault();
			//유효성체크

			//게시글 작성전송
			if(confirm('게시글을 수정하시겠습니까?')){
			document.getElementById("boardVO").submit();
			}
		}, false);
		//이전버튼 클릭시
		cancelBtn.addEventListener("click", function(e) {
			e.preventDefault();
			let returnPage = e.target.getAttribute('data-returnPage');
			let bnum = e.target.getAttribute('data-bnum');
			location.href=getContextPath()+"/board/view/"+returnPage+"/"+bnum;
		}, false);
		//목록버튼 클릭시
		listBtn.addEventListener("click", function(e) {
			e.preventDefault();
			let returnPage = e.target.getAttribute('data-returnPage');
			location.href = getContextPath() + "/board/list/" + "${boardVO.boardCategoryVO.cname }" + "/" + returnPage;
		}, false);
		//첨부파일 1건 삭제 : Ajax로 구현함.
		let fileList = document.getElementById('fileList');
		if(fileList != null ) {
			fileList.addEventListener("click",function(e){
				console.log(e.target); //이벤트가 발생된 요소
				console.log(e.currentTarget);//이벤트가 등록된 요소
				console.log(e.target.tagName);
				//선택된 요소가 첨부파일 삭제 아이콘일때만 삭제처리 수행
				if(e.target.tagName != 'I') return false;
				if(!confirm('삭제 하시겠습니까?')) return false;
				//실제 이벤트가 발생한요소의 data-del_file속성값 읽어오기
				let fid = e.target.getAttribute('data-del_file');

			  //AJAX 사용
			  //1) XMLHttpRequest객체 생성	
			  var xhttp = new XMLHttpRequest();
			  
			  //2) 서버응답처리
			  xhttp.addEventListener("readystatechange",ajaxCall,false);
			  function ajaxCall(){
				  if (this.readyState == 4 && this.status == 200) {
					  console.log(this.responseText);
					  if(this.responseText == "success"){
					  	console.log('성공!!');
					  	//삭제대상 요소 찾기
 					  	let delTag = e.target.parentElement.parentElement.parentElement;
 					  	//부모요소에서 삭제대상 요소 제거
					  	fileList.removeChild(delTag); 
					  }else{
					  	console.log('실패!!');
					  }
				  }
			  }
			 	  			  
			  //post방식
			  xhttp.open("DELETE","http://localhost:9080/greenfood/board/file/"+fid,true);
			  xhttp.send();
			},false);  
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
				<div class="section">
					<div class="title">
						<h3 class="write">MODIFY</h3>
					</div>
				</div>
				<form:form action="${pageContext.request.contextPath }/board/modify/${returnPage }"
					enctype="multipart/form-data" method="post"
					modelAttribute="boardVO">
					<form:hidden path="boardCategoryVO.cnum" value="${boardVO.boardCategoryVO.cnum }" />
					<form:hidden path="bnum"/>
					<div class="section-body">
						<div class="table1 board-write">
							<table>
								<colgroup>
									<col style="width: 133px;">
								</colgroup>
								<tbody>
									<tr>
										<th class="cate"><form:label path="boardCategoryVO.cnum">분류</form:label></th>
										<td class="cate">
											<div class="textfield">
												<form:select path="boardCategoryVO.cnum" id="category" disabled="true">
													<option value="0">====== SELECT ======</option>
													<form:options path="boardCategoryVO.cnum"
														items="${boardCategoryVO }" itemValue="cnum"
														itemLabel="cname" />
												</form:select>
												<div>
													<form:errors cssClass="errmsg" path="boardCategoryVO.cnum" />
												</div>
											</div>
										</td>
									</tr>
									<c:if test="${boardVO.boardCategoryVO.cname == 'Q&A' }">
										<tr>
											<th class="cate"><form:label path="boardCategoryVO.cnum">문의 선택</form:label></th>
											<td class="cate">
												<div class="textfield">
													<form:select path="boardCategoryVO.cnum" id="category" disabled="true">
														<option value="0">====== SELECT ======</option>
														<form:options path="boardCategoryVO.cnum"
																					items="${boardCategoryVO }" 
																					itemValue="cnum"
																					itemLabel="cname2" />
													</form:select>
													<div>
														<form:errors cssClass="errmsg" path="boardCategoryVO.cnum" />
													</div>
												</div>
											</td>
										</tr>
									</c:if>
									<tr>
										<th class="ta"><form:label path="bid">작성자</form:label></th>
										<td>
											<div class="textfield">
												<input id="use" type="text" readonly="true"
													value="${member.name }"></input>
											</div>
										</td>
									</tr>
									<tr>
										<th class="ta"><form:label path="btitle">제목</form:label></th>
										<td>
											<div class="textfield">
												<form:input type="text" id="ja" path="btitle" />
												<div>
													<form:errors cssClass="errmsg" path="btitle" />
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<th class="ta"><form:label path="bcontent">내용</form:label></th>
										<td>
											<div class="textfield">
												<form:textarea path="bcontent" id="area" cols="60" rows="18"></form:textarea>
													<script>
													 var ckeditor_config = {
													   resize_enaleb : false,
													   enterMode : CKEDITOR.ENTER_BR,
													   shiftEnterMode : CKEDITOR.ENTER_P,
													   filebrowserUploadUrl : "/admin/goods/ckUpload"
													 };
													 
													 CKEDITOR.replace("area", ckeditor_config);
													</script>
												<div>
													<form:errors cssClass="errmsg" path="bcontent" />
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<th class="ta"><form:label path="files">첨부 파일</form:label></th>
										<td>
											<div class="textfield">
												<form:input type="file" multiple="multiple" path="files" />
												<form:errors path="files" />
											</div>
										</td>
									</tr>
										<c:if test="${!empty files}">
									<tr>
										<th class="ta"><form:label path="files">첨부 목록</form:label></th>
										<td>
											<div class="textfield" id="fileList">
											<c:forEach var="file" items="${files }">
											<p>
												<a class="fileList"
												href="${pageContext.request.contextPath }/board/file/${file.fid }">${file.fname }</a>
												<span id="filecontent1">(${file.fsize/1000 } kb)</span> 
												<span id="filecontent2"> <a href="#none">
													<i class="fas fa-backspace"
														 data-del_file="${file.fid }"></i></a>
												</span>
											</p>
											</c:forEach>
											</div>
										</td>
									</tr>
										</c:if>
								</tbody>
							</table>
						</div>
					</div>
					<div class="textfield">
						<div class="tailfield">
							<form:button class="tail" id="writeBtn" >수정</form:button>
							<form:button class="tail" id="cancelBtn"
							data-returnPage="${returnPage }" data-bnum="${boardVO.bnum }">이전</form:button>
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