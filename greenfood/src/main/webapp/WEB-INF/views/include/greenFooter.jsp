<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- <c:set var="contextRoot" value="${pageContext.request.contextPath }" /> --%>
   <footer id="footer">
      <div id="footerContainerAll"> 
        <div id="footerContainer">
          <!--푸터 메뉴-->
          <div class="footerContent">
            <div class="linkMenu">
              <ul>
                <li><a href="">이용약관</a></li>
                <li><a href="">개인정보취급방침</a></li>
                <li><a href="${pageContext.request.contextPath }/board/writeForm/Q&A/1">제휴문의</a></li>
                <li><a href="${pageContext.request.contextPath }/board/writeForm/Q&A/1">고객센터</a></li>
              </ul> 
            </div>
            <div class="teamInfo">
              <ul>
                <li>주식회사: GREEN FOOD</li>
                <li>대표이사: 김현욱</li>
                <li>주소: 서울특별시 강남구 학동로 123</li>
              </ul>
            </div>   
            <div class="numberInfo">
              <ul>
                <li>사업자 등록번호 : 106-81-00120</li>
                <li>통신판매업 신고번호:제2020-강남-0014</li>
              </ul>
            </div>   
          </div>  <!-- footerContent끝 -->
          <div class="footerLogo"><a href="<c:url value="/" />"><img src="<c:url value="/resources/img/logo.png"/>" alt="banner"></a></div>
        </div>  
      </div>
    </footer>
    
    