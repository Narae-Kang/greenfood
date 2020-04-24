<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>댓글</title>
<!-- google font -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap"
	rel="stylesheet">
<!-- font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-1/css/all.min.css" />

<style>
#replyContainer * {
	box-sizing: border-box;
	font-size : 0.8rem;
}
.indent { margin-left:50px;}
.smallFont {
	font-size: 0.7rem;
	color: gray;
	padding-right : 10px;
}

#replyContainer {
	width: 100%;
	display: flex;
	justify-content: center;
	margin-top: 30px;
}

#replyWrapper {
	width: 1200px;
}

/* 작성 폼 */
#replyWriteForm {
	display: flex;
	justify-content: center;
}

#replyWriteForm textarea {
	width: 95%;
}

#replyWriteForm button {
	margin-left: 5px;
	width: 70px;
	height: 64px;
	line-height: 40px;
	font-size: 11px;
}

#replyList { margin-top: 30px; }

/* 1개 댓글 전체 감싸는 폼 */
#replyContentForm {
	width: 100%;
	border-top : 1px solid #dbdbdb; 
	padding : 5px 0 10px 0;
}
/*작성자 정보*/
.col {
	padding: 5px 10px;
	white-space: nowrap;
}

.replyTitle, .titleBtn {
	display: flex;
	align-items: center;
}

.titleBtn {
	width: 100%;
	display: flex;
	justify-content: flex-end;
}

.titleBtn div {
	padding: 0 5px;
}
/*본문*/
.replyBody {
	width: 100%;
	min-height: 30px;
	display: flex;
	align-items: center;
}

.bodyContent {
	display : flex;
	padding-left: 10px;
}

/* 댓글 아래 생성되는 수정, 대댓글 폼 */
.row.rreplyModify,
.rreply.indent {
	display: flex;
	padding : 5px 0 10px 0;
}
.rreplyModify textarea,
.rreply textarea {
	width: 93%;
	margin-right : 5px;
}
.rreplyModify button,
.rreply button {
	width: 70px;
	height: 65px;
	line-height: 40px;
	font-size: 11px;
	margin : 0;
} 

#paging {
	padding-top: 20px;
}

</style>

<script>
	window.addEventListener("load",init2,false);
	let l_bnum = ${boardVO.bnum }
	let l_page = 1;				//요청페이지
	let l_id 				= "${sessionScope.member.id}";									//로그인 아이디
	let l_name 	= "${sessionScope.member.name}";						//로그인 별칭
	let l_url 			= "${pageContext.request.contextPath}/rboard"; 	//공통 URL
	
	function init2(){

		//댓글목록 가져오기 (요청페이지 : 1)
		replyList(l_page);  

		//페이지번호 클릭시 이벤트 처리
 		paging.addEventListener("click",function(e){
			e.preventDefault();
				if(e.target.tagName == 'A'){
	 				console.log("페이지번호 클릭됨!!");
	 				l_page = e.target.getAttribute("href");
				replyList(l_page);
			} 
		},false); 

		//댓글작성
		replyWriteBtn.addEventListener("click",function(){
			console.log("댓글작성버튼 클릭됨");
			let rcontentTag = document.getElementById("rcontent")
			let rcontent = rcontentTag.value;
			
			let xhttp = new XMLHttpRequest();
			xhttp.addEventListener("readystatechange",function(){
				if(this.readyState == 4 && this.status == 200){
					console.log('댓글작성:'+this.responseText);
					if(this.responseText == 'success'){
						replyList(l_page); 
						rcontentTag.value = "";
						rcontentTag.focus();
					}else{
						console.log('댓글작성오류');
					}
				}
			});

		 //전송데이터(작성정보+내용) json포맷으로 만들기
     let sendData = {};
     sendData.bnum  = l_bnum;
     sendData.rid 	= l_id;
     sendData.rname = l_name;
     sendData.rcontent = rcontent;
     
     //자바스크립트 obj => json포맷 문자열 변환
     let result = JSON.stringify(sendData);
     console.log("obj => json 변환 결과:"+result);
	     				
     //post방식
     xhttp.open("POST",l_url,true);
     xhttp.setRequestHeader("Content-Type","application/json;charset=utf-8"); 
     xhttp.send(result);				
			
		},false);
		
		let replyListTag = document.getElementById("replyList");
		replyListTag.addEventListener("click",function(e){
			//댓글목록에서 'I'태그의 자식 태그에서만 반응하기
			if(e.target.tagName != 'I') return false;
			//이벤트가 일어난 지점에서 data-rnum속성을 포함한 요소를 찾아서 data-rnum값을 추출한다.
			let parentTags = parents(e.target);
			let rnumTag    = parentTags.find( tag => {	if(tag.hasAttribute("data-rnum")){
													return tag;
												}});
			let data_rnum =	rnumTag.getAttribute("data-rnum");
			
			//댓글 삭제   
			if(e.target.classList.contains('replyDeleteBtn')){
				console.log('댓글 삭제버튼 클릭:'+data_rnum);
				if(confirm('삭제하시겠습니까?')){
					doDelete(e.target, data_rnum);
				}
			//댓글 수정
			}else if(e.target.classList.contains('replyModifyBtn')){
				console.log('댓글 수정버튼 클릭:'+data_rnum);

				doReplyModifyTrigger(replyListTag,'rereplyCancelBtn');
				doReplyModifyTrigger(replyListTag,'replyModifyCancelBtn');
					
				//1) 아이콘 토글
				e.target.classList.toggle("replyModifyBtn"); //수정버튼
				e.target.classList.toggle("fa-edit");

				e.target.classList.toggle("replyModifyCancelBtn"); //수정취소버튼
				e.target.classList.toggle("fa-window-close");		
				 			
				//2) 댓글수정양식을 댓글 대상 아래 추가하기 
				console.log(rnumTag);
				console.log(rnumTag.nextElementSibling);
									
				let row_1 = elt("textarea",{name:"rrcontent", class:"rrcontent", rows:"3"});		//댓글수정폼
				let row_2 = elt("button",{class:"rreplyModifyBtn"},"수정");											//댓글수정버튼
				let rreplyModifyForm = elt("div",{class:"row rreplyModify indent"},row_1,row_2);
				 					
				row_2.addEventListener("click",function(){
				//댓글 수정 처리하기
				doModify(data_rnum,row_1.value);
				},false);
				replyListTag.insertBefore(rreplyModifyForm,rnumTag.nextElementSibling);
				replyListTag.getElementsByClassName("rrcontent")[0].value
					= rnumTag.getElementsByClassName("rrcontent")[0].textContent;					
			}else if(e.target.classList.contains('replyModifyCancelBtn')){
				console.log('수정버튼 취소 클릭됨'+data_rnum);

				//1)
				e.target.classList.toggle("replyModifyBtn");
				e.target.classList.toggle("fa-edit");

				e.target.classList.toggle("replyModifyCancelBtn");
				e.target.classList.toggle("fa-window-close");				
							
				//2) 대댓글입력양식을 제거하기 
				replyListTag.removeChild(rnumTag.nextElementSibling);
				
			}else if(e.target.classList.contains('rereplyBtn')){
				console.log('댓글버튼 클릭됨'+data_rnum);
				doReplyModifyTrigger(replyListTag,'rereplyCancelBtn');
				doReplyModifyTrigger(replyListTag,'replyModifyCancelBtn');
				 
				//1) 아이콘 토글
				e.target.classList.toggle("rereplyBtn");
				e.target.classList.toggle("fa-comment-dots");
				e.target.classList.toggle("rereplyCancelBtn");
				e.target.classList.toggle("fa-window-close");
						 			
				//2) 대댓글입력양식을 대댓글 대상 아래 추가하기 
				console.log(rnumTag);
				console.log(rnumTag.nextElementSibling);			
				let row_1 = elt("textarea",{name:"rrcontent", class:"rrcontent", rows:"3"});		//대댓글 작성
				let row_2 = elt("button",{class:"rreplyBtn"},"등록");														//대댓글 버튼
				let rreplyForm = elt("div",{class:"rreply indent"},row_1,row_2);							
				 	
				//대댓글 등록 처리하기
				row_2.addEventListener("click",function(){
					doReply(data_rnum,row_1.value);
				},false);
				
				replyListTag.insertBefore(rreplyForm,rnumTag.nextElementSibling);
				
				replyListTag.getElementsByClassName("rrcontent")[0].placeholder
					= rnumTag.getElementsByClassName("rname")[0].textContent;
					//= rnumTag.getElementsByClassName("rname")[0].textContent+"님께 답글쓰기";

			}else if(e.target.classList.contains('rereplyCancelBtn')){

				//1) 아이콘 토글
				console.log('댓글버튼 클릭됨'+data_rnum);
				e.target.classList.toggle("rereplyBtn");
				e.target.classList.toggle("fa-comment-dots");

				e.target.classList.toggle("rereplyCancelBtn");
				e.target.classList.toggle("fa-window-close");					
				//2) 대댓글입력양식을 제거하기 
				replyListTag.removeChild(rnumTag.nextElementSibling);
			}
		},false);
		
	}  //init2 끝
	
	//이벤트 트리거
	function doReplyModifyTrigger(i_pnode,i_findClass){
		Array.from(i_pnode.getElementsByClassName(i_findClass))
		 .forEach(item=>{item.click()});
	}
	
	//댓글 수정
	function doModify(i_rnum,i_rcontent){

		let xhttp = new XMLHttpRequest();
		xhttp.addEventListener("readystatechange",function(){
			if(this.readyState == 4 && this.status == 200){
					console.log('responseText:'+this.responseText);
				if(this.responseText == 'success'){
					replyList(l_page);
				}else{
					console.log('대댓글 수정 오류');
				}
			}
		});		
		let sendData = {};
		sendData.rnum = i_rnum; 						//수정할 댓글번호
		sendData.rcontent = i_rcontent;			//대댓글내용
		
		let result = JSON.stringify(sendData);
				
	  xhttp.open("PUT",l_url,true);
	  xhttp.setRequestHeader("Content-Type","application/json;charset=utf-8"); 
	  xhttp.send(result);			
	}
	//대댓글 등록
	function doReply(i_rnum,i_rcontent){

		let url = l_url+"/reply";
		let xhttp = new XMLHttpRequest();
		xhttp.addEventListener("readystatechange",function(){
			if(this.readyState == 4 && this.status == 200){
					console.log('responseText:'+this.responseText);
				if(this.responseText == 'success'){
					replyList(l_page);
				}else{
					console.log('대댓글 작성 오류!!');
				}
			}
		});		
		let sendData = {};
		sendData.bnum = l_bnum; 						//게시글 원글
		sendData.rid  = l_id;	 							//작성자 아이디
		sendData.rname = l_name;						//작성자 이름
		sendData.rcontent = i_rcontent;			//대댓글내용
		sendData.prnum =	i_rnum;						//부모댓글 
		
		let result = JSON.stringify(sendData);
				
	  xhttp.open("POST",url,true);
	  xhttp.setRequestHeader("Content-Type","application/json;charset=utf-8"); 
	  xhttp.send(result);					
	}
	//댓글 삭제
	function doDelete(i_node, i_rnum){
		let url = l_url+"/"+i_rnum;
		let xhttp = new XMLHttpRequest();
		xhttp.addEventListener("readystatechange",function(){
			if(this.readyState == 4 && this.status == 200){
					console.log('responseText:'+this.responseText);
				if(this.responseText == 'success'){
					replyList(l_page);
				}else{
					console.log('댓글삭제오류');
				}
			}
		});			

   xhttp.open("DELETE",url,true); 
   xhttp.send();				
	}

	function elt(name, attributes) {
		var node = document.createElement(name);
		if( attributes ) {
			for(var attr in attributes) {
				if(attributes.hasOwnProperty(attr)) {
					node.setAttribute(attr,attributes[attr]);
				}
			}
		}
		for(var i=2; i<arguments.length; i++) {
			var child = arguments[i];
			if( typeof child == "string" ) {
				child = document.createTextNode(child);
			}
			node.appendChild(child);
		}
		return node;
	}
			
	/* 특정 노드를 매개값으로 받아서 조상노드를 찾아서 배열에 저장하기 */
	function parents(node) {     
		let current = node,         
		list    = [];     
		while(	current.parentNode != null && 
						current.parentNode != document.documentElement) {
			//존재하는 부모노드를 배열에 추가       
			list.push(current.parentNode);
			//현재노드 갱신     
			current = current.parentNode;    
		}     
		return list;
	}
			
	//댓글목록 가져오기
	function replyList(reqPage){
		let url = l_url+"/"+l_page+"/"+l_bnum;
		
		console.log('댓글목록url:'+url);
		//Ajax Call
		//1)
		let xhttp = new XMLHttpRequest();
		//2)
		xhttp.addEventListener("readystatechange",function(){
			if(this.readyState == 4 && this.status == 200){
				console.log('responseText:'+this.responseText);
				let jsObj = JSON.parse(this.responseText);
				let str = "";
				jsObj.list.forEach( e => {
 					console.log("rnum::"+e.rnum);
					console.log("rid::"+e.rid);
					console.log("rname::"+e.rname); 
					console.log("prname::"+e.prname); 
					
					str += '<div id="replyContentForm" data-rnum="'+e.rnum+'" >';
					if(e.rindent == 0){
						str += '  <div id="replyContent">';
					}else{
						str += '  <div id="replyContent" class="indent">';
					}	
								    <!-- 헤드 -->
					str += '    <div class="header replyContent replyTitle">';
					str += '      <div class="col titleName"><b>'+e.rname+'</b></div>';
					str += '      <div class="col titleDate smallFont"><i>'+e.rcdate+'</i></div>';
					str += '      <div class="col titlerRe"><span><i class="fas fa-comment-dots rereplyBtn" title="댓글달기"></i></span></div>';
					if(e.rid == "${sessionScope.member.id}") {
						str += '      <div class="col titleBtn">';
						str += '        <div><span><i class="fas fa-edit replyModifyBtn" title="수정"></i></span></div>';
						str += '        <div><span><i class="far fa-trash-alt replyDeleteBtn" title="삭제"></i></span></div>';
						str += '      </div>';
					} else {
						str += '      <div class="col titleBtn"></div>';
					}
					str += '    </div>';
											<!-- 바디 -->
					str += '    <div class="replyContent replyBody">';
					str += '      <div class="bodyContent">';
					if(e.rindent == 0){
						str += '			<div class="smallFont" style="width:0px; position:absolute; left:15px;"></div>';
					} else {
					str += '      	<div class="smallFont">'+e.prname+'</div>';
					}
					str += '        <div>'+e.rcontent+'</div>';
					str += '      </div>';
					str += '    </div>';
					str += '  </div>';
					str += '</div>';				

					document.getElementById('replyList').innerHTML = str;

					});		//jsObj.list.forEach 
					
					//페이지징
					//이전페이지 여부
					str = "";
					if(jsObj.pc.prev){
						str += '<a href="1">◀</a>';
					  str += '<a href="'+(jsObj.pc.startPage-1)+'">◁</a>';
					}
					//페이지 1~10
					for(let i=jsObj.pc.startPage, end=jsObj.pc.endPage; i<=end; i++){
						//현재 페이지와 요청페이지가 다르면
						if(jsObj.pc.rc.reqPage != i ){
							str += '<a href="'+i+'">'+i+'</a>';
						}else{
							str += '<a href="'+i+'" class="active">'+i+'</a>';
						}
					}

					//다음페이지 여부
					if(jsObj.pc.next){
				    str += '<a href="'+(jsObj.pc.endPage+1)+'">▷</a>';
				    str += '<a href="'+(jsObj.pc.finalEndPage)+'">▶</a>';
					}		
					document.getElementById('paging').innerHTML = str;		
				}
		  },false);
			//3)
			xhttp.open("GET",url,true);
			xhttp.send();
		}
		
	</script>

</head>
<body>

	<div id="replyContainer">
		<div id="replyWrapper">

			<!-- 댓글 작성 폼-->
			<div id="replyWriteForm">
				<textarea name="rcontent" id="rcontent" rows="3"></textarea>
				<button id="replyWriteBtn">등록</button>
			</div>
			
			<!-- 댓글 리스트 -->
			<div id="replyList">
				<!--       	<div class="replyContentForm">
      		<div class="replyContent">
	      		헤드
			      <div class="replyTitle">
			        <div class="col titleName"><b>작성자</b></div>
			        <div class="col titleDate smallFont">2020-01-01 22:00</div>
			        <div class="col titlerRe"><i class="far fa-comment-dots"></i></div>
			        <div class="col titleBtn">
			          <div><a href="">수정</a></div>
			          <div><a href="">삭제</a></div>
			        </div>
			      </div>
			      바디
			      <div class="replyBody">
			        <div class="bodyContent">
			          <span class="smallFont">원댓</span>
			          <span>내용!</span>
			        </div>
			      </div>
			    </div>  
      	</div> -->
			</div>
			
			<!--페이징-->
		  <div id="paging"></div>

		</div> <!-- replyWrapper 끝 -->
	</div> <!-- replyContainer 끝 -->

</body>
</html>