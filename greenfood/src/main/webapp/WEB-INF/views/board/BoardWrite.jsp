<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GREEN FOOD</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/greenMain.css"/>" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="<c:url value='/resources/js/root.js' />"></script>
<script src="<c:url value='/resources/ckeditor/ckeditor.js' />"></script>
<style>
#ja, #area {
	width: 100%;
	box-sizing: border-box;
}
#area {
  resize: none;
}
.m2 {
	margin-top: 80px;
}

.textfield, #category, #ja, #use {
	line-height: 24px;
}

#categoryid1 {
	width: 200px;
	padding: 4px;
	box-sizing: border-box;
}
#categoryid2 {
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
	padding: 0 0 20px;
	text-align: center;
}
.ta {
vertical-align: middle;
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

/* 평점 스타일시트 */
.grade>.input,
.grade>.input>label:hover,
.grade>.input>input:focus+label,
.grade>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('<c:url value='/resources/img/grade_img.png' />')no-repeat;}
.grade {display:inline-block; white-space:nowrap;width:225px;height:40px;line-height:30px;}
.grade>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
.grade>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
grade>.input.focus{outline:1px dotted #ddd;}
.grade>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
.grade>.input>label:hover,
.grade>.input>input:focus+label,
.grade>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
.grade>.input>label:hover~label{background-image: none;}
.grade>.input>label[for="p1"]{width:30px;z-index:5;}
.grade>.input>label[for="p2"]{width:60px;z-index:4;}
.grade>.input>label[for="p3"]{width:90px;z-index:3;}
.grade>.input>label[for="p4"]{width:120px;z-index:2;}
.grade>.input>label[for="p5"]{width:150px;z-index:1;}
.grade>output{display:inline-block; width: 60px; text-align: right;font-size:13px; vertical-align:middle;}

</style>


<script>
window.addEventListener("load", init, false);
function init() {
	
	//컨트롤러에서 데이터 받기
	var jsonData = JSON.parse('${category}');
	console.log(jsonData);

	var cate1Arr = new Array();
	var cate1Obj = new Object();

	//1차 분류 셀렉트 박스에 삽입할 데이터 준비
	for(var i = 0; i < jsonData.length; i++) {

	if(jsonData[i].level == "1") {
	cate1Obj = new Object();  //초기화
	cate1Obj.cnum = jsonData[i].cnum;
	cate1Obj.cname = jsonData[i].cname;
	cate1Arr.push(cate1Obj);
	}
	};

	//1차 분류 셀렉트 박스에 데이터 삽입
	var cate1Select = $('select.category1')
	console.log(cate1Select);
	var admin = document.getElementById('categoryid1').getAttribute('data-admin');
	console.log('admin : ' + admin);
	 if(admin == 1){
	 cate1Select.append("<option value='" + cate1Arr[0].cnum + "'>" + cate1Arr[0].cname + "</option>");
	 }
	 cate1Select.append("<option value='" + cate1Arr[1].cnum + "'>" + cate1Arr[1].cname + "</option>");
	 cate1Select.append("<option value='" + cate1Arr[2].cnum + "'>" + cate1Arr[2].cname + "</option>");


	$(document).on("change", "select.category1", function(){
		 
		 var cate2Arr = new Array();
		 var cate2Obj = new Object();
		 
		 // 2차 분류 셀렉트 박스에 삽입할 데이터 준비
		 for(var i = 0; i < jsonData.length; i++) {
		  
		  if(jsonData[i].level == "2") {
		   cate2Obj = new Object();  //초기화
		   cate2Obj.cnum = jsonData[i].cnum;
		   cate2Obj.cname2 = jsonData[i].cname2;
		   cate2Obj.ccode = jsonData[i].ccode;
		   
		   cate2Arr.push(cate2Obj);
		  }
		 }
		 
		 var cate2Select = $("select.category2");
		 cate2Select.children().remove();		 
		 $("option:selected", this).each(function(){
		  
		  var selectVal = $(this).val();  
		  cate2Select.append("<option value='" + selectVal + "'>====== 선택 ======</option>");
		  
		  for(var i = 0; i < cate2Arr.length; i++) {
		   if(selectVal == cate2Arr[i].ccode) {
		    cate2Select.append("<option value='" + cate2Arr[i].cnum + "'>"
		         + cate2Arr[i].cname2 + "</option>");
		   }
		  }
		  
		 });
		});
	
	$(function(){

		  $("#categoryid1").on("change", function(){
		    if($("#categoryid1").val() != "3000") {
		      $(".category2-area").hide();		      
		      $("#categoryid2").attr("disabled", "disabled");
		      $("#categoryid1").attr("name", "boardCategoryVO.cnum");
		    } else {
		      $(".category2-area").show();
		      $("#categoryid2").removeAttr("disabled");
		      $("#categoryid1").removeAttr("name");
		    }  // - if end

		    if($("#categoryid1").val() == "2000") {
			    $(".grade-area").show();
		    } else {
					$(".grade-area").hide();
			    }
		  });  // - on change end
		});  // - $function end
		starRating();
//등록버튼 클릭시
  writeBtn.addEventListener("click", function(e) {
	e.preventDefault();
	//유효성체크
	//게시글 작성전송
	console.log("checkValid():",checkValid());
	if(checkValid() && confirm('게시글을 등록 하시겠습니까?')){
		console.log("checkValid():",checkValid());
		document.getElementById("boardVO").submit();
	}
}, false);  
//취소버튼 클릭시	
 cancelBtn.addEventListener("click", function(e) {
	e.preventDefault();
	document.getElementById("boardVO").reset();
}, false); 
//목록버튼 클릭시
listBtn.addEventListener("click", function(e) {
	e.preventDefault();
	let returnPage = e.target.getAttribute('data-returnPage');
	let boardName = e.target.getAttribute('data-boardName');
	location.href = getContextPath() + "/board/list/" + boardName + "/" + returnPage;
}, false);
}

function checkValid() {
	var cateEle = document.getElementById('categoryid1');
	var cate2Ele = document.getElementById('categoryid2');
	var titleEle = document.getElementById('ja');
	var contentEle = document.getElementById('area');
	var gradeEle = document.getElementById('score-b');
	console.log(cateEle);
	console.log(cate2Ele);
	console.log(titleEle);
	console.log(contentEle);
	var flag = true;
	
	//카테고리1
	if(cateEle.value == "") {
		category1_errmsg.innerHTML = "카테고리를 선택해야 합니다."
		flag = flag && false;
		} else {
			category1_errmsg.innerHTML = "";
			}
	//카테고리2
	if(cateEle.value == "3000" && cate2Ele.value == "3000") {
		category2_errmsg.innerHTML = "문의 종류를 선택해주세요."
		}else {
			category2_errmsg.innerHTML = "";
		}
	//평점
	if(cateEle.value == "2000" && gradeEle.textContent === "0" ) {
		grade_errmsg.innerHTML = "평점을 입력해주세요."
		}else {
			grade_errmsg.innerHTML = "";
		}
	//제목
	if(!isTitle(titleEle.value)) {
		title_errmsg.innerHTML = "제목은 1글자 이상 50글자 이하로 입력해야 합니다."
		flag = flag && false;
		} else {
			title_errmsg.innerHTML = "";
			}
 	//내용
	if(contentEle.value == "") {
		content_errmsg.innerHTML = "내용을 입력하세요."
		flag = flag && false;
		} else {
			content_errmsg.innerHTML = "";
			} 
	return flag;
}

function isTitle(asValue) {
	var regExp = /^.{1,50}$/;     //모든 글자 1글자이상 50글자 이하
	return regExp.test(asValue);
}
var starRating = function(){
	var $star = $(".grade"),
	    $result = $star.find("output>b");
		
	  	$(document)
		.on("focusin", ".grade>.input", 
			function(){
	   		 $(this).addClass("focus");
	 	})
			 
	   	.on("focusout", ".grade>.input", function(){
	    	var $this = $(this);
	    	setTimeout(function(){
	      		if($this.find(":focus").length === 0){
	       			$this.removeClass("focus");
	     	 	}
	   		}, 100);
	 	 })
	  
	    .on("change", ".grade :radio", function(){
	    	$result.text($(this).next().text());
	  	})
	    .on("mouseover", ".grade label", function(){
	    	$result.text($(this).text());
	    })
	    .on("mouseleave", ".grade>.input", function(){
	    	var $checked = $star.find(":checked");
	    		if($checked.length === 0){
	     	 		$result.text("0");
	   		 	} else {
	     	 		$result.text($checked.next().text());
	    		}
	  	});
	};




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
						<h3 class="write">게시글 작성</h3>
					</div>
				</div>
				<form:form
					action="${pageContext.request.contextPath }/board/write/${returnPage }"
					enctype="multipart/form-data" 
					method="post"
					modelAttribute="boardVO">
					<div class="section-body">
						<div class="table1 board-write">
							<table>
								<colgroup>
									<col style="width: 133px;">
								</colgroup>
								<tbody>
									<tr>
										<th class="cate"><label>글 분류</label></th>
										<td class="cate">
											<div class="textfield">
												<select id="categoryid1" class="category1" data-admin="${member.admin }">
													<option value="">====== 선택 ======</option>
<!-- 													<option value="1000">NOTICE</option>
													<option value="2000">REVIEW</option>
													<option value="3000">Q&A</option> -->
												</select>
												<div>
													<span class="errmsg" id="category1_errmsg"></span>
												</div>
<!-- 												<select name="boardCategoryVO.cnum" id="category">
													<option value="0">====== 선택 ======</option>
													<option value="1000">공지사항</option>
													<option value="2000">후기</option>
													<option value="3000">Q&A</option>
												</select> -->
												<%-- <form:select path="boardCategoryVO.cid" id="category">
													<option value="0">====== SELECT ======</option>
													<form:options path="boardCategoryVO.cid"
														items="${boardCategoryVO }" itemValue="cid"
														itemLabel="cname" />
												</form:select> --%>
											</div>
										</td>
									</tr>
										
									<tr class="category2-area" style="display: none;">
									<th class="cate"><form:label path="boardCategoryVO.cnum">문의 선택</form:label></th>
										<td class="cate">
											<div class="textfield">
												<select name="boardCategoryVO.cnum" id="categoryid2" class="category2" disabled="disabled" >
													<option value="">====== 선택 ======</option>
<!-- 													<option value="3001">상품문의</option>
													<option value="3002">주문문의</option>
													<option value="3003">배송문의</option>
													<option value="3004">환불문의</option>
													<option value="3005">기타문의</option> -->
												</select>
												<div>
													<span class="errmsg" id="category2_errmsg"></span>
													<form:errors cssClass="errmsg" path="boardCategoryVO.cnum" />
												</div>
											</div>
										</td>
									</tr>
									
									<tr class="grade-area" style="display: none;">
									<th class="cate"><label>평점</label></th>
										<td class="cate">
											<div class="textfield">
												<div class="starRev">
												  <span class="grade">
														<span class="input">
													    	<input type="radio" name="grade" value="1" id="p1">
													    	<label for="p1">1</label>
													    	<input type="radio" name="grade" value="2" id="p2">
													    	<label for="p2">2</label>
													    	<input type="radio" name="grade" value="3" id="p3">
													    	<label for="p3">3</label>
													    	<input type="radio" name="grade" value="4" id="p4">
													    	<label for="p4">4</label>
													    	<input type="radio" name="grade" value="5" id="p5">
													    	<label for="p5">5</label>
													  	</span>
													  	<output for="grade"><b id="score-b">0</b> / 5 점</output>						
													</span>
												</div>
												<div>
													<span class="errmsg" id="grade_errmsg"></span>
													<form:errors cssClass="errmsg" />
												</div>
											</div>
										</td>
									</tr>
									
									
									
									
									<tr>
										<th class="ta"><form:label path="bid">작성자</form:label></th>
										<td>
											<div class="textfield">
												<input id="use" type="text" readonly="true"
													value="${member.name }(${member.id})"></input>
											</div>
										</td>
									</tr>
									<tr>
										<th class="ta"><form:label path="btitle">제목</form:label></th>
										<td>
											<div class="textfield">
												<form:input type="text" id="ja" path="btitle" />
												<div>
													<span class="errmsg" id="title_errmsg"></span>
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
<!--   												<script>
													var ckeditor_config = {
														resize_enaleb : false,
														enterMode : CKEDITOR.ENTER_BR,
														shiftEnterMode : CKEDITOR.ENTER_P,
														filebrowserUploadUrl : "/admin/goods/ckUpload"
													};

													CKEDITOR.replace("area", ckeditor_config);
												</script> -->
												<div>
													<span class="errmsg" id="content_errmsg"></span>
													<form:errors cssClass="errmsg" path="bcontent" />
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<th class="ta"><form:label path="files">첨부파일</form:label></th>
										<td>
											<div class="textfield">
												<form:input type="file" multiple="multiple" path="files" />
												<form:errors path="files" />
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="textfield">
						<div class="tailfield">
							<button type="submit" class="tail" id="writeBtn">등록</button>
							<form:button class="tail" id="cancelBtn">취소</form:button>
							<form:button class="tail" id="listBtn" data-boardName="${boardName }"
								data-returnPage="${returnPage }">목록</form:button>
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