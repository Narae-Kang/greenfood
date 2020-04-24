<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>식단고르기</title>
<link rel="stylesheet" href="<c:url value= '/resources/css/product.css' />">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/productinclude.css"/>" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-1/css/all.min.css" />
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
<script type="text/javascript">
	var today = null;
	var year = null;
	var month = null;
	var firstDay = null;
	var lastDay = null;
	var $tdDay = null;
	var $tdSche = null;
	var jsonData = null;
	$(document).ready(function() {
		initDate();
		drawDays();
		drawSche();
		$("#movePrevMonth").on("click", function() {
			movePrevMonth();
		});
		$("#moveNextMonth").on("click", function() {
			moveNextMonth();
		});
	});

	//날짜 초기화
	function initDate() {
		$tdDay = $("td div.cal-day")
		$tdSche = $("td div.cal-schedule")
		dayCount = 0;
		today = new Date();
		year = today.getFullYear();
		month = today.getMonth() + 1;
		if (month < 10) {
			month = "0" + month;
		}
		firstDay = new Date(year, month - 1, 1);
		lastDay = new Date(year, month, 0);
	}
	//           //calendar 날짜표시
	function drawDays() {
		$("#cal_top_year").text(year);
		$("#cal_top_month").text(month);
	}
	//calendar 월 이동
	function movePrevMonth() {
		month--;
		if (month <= 0) {
			month = 12;
			year--;
		}
		if (month < 10) {
			month = String("0" + month);
		}
		getNewInfo();
	}
	function moveNextMonth() {
		month++;
		if (month > 12) {
			month = 1;
			year++;
		}
		if (month < 10) {
			month = String("0" + month);
		}
		getNewInfo();
	}
	//정보갱신
	function getNewInfo() {
		for (var i = 0; i < 35; i++) {
			$tdDay.eq(i).text("");
			$tdSche.eq(i).text("");
		}
		dayCount = 0;
		firstDay = new Date(year, month - 1, 1);
		lastDay = new Date(year, month, 0);
		drawDays();
		drawSche();
	}
	//스케줄 그리기
	function drawSche() {
		setData();
		var dateMatch = null;
		for (var i = firstDay.getDay(); i < firstDay.getDay()
				+ lastDay.getDate(); i++) {
			var txt = "";
			txt = jsonData[year];
			if (txt) {
				txt = jsonData[year][month];
				if (txt) {
					txt = jsonData[year][month][i];
					dateMatch = firstDay.getDay() + i - 1;
					$tdSche.eq(dateMatch).text(txt);
				}
			}
		}
	}
</script>
<script>
window.addEventListener("load", init, false);

	function init(){
		//선택 완료버튼클릭시
			submitbtn.addEventListener("click", function(e){
				e.preventDefault();
				if(confirm("확인을 누르시면 메인페이지로 이동합니다. 선택하신 식단은 쇼핑정보에서 확인 가능합니다")){
				document.getElementById("selectMenu").submit();
					}
				}, false);

		//취소 클릭시
			canclebtn.addEventListener("click",function(e){
				e.preventDefault();
				document.getElementById("selectMenu").reset();
				},false);
		}


function checkBox(checked){
    var result = document.getElementById("checkResult");
    if( checked.checked==true ){
        console.log(result.value);
        console.log(result.name);
        if(result.value == "" ){
            result.value = checked.getAttribute("value");
        }else{
            result.value += ", "+ checked.getAttribute("value");
        }
    }else {

        var resultArr = result.value.split(", ");
        for(var i=0; i<resultArr.length; i++){
            if(resultArr[i] == checked.getAttribute("value")){
                resultArr.splice(i,1);
                break;
            }
        }
        result.value  = resultArr.join(", ");
    }
 }

</script>

<style>
.select-abstract-box{ width:100%; height: 200px;}

.cal_top { text-align: center; font-size: 30px; padding-top: 50px !important; }
.cal-schedule {    font-size: 0.85em; line-height: 20px; height: 160px;}

.Menu-BtnBox { background-color: white; width: 100%; }

.MB-centerBox { width: 100%; display: flex; justify-content: center; }

#submitbtn { background-color: #BCE074; color: white; width: 150px; height: 50px; font-size: 1.1em; }
#submitbtn:hover { transition: background 0.75s; background: rgb(233, 248, 204); font-size: 1.15em; color: black; }

#canclebtn { background-color: black; color: white; width: 150px; height: 50px; font-size: 1.1em; }
#canclebtn:hover { transition: background 0.75s; background: rgb(143, 142, 142); font-size: 1.15em; color: white; }

.checked-day {width: 100%; display: flex; justify-content: center; height: 100px; line-height: 50px; padding-top: 20px; }

#checkResult, #checkResult2{width: 500px; height: 50px; border: none; font-weight: bold;}

.checked-menu{background-color: white; padding-right: 10px; }

.form-box{width: 100%; display: flex; justify-content: center; padding-top: 30px;}

#id-text{border: none;}

#sdate-label{background-color: white; vertical-align: top;}

.now-id{padding-bottom:10px;}

#day-title{border : none; width:70px;}
</style>
</head>
<%@ include file="../include/greenHeader.jsp"%>
<body>
	<div class="headerList">
		<img src="<c:url value="/resources/img/headerimg.jpg"/>" width="100%"
			height="180px" alt="">
	</div>

<div class="select-abstract-box"></div>

	<div class="List-wrapper">
		<div class="container">
			<div class="wrapper">
				<div class="home-menu">
					<a href="<c:url value='/' />"><i class="fas fa-home"></i>HOME</a> >
					<a href="${pageContext.request.contextPath }/menu/sm">식단고르기</a>
					> ${productVO.pname }
				</div>
			</div>
		</div>
	</div>
	


	<div class="calendar-container">
		<div class="cal_top">
			<a href="#" id="movePrevMonth"><span id="prevMonth"
				class="cal_tit">&lt;</span></a> <span id="cal_top_year"></span> <span
				id="cal_top_month"></span> <a href="#" id="moveNextMonth"><span
				id="nextMonth" class="cal_tit">&gt;</span></a>
			<div class="small-font">드시고자 하는 날짜의 메뉴를 잘 확인하시기 바랍니다</div>
			<div class="small-font2">* 주문한 상품의 일자만큼 선택이 가능합니다</div>
		</div>
		<div id="cal_tab" class="cal">
		<form id="selectMenu" action="${pageContext.request.contextPath }/menu/selectJS" method="POST">
		<input type="hidden" name="smenu" value="${list.get(0).menu }"/>
		
			<table class="calendar">
				<tr id="day-tr">
					<th>월</th>
					<th>화</th>
					<th>수</th>
					<th>목</th>
					<th>금</th>
				</tr>
				<tr height="180">
					<c:forEach begin="2" end="${list.get(0).mdate.day}">
						<td></td>
					</c:forEach>
					<c:forEach var="list" items="${list}" varStatus="status">
						<fmt:formatDate value="${list.mdate}" pattern="yyyy-MM-dd"
							var="mdate" />
						<fmt:formatDate value="${list.mdate}" pattern="d" var="day" />
						<fmt:formatDate var="mdate" value="${list.mdate}" pattern="yyyy-MM-dd" />
						<td
							style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap">
							<div class="cal-day">
<%-- 								${ day} 
								<input type="checkbox" onchange="checkBox(this)" name="selectedDate"  value="${mdate }"> --%>
								<input type="hidden" name="sdate" value="${list.mdate }" id="day-title"/>
								<%-- ${ day} --%> 
								<input type="checkbox" onchange="checkBox(this)" name="smnum"  value="${list.mnum }">
								<div class="cal-check"></div>
							</div>
							<div class="cal-schedule">
								<c:if test="${list.mdate == mdate}">

									<strong id="maindish-title"> ${list.maindish}</strong>
									<br>
                  ${list.maindish}<br>
                  <c:if test="${!empty list.rice }">
                  ${list.rice}<br>
                  </c:if>
                  
                  <c:if test="${!empty list.side1 }">
                  ${list.side1}<br>
                  </c:if>
                  <c:if test="${!empty list.side2 }">
                  ${list.side2}<br>
                  </c:if>
                  <c:if test="${!empty list.side3 }">
                  ${list.side3}<br>
                  </c:if>
                  <c:if test="${!empty list.side_side }">
                  ${list.side_side}<br>
                  </c:if>
                  <c:if test="${!empty list.salad }">
                  ${list.salad }<br>
                  </c:if>
                  <c:if test="${!empty list.soup }">
                  ${list.soup}<br>
                  </c:if>
                      칼로리 : ${list.cal}kcal<br>
								</c:if>
								<input type="hidden" name="smnum" value="${list.mnum }" />
							</div>
						</td>
						<c:if
							test="${status.current.mdate.day%5 == 0 
                  			and status.current.mdate.day> 0 
                  			and status.current.mdate.day != status.end}">
				</tr>
				<tr>
					</c:if>
					</c:forEach>
					<td></td>
				</tr>
			</table>
		</div>
	</div>
			
	<div class="form-box">
 
<div class="checked-menu">선택메뉴 : </div>
		<textarea id="checkResult" readonly="readonly"></textarea> 
	</div>
	<div class="Menu-BtnBox">
		<div class="MB-centerBox">
			<div>
				 <button id="submitbtn">선 택 완 료</button> 
			</div>
			<div>
				<button id="canclebtn">주 문 취 소</button>
			</div>
		</div>
	</div>
 	<%-- </form:form>  --%>
</div>
</form>
</body>
<%@ include file="../include/greenFooter.jsp"%>
</html>