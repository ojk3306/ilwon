<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/prototype/common/resources/js/jquery-3.3.1.min.js"></script>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel='stylesheet' type='text/css'>
<script type="text/javascript">


function updatephone(){
	$.ajax({
		url:"<%=request.getContextPath()%>/userupdate.sm",
	    data:{ userno:$("#a").val(), value:$("#rephone").val(),pwd:$("#rephone").val(),type:"1" },
		type:"get",
	    success:function(data){
	    	console.log(data)
	    	$("#userphone").text(data);
	    }
	});
}

function updatepwd(){
	$.ajax({
		url:"<%=request.getContextPath()%>/userupdate.sm",
	    data:{ userno:$("#a").val(), value:$("#repwd").val(), pwd:$("#repwd").val(),type:"2" },
		type:"get",
	    success:function(data){
	    	console.log(data)
	    }
	});
}


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
   <h4><%=loginUser.getUserName()%>의 프로필</h4></div>
   <div class="panel-body" >
       
    <div class="box box-info" >
        
            <div class="box-body" >
                     



<div class="clearfix" ></div>
<hr style="margin:5px 0 5px 0;">
 <form>
 <input type="hidden" id="a" value="<%=loginUser.getUserNo() %>">
<div class="col-sm-5 col-xs-6 tital"  >
<strong>이름:</strong>&nbsp;
<label id="username"><%=loginUser.getUserName() %></label>
</div>
<div class="col-sm-7 col-xs-6" style="font-size:medium;">


</div>
<div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital">
<strong>이메일:</strong>&nbsp;
<label id="usermail"><%=loginUser.getUserEmail()%></label>
</div>

<div class="clearfix"></div>
<div class="bot-border"></div>
<div class="col-sm-5 col-xs-6 tital">
<strong>비밀번호:</strong>&nbsp;
</div>
<div class="col-sm-7 col-xs-6" style="font-size:medium;">
<INPUT TYPE="TEXT" id="repwd">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="btn btn-primary loading" value="비번 수정" onclick="updatepwd();" id="4"  readonly="readonly">
</div>
<div class="clearfix"></div>
<div class="bot-border"></div>
<div class="col-sm-5 col-xs-6 tital">
<strong>나이:</strong>&nbsp;
<label id="userage"><%=loginUser.getUserAge()%></label>
</div>

<div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital">
<strong>성별:</strong>&nbsp;
<label id="usergender"><%=loginUser.getUserGender()%></label>
</div>

<div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital">
<strong>전화번호:</strong>&nbsp;
<label id="userphone"><%=loginUser.getUserPhone() %></label>
</div>
<div class="col-sm-7 col-xs-6" style="font-size:medium;">
<INPUT TYPE="TEXT" id="rephone" value="<%=loginUser.getUserPhone()%>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="btn btn-primary loading" value="전번 수정" onclick="updatephone();" id="4"  readonly="readonly">
</div>
<div class="clearfix"></div>
<div class="bot-border"></div>
<div class="col-sm-5 col-xs-6 tital"  >
<strong>주소:</strong>&nbsp;&nbsp;
<label id="userloc"><%=loginUser.getUserLoc() %></label>
</div>





<div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital">
<strong>회원가입일:</strong>&nbsp;<%=loginUser.getUserEnrollDate() %>
</div>






<div class="clearfix"></div>
<div class="bot-border"></div>
                

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
    
   </div>
</div>


         
<%@include file="/common/footer.jsp" %>

</body>
</html>