<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script>
	function moveLoginPage() {
		location.href = "/prototype/03.OHW/views/login.jsp"
	}


</script>
</head>
<body>
<%@ include file="/common/navbar.jsp" %>

<div id="wrapper" style="width:100%; height:1500px;" align="center">
	<h1 align="center" style="margin-top:300px;">회원가입 성공!</h1>
	<h3>은밀한 과외의 회원이 되신걸 환영합니다!</h3>
	<br>
	<button type="button" class="btn btn-success" onclick="moveLoginPage()">로그인하러가기</button>


</div>

<%@ include file="/common/footer.jsp" %>
</body>
</html>