<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>

<%
String message =(String)request.getAttribute("message");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>로그인</title>
<script type="text/javascript" src="/prototype/common\resources\js\jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
	alert('<%=message%>');
})


</script>
    
<style type="text/css">
    
	body {
		padding-top: 40px;
		padding-bottom: 40px;
		background-color: #eee;
	}

	.form-signin {
		max-width: 330px;
		padding: 15px;
		margin: 0 auto;
	}
	
	.form-signin .form-signin-heading, .form-signin .checkbox {
		margin-bottom: 10px;
	}
	
	.form-signin .checkbox {
		font-weight: normal;
	}
	
	.form-signin .form-control {
		position: relative;
		height: auto;
		-webkit-box-sizing: border-box;
		-moz-box-sizing: border-box;
		box-sizing: border-box;
		padding: 10px;
		font-size: 16px;
	}
	
	.form-signin .form-control:focus {
		z-index: 2;
	}
	
	.form-signin input[type="email"] {
		margin-bottom: -1px;
		border-bottom-right-radius: 0;
		border-bottom-left-radius: 0;
	}
	
	.form-signin input[type="password"] {
		margin-bottom: 10px;
		border-top-left-radius: 0;
		border-top-right-radius: 0;
	}
    
</style>
   
</head>

<body>

<div style="margin-top: -48px;">
	<%@ include file = "../../common/navbar.jsp" %>
</div>

<div class = "container">
	<form class = "form-signin" action = "<%= request.getContextPath() %>/login.sm">
		<h2 class="form-signin-heading">로그인</h2>
		
		<label for="inputEmail" class="sr-only">ID</label>
		<input type="email" id="inputEmail" name = "id" class="form-control" placeholder="ID" required autofocus>
		
		<label for="inputPassword" class="sr-only">Password</label>
		<input type="password" id="inputPassword" name = "pwd" class="form-control" placeholder="Password" required>
		
		<div class="checkbox">		
		<label>
		<input type="checkbox" value="remember-me"> 정보 기억
		</label>		
		</div>
		
		<button class="btn btn-lg btn-primary btn-block" type="submit">LogIn</button>
	</form>
</div>

<div class = "form-signin">
	<a href = "../../04.OJK/join_start.jsp">
		<input type = "button" class = "btn btn-lg btn-success btn-block" value = "아직 회원이 아니시라면?">
	</a>
</div>

<div style="margin-top:30%">
	<%@ include file = "../../common/footer.jsp" %>
</div>
	
</body>
</html>
