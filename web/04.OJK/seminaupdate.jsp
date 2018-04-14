<%@page import="semina.model.vo.Semina"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String errormessage=null;
  	if(request.getAttribute("message")!=null)
  		errormessage=(String)request.getAttribute("message");
  	
  	Semina semi=(Semina)request.getAttribute("list");	
    %>
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

var detailCount=4;
var detailmax=4;
function addDetail(){
if(detailmax>detailCount){
$("#detail").append("<div id='"+detailCount+"'class='form-group'><label for='disc' style='padding:auto; width:100px;'>정보 제목</label>	<div style='width: 99%;'><input type='text' id='phone' name='detailtitle"+detailCount+"' class='form-control' style='width:150px; float:left'><input type='button' onclick='removeDetail(this)' id='"+detailCount+"' class='btn btn-primary center' value='정보삭제하기' style='margin-left:10px;'><input type='button' onclick='addDetail()' class='btn btn-primary center' value='정보 추가하기' style='margin-left:10px;'></div><label for='disc' style='margin-top:5px; width:100px;'>상세정보</label><textarea name='detailinfo"+detailCount+"' class='form-control' rows='3'></textarea></div>");
 detailCount++;
 console.log(detailCount);
	}else{
alert("너무 많습니다! 삭제해주세요");
return false;		
	}
	
}
function removeDetail(a){
	$("#"+a.id).remove();
	detailCount--;
	console.log(detailCount);
}

$(document).ready(function(){
	if(<%=errormessage%>!=null)
		alert(errormessage);
	$flag=1;
	$("#myName").focusout(function(){
		if($(this).val()==''){
    		$(this).css("border-color", "#FF0000");
    			$('#submit').attr('disabled',true);
    			 $("#error_name").text("*강의 타이틀을 입력해주세요...");
    	}
    	else
    	{
    		$(this).css("border-color", "#2eb82e");
    		$('#submit').attr('disabled',false);
    		$("#error_name").text("");

    	}
   });
  
    $("#dob").focusout(function(){
		if($(this).val()==''){
    		$(this).css("border-color", "#FF0000");
    			$('#submit').attr('disabled',true);
    			$("#error_dob").text("*강의일을 설정해주세요...");
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
    		$("#error_age").text("ㅇㅇㅇ");

    	}
    	});
    $("#phone").focusout(function(){
        $pho =$("#phone").val();
		if($(this).val()==''){
    		$(this).css("border-color", "#FF0000");
    			$('#submit').attr('disabled',true);
    			$("#error_phone").text("");
    	}
    	else if ($pho.length!=10)
    	{   
                $(this).css("border-color", "#FF0000");
    			$('#submit').attr('disabled',true);
    			$("#error_phone").text("* 제목을 입력해주세요...");
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
    		$("#error_phone").text("11");
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
    			 $("#error_dob").text("* Y22");
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
    			 $("#error_phone").text("");
    	}
		});
		$("#img2").change(function() {
			var fileValue = $("#img2").val().split("\\");
			var fileName = fileValue[fileValue.length-1]; // 파일명
			console.log(fileName)
			
			$("#i2").append('<span>'+fileName+'</span>') ;
			
			
		});
		
		
});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>세미나 등록하기</title>
</head>
<body>
<%@ include file="/common/navbar.jsp"%>
<div class="container">
<div class="col-md-6 col-sm-12 col-lg-6 col-md-offset-3">
		<div class="panel panel-primary">
			<div class="panel-heading">세미나를 등록합니다.
			</div>
			<div class="panel-body">
				<form name="myform" action="/prototype/semupup" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<label for="myName">세미나 타이틀 * </label>
						<input id="myName" name="title" class="form-control" value="<%=semi.getSeminaTitle()%>" type="text" data-validation="required">
						<span id="error_name" class="text-danger"></span>
					</div>
					<div class="form-group">
					
					
				<label for="lastname">타이틀 이미지 (선택사항)</label>
						
			<br>
					<label class="btn btn-primary btn-file form-control" id="i2">
  					  파일수정 <input type="file"   style="display: none;" name="titleimg" id="img2" accept=".gif, .jpg, .png" >
							 
							 
					</label> 
				
						<span id="error_lastname" class="text-danger"></span>
					</div>
					<div class="form-group">
						<label for="age">인원 설정 *</label>
						<Br>	
						<div style="width:95%; background: red">
						<label for="age" style="width: 15%; float:left" >최소인원:</label>
						<input id="age" name="min"  class="form-control" type="number" min="1" value="<%=semi.getSeminaMin() %>" style="width: 30%; float:left">
						 <label for="age" style="margin-left:10px;    width: 15%; float:left" >최대인원:</label>
						<input id="age" name="max"  class="form-control" type="number" min="1" value="<%=semi.getSeminaMax() %>" style="width: 30%; float:left">
						</div>
						
						<span id="error_age" class="text-danger"></span>
				
					</div>
					
						<hr style="clear:both; border: 0">
					
					<div class="form-group"> 
						<label for="dob">세미나 날 및 시각  * (오늘이 아니라 세미나를 하는 날입니다.)     </label>
						<input type="date" value="<%=semi.getSeminaEndDate() %>" name="seminadate" id="dob" class="form-control">
						<span id="error_dob" class="text-danger"></span>
					</div>
					<div class="form-group">
						<label for="gender">희망 참가료(원)(무료가능) *</label>
						<input type="number" name="cost" class="form-control" value="<%=semi.getSeminaPrice() %>" min="0">
					<span id="error_gender" class="text-danger"></span>
					</div>
					
					
					<div class="form-group">
						<label for="phone">강의 지역 *</label>
						<input type="text" id="loc" name="loc" class="form-control" value="<%=semi.getSeminaLocation() %>" onclick="juso()" readonly="readonly" placeholder="클릭 해서 지역을 선택해주세요!">
						<span id="error_phone" class="text-danger"></span>
					</div>

					<div id="detail">
					<div class="form-group">
					
					<label for="disc" style="padding:auto; width:200px;">검색목록에서 보여줄 소제목 * </label>
					<div style="width: 99%;">
					<input type="text" id="phone" name="detailtitle" value="<%=semi.getSeminatitle1() %>"     class="form-control" style="width:150px; float:left">
					<input type="button" onclick="addDetail()" class="btn btn-primary center" value="정보 추가하기" style="margin-left:140px;">						
					</div>
					<label for="disc" style="margin-top:5px; width:300px;">검색목록에서 보여줄  상세정보 *</label>
					<textarea class="form-control" name="detailinfo" rows="3">
					<%=semi.getSeminaContent1() %>
					</textarea>
					</div>
					</div>
					
					
					
					<div id='1'class='form-group'>
					<label for='disc' style='padding:auto; width:100px;'>정보 제목</label>	
					<div style='width: 99%;'>
					<input type='text' id='phone' name='detailtitle1' value="<%=semi.getSeminatitle2() %>" class='form-control' style='width:150px; float:left'>
					<input type='button' onclick='removeDetail(this)' id='1' class='btn btn-primary center' value='정보삭제하기' style='margin-left:10px;'>
					<input type='button' onclick='addDetail()' class='btn btn-primary center' value='정보 추가하기' style='margin-left:10px;'>
					</div>
					<label for='disc' style='margin-top:5px; width:100px;'>상세정보
					</label>
					<textarea name='detailinfo"+detailCount+"' class='form-control' rows='3'>
					<%=semi.getSeminaContent2() %>
					</textarea>
					</div>
					
					<div id='2'class='form-group'>
					<label for='disc' style='padding:auto; width:100px;'>정보 제목</label>	
					<div style='width: 99%;'>
					<input type='text' id='phone' name='detailtitle2' value="<%=semi.getSeminatitle3() %>" class='form-control' style='width:150px; float:left'>
					<input type='button' onclick='removeDetail(this)' id='2' class='btn btn-primary center' value='정보삭제하기' style='margin-left:10px;'>
					<input type='button' onclick='addDetail()' class='btn btn-primary center' value='정보 추가하기' style='margin-left:10px;'>
					</div>
					<label for='disc' style='margin-top:5px; width:100px;'>상세정보
					</label>
					<textarea name='detailinfo"+detailCount+"' class='form-control' rows='3'>
					<%=semi.getSeminaContent3() %>
					</textarea>
					</div>
					
					<div id='3'class='form-group'>
					<label for='disc' style='padding:auto; width:100px;'>정보 제목</label>	
					<div style='width: 99%;'>
					<input type='text' id='phone' name='detailtitle3' value="<%=semi.getSeminatitle4() %>" class='form-control' style='width:150px; float:left'>
					<input type='button' onclick='removeDetail(this)' id='1' class='btn btn-primary center' value='정보삭제하기' style='margin-left:10px;'>
					<input type='button' onclick='addDetail()' class='btn btn-primary center' value='정보 추가하기' style='margin-left:10px;'>
					</div>
					<label for='disc' style='margin-top:5px; width:100px;'>상세정보
					</label>
					<textarea name='detailinfo"+detailCount+"' class='form-control' rows='3'>
					<%=semi.getSeminaContent4() %>
					</textarea>
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
					 <input type="hidden" value="<%=semi.getSeminaNo()%>" name="semino">
					<center>
					<input type="hidden" name="userno"  value="<%=loginUser.getUserNo()%>">
					<input type="submit" value="세미나수정" class="btn btn-primary center">
		
					<input type="button" onclick="history.back()" value="뒤로가기" class="btn btn-primary center">
					</center>
				</form>

			</div>
		</div>
</div>

</div>

<%@ include file="/common/footer.jsp" %>
</body>
</html>