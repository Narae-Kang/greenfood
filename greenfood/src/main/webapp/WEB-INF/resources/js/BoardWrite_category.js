
	//컨트롤러에서 데이터 받기
	var jsonData = JSON.parse('${category}');
	console.log(jsonData);

	var cate1Arr = new Array();
	var cate1Obj = new Object();

	//1차 분류 셀렉트 박스에 삽입할 데이터 준비
	for(var i = 0; i < jsonData.length; i++) {

	if(jsonData[i].level == "1") {
	cate1Obj = new Object();  //초기화
	cate1Obj.cnum = jsonData[i].cnum;
	cate1Obj.cname = jsonData[i].cname;
	cate1Arr.push(cate1Obj);
	}
	};

	//1차 분류 셀렉트 박스에 데이터 삽입
	var cate1Select = $('select.category1')
	console.log(cate1Select);
	for(var i = 0; i < cate1Arr.length; i++) {
	 cate1Select.append("<option value='" + cate1Arr[i].cnum + "'>"
	      + cate1Arr[i].cname + "</option>"); 
	}

	$(document).on("change", "select.category1", function(){

		 var cate2Arr = new Array();
		 var cate2Obj = new Object();
		 
		 // 2차 분류 셀렉트 박스에 삽입할 데이터 준비
		 for(var i = 0; i < jsonData.length; i++) {
		  
		  if(jsonData[i].level == "2") {
		   cate2Obj = new Object();  //초기화
		   cate2Obj.cnum = jsonData[i].cnum;
		   cate2Obj.cname = jsonData[i].cname;
		   cate2Obj.ccode = jsonData[i].ccode;
		   
		   cate2Arr.push(cate2Obj);
		  }
		 }
		 
		 var cate2Select = $("select.category2");

		 cate2Select.children().remove();

		 $("option:selected", this).each(function(){
		  
		  var selectVal = $(this).val();  
		  if(cate2Arr)
		  cate2Select.append("<option value='" + selectVal + "'>====== 선택 ======</option>");
		  
		  for(var i = 0; i < cate2Arr.length; i++) {
		   if(selectVal == cate2Arr[i].ccode) {
		    cate2Select.append("<option value='" + cate2Arr[i].cnum + "'>"
		         + cate2Arr[i].cname + "</option>");
		   }
		  }
		  
		 });
		});