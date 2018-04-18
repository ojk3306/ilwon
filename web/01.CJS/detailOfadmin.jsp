<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="users.model.vo.*" %>
    <%
	
	Users use=(Users)session.getAttribute("loginUser");
	
    Users user=(Users)request.getAttribute("user");
    %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/prototype/common/resources/js/jquery-3.3.1.min.js"></script>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel='stylesheet' type='text/css'>
<script type="text/javascript">
function updatename(){
$.ajax({
	url:"<%=request.getContextPath()%>/adminupdate",
    data:{userno:$("#a").val(),value:$("#rename").val(),type:"1"},//추가로 유저 번호도 보낸다.
	type:"get",
    success:function(data){
    	console.log(data)
    	$("#username").text(data);
    }
});
}

function updatemail(){
	$.ajax({
		url:"<%=request.getContextPath()%>/adminupdate",
	    data:{userno:$("#a").val(),value:$("#remail").val(),type:"2"},//추가로 유저 번호도 보낸다.
		type:"get",
	    success:function(data){
	    	console.log(data)
	    	$("#usermail").text(data);
	    }
	});
}

function updateage(){
	$.ajax({
		url:"<%=request.getContextPath()%>/adminupdate",
	    data:{userno:$("#a").val(),value:$("#reage").val(),type:"3"},//추가로 유저 번호도 보낸다.
		type:"get",
	    success:function(data){
	    	console.log(data)
	    	$("#userage").text(data);
	    }
	});
}

function updategender(){
	$.ajax({
		url:"<%=request.getContextPath()%>/adminupdate",
	    data:{ userno:$("#a").val(), value:$("input:radio[name='gender']:checked").val(),type:"4" },
		type:"get",
	    success:function(data){
	    	console.log(data)
	    	$("#usergender").text(data);
	    }
	});
}

function updatephone(){
	$.ajax({
		url:"<%=request.getContextPath()%>/adminupdate",
	    data:{ userno:$("#a").val(), value:$("#keycount").val(),type:"5" },
		type:"get",
	    success:function(data){
	    	console.log(data)
	    	$("#userphone").text(data);
	    }
	});
}

function updatekeymax(){
	$.ajax({
		url:"<%=request.getContextPath()%>/adminupdate",
	    data:{ userno:$("#a").val(), value:$("#keycount").val(),type:"6" },
		type:"get",
	    success:function(data){
	    	console.log(data)
	    	$("#keyword").text(data);
	    }
	});
}

function updatelessonmax(){
	$.ajax({
		url:"<%=request.getContextPath()%>/adminupdate",
	    data:{ userno:$("#a").val(), value:$("#lessoncount").val(),type:"7" },
		type:"get",
	    success:function(data){
	    	console.log(data)
	    	$("#maxlesson").text(data);
	    }
	});
}

function updateloginable(){
	if($("#TriSeaPrimary").is(":checked")!=true ) {
		$.ajax({
			url:"<%=request.getContextPath()%>/adminupdate",
		    data:{ userno:$("#a").val(),value:"N",type:"8"},
			type:"get",
		    success:function(data){
		    	console.log(data)
		    	$("#TriSeaPrimary").attr("checked", false);
		    }
		});
	}else{
		$.ajax({
			url:"<%=request.getContextPath()%>/adminupdate",
		    data:{ userno:$("#a").val(),value:"Y",type:"8"},
			type:"get",
		    success:function(data){
		    	console.log(data)
		    	 $("#TriSeaPrimary").attr("checked", true);
		    }
		});
	}
}

function updateexeable(){

	if($("#TriSeaInfo").is(":checked")!=true ) {
		$.ajax({
			url:"<%=request.getContextPath()%>/adminupdate",
		    data:{ userno:$("#a").val(),value:"N",type:"9"},
			type:"get",
		    success:function(data){
		    	console.log(data)
		    	$("#TriSeaInfo").attr("checked", false);
		    }
		});
	}else{
		$.ajax({
			url:"<%=request.getContextPath()%>/adminupdate",
		    data:{ userno:$("#a").val(),value:"Y",type:"9"},
			type:"get",
		    success:function(data){
		    	console.log(data)
		    	 $("#TriSeaInfo").attr("checked", true);
		    }
		});
	}
}

$(function(){
	if(<%=use.getUserTypeNo()%> != 1003 )
		location.href="/prototype/index.jsp";
	
	if(<%=user.getUserGender()%>==M){
		$("#M").attr("checked", true);
	}else{
		$("#F").attr("checked", true);
	}
	
	if('<%=user.getUserLoginable()%>'=='Y'){
        $("#TriSeaPrimary").attr("checked", true);    
	}else{
		$("#TriSeaPrimary").attr("checked", false);
	}
	
	if('<%=user.getUserExeable()%>'=='Y'){
	    $("#TriSeaInfo").attr("checked", true);     
	}else{
		$("#TriSeaInfo").attr("checked", false);
	}
})

</script>

<style>

body {
background:#eeeeee;
}
.container{

}
.TriSea-technologies-Switch > input[type="checkbox"] {
    display: none;   
}

.TriSea-technologies-Switch > label {
    cursor: pointer;
    height: 0px;
    position: relative; 
    width: 40px;  
}

.TriSea-technologies-Switch > label::before {
    background: rgb(0, 0, 0);
    box-shadow: inset 0px 0px 10px rgba(0, 0, 0, 0.5);
    border-radius: 8px;
    content: '';
    height: 16px;
    margin-top: -8px;
    position:absolute;
    opacity: 0.3;
    transition: all 0.4s ease-in-out;
    width: 40px;
}
.TriSea-technologies-Switch > label::after {
    background: rgb(255, 255, 255);
    border-radius: 16px;
    box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.3);
    content: '';
    height: 24px;
    left: -4px;
    margin-top: -8px;
    position: absolute;
    top: -4px;
    transition: all 0.3s ease-in-out;
    width: 24px;
}
.TriSea-technologies-Switch > input[type="checkbox"]:checked + label::before {
    background: inherit;
    opacity: 0.5;
}
.TriSea-technologies-Switch > input[type="checkbox"]:checked + label::after {
    background: inherit;
    left: 20px;
}
.col-md-7{
margin-top: 50px;
margin-left: 190px;
}

#profile-image1 {
    cursor: pointer;
     width: 100px;
    height: 100px;
	border:2px solid #03b1ce ;}
	.tital{ 
	font-size:16px; font-weight:500;
	}
	 .bot-border{ 
	 border-bottom:1px #f8f8f8 solid;  margin:5px 0  5px 0
	 }	
	 
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>유저 디테일</title>
</head>
<body style="background:#eeeeee;">
<%@include file="/common/navbar.jsp" %>



<div class="container" style="height: 900px" >
	<div class="row" >
  <div class="col-md-7" Style="overflow:hidden;">
<div class="panel panel-default">
  <div class="panel-heading" style="background:#00ffff;"> 
   <h4><%=user.getUserName()%>의 프로필</h4></div>
   <div class="panel-body" >
       
    <div class="box box-info" >
        
            <div class="box-body" >
<div class="col-sm-6">
 <div align="center"> 
    <%if(user.getUserOriginalPhoto() != null) { %>
						<img alt="User Pic" style="width:200px; height: 180px; " src="/prototype/userTitleimg/<%=user.getUserOriginalPhoto()%>" class="img-circle img-responsive"> 
					<% }else{%>
							<img src="/prototype/userTitleimg/rakoon.jpg"
							class="img-circle" alt="Cinque Terre" width="200px"
							height="200px">

					<%} %>


   </div>
              
              <br>
    
              <!-- /input-group -->
</div>

 

<div class="clearfix" ></div>
<hr style="margin:5px 0 5px 0;">
 <form>
<div class="col-sm-5 col-xs-6 tital"  >
<strong>이름:</strong>&nbsp;
<label id="username"><%=user.getUserName() %></label>
</div>
<div class="col-sm-7 col-xs-6" style="font-size:medium;">
<INPUT id="rename" TYPE="TEXT" value="<%=user.getUserName()%>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="btn btn-primary loading"  id="1" onclick="updatename();" value="이름 수정" readonly="readonly">

</div>
<div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital">
<strong>이메일:</strong>&nbsp;
<label id="usermail"><%=user.getUserEmail()%></label>
</div>
<div class="col-sm-7 col-xs-6" style="font-size:medium;">
<INPUT TYPE="TEXT" id="remail" value="<%=user.getUserEmail()%>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="btn btn-primary loading" onclick="updatemail();" id="2"  value="메일 수정" readonly="readonly">
</div>
<div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital">
<strong>나이:</strong>&nbsp;
<label id="userage"><%=user.getUserAge()%></label>
</div>
<div class="col-sm-7 col-xs-6" style="font-size:medium;">
<INPUT TYPE="number" id="reage" value="<%= user.getUserAge()%>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="btn btn-primary loading" onclick="updateage();" id="3"  value="나이 수정" readonly="readonly">
</div>
<div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital">
<strong>성별:</strong>&nbsp;
<label id="usergender"><%=user.getUserGender()%></label>
</div>
<div class="col-sm-7 col-xs-6" style="font-size:medium;">

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<INPUT TYPE="radio" id="M" name="gender" value="M">남성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="radio" id="F"  name="gender" value="F">여성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" onclick="updategender();" id="3"  class="btn btn-primary loading" value="성별 수정" readonly="readonly">

</div>
<div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital">
<strong>전화번호:</strong>&nbsp;
<label id="userphone"><%=user.getUserPhone()%></label>
</div>
<div class="col-sm-7 col-xs-6" style="font-size:medium;">
<INPUT TYPE="TEXT" id="rephone" value="<%=user.getUserPhone()%>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="btn btn-primary loading" value="전번 수정" onclick="updatephone();" id="4"  readonly="readonly">
</div>
<div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital">
<strong>최대 키워드수:</strong>&nbsp;
<label id="keyword"><%=user.getUserKeywordCount()%></label>
</div>
<div class="col-sm-7 col-xs-6" style="font-size:medium;">
<INPUT TYPE="number" id="keycount" min="5" value="<%=user.getUserKeywordCount()%>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="btn btn-primary loading" id="5"  onclick="updatekeymax();" value="키워드 수정" readonly="readonly">
</div>
<div class="clearfix"></div>
<div class="bot-border"></div>
<div class="col-sm-5 col-xs-6 tital">

<strong>최대 강의수 :</strong>&nbsp;
<label id="maxlesson"><%=user.getUserLessonmax()%></label>
</div>
<div class="col-sm-7 col-xs-6" style="font-size:medium;">
<INPUT TYPE="number" id="lessoncount" value="<%=user.getUserLessonmax()%>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="btn btn-primary loading" value="강의수 수정" id="6" onclick="updatelessonmax();" readonly="readonly">
</div>
<div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital">
<strong>회원가입일:</strong>&nbsp;<%=user.getUserEnrollDate() %>
</div>







                <!-- Default panel contents -->
                <h2 class="panel-heading" style="text-align:center;">권한 설정</h2>
      
                <ul class="list-group">
                 
                    <li class="list-group-item">
 						     로그인권한
                        <div class="TriSea-technologies-Switch pull-right">
                            <input id="TriSeaPrimary" name="TriSea1" type="checkbox" onclick="updateloginable()" checked="checked">
                            <label for="TriSeaPrimary" class="label-primary"></label>
                        </div>
                    </li>
   
                    <li class="list-group-item">
             			      글 작성권한
                        <div class="TriSea-technologies-Switch pull-right">
                            <input id="TriSeaInfo" name="TriSea1" type="checkbox" onclick="updateexeable()" checked="checked">
                            <label for="TriSeaInfo" class="label-info"></label>
                        </div>
                    </li>
                </ul>

<center>

<input type="button" class="btn btn-primary loading" value="뒤로가기" onclick="history.back(-1)" readonly="readonly">
</center>
</form>










            <!-- /.box-body -->
          </div>
          <!-- /.box -->

        </div>
       
            
    </div> 
    </div>
</div>  
    <script>
              $(function() {
    $('#profile-image1').on('click', function() {
        $('#profile-image-upload').click();
    });
});       
              </script>
   </div>
</div>


         
<input type="hidden" value="<%=user.getUserNo()%>" id="a">
<%@include file="/common/footer.jsp" %>

</body>
</html>