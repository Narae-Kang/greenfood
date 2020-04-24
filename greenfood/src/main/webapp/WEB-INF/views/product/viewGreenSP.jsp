<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>GREEN FOOD</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/productinclude.css"/>" />
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-1/css/all.min.css" />
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap"
        rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>

  <script type="text/javascript"> 
    function scroll_follow(id) {
      $(window).scroll(function ()  //스크롤이 움직일때마다 이벤트 발생
      {
        var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.
        // if(position>100){
            $(id).stop().animate({ top: position + 25 + "px" },800); //해당 오브젝트 위치값 재설정
        // }else {
            // $(id).stop().animate({ top:-310 + "px" }, 0); //해당 오브젝트 위치값 재설정
        // }
      });
    }
    scroll_follow("#scroll");
    //스크롤이 생기도록 <br> 을 여러게 넣은 부분
    $(document).ready(function(){ for( var i=0; i<200; i++ ) {$('#brr').html($('#brr').html() +"<br>" + i);} });
 
    </script> 
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
//               drawCalendar();
              initDate();
              drawDays();
              drawSche();
              $("#movePrevMonth").on("click", function(){movePrevMonth();});
              $("#moveNextMonth").on("click", function(){moveNextMonth();});
          });
          
          //날짜 초기화
           function initDate(){
              $tdDay = $("td div.cal-day")
              $tdSche = $("td div.cal-schedule")
              dayCount = 0;
              today = new Date();
              year = today.getFullYear();
              month = today.getMonth()+1;
              if(month < 10){month = "0"+month;}
              firstDay = new Date(year,month-1,1);
              lastDay = new Date(year,month,0);
          } 
          
           //calendar 날짜표시
           function drawDays(){
                $("#cal_top_year").text(year);
               $("#cal_top_month").text(month);

           }
          
          //calendar 월 이동
           function movePrevMonth(){
              month--;
              if(month<=0){
                  month=12;
                  year--;
              }
              if(month<10){
                  month=String("0"+month);
              }
              getNewInfo();
              }
          
          function moveNextMonth(){
              month++;
              if(month>12){
                  month=1;
                  year++;
              }
              if(month<10){
                  month=String("0"+month);
              }
              getNewInfo();
          }
          
          //정보갱신
          function getNewInfo(){
              for(var i=0;i<35;i++){
                  $tdDay.eq(i).text("");
                  $tdSche.eq(i).text("");
              }
              dayCount=0;
              firstDay = new Date(year,month-1,1);
              lastDay = new Date(year,month,0);
              drawDays();
              drawSche();
          }
          
          //스케줄 그리기
           function drawSche(){
              setData();
              var dateMatch = null;
              for(var i=firstDay.getDay();i<firstDay.getDay()+lastDay.getDate();i++){
                  var txt = "";
                  txt =jsonData[year];
                  if(txt){
                      txt = jsonData[year][month];
                      if(txt){
                          txt = jsonData[year][month][i];
                          dateMatch = firstDay.getDay() + i -1; 
                          $tdSche.eq(dateMatch).text(txt);
                      }
                  }
              }
          } 

           </script>



     <style>
        body{margin: 0;}
     .headerList{position: absolute; top: 80px;}
        .container {  padding-top: 30px; display: flex; justify-content: center; width: 1024px;}

        .List-wrapper{    width: 100%; display: flex; justify-content: center;}
        .List-wrapper2{    width: 100%; display: flex; justify-content: center;}

        .wrapper { width: 1024px; }

        .home-menu{padding-top: 50px; padding-left: 20px; padding-bottom: 20px;}
        .home-menu h2 { font-size: 2em; }

        .home-menu a:hover{font-weight: 600;}
        a { text-decoration: none; color: black; }

        .itemList {width: 1024px; display: flex;}
        .itemList ul li{display: inline-block;}
        
        #item1, #item2, #item3, #item4{ padding-left: 20px; padding-bottom: 75px;}
        #item1 a:hover, #item2 a:hover, #item3 a:hover, #item4 a:hover{font-weight: 600;}
        
        .product-info{ width: 100%; padding-left: 20px; padding-right: 20px;}
        .product-info h2 { font-size: 2em; font-weight: 500;}

        .green-title{font-size: 2em; padding-left: 0px; padding-bottom: 5px; }
        .sub-inform{color: rgb(165, 162, 162); padding-left: 10px;     padding-bottom: 20px;}

        .price{display: flex; padding-bottom: 15px;}
        .price-title{padding: 10px 15px 10px 15px;}
        .price-num{padding:  10px 15px 10px 15px; color: #7AB62E; font-weight: bold;}
        
        .guide{display: flex; padding-bottom: 15px;}
        .guide-title{padding: 10px 15px 10px 15px; line-height: 40px;}
        .guide-text{padding: 15px 10px 10px 10px;
    font-size: 0.9em;}

        .choice{display: flex;}
        .pnnum-label{padding-right: 6px; line-height:40px; width: 30%;}
        .choice-title{padding: 10px 10px 10px 15px; width: 100%; display: flex; }
        
        .selectedPrice1, .selectedPrice2, .selectedPrice3 { display: none;}
        
        .choice select{    width: 100%; padding: 5px 30px 5px 70px; text-align: center;}
        
        .quantity{display: flex;}
        .quantity-title{line-height: 40px; padding: 10px 15px 10px 15px;}
        .quantity-title2{line-height: 40px; padding: 10px 15px 10px 15px;}
        #quantity{padding: 8px 30px; }
        .quantity-count{    padding: 10px; line-height: 40px;}

        .final-price{display: flex; padding-top: 15px;}
        .fprice-title{padding: 10px 15px 10px 15px;}
        .fprice-num{padding:  10px 15px 10px 15px; color: #7AB62E; font-weight: bold; }

        .Btn-box{margin: 0; width: 100%; display: flex; justify-content: space-between; padding-top: 28px;}

        #cart_Btn{width: 200px; height: 70px; background-color: #333; color: white; border: 1px solid black;}
        #cart_Btn:hover{transition: 0.3s; border: 1px solid #333; background-color: white; color: black;}

        #order_Btn{background-color: #BCE074; width: 200px; height: 70px; border: 1px solid rgba(0, 0, 0, 0.212);}
        #order_Btn:hover{transition: 0.3s; border: 1px solid #333; background-color: white; color: black;}

        .cal_top{ text-align: center; font-size: 30px; padding-top: 100px; }
        .cal{ text-align: center; /* background-color: wheat; */ width: 100%; }

        table.calendar{     width: 1024px; display: inline-table; text-align: left;}
        
        table.calendar tr{ text-align: center; }
        table.calendar th{ text-align: center; }
        table.calendar td{ vertical-align: top; width: 100px; padding-top: 10px; border-bottom: 1px solid #EAEAEA; }

				#day-tr{background-color: whitesmoke;}
        .small-font{font-size: 0.65em; color: #a4a4a4;}
        .small-font2{font-size: 0.5em; color: red; height: 100px; padding-top: 10px;}

        .calendar-container{width: 100%; }
        .cal-schedule{font-size: 0.85em; line-height: 20px; height: 130px;}
        #maindish-title{font-size: 1em;}
        
        .consist-box-container h2{font-size: 2em; height: 100%; text-align: center; padding-top: 50px;}
        
        .consist-title1{width: 100%; font-size: 1.25em; font-weight: 600; }
        .consist-box-wrapper{width: 100%; text-align: center;}
        .consist-box{display: flex; justify-content: center;}
        .consist-info{width: 25%; padding-left: 30px;}
        
        .consist-title1-son{width : 100%; display: flex; justify-content: center;}
        .consist-title1-grandson{width: 1024px; text-align: left; height: 50px; line-height: 50px; font-size: 1.25em;}
          
          .hr-box{width: 100%;}
          .hr-box hr{width: 1024px;}
          
          .consist-box-biggest{width: 100%; display: flex; justify-content: center;}
          .consist-box-bigger{width: 1024px;}
          .consist-abstract-box{    width: 100%; height: 255px;}
          .consist-of-menu{display: flex;}
          
          .font-strong{font-size: 2em; line-height: 45px;}
          .font-small{color: #a4a4a4; line-height: 60px; padding-left: 3px;}
          
          .consist-info p{color : red; font-size: 0.75em;}
          
          .rice-box-container{width: 100%; height: 100%;  text-align: center;}
          
          .rice-box-wrapper{width: 100%; text-align: center;}
          .rice-title1{width: 100%; font-size: 1.25em; font-weight: 600; }
          
          .rice-title1-son{width : 100%; display: flex; justify-content: center;}
          .rice-title1-grandson{width: 1024px; text-align: left; height: 50px; line-height: 50px; font-size: 1.25em; padding-top: 20px;}
          
          .rice-wrapper{width: 100%; display: flex; justify-content: center; }
          .rice-img{width: 100%;}
          .rice-img-inner img{width: 1024px;}
          
          .rice-info-center{text-align: center;}
          
          
          
          .origin-box-container{width: 100%; height: 100%;  text-align: center;}
          
          .origin-box-wrapper{width: 100%; text-align: center;}
          .origin-title1{width: 100%; font-size: 1.25em; font-weight: 600; }
          
          .origin-title1-son{width : 100%; display: flex; justify-content: center;}
          .origin-title1-grandson{width: 1024px; text-align: left; height: 50px; line-height: 50px; font-size: 1.25em; padding-top: 20px;}

          .origin-wrapper{width: 100%; display: flex; justify-content: center; }
          .origin-img{width: 100%;}
          .origin-img-inner img{width: 1024px;}
          
          .origin-info-center{text-align: center;}

          #greenJS-title, #greenrice-title, #greenspecial-title, #greendiet-title{font-size: 1.25em;}
          /*========================================================================
          ==========================================================================*/
          /*반응형 1028px일때 오른쪽 설명 및 기능파트 하단으로 이동*/
          @media only screen and (max-width:818px) {
            
            /* *{margin: 0; padding : 0px;} */
            
            .itemList {display: inline;}

            .main-image{width: 100%; }
          }
          /*====================================*/
          
           @media only screen and (max-width:1410px) {
            
          #scroll { display : none;}
          }
          
          /* 사이드 메뉴 */
#scroll{width: 90px; height: 200px;  text-align: center; background-color: white; border-radius: 5px; }
   .sd0 {background-color: black; color: white; padding:0;}
   .sd1, .sd2, .sd3, .sd4{padding-top: 5px;}
   .sd1 a, .sd2 a, .sd3 a, .sd4 a{background-color: white;} 
   .sd1 a:hover, .sd2 a:hover, .sd3 a:hover, .sd4 a:hover{font-weight: 900;} 
   #scroll{     position: relative;
    left: 160px;
    bottom: 600px;
    font-size: 0.85em; }
   /*============================================================================================*/
    </style>
</head>
	<%@ include file="../include/greenHeader.jsp" %>		
<body>
    <SCRIPT>
        window.document.addEventListener("load", init, false);
					function init(){
						cal(value);
						}
        function cal(value) {
                var calc = document.querySelector("#pnnumSelect");
                console.log("calc:",calc);
								var selected = calc.children[calc.selectedIndex];                
                if (selected.value == '그린스페셜 10일권') {
                    calcTotalPrice = ((7 * 20000)-10000);
                } else if (selected.value == '그린스페셜 20일권') {
                    calcTotalPrice = Math.round(8 * 325000 / 10);
                } else if (selected.value == '그린스페셜 30일권') {
                    calcTotalPrice = Math.round(9 * 433333 / 10);
                }
                var quantity = document.querySelector("#quantity"); 
                if (selected.value == '그린스페셜 10일권') {
                    calcTotalPrice2 = ((7 * 20000)-10000) * quantity.value;
                } else if (selected.value == '그린스페셜 20일권') {
                    calcTotalPrice2 = Math.round(8 * 325000 / 10) *  quantity.value;
                } else if (selected.value == '그린스페셜 30일권') {
                    calcTotalPrice2 = Math.round(9 * 433333 / 10) * quantity.value;
                }                    
                


                printNumber = NumberFormat(calcTotalPrice);
                printNumber2 = NumberFormat(calcTotalPrice2);
                total_price.innerHTML = printNumber;
                total_price2.innerHTML = printNumber2;
                // calc.exec_price.value = printNumber;
            }
            function NumberFormat(val) {
									var origin = val;
									
									var length = (""+val).length
									var cnt = 0;
									var numStr = "";
									while(origin>0){
									    const letter = origin%10;
									    numStr = letter+numStr;
									    if(cnt!==0 && length !== cnt+1 && cnt%3 === 2){
									        numStr = "," +numStr;
									    }
									    cnt++;
									    origin = Math.floor(origin/10);
									}
					return numStr +" 원";
            }
    </SCRIPT>
	<script type="text/javascript">
    window.addEventListener("load",init2,false);
    function init2(){
    	var product = document.querySelector("#pnnumSelect");
      //바로 주문하기
    	order_Btn.addEventListener("click",function(e){
        e.preventDefault();
     		let frm = document.forms['greenSP'];
     		//1)'원' 제거
     		let tmp = total_price.textContent.substr(0,total_price.textContent.length-1);
     		let tid = e.target.getAttribute('data-tid');
     		if(product.value == ""){
				alert('상품기간을 선택해주세요.');
       		}else if(product.value != "" && tid == "" && confirm('로그인 후 이용해주시기 바랍니다. \n로그인 페이지로 이동하시겠습니까?')) {
       			location.href = "${pageContext.request.contextPath }/loginForm";
       		} else if(product.value != "" && tid != "" && confirm('선택 하신 상품을 바로 주문하시겠습니까? \n주문서 작성 페이지로 이동합니다.')){
     		//2)',' 제거
     		frm.tprice.value = tmp.replace(/\,/g,"");     		
     		frm.action="${pageContext.request.contextPath }/order/noworder"
        frm.submit();
						}
      },false);

			//장바구니결제
    	cart_Btn.addEventListener("click",function(e){
        e.preventDefault();
       		let frm = document.forms['greenSP'];
       		let tid = e.target.getAttribute('data-tid');
       		//1)'원' 제거
       		let tmp = total_price.textContent.substr(0,total_price.textContent.length-1);
       		if(product.value == ""){
							alert('상품기간을 선택해주세요.');
           		}else if(product.value != "" && tid == "" && confirm('로그인 후 이용해주시기 바랍니다.\n 로그인 페이지로 이동하시겠습니까?')) {
           			location.href = "${pageContext.request.contextPath }/loginForm";
           		} else if(product.value != "" && tid != "" && confirm('장바구니에 상품이 추가되었습니다. \n장바구니 페이지로 이동하시겠습니까?.')){
       		//2)',' 제거
       		frm.tprice.value = tmp.replace(/\,/g,"");
       		frm.action="${pageContext.request.contextPath }/order/addcart";
       		frm.submit();
           		}
      },false);
    }
    </script>
 <div  id="scroll">
        <div class="sd0"> MENU </div>
        <div class="sd1"> <a href="<c:url value='/' />">홈으로</a></div>
        <div class="sd2"><a href="${pageContext.request.contextPath }/product/greenJs/1">그린정식</a></div>
        <div class="sd3"><a href="${pageContext.request.contextPath }/product/greenRice/4">그린덮밥</a></div>
        <div class="sd3"><a href="${pageContext.request.contextPath }/product/greenSP/7">그린스페셜</a></div>
        <div class="sd3"><a href="${pageContext.request.contextPath }/product/greenDiet/10">그린다이어트</a></div>
        <div class="sd3"><a href="${pageContext.request.contextPath }/board/list/Q&A">고객센터</a></div>
      </div>
      
 <div class="headerList">
      <img src="<c:url value="/resources/img/headerimg.jpg"/>" width="100%" height="180px" alt="">
    </div>
    
    
    <div class="List-wrapper">
      <div class="container">
        <div class="wrapper">
          <div class="home-menu">
          <a href="<c:url value='/' />"><i class="fas fa-home"></i>HOME</a> > <a href="${pageContext.request.contextPath }/product/list">맛있는 한끼</a> > <a href="${pageContext.request.contextPath }/product/greenSP/7">그린스페셜</a>
          </div>
        </div>
      </div>
    </div>
    
    <div class="List-wrapper2">
      <div class="itemList">
    
        <div class="main-image"><img src="<c:url value="/resources/img/greenspecial.jpg"/>" width="550px" height="505px" alt="">
        </div>
        <form 		 id="greenSP"
       						 enctype="multipart/form-data"
        					 method="post">
        <div class="product-info">

          <div class="product-title">
            <div class="green-title">
              <label>그린스페셜</label>
            </div>
            <div class="sub-inform">
              <label>${productVO.pdetail }</label>
            </div>
            <hr>
          </div>
          <div class="sub-info">
            <div class="price">
              <div class="price-title"> <label>상품가격</label> </div>
              <div class="price-num">
 							<span id="total_price"></span>
 							</div>
            </div>
            <div class="guide">
              <div class="guide-title"> 배송 안내 </div>
              <div class="guide-text">결제일로부터 평일기준 3일 이후 배송이 시작됩니다.
                <br>식단표는 마이페이지에서 확인 가능합니다. </div>

            </div>
    
                <!-- 받아오기 -->
    <input type="hidden" value="${productVO.pnnum }" name="tnum">
    <input type="hidden" value="${productVO.pnum }" name="tpnum">
    <input type="hidden" value="${tid }" name="tid">
    <input type="hidden" name="tprice">
    
    
    
          </div>
          <hr>
          <div class="choice">
            <div class="choice-title">
            <div class="pnnum-label">
            <label>기간선택</label>
            </div>
            <select  id="pnnumSelect" onChange='cal();' name="pname">
            	<option value=""><<< 상품 선택 >>></option>
              <c:forEach items="${productCategoryVO}" var="item">
              		<c:if test="${item.pnum eq productVO.pnum }">
              			<option value="${item.pname}" id="options">${item.pname}</option>
              		</c:if>
              </c:forEach>
            </select>
            </div>
          </div>
          <div class="quantity">
            <div class="quantity-title">
            수량 선택
            </div>
            <div class="quantity-count">
              <select name = "amount" id="quantity" onChange="cal();">
              <option value="1" selected="selected">1개</option>
              <option value="2">2개</option>
              <option value="3">3개</option>
              <option value="4">4개</option>
              <option value="5">5개</option>
              </select>
            </div>
          </div>
          <div class="final-price">
            <div class="fprice-title"> 결체 총액 </div>
            <div class="fprice-num">
            <span id='total_price2'></span>
            </div>
          </div>
          <ul class="Btn-box">
            <li>
              <div class="cart-Btn">
                <button type="submit" id="cart_Btn" name="addcart" value="addcart" data-tid="${tid }">장바구니 담기</button>
              </div>
            </li>
            <li>
              <div class="order-Btn">
                <button type="submit" id="order_Btn"  name="noworder" value="noworder" data-tid="${tid }">바로 주문하기</button>
              </div>
            </li>
          </ul>
        </div>
        </form>
        <div class="calendar-box">
          <div></div>
        </div>
      </div>
    </div>
    
<%--     <%@ include file="../menu/greenJSList.jsp" %> --%>
    
   <div class="calendar-container">
      <div class="cal_top">
        <a href="#" id="movePrevMonth"><span id="prevMonth" class="cal_tit">&lt;</span></a>
        <span id="cal_top_year"></span>
        <span id="cal_top_month"></span>
        <a href="#" id="moveNextMonth"><span id="nextMonth" class="cal_tit">&gt;</span></a>
        <div class="small-font">드시고자 하는 날짜의 메뉴를 잘 확인하시기 바랍니다</div>
        <div class="small-font2"> * 식자재 상황에 따라 제품이 변경될 수 있습니다</div>
      </div>
      <div id="cal_tab" class="cal">
      	<table class="calendar">
              <tr id="day-tr"> 
              	<th>월</th><th>화</th><th>수</th><th>목</th><th>금</th> 
              </tr>
              
              <tr height="130">        
<%--               		<h1>day:${listJS.get(0).mdate.day}</h1> --%>
              		<c:forEach begin="2" end="${listSP.get(0).mdate.day}">
              			<td></td>
              		</c:forEach>         
                  <c:forEach var="sp" items="${listSP}" varStatus="status">
                  <fmt:formatDate value="${sp.mdate}" pattern="yyyy-MM-dd" var="mdate" />
                  <fmt:formatDate value="${sp.mdate}" pattern="d" var="day" />
                  <fmt:parseDate var="mdate" value="${sp.mdate}" pattern="yyyy-MM-dd" />
							<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap">
                  <div class="cal-day">
										${ day}
                  </div>
                  <!-- <input type="checkbox" name="" id=""> -->
                  <div class="cal-schedule">
								<c:if test="${sp.mdate == mdate}">                      
                  <strong id="maindish-title"> ${sp.maindish}</strong><br>
                  ${sp.rice}<br>
                  ${sp.side_side}<br>
                  ${sp.salad}<br>
                      칼로리 : ${sp.cal}kcal<br>
                  </c:if> 
                  </div>
                  </td>
                  <c:if test="${status.current.mdate.day%5 == 0 
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
    
    <div class="consist-box-container">
      <div class="consist-ifno">
        <h2>그린스페셜 구성내용</h2>
      </div>
      <div class="consist-box-wrapper">
        <div class="consist-title1">
          <div class="consist-title1-son">
            <div class="consist-title1-grandson">
              구성
            </div>
          </div>
          <div class="hr-box">
            <hr>
          </div>
        </div>
      </div>
    </div>
    
    <div class="consist-box-biggest">
      <div class="consist-box-bigger">
        <div class="consist-box">
          <div class="consist-image-box"><img src="<c:url value="/resources/img/greenspecial-main.jpg"/>" width="760px" height="460px" alt=""></div>
          <div class="consist-info">
            <div class="consist-abstract-box"></div>
            <div class="consist-of-menu">
              <div class="font-strong"> </div>
              <div class="font-small">  </div>
            </div>
            <div class="consist-of-menu">
              <div class="font-strong">메인요리 </div>
              <div class="font-small"> (260~300g) </div>
            </div>
            <div class="consist-of-menu">
              <div class="font-strong">샐러드</div>
              <div class="font-small"> (80~90g) </div>
            </div>
            <div class="consist-of-menu">
              <div class="font-strong">반찬 </div>
              <div class="font-small"> 1종(30~35g) </div>
            </div>
            <p>* 중량은 메뉴에 따라 상이할 수 있습니다.</p>
          </div>
        </div>
      </div>
    </div>
    
      <div class="rice-box-container">
        <div class="rice-box-wrapper">
          <div class="rice-title1">
            <div class="rice-title1-son">
              <div class="rice-title1-grandson">
                메인요리
              </div>
            </div>
            <div class="hr-box">
              <hr>
            </div>
          </div>
        </div>
      </div>
      <div class="rice-wrapper">
          <div class="rice-img-inner">
            <img src="<c:url value="/resources/img/special-main.jpg"/>" alt="">
            <div class="rice-info-center"> 파스타, 샌드위치, 스테이크 등을 맛보실 수 있습니다. (1인 기준 260~300g 내외)</div>
        </div>
      </div>
            <div class="rice-box-container">
        <div class="rice-box-wrapper">
          <div class="rice-title1">
            <div class="rice-title1-son">
              <div class="rice-title1-grandson">
                샐러드
              </div>
            </div>
            <div class="hr-box">
              <hr>
            </div>
          </div>
        </div>
      </div>
      <div class="rice-wrapper">
          <div class="rice-img-inner">
            <img src="<c:url value="/resources/img/rice-salad.jpg"/>" alt="">
            <div class="rice-info-center"> 메인요리와 함께 제공되는 샐러드입니다. (1인 기준 35~40g 내외)</div>
        </div>
      </div>
      <div class="origin-box-container">
        <div class="origin-box-wrapper">
          <div class="origin-title1">
            <div class="origin-title1-son">
              <div class="origin-title1-grandson">
                원산지
              </div>
            </div>
            <div class="hr-box">
              <hr>
            </div>
          </div>
        </div>
      </div>
      <div class="origin-wrapper">
          <div class="origin-img-inner">
            <img src="<c:url value="/resources/img/origin-table.jpg"/>" alt="">
        </div>
      </div>
</body>
	<%@ include file="../include/greenFooter.jsp" %>
</html>