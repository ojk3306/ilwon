<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript" src="/prototype\common\resources\js\jquery-3.3.1.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자-카테고리 관리</title>

<script type="text/javascript">
function rehide(){
	  $('[id^=detail-]').hide();
	    $('.toggle').click(function() {
	        $input = $( this );
	        $target = $('#'+$input.attr('data-toggle'));
	        $target.slideToggle();
	    });}
	    
function update(data){
	console.log($("input[name="+data.name+"]").val());
	userno = console.log(data.name)
	$.ajax({
		url:"/prototype/upcate",
		
		data:{userno:data.name,cate:$("input[name="+data.name+"]").val()},
		datatype:"json",
		
		success:function(data){
		var jsonStr = JSON.stringify(data);
		var json = JSON.parse(jsonStr);
	
		$("input[name="+data.userno+"]").val(data.cate);
		$("#"+data.userno).text(data.cate);
		//$("#"+userno).text(data);
		//console.log(data.userno);
		//console.log(data.cate);
		}
	})
}
function deletekey(data){
	var inputString = prompt('최고관리자의 승인을 받았습니까? (Y or N)','N');
	
	if(inputString=='Y'){
		console.log(data.name);
		
		location.href='/prototype/dcate?userno='+data.name;
	
	
	}else{
	console.log("bb");
	return false;
	}
	
	
}

function addbigcate(){//대분류 추가

	var input = prompt('대분류 카테고리의 이름을 적으세요.');
	location.href='/prototype/bigadd?cate='+input;
	
	
}
function addcate(data){//소분류 추가.
	console.log("일반카테추가"+data.id)
	var input = prompt('소분류 카테고리의 이름을 적으세요.');
	
	
	//location.href='/prototype/smalladd?cate='+input+'&cateno='+data.id;
	$.ajax({
		url:"/prototype/smalladd",
		data:{cate:input,cateno:data.id},
		datatype:"json",
		success:function(data){
			var jsonStr = JSON.stringify(data);
			var json = JSON.parse(jsonStr);
/*
			json.put("CATEGORY_NO",cate.getCATEGORY_NO());
			json.put("CATEGORY_BIG",cate.getcATEGORY_BIG());
			json.put("CATEGORY_SMALL",cate.getCATEGORY_SMALL());
			json.put("CATEGORY_HIT",cate.getCATEGORY_HIT());
		*/

		var json = JSON.parse(jsonStr);
		
		console.log(json.CATEGORY_NO);
	
		
$("div[id="+json.CATEGORY_BIG+"]").html($("div[id="+json.CATEGORY_BIG+"]").html()+'<div class="col-xs-5" style="width:200px;  margin-top:-5px; border-right:1px;"><p><center><h5><strong id="'+json.CATEGORY_NO+'">'+json.CATEGORY_SMALL+'</strong></h5></center></p><center>조회수 :'+json.CATEGORY_HIT+'</center><input type="text"  name="'+json.CATEGORY_NO+'" value="'+json.CATEGORY_SMALL+'" style="width:100%;"><br><a name="'+json.CATEGORY_NO+'" onclick="update(this);" class="btn btn-primary loading">이름 수정</a>&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="deletekey(this);" name="'+json.CATEGORY_NO+'"class="btn btn-danger loading">삭제</a> </div></div></div>');



		},error:function(a,b,c){
			console.log(b+c);
		}
	})

}
$(document).ready(function(){
    $('[id^=detail-]').hide();
    
    $('.toggle').click(function() {
        $input = $( this );
        $target = $('#'+$input.attr('data-toggle'));
        $target.slideToggle();
    });
 
    
$.ajax({
    	url:"/prototype/clist",
    	type:"get",
    	datatype:"json",
    	success:function(data){
var jsonStr = JSON.stringify(data);
var json = JSON.parse(jsonStr);
var values="";
var values1="";

for(var i in json.big){ //대분류 삽입

values+='<li class="list-group-item"><div class="row toggle" id="dropdown-detail-'+i+'" data-toggle="detail-'+i+'"><div class="col-xs-10"><center><h4><strong>'+json.big[i].CATEGORY_BIG+'</strong></h4></center></div><div class="col-xs-2"><i class="fa fa-chevron-down pull-right"></i></div></div><div id="detail-'+i+'"><hr></hr><div id="'+json.big[i].CATEGORY_BIG+'" style="margin-left:-30px; width:840px; " class="container"> </li>';

}
$('.list-group').html(values);


for(var i in json.clist){ //소분류 삽입
$("fluid-row[id="+json.clist[i].CATEGORY_BIG+"]").html("");	
	
$("#"+json.clist[i].CATEGORY_BIG).html($("#"+json.clist[i].CATEGORY_BIG).html()+'<div class="col-xs-5" style="width:200px; margin-top:-5px; border-right:1px;"><p><center><h5><strong id="'+json.clist[i].CATEGORY_NO+'">'+json.clist[i].CATEGORY_SMALL+'</strong></h5></center></p><center>조회수 :'+json.clist[i].CATEGORY_HIT+'</center><input type="text"  name="'+json.clist[i].CATEGORY_NO+'" value="'+json.clist[i].CATEGORY_SMALL+'" style="width:100%;"><br><a name="'+json.clist[i].CATEGORY_NO+'" onclick="update(this);" class="btn btn-primary loading">이름 수정</a>&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="deletekey(this);" name="'+json.clist[i].CATEGORY_NO+'" class="btn btn-danger loading">삭제</a> </div></div></div>');

}
for(var i in json.big){
	
	$("#detail-"+i).html( $("#detail-"+i).html()+'<hr><center><button type="button" id="'+json.big[i].CATEGORY_BIG+'1" onclick="addcate(this);" class="btn btn-success">추가</button></center>'  )

}
 

rehide();
},
    	error:function(a,b,c){
    		console.log(b+c)
    	}   	
    })
  

});

</script>
</head>
<body>
<%@ include file="/common\navbar.jsp" %>

<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css">
<div id="container" STYLE="margin-bottom:30PX; ">
<div class="panel panel-default" style="width: 850px; margin: auto">
<div class="panel-heading" style="height:35px;">
	<center style="float: left;">
    <h4 class="panel-title">카테고리 관리.수정시 공지사항에 게시하시오. 대분류추가,삭제시 최고 관리자의 승인을 받으시오.</h4>
    </center>
    <div style="float: right;">
    <button type="button" onclick="addbigcate()" class="btn btn-success btn-number" Style="margin-top: -10px;">
   대분류추가
   </button>
    </div>
</div>   
<ul class="list-group">	

</ul>
	</div>
</div>
<%@ include file="/common\footer.jsp" %>
</body>
</html>