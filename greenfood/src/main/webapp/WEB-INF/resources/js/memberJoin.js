window.addEventListener("load",init,false);
function init(){
	joinBTN.addEventListener("click",function(e){
    e.preventDefault();
    if(checkValid()){
    	document.forms['joinFrm'].submit();
    }
  },false);
}
function sample6_execDaumPostcode() {
  new daum.Postcode({
      oncomplete: function(data) {
          // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

          // 각 주소의 노출 규칙에 따라 주소를 조합한다.
          // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
          var addr = ''; // 주소 변수
          var extraAddr = ''; // 참고항목 변수

          //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
          if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
              addr = data.roadAddress;
          } else { // 사용자가 지번 주소를 선택했을 경우(J)
              addr = data.jibunAddress;
          }

          // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
          if(data.userSelectedType === 'R'){
              // 법정동명이 있을 경우 추가한다. (법정리는 제외)
              // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
              if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                  extraAddr += data.bname;
              }
              // 건물명이 있고, 공동주택일 경우 추가한다.
              if(data.buildingName !== '' && data.apartment === 'Y'){
                  extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
              }
              // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
              if(extraAddr !== ''){
                  extraAddr = ' (' + extraAddr + ')';
              }
              // 조합된 참고항목을 해당 필드에 넣는다.
              document.getElementById("sample6_detailAddress").value = extraAddr;
          
          } else {
              document.getElementById("sample6_detailAddress").value = '';
          }

          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          document.getElementById('sample6_postcode').value = data.zonecode;
          document.getElementById("sample6_address").value = addr;
          // 커서를 상세주소 필드로 이동한다.
          document.getElementById("sample6_detailAddress").focus();
      }
  }).open();
}


function checkValid(){
  // 사용자 입력값 읽어오기
  var id 		= document.getElementById('id');
  var pw 		= document.getElementById('pw');
  var pwChk 	= document.getElementById('pwChk');
  var tel 		= document.getElementById('tel');
  var name 		= document.getElementById('name');
  var address 	= document.getElementById('sample6_detailAddress');
  var birth 	= document.getElementById('birth');

  var flag = true; /* 회원가입 유효성 체크 유무 */


  //아이디 미입력했을때
  if(joinFrm.id.value == ""){
    id_errmsg.innerHTML = "이메일을 입력해주세요";

    flag = flag && false;
  //공백 사용했을때
  }else if(joinFrm.id.value.indexOf(" ") >= 0) {
  	id_errmsg.innerHTML = "아이디에 공백을 사용할 수 없습니다.";

    flag = flag && false;
  //이메일 형식에 어긋날때
	}else  if(!isEmail(joinFrm.id.value)) {
    id_errmsg.innerHTML = "이메일 정보가 잘못되었습니다.";

    flag = flag && false;
  }else{
		id_errmsg.innerHTML = "";
  }   
	
  //비밀번호 미입력했을때
  if(joinFrm.pw.value == ""){
	 pw_errmsg.innerHTML = "비밀번호를 입력해주세요";

	 flag = flag && false;
	//아이디4~12자 벗어났을때
  }else if(joinFrm.pw.value.length<4 || joinFrm.pw.value.length>12) {
   pw_errmsg.innerHTML = "비밀번호를 4~12자까지 입력해주세요.";

   flag = flag && false;   
	}else{
		pw_errmsg.innerHTML = "";
  } 

  //비밀번호 재확인
  //비밀번호 일치 체크
  if(joinFrm.pwChk.value == ""){
  	pwChk_errmsg.innerHTML = "비밀번호를 입력해주세요";

 	  flag = flag && false;
 	 //비밀번호와 비밀번호체크가 일치하지않을때
  }else if(pw.value != pwChk.value ) {
    pwChk_errmsg.innerHTML = "비밀번호가 일치하지 않습니다.";

    flag = flag && false;
  }else{
    pwChk_errmsg.innerHTML = "";
  }    
  
  //이름을 입력하지않았을때
   if(name.value == "" ) {
   	name_errmsg.innerHTML = "이름을 입력해주세요";

    flag = flag && false;
  //이름이 2~5글자에 벗어낫을때  
  }else if(joinFrm.name.value.length<1 || joinFrm.name.value.length>6) {
  	name_errmsg.innerHTML = "이름을 2~5자 이내로 입력해주세요";

    flag = flag && false;   
  }else{
  	name_errmsg.innerHTML = "";
  }    
   
  //생년월일 미입력
  if(birth.value == "" ) {
    birth_errmsg.innerHTML = "생일을 입력해주세요!";

    flag = flag && false;
  }else{
    birth_errmsg.innerHTML = "";
  }
 
  //전화번호가 형식에 맞지않을때
  if(!isTel(tel.value)) {
   tel_errmsg.innerHTML = "전화번호가 잘못되었습니다.ex)010-1234-5678";

   flag = flag && false;
  }else{
   tel_errmsg.innerHTML = "";
  }    
  //주소를 입력하지않았을때
  if(address.value == 0){
  	address_errmsg.innerHTML = "주소를 입력하세요.";
    flag = flag && false;
  }else{
  	address_errmsg.innerHTML = "";
  }
    return flag;
}
// 이메일 체크 정규식
function isEmail(asValue) {
  var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
  return regExp.test(asValue); // 형식에 맞는 경우 true 리턴
}

// 핸드폰 번호 체크 정규식
function isTel(asValue) {
  var regExp = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;
  return regExp.test(asValue); // 형식에 맞는 경우 true 리턴
}

// 비밀번호 체크 정규식
function isPassword(asValue) {
  var regExp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,10}$/; // 8 ~ 10자 영문, 숫자 조합
  return regExp.test(asValue); // 형식에 맞는 경우 true 리턴
}