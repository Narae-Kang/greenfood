window.addEventListener("load",init,false);
function init(){
  var findIDBtn2 = window.document.getElementById("findIDBtn2");

  findIDBtn2.addEventListener("click",function(e){    
    var result = checkFindID();
    if(result){
     //AJAX 사용
     //1) XMLHttpRequest객체 생성
     var xhttp = new XMLHttpRequest();
     //2) 서버응답처리
     xhttp.addEventListener("readystatechange",ajaxCall,false);
     function ajaxCall(){
		   if (this.readyState == 4 && this.status == 200) {
			 
			//json포맷 문자열  => 자바스크립트 obj
			  var jsonObj = JSON.parse(this.responseText);
			  //console.log(jsonObj.id);
			  if(jsonObj.success){
					document.getElementById("id").value = jsonObj.id;
					document.getElementById("birthMsg").innerHTML = "";
			  }else{
					document.getElementById("id").value = "";
					document.getElementById("birthMsg").innerHTML = jsonObj.msg;
			  }
		   }// end if(this.readyState == 4 && this.status == 200)
     }// end of function ajaxCall()
     
		 //3) 서비스 요청
     var sendData = {};
     sendData.tel   = document.getElementById("tel").value;
     sendData.birth = document.getElementById("birth").value;
     //자바스크립트 obj => json포맷 문자열 변환
     var result = JSON.stringify(sendData);
     console.log(result);
     
     //post방식
     xhttp.open("POST","http://localhost:9080/greenfood/member/id",true);
     xhttp.setRequestHeader("Content-Type","application/json;charset=utf-8"); 
     xhttp.send(result);
     //get방식
//     xhttp.open("GET","http://localhost:9080/portfolio/member/id/"+sendData.tel+"/"+sendData.birth,true);   
//     xhttp.send();
    }
  },false);
}
//전화번호, 생년월이 유효성 체크
function checkFindID(){
  //사용자가 입력한 전화번호 읽어오기	
  var telTag = document.getElementById("tel");
  var telValue = telTag.value;
  //사용자가 입력한 생년월일 읽어오기
  var birthTag = document.getElementById("birth");
  var birthValue = birthTag.value;
  
  var flag = true; //유효성 성공유뮤 플래그
  
  //1) 전화번호 체크
  if(telValue.trim().length == 0){
    telMsg.innerHTML="전화번호를 입력하세요!";
    telMsg.classList.add("errmsg");     
    telTag.focus();
    flag = false;
    return flag;
  }
  //2) 생년월일체크
  if(birthValue.trim().length == 0){
    telMsg.innerHTML="";
    birthMsg.innerHTML="생년월일를 입력하세요!";
    birthMsg.classList.add("errmsg");  
    birthTag.focus();
    flag = false;
    return flag;
  }
  telMsg.innerHTML="";
  birthMsg.innerHTML="";
  return flag;
}