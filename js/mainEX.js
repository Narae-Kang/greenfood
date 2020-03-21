window.addEventListener("load",init,false);
function init() {
  var tabEle = document.getElementsByClassName("tab")[0];
  var imgEle = document.getElementsByClassName("newImg_container")[0];
  var noteEle = document.getElementsByClassName("note_container")[0];

  //햄버거 버튼 클릭시
  tabEle.addEventListener("click",function(e){
    e.preventDefault();
    displayMobileMenue();
  },false);

  //이미지 본문 클릭시
  imgEle.addEventListener("click",function(){
    var mobileEle = document.getElementById("mobile");
    mobileEle.classList.remove("active");
    imgEle.classList.remove("active");        
  },false);
  //박스 본문 클릭시
  noteEle.addEventListener("click",function(){
    var mobileEle = document.getElementById("mobile");
    mobileEle.classList.remove("active");
    noteEle.classList.remove("active");        
  },false);
}

function displayMobileMenue(){
  var mobileEle = document.getElementById("mobile");
  var imgEle = document.getElementsByClassName("newImg_container")[0];
  mobileEle.classList.add("active");
  imgEle.classList.add("active");
}


imgslide(); //페이지가 로딩될때 함수를 실행합니다
function imgslide(){
  $val = $(".new_img").attr("val"); //현재 이미지 번호를 가져옵니다
  $mx = $(".new_img").attr("mx"); //총 이미지 개수를 가져옵니다
	$("#img01"+$val).hide(); //현재 이미지를 사라지게 합니다.
	if( $val == $mx ){ $val = 1; } //현재이미지가 마지막 번호라면 1번으로 되돌립니다.
	else{ $val++; } //마지막 번호가 아니라면 카운트를 증가시켜줍니다
	$("#img01"+$val).fadeIn(500); //변경된 번호의 이미지영역을 나타나게 합니다.괄호 안에 숫자는 페이드인 되는 시간을 나타냅니다.
	$(".new_img").attr('val',$val); //변경된 이미지영역의 번호를 부여합니다.
	setTimeout('imgslide()',1000); //1초 뒤에 다시 함수를 호출합니다.(숫자값 1000당 1초)
}
