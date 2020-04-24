<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

      
    <section id="section">
      <div id="sectionContainer">
        <!-- 메인 이미지 슬라이드 -->
	        <div class="mainSlide"> 	
	        	<div class="slideImg">		
	          	<a href=""><img src="<c:url value="/resources/img/main01.jpg"/>" alt="3"></a>
	          	<a href=""><img src="<c:url value="/resources/img/main02.jpg"/>" alt="3"></a>
	          	<a href=""><img src="<c:url value="/resources/img/main03.jpg"/>" alt="2"></a>
	          	<a href=""><img src="<c:url value="/resources/img/main04.jpg"/>" alt="2"></a>
	          </div>
				    <div class="slideNav">
			      	<a href="" class="prev">prev</a>
			      	<a href="" class="next">next</a>
			    	</div>	
			    	<div class="slideIndicator"></div>
	        </div>
	        
        <!-- 베스트 메뉴-->
        <div class="sectionBest">
          <div class="sectionTitle"><p>베스트 상품</p></div>
          <div class="bestContent">
            <div class="bestMenu best1"><a href="${pageContext.request.contextPath }/product/greenJs/1"><img src="<c:url value="/resources/img/menuA1.jpg"/>" alt="베스트정식"></a></div>
            <div class="bestMenu best2">
              <div class="bestMenuImg"><a href="${pageContext.request.contextPath }/product/greenDiet/10"><img src="<c:url value="/resources/img/menuA2.jpg"/>" alt="베스트다이어트"></a></div>
              <div class="bestMenuInfo">
                <div><p>누적판매량 1위!</p></div>
                <div><p>그린다이어트</p></div>
              </div>
            </div>
            <div class="bestMenu best3">
              <div class="bestMenuImg"><a href="${pageContext.request.contextPath }/product/greenSP/7"><img src="<c:url value="/resources/img/menuA3.jpg"/>" alt="베스트스페셜"></a></div>
              <div class="bestMenuInfo">
                <div><p>특별한 날의 선택</p></div>
                <div><p>그린스페셜</p></div>
              </div>
            </div>
          </div>
        </div>

        <!-- 게시판 -->
        <div class="sectionBoard">
          <div class="sectionTitle"><p>고 객 센 터</p></div>
          <div class="boardContent">
						<div class="boardMenu noticeHeader"><a href="<c:url value='/board/list/NOTICE' />"><img src="<c:url value="/resources/img/noticeheader3.jpg" />" alt="NOTICE" /></a></div>       
            <div class="boardMenu mainNoticeList">
							<c:forEach var="rec" items="${mainNotice }" end="5">
								<fmt:formatDate value="${rec.bcdate }" pattern="yyyy-MM-dd" var="cdate" />
								<div class="noticeList">
									<div class="noticeTitle"><a href="${pageContext.request.contextPath }/board/view/1/${rec.bnum }">${rec.btitle }</a></div>
									<div class="noticeDate"><a href="${pageContext.request.contextPath }/board/view/1/${rec.bnum }">${cdate }</a></div>
								</div>
							</c:forEach> 
            </div>
            <div class="boardMenu">
              <img src="<c:url value="/resources/img/centerinfo.jpg"/>" alt="고객센터안내">
            </div>
          </div>
        </div>

      </div> <!--sectionContainer 끝-->
    
    </section>