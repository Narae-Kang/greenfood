<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>그린푸드 상품목록</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/productinclude.css"/>" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-1/css/all.min.css" />
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
<script src="<c:url value="/resources/js/main.js"/>" ></script>

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
    //스크롤이 생기도록 <br> 을 여러게 넣은 부분..
    $(document).ready(function(){ for( var i=0; i<200; i++ ) {$('#brr').html($('#brr').html() +"<br>" + i);} });
    
 
    </script> 
<style>
       
body{margin: 0;}
.container {  
	padding-top: 20px;
	display: flex;
	justify-content: center;
	width: 1024px;}

.headerList{position: absolute; top: 70px;}
.List-wrapper{    width: 100%; display: flex; justify-content: center; margin-top : 110px;}

.List-wrapper2{    width: 100%; display: flex; justify-content: center;}

.wrapper { width: 1200px; }

.home-menu{padding-left: 20px; padding-top: 30px;}
.home-menu h2 { font-size: 2em; }

.home-menu a:hover{font-weight: 600;}
a { text-decoration: none; color: black; }

.itemList {width: 1200px;}

.itemList ul li{display: inline-block;}

#item1, #item2, #item3, #item4{ padding-left: 20px; padding-bottom: 75px;}

#item1 a:hover, #item2 a:hover, #item3 a:hover, #item4 a:hover{font-weight: 600;}
   
#greenJS-title, #greenrice-title, #greenspecial-title, #greendiet-title{font-size: 1.25em; padding : 10px 0;}


/* 사이드 메뉴 */
#scroll{width: 90px; height: 200px;  text-align: center; background-color: white; border-radius: 5px; padding-top:300px;}
   .sd0 {background-color: black; color: white; padding:0;}
   .sd1, .sd2, .sd3, .sd4{padding-top: 5px;}
   .sd1 a, .sd2 a, .sd3 a, .sd4 a{background-color: white;} 
   .sd1 a:hover, .sd2 a:hover, .sd3 a:hover, .sd4 a:hover{font-weight: 900;} 
   #scroll{ position: relative; left: 345px; bottom: 600px; }
   /*============================================================================================*/
   
</style>
</head>
<body>
	<%@ include file="../include/greenHeader.jsp" %>		
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
        <img src="<c:url value="/resources/img/headerimg.jpg"/>" width="100%" height="240px" alt="">
    </div>

    

    <div class="List-wrapper">
        <div class="container">
            <div class="wrapper">
                <div class="home-menu">
                    <a href="<c:url value='/' />"><i class="fas fa-home"></i>HOME</a> > <a href="${pageContext.request.contextPath }/product/list">맛있는 한끼</a>
                    <h2>전체상품</h2>
                </div>
            </div>
        </div>
    </div>


    <div class="List-wrapper2">
        <div class="itemList">
            <ul>
		
			
                <li id="item1">
                    <div>
                        <div><a href="${pageContext.request.contextPath }/product/greenJs/1">
                                <img src="<c:url value="/resources/img/koreanfood.jpg"/>" width="480px" height="480px" alt="">
                                <div id="greenJS-title">그린정식</div>
                                정성 가득한 한식메뉴를 즐길수 있는 그린푸드의 대표 상품입니다.
                            </a>
                        </div>
                    </div>
                </li>


                <li id="item2">
                    <div>
                        <div><a href="${pageContext.request.contextPath }/product/greenRice/4">
                                <img src="<c:url value="/resources/img/rice.jpg"/>" width="480px" height="480px" alt="">
                                <div id="greenJS-title">그린덮밥</div>
                                한그릇으로 즐기는 다양한 나라의 특색있는 메뉴를 즐길수 있습니다.
                            </a>
                        </div>
                    </div>
                </li>

                <li id="item3">
                    <div>
                        <div><a href="${pageContext.request.contextPath }/product/greenSP/7">
                                <img src="<c:url value="/resources/img/greenspecial.jpg"/>" width="480px" height="480px" alt="">
                                <div id="greenJS-title">그린 스페셜</div>
                                좀 더 특별하고, 고급스러운 맛을 느껴보실 수 있는 상품입니다.
                            </a>
                        </div>
                    </div>
                </li>

                <li id="item4">
                    <div>
                        <div><a href="${pageContext.request.contextPath }/product/greenDiet/10">
                        <img src="<c:url value="/resources/img/diet.jpg"/>" width="480px" height="480px" alt="">
                                <div id="greenJS-title">그린 다이어트</div>
                                맛과 영양이 가득하지만 한층 가벼운 구성의 상품입니다.
                            </a>
                        </div>
                    </div>
                </li>
                			
            </ul>
        </div>
    </div>

		<%@ include file="../include/greenFooter.jsp" %>
</body>
</html>