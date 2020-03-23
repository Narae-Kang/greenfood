<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video {
  margin: 0;
  padding: 0;
  border: 0;
  font-size: 100%;
  font: inherit;
  vertical-align: baseline;
}
html, body { min-height:100%; line-height: 1; }
ol, ul { list-style: none; }
table {	border-collapse: collapse; border-spacing: 0;}
 * { 
  box-sizing: border-box; 
  list-style: none; /* ul 앞에 점 제거 */
  text-decoration: none;  /* a태그 밑줄제거*/ 
  font-family: 'Noto Sans KR', sans-serif;
}
html{   position:relative; }
/* ================================================ 헤더시작 */  
#headerContainerAll {
  width: 100%; height: 100px;
  display: flex;
  justify-content: center;
  
}
#headerContainer {   
  width: 1024px; 
  display: flex;
  flex-direction: row;
}
.headerItem:nth-child(1) {flex: 1;} 
.headerItem:nth-child(2) {flex: 3;}
.headerItem:nth-child(3) {flex: 1;}

.headerLogo {  
  width: 250px; height: 70px;
  justify-content: center;
  align-self: center; /* 세로축 중앙정렬*/ 
}

/* 메뉴 시작 .headerNav */
.headerNav {
  display: flex;
  align-items: center;  
  justify-content: center; 
  text-align: center;  
}
ul, li {padding:0; margin:0;}/* 메뉴 글자꾸미기 */ 
.headerNav ul li {
  display: inline; /* 메뉴 가로 배치 */
  font-family: 'Noto Sans KR', sans-serif;
}
.headerNav ul {   
  font-size: 25px; 
}
.headerNav li a {
  margin: 0 50px;
  color: gray;
  font-weight: bold;
}
.headerNav > ul > li:hover > a, 
.headerNav > ul > li:active > a{
  color: darkseagreen;
}
/* ---------------------------------- 서브메뉴 시작 .headerNav */
.headerNav ul { position: relative; }
.headerNav ul ul {
  display: none;
  position: absolute;
  z-index: 1;
}
 .headerNav ul ul li {
  display: block;   /* 서브메뉴 세로 정렬 */
} 
.headerNav ul ul a {
  display: block;
  width: auto;
  min-width: 130px;
  opacity: 0.7;
  background-color: mistyrose;
  color: darkslategrey;
  text-align: center;
  transition: all .3s; 
  padding: 5px;
}
.sub1 { left: -5px;  }
.sub2 { left: 230px; }
.headerNav ul ul a:hover,  /* 마우스 위로가져갔을때 */
.headerNav ul ul a:focus{ /* tab키 눌렀을때 */
  background-color: mistyrose;
  opacity: 1;
}
.headerNav > ul > li:hover ul {
  display: block;
  z-index: 1;
}
/* 오른쪽 미니 메뉴 */
.rightMenu {
  width: 100px; height: 100px;
  padding: 25px 0 0 50px;
}
.iconMenu, .memberMenu {
  width: 160px;
  display: flex;
}
.iconMenu div {
  padding-right: 15px;
}
.memberMenu div {
  padding: 8px 15px 0 0;
}
.iconMenu a, .memberMenu a{
  font-size: 15px; color: gray;
  color: rgb(81, 163, 56);
}

/*  ================================================  본문시작 */ 
#sectionContainer {
  width: 100%;
  display: flex; flex-direction: column;
  justify-content: center;
  align-items: center;
}

/*슬라이드 쇼*/
 .sectionSlide {
  background-color: darkgray;
  width: 100%; height: 500px;  
}
.sectionSlide img {
  width: 100%; height: 500px; overflow: hidden;
}
/*타이틀 명*/
.sectionTitle { 
  width: 100%; height: 100px;
  display: flex; align-items: center;
}
.sectionTitle  p {
  color: black; font-size: 25px;
  font-weight: bold;  
}
/*베스트상품*/
.sectionBest {
  width: 1024px; height: 500px;
  display: flex;
  justify-content: center;
  flex-direction: column;
}

.bestContent {
  width: 100%; height: 400px;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: row;
  border: 1px solid gray;

}
.bestMenu:nth-child(1) {flex: 2;} 
.bestMenu:nth-child(2) {flex: 1;}
.bestMenu:nth-child(3) {flex: 1;}
.bestMenu img { padding: 0 5px; width: 100%; }

.bestMenuInfo {
  width: 100%;  min-height: 50px;
   display: flex; 
  align-items: center;
  justify-content: center; 
}
.bestMenuInfo {
  display: flex;
  justify-content: center;
  flex-direction: column;
}
.bestMenuInfo div {
  padding-top: 15px;
}
.bestMenuInfo div p{
  color : black; font-size: 16px;
  font-weight: bold;
}


/*게시판*/
.sectionBoard {
  width: 1024px; height: 400px;
  display: flex;
  justify-content: center;
  flex-direction: column;
} 
.boardContent {
  border: 1px solid gray;
  width: 100%; height: 300px;
  display: flex;
  flex-direction: row;
}
.boardMenu {
  width: 50%; 
  display: flex;
  justify-content: center;
}
.boardMenu img {
  width: 100%;
}



/*  ================================================  푸터시작 */ 
#footerContainerAll {
  width: 100%; height: 200px;
  background-color: #EAEAEA;
  margin-top: 50px;
  bottom: 0;
  display: flex;
  justify-content: center;
}
#footerContainer {
  width: 1024px;
  display: flex;
  flex-direction: row;
  align-items: center;
}
.footerContent {
  display: flex; 
  flex-direction: column;
  /* justify-content: center; */
  /* align-items: center; */
}
.footerContent div {
  
}
.footerContent div ul li a {
  display: inline-block; 
  padding: 10px 5px;
  color: gray;
}
.footerContent div ul li{
  display: inline-block; 
  padding: 10px 10px;
  color: gray;
}


/* .footerLogo {
  float: right;
} */




</style>
</head>
<body>
  <div id="conainerAll">

    <header id="header">
      <div id="headerContainerAll">
        <div id="headerContainer">

          <div class="headerItem headerLogo"><a href=""><img src="img/tbanner3.jpg" alt="banner"></a></div>

          <div class="headerItem headerNav">
            <ul>
              <li><a href="">맛있는 한끼</a>
                <ul class="sub1">
                  <li class="sub1-1"><a href="">그린 정식</a></li>
                  <li class="sub1-2"><a href="">그린 덮밥</a></li>
                  <li class="sub1-3"><a href="">그린 스페셜</a></li>
                  <li class="sub1-4"><a href="">그린 다이어트</a></li>
                </ul>
              </li>
              <li><a href="">고객 센터</a>
                <ul class="sub2">
                  <li class="sub2-1"><a href="">후기</a></li>
                  <li class="sub2-2"><a href="">Q & A</a></li>
                  <li class="sub2-3"><a href="">공지사항</a></li>
                </ul>
              </li>
            </ul>
          </div> <!--headerNav-->
          <div class="headerItem rightMenu">
            <div class="iconMenu">
              <div class="cart"><a href=""><i class="fas fa-shopping-cart fa-2x"></i></a></div>
              <div class="mypage"><a href=""><i class="fas fa-user-edit fa-2x"></i></a></div>
            </div>
            <div class="memberMenu">
              <div class="join"><a href="">JOIN</a></div>
              <div class="login"><a href="">LOGIN</a></div>
            </div>
          </div>

        </div> <!--headerWrapper 끝-->
      </div> <!--headerContainer 끝-->
    </header>

    <section id="section">
      <div id="sectionContainer">
        <!-- 이미지 슬라이드 -->
        <div class="sectionSlide">
          <img src="img/main01.jpg" alt="">
        </div>

        <!-- 베스트 메뉴-->
        <div class="sectionBest">
          <div class="sectionTitle"><p>베스트 상품</p></div>
          <div class="bestContent">
            <div class="bestMenu"><a href=""><img src="img/menuA1.jpg" alt="그린정식대표사진"></a></div>
            <div class="bestMenu">
              <div class="bestMenuImg"><img src="img/menuA2.jpg" alt=""></div>
              <div class="bestMenuInfo">
                <div><p>중화 마파두부 정식</div></p>
                <div><p>20.03.06 그린정식</p></div>
              </div>
            </div>
            <div class="bestMenu">
              <div class="bestMenuImg"><img src="img/menuA3.jpg" alt=""></div>
              <div class="bestMenuInfo">
                <div><p>고사리 듬뿍 육개장 정식</p></div>
                <div><p>20.02.29 그린정식</p></div>
              </div>
            </div>
          </div>
        </div>

        <!-- 게시판 -->
        <div class="sectionBoard">
          <div class="sectionTitle"><p>고 객 센 터</p></div>
          <div class="boardContent">
            <div class="boardMenu">
              공지사항게시판보이기하지만공지가만들어지고다시넣으려면어차피css를새로잡아줘야하기때문에저는아무것도하지않을예정입니다.보기싫겠지만뭐어쩌겠어요그럴수도있죠토요일하루종일앉아있었더니허리가아프네요다들나처럼열심히팀포폴을하고있겠지믿고싶지만사실알고있어요안하고있을거야..우리명균이는롤안한다던데무슨겡미을하고있을까기왕하는거배그나좀했으면좋겠는데민식이는어제부산도간다그랬으니오늘도술먹고늦게일어났겠지그래도한별이는공부를하고있을거라고믿고싶은데..그래그럴거야.왜이렇게뭔가를자꾸저고있냐면최대한글을많이적어서칸이어떻게차는지볼수있게해두고싶어서인데그냥쓰고싶어서쓰는거랍니다일하기싫거든요아니나도토요일에이렇게하루종일하고싶지않다고인간은주3일근무에특화되게태어났는데이건유전자를역행하는행위다증말그리고~~나는~~일요일도컴퓨터를잡았네대체왜이글자들이내맘대로움직이지않을까오른쪽으로가라고하면한번에팍가면좋잖아이짜식들아꼭그렇게밑으로위로중간으로가야겠냐하여간이새끼들은눈치라는게없어요지금도봐바옆으로일렬로쫙줄좀3잘서보라는데그걸아직도밑으로서고있어오와열모르냐이놈들아색은왜또한놈은보라색이고한놈은까만색이야까만놈어디서왜까만건데말이라도하라고아니아직도끝까지안찼네얼마나더써야하는거야내일은월요일월요일월요이이이이이이이일
            </div>
            <div class="boardMenu">
              <img src="img/centerinfo.jpg" alt="고객센터안내">
            </div>
          </div>
        </div>

      </div> <!--sectionContainer 끝-->
    
    </section>
    <footer id="footer">
      <div id="footerContainerAll"> 
        <div id="footerContainer">
          <!--푸터 메뉴-->
          <div class="footerContent">
            <div class="linkMenu">
              <ul>
                <li><a href="">이용약관</a></li>
                <li><a href="">개인정보취급방침</a></li>
                <li><a href="">제휴문의</a></li>
                <li><a href="">고객센터</a></li>
                <li><a href="">Q&A문의</a></li>
              </ul> 
            </div>
            <div class="teamInfo">
              <ul>
                <li>주식회사: GREEN FOOD</li>
                <li>대표이사: 강나래</li>
                <li>주소: 서울특별시 강남구 학동로 123</li>
              </ul>
            </div>   
          </div>  <!-- footerContent끝 -->
          <div class="footerLogo"><a href=""><img src="img/tbanner4.jpg" alt="banner"></a></div>
        </div>  
      </div>
    </footer>
  </div>  

</body>
</html>