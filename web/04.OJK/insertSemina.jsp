<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="/prototype/common/resources/js/jquery-3.3.1.min.js"></script>
	<script 
	src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style type="text/css">
	.palel-primary
	{
		border-color: #bce8f1;
	}
	.panel-primary>.panel-heading
	{
		background:#bce8f1;
		
	}
	.panel-primary>.panel-body
	{
		background-color: #EDEDED;
	}
</style>
<script type="text/javascript">
function juso(){ 

	new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	            console.log(data.roadAddress);
	            $("#loc").val(data.roadAddress)	
	        }
	    }).open();

	
	};

var detailCount=1;
var detailmax=5;
function addDetail(){
if(detailmax>detailCount){
$("#detail").append("<div id='"+detailCount+"'class='form-group'><label for='disc' style='padding:auto; width:100px;'>상세정보 제목</label>	<div style='width: 99%;'><input type='text' id='phone' name='phone' class='form-control' style='width:150px; float:left'><input type='button' onclick='removeDetail(this)' id='"+detailCount+"' class='btn btn-primary center' value='정보삭제하기' style='margin-left:10px;'><input type='button' onclick='addDetail()' class='btn btn-primary center' value='정보 추가하기' style='margin-left:10px;'></div><label for='disc' style='margin-top:5px; width:100px; margin-left: -150px;'>상세정보</label><textarea class='form-control' rows='3'></textarea></div>");
 detailCount++;
 console.log(detailCount);
	}else{
		alert("너무 많습니다! 삭제해주세요");
		
	}
	
}
function removeDetail(a){
	$("#"+a.id).remove();
	detailCount--;
	console.log(detailCount);
}

$(document).ready(function(){
	$flag=1;
	$("#myName").focusout(function(){
		if($(this).val()==''){
    		$(this).css("border-color", "#FF0000");
    			$('#submit').attr('disabled',true);
    			 $("#error_name").text("* You have to enter your first name!");
    	}
    	else
    	{
    		$(this).css("border-color", "#2eb82e");
    		$('#submit').attr('disabled',false);
    		$("#error_name").text("");

    	}
   });
    $("#lastname").focusout(function(){
		if($(this).val()==''){
    		$(this).css("border-color", "#FF0000");
    			$('#submit').attr('disabled',true);
    			$("#error_lastname").text("* You have to enter your Last name!");
    	}
    	else
    	{
    		$(this).css("border-color", "#2eb82e");
    		$('#submit').attr('disabled',false);
    		$("#error_lastname").text("");
    	}
   });
    $("#dob").focusout(function(){
		if($(this).val()==''){
    		$(this).css("border-color", "#FF0000");
    			$('#submit').attr('disabled',true);
    			$("#error_dob").text("* You have to enter your Date of Birth!");
    	}
    	else
    	{
    		$(this).css("border-color", "#2eb82e");
    		$('#submit').attr('disabled',false);
    		$("#error_dob").text("");
    	}
   });
    $("#gender").focusout(function(){
    	$(this).css("border-color", "#2eb82e");
   
   });
    $("#age").focusout(function(){
		if($(this).val()==''){
    		$(this).css("border-color", "#FF0000");
    			$('#submit').attr('disabled',true);
    			$("#error_age").text("필수!");
    	}
    	else
    	{
    		$(this).css({"border-color":"#2eb82e"});
    		$('#submit').attr('disabled',false);
    		$("#error_age").text("");

    	}
    	});
    $("#phone").focusout(function(){
        $pho =$("#phone").val();
		if($(this).val()==''){
    		$(this).css("border-color", "#FF0000");
    			$('#submit').attr('disabled',true);
    			$("#error_phone").text("* You have to enter your Phone Number!");
    	}
    	else if ($pho.length!=10)
    	{   
                $(this).css("border-color", "#FF0000");
    			$('#submit').attr('disabled',true);
    			$("#error_phone").text("* Lenght of Phone Number Should Be Ten");
    	}
    	else if(!$.isNumeric($pho))
    	{
    	        $(this).css("border-color", "#FF0000");
    			$('#submit').attr('disabled',true);
    			$("#error_phone").text("* Phone Number Should Be Numeric");  
    	}
    	else{
    		$(this).css({"border-color":"#2eb82e"});
    		$('#submit').attr('disabled',false);
    		$("#error_phone").text("");
    	}

	});

		$( "#submit" ).click(function() {
			if($("#myName" ).val()=='')
			{
    		$("#myName").css("border-color", "#FF0000");
    			$('#submit').attr('disabled',true);
    			 $("#error_name").text("* You have to enter your first name!");
    	}
    	if($("#lastname" ).val()=='')
			{
    		$("#lastname").css("border-color", "#FF0000");
    			$('#submit').attr('disabled',true);
    			 $("#error_lastname").text("* You have to enter your Last name!");
    	}
			if($("#dob" ).val()=='')
			{
    		$("#dob").css("border-color", "#FF0000");
    			$('#submit').attr('disabled',true);
    			 $("#error_dob").text("* You have to enter your Date of Birth!");
    	}
			if($("#age" ).val()=='')
			{
    		$("#age").css("border-color", "#FF0000");
    			$('#submit').attr('disabled',true);
    			 $("#error_age").text("* You have to enter your Age!");
    	}
    	if($("#phone" ).val()=='')
			{
    		$("#phone").css("border-color", "#FF0000");
    			$('#submit').attr('disabled',true);
    			 $("#error_phone").text("* You have to enter your Phone Number!");
    	}
		});
});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>세미나 등록하기</title>
</head>
<body>
<%@ include file="/common/navbar.jsp" %>
<div class="container">

    <div class="col-md-6 col-sm-12 col-lg-6 col-md-offset-3">
		<div class="panel panel-primary">
			<div class="panel-heading">세미나를 등록합니다.
			</div>
			<div class="panel-body">
				<form name="myform">
					<div class="form-group">
						<label for="myName">세미나 타이틀</label>
						<input id="myName" name="myName" class="form-control" type="text" data-validation="required">
						<span id="error_name" class="text-danger"></span>
					</div>
					<div class="form-group">
						<label for="lastname">Last Name *</label>
						<input id="lastname" name="lastname" class="form-control" type="text" data-validation="email">
						<span id="error_lastname" class="text-danger"></span>
					</div>
					<div class="form-group">
						<label for="age">인원 설정</label>
						
						<div style="width:95%; background: red">
						<label for="age" style="width: 10%; float:left" >최소인원:</label>
						<input id="age" name="age"  class="form-control" type="number" min="1" style="width: 30%; float:left">
						 <label for="age" style="margin-left:10px;    width: 10%; float:left" >최대인원:</label>
						<input id="age" name="age"  class="form-control" type="number" min="1" style="width: 30%; float:left">
					 	
						</div>
						
						<span id="error_age" class="text-danger"></span>
				
					</div>
					
						<hr style="clear:both; border: 0">
					
					<div class="form-group">
						<label for="dob">강의 날 및 시각</label>
						<input type="date" name="dob" id="dob" class="form-control">
						<span id="error_dob" class="text-danger"></span>
					</div>
					<div class="form-group">
						<label for="gender">희망 참가료(원)</label>
						<input type="number" class="form-control" min="0">
					<span id="error_gender" class="text-danger"></span>
					</div>
					
					
					<div class="form-group">
						<label for="phone">강의 지역</label>
						<input type="text" id="loc" name="loc" class="form-control" onclick="juso()">
						<span id="error_phone" class="text-danger"></span>
					</div>
					
					
					
					
					<div id="detail">
					<div class="form-group">
						
						<label for="disc" style="padding:auto; width:100px;">상세정보 제목</label>
						<div style="width: 99%;">
						<input type="text" id="phone" name="phone" class="form-control" style="width:150px; float:left">
						
						<input type="button" onclick="addDetail()" class="btn btn-primary center" value="정보 추가하기" style="margin-left:140px;">						
						</div>
						
						<label for="disc" style="margin-top:5px; width:100px; margin-left: -150px;">상세정보</label>
						<textarea class="form-control" rows="3"></textarea>
					</div>
					</div>
					
					<!-- 	이후 정보 추가시, 이것을 추가해서 넣는다. 
					<div class="form-group">
						<label for="disc" style="padding:auto; width:100px;">상세정보 제목</label>
						<div style="width: 99%;">
						<input type="text" id="phone" name="phone" class="form-control" style="width:150px; float:left">
						
						<input type="button" onclick="removeDetail()" class="btn btn-primary center" value="정보 삭제하기" style="margin-left:10px;">
						<input type="button" onclick="addDetail()" class="btn btn-primary center" value="정보 추가하기" style="margin-left:10px;">
					
						</div>
						
						<label for="disc" style="margin-top:5px; width:100px; margin-left: -150px;  ">상세정보</label>
						<textarea class="form-control" rows="3"></textarea>
					</div>
					  -->
					
					<input type="submit" value="강의생성" class="btn btn-primary center">
					<input type="reset" value="초기화" class="btn btn-primary center">
					<input type="button" onclick="history.back()" value="뒤로가기" class="btn btn-primary center">
					
				</form>

			</div>
		</div>
</div>

</div>

<%@ include file="/common/footer.jsp" %>
</body>
</html>