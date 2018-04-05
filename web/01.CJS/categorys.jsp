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
	    });
}
$(document).ready(function() {
    $('[id^=detail-]').hide();
    $('.toggle').click(function() {
        $input = $( this );
        $target = $('#'+$input.attr('data-toggle'));
        $target.slideToggle();
    });
 
$.ajax({
    	url:"/prototype/clist",
    	date:{},
    	type:"get",
    	datetype:"json",
    	success:function(data){
var jsonStr = JSON.stringify(data);
var json = JSON.parse(jsonStr);
var values="";
var values1="";
var x=1;
for(var i in json.big) {
values+='<li class="list-group-item"><div class="row toggle" id="dropdown-detail-'+i+'" data-toggle="detail-'+i+'"><div id="'+json.big[i].CATEGORY_BIG+'" class="col-xs-10">'+json.big[i].CATEGORY_BIG+'</div><div class="col-xs-2"><i class="fa fa-chevron-down pull-right"></i></div></div><div id="detail-'+i+'"><hr></hr><div class="container"> <div class="fluid-row"><div class="col-xs-1">농구 </div> <div class="col-xs-5" style="background: red ">조회수 =<input type="text" disabled="disabled" style="visibility: hidden;"><input type="button" value="이름수정"><input type="button" value="삭제"></div> </div> </div></div></li>';}
$('.list-group').html(values);

for(var i in json.clist){
	for(var j=0; j<json.big.length; j++){
		if(  $("#"+json.big[i].CATEGORY_BIG)       )
	
	
	
	
	
	}
	
}

console.log()
$(".fluid-row").html("")

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
<div class="container">
<div class="panel panel-default" style="width: 900px;">
<div class="panel-heading">
    <h3 class="panel-title">카테고리 관리. 추가및 수정시 공지사항에 게시하시오.</h3>
</div>   
<ul class="list-group">	
	
          
          
          
          
          
          
          
          
           
        </ul>
	</div>
</div>

<%@ include file="/common\footer.jsp" %>
</body>
</html>