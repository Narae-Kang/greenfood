<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>나의 상품 정보</title>
<!-- 구글폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-1/css/all.min.css" />  

<link rel="stylesheet" href="<c:url value='/resources/css/greenMain.css' />">

<style>
        body{
              font-family: 'Noto Sans KR', sans-serif;
        }
        table{
            width: 100%;
            border-collapse: collapse;
        }   
        .info1{
            font-size: 27px;
            margin: 60px;
        }
        .info2{
            text-align: left;
            font-size: 1em;
            padding-bottom:12px; 
            font-weight: bold;
        }
        .order_info{
            margin-bottom: 50px;
        }
        .order_info tr th{
            background-color: #f1f1f1;
            border-top: 1px solid rgba(71, 64, 64, 0.192);
            border-bottom: 1px solid rgba(71, 64, 64, 0.192);
            padding: 17px 0 17px 0;
            font-size: 15px;
            font-weight: bold;
        }
        .order_info tr td{
            border-bottom: 1px solid rgba(71, 64, 64, 0.192);
            text-align: center;
            font-size: 14px;
            padding: 15px 0 15px 0;
        }
        .col:first-child td{
            font-size: 15px;
            text-align: center;
            padding: 20px 0 20px 0;
            background-color: #f1f1f1;
            border: 1px solid rgba(71, 64, 64, 0.192);
            font-weight: bold;
        }
        .order_menu .row td{
            text-align : center;
            padding: 17px 0 17px 6px;
            font-size: 14px;
            border: 1px solid rgba(71, 64, 64, 0.192);
        }
        #order_review{
              background-color: rgb(188, 224, 116);
              border: 1px solid #dfdfdf;
              padding: 8px 20px;
        }
        .infoList1{
              display: flex;
              justify-content: center;  
        }
         .infoList2{
               padding-top: 100px;
               min-height: 64vh; 
               width: 1200px;
         }
         .menu{
              text-align: left;
               font-size: 1em;
               padding-bottom: 12px;
               font-weight: bold;
         }
         #order_review{
                 font-weight: bold;
         }
         .paging {
                  padding: 12px 0 0;
                  margin: 0;
                  text-align: center;
               }
               
               .paging li {
                  display: inline-block;
                  margin: 0 2px;
               }
               
               .paging li a {
                  height: 21px;
                  text-align: center;
                  display: block;
               }
               
               .front-paging {
                  width: 27px;
                  border: 1px solid #e0e0e0;
               }
               
               #ll {
                  background:
                     url("../img/icon_arrow_page_ll.png")
                     no-repeat center center;
               }
               
               #l {
                  background:
                     url("../img/icon_arrow_page_l.png")
                     no-repeat center center;
               }
               
               #r {
                  background:
                     url("../img/icon_arrow_page_r.png")
                     no-repeat center center;
               }
               
               #rr {
                  background:
                     url("../img/icon_arrow_page_rr.png")
                     no-repeat center center;
               }
               

         .paging-number {
                     padding: 4px 10px 2px;
                     font-size: 12px;
            }
            .search-area {
               padding: 10px;
               border: 1px solid #e8e8e8;
               border-left: 0;
               border-right: 0;
               background: #f7f7f7;
               margin-top: 12px !important;
               text-align: center;
            }
            
            .search-item {
               display: inline-block;
               background: #fff;
               vertical-align: middle;
            }
            
            #searchType {
               height: 28px;
               border: 1px solid #d0d0d0;
               font-size: 11px;
            }
            
            .search-item-keyword {
               width: 210px;
               height: 26px;
               border: 1px solid #d0d0d0;
            }
            
            #keyword {
               width: 100%;
               height: 24px;
               padding: 0;
               border: 1px solid #fff;
               color: #979797;
               line-height: 24px;
               font-size: 11px;
            }
            
            #searchBtn {
               width: 50px;
               height: 28px;
               line-height: 26px;
               font-size: 11px;
               background: #BCE074;
               border: 1px solid rgba(0, 0, 0, 0.212);
               color: #fff;
            }
            #pagingnumber {
               border: 1px solid #3e3d3c;
            }
            .prev-next {
               padding: 0 0 6px;
            }
            .onum_th{
               border-right: 1px solid #d0d0d0;
            }
</style>
</head>
<body>
<!-- header -->
<%@ include file="../include/greenHeader.jsp"%>
<div class="infoList1">
<div class="infoList2">
 <table class="order_info">
        <colgroup>
            <col style="width: 60px;">
            <col style="width: 160px;">
            <col style="width: 120px;">
            <col style="width: 80px;">
            <col style="width: 80px;">
        </colgroup>
        <caption class="info1">나의쇼핑정보</caption>
        <caption class="info2">주문상품정보</caption>
        <thead>
            <tr>
                <th>주문번호</th>
                <th>상품정보</th>
                <th>수량</th>
                <th>상품구매금액</th>
                <th>주문상태</th>
            </tr>
        </thead>
        <tbody>
            <!-- 이전 주문번호 -->      
           <c:set var="preonum" value="${info.onum }" />
           <!-- 총레코드수 -->
           <c:set var="last" value="${infoList.size()}" />

                <!-- 전체 주문 정보 -->
           <c:forEach items="${infoList }" var="info" varStatus="status">
           
              <!-- 주문번호가 바뀌면 -->
                <c:if test="${preonum != info.onum }">
                      <c:set var="cnt" value="0" />
                     <!-- 주문번호가 같은 항목갯수 카운트 -->
                    <c:forEach items="${infoList }" var="info2">
                             <c:if test="${info.onum == info2.onum }" >
                                  <c:set var="cnt" value="${cnt+1 }" />
                               </c:if>
                    </c:forEach>                   
            <tr>                           
                <td rowspan="${cnt}"  class="onum_th"><a href="${pageContext.request.contextPath }/order/orderReadForm?onum=${info.onum}" style="border-bottom: 1px solid gray;"> [${info.onum }]</a></td>
                </c:if>

                <c:if test="${last == status.index+1 }">
                   <tr>                           
                </c:if>          
                               
            <td>${info.pname }</td>
            <td>${info.amount }</td>
            <td>${info.price }</td>
            <td>${info.state }</td>
              
            <!-- 주문번호가 바뀌면 -->
               <c:if test="${preonum != info.onum }">
            
            </c:if>
            
            <!-- 이전 주문번호 -->
            <c:set var="preonum" value="${info.onum }" />    
          </c:forEach>
        </tbody>
        <c:if test="${Ordercnt == 0 }">
           <tr>
               <td colspan="5" style="text-align: center; height: 100px;">구매한 상품이 없습니다.</td>
            </tr>
        </c:if>
    </table> 
    <table class="order_menu">
    <colgroup>
    <col style="width: 80px;">
    <col style="width: 150px;">
    <col style="width: 120px;">
    <col style="width: 80px;">
    </colgroup>
    
     <caption class="menu">식단정보</caption>
            <tr class="col">
                <td rowspan="11">식단</td>
                <td>식단명</td>
                <td>날짜</td>
                <td>리뷰</td>
            </tr>
            <c:forEach items="${SelectmenuList }" var="selectMenu">
            <tr class="row">
                <td>${selectMenu.smenu }</td>
                <td>${selectMenu.sdate }</td>
                <td>
                <jsp:useBean id="now" class="java.util.Date" />
                        <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
                        <fmt:parseDate value="${selectMenu.sdate}" var="sdate" pattern="yyyy-MM-dd" />
                      <fmt:formatDate var="sdate" pattern="yyyy-MM-dd" value="${sdate}" />

                <c:if test="${sdate <= today }">
                <a id="order_review" href="${pageContext.request.contextPath }/board/writeForm/REVIEW/1">리뷰</a>
                </c:if> 
                </td> 
            </tr> 
            </c:forEach>
           
       
    </table>
    <table>
         <c:if test="${MenuCnt == 0 }">
           <tr>
               <td colspan="3" style="font-size:14px; text-align: center; height: 100px; border-bottom: 1px solid rgba(71, 64, 64, 0.192);">
               주문한 식단이 없습니다</td>
            </tr>
        </c:if>
        </table>
    <ul class="paging">
               <!-- 처음페이지 / 이전페이지 이동 -->
               <c:if test="${pc.prev }">
                  <li class="front-paging" id="ll">
                     <a class="prev-next" href="${pageContext.request.contextPath }/order/infoList/1"> 
                        <img src="<c:url value='/resources/img/icon_arrow_page_ll.png' />" alt="" />
                     </a>
                  </li>
                  <li class="front-paging" id="l">
                     <a class="prev-next" href="${pageContext.request.contextPath }/order/infoList/${pc.startPage-1}">
                        <img src="<c:url value='/resources/img/icon_arrow_page_l.png' />" alt="" />
                     </a>
                  </li>
               </c:if>
               
               <c:forEach var="pageNum" begin="${pc.startPage }" end="${pc.endPage }">
                  <!-- 현재페이지와 요청페이지가 다르면 -->
                  <c:if test="${pc.rc.reqPage != pageNum }">
                     <li>
                        <a class="paging-number" href="${pageContext.request.contextPath }/order/infoList/${pageNum }/${pc.fc.searchType}/${pc.fc.keyword}">${pageNum }</a>
                     </li>
                  </c:if>
                  <!-- 현재페이지와 요청페이지가 같으면 -->
                  <c:if test="${pc.rc.reqPage == pageNum }">
                     <li id="pagingnumber">
                        <a class="paging-number" href="${pageContext.request.contextPath }/order/infoList/${pageNum}/${pc.fc.searchType}/${pc.fc.keyword}">${pageNum }</a>
                     </li>
                  </c:if>
               </c:forEach>
               <!-- 다음페이지 / 최종페이지 이동 -->
               <c:if test="${pc.next }">
                  <li class="front-paging" id="r">
                     <a class="prev-next" href="${pageContext.request.contextPath }/order/infoList/${pc.endPage+1}">
                        <img src="<c:url value='/resources/img/icon_arrow_page_r.png' />" alt="" />
                     </a>
                  </li>
                  <li class="front-paging" id="rr">
                     <a class="prev-next" href="${pageContext.request.contextPath }/order/infoList/${pc.finalEndPage}">
                        <img src="<c:url value='/resources/img/icon_arrow_page_rr.png' />" alt="" />
                     </a>
                  </li>
               </c:if>
            </ul>
             
               <div class="search-area">
               <div class="search-item">
                  <select name="searchType" id="searchType">
                     <option value="A"
                        <c:out value="${pc.fc.searchType == 'A' ? 'selected':'' }"/>>전체</option>
                  
                     <option value="C"
                        <c:out value="${pc.fc.searchType == 'C' ? 'selected':'' }"/>>식단명</option>
                  </select>
               </div>
               <div class="search-item">
                  <div class="search-item-keyword">
                     <input type="search" name="keyword" id="keyword" value="${pc.fc.keyword }" />
                  </div>
               </div>
               <div class="search-item">
                  <button id=searchBtn2>검색</button>
               </div>
               </div>
               
               
</div>
</div>
<script src="<c:url value='/resources/js/common.js' />"></script>
<script>
window.addEventListener("load", init, false);
function init() {
   //검색버튼 클릭시
   searchBtn2.addEventListener("click", function(e) {
      e.preventDefault();
      console.log("검색 버튼 클릭");
      // 검색어 입력값이 없으면
      if (keyword.value.trim().length == 0) {
         alert('검색어를 입력하세요!');
         keyword.value = "";
         keyword.focus();
         return false;
      }

      let stype = searchType.value; //검색유형
      let kword = keyword.value.trim(); //검색어

      location.href = getContextPath() + "/order/infoList"+"/1/" + stype + "/" + kword;
   }, false);
}

</script>
<!-- footer -->
<%@ include file="../include/greenFooter.jsp"%>
</body>
</html>