<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html
>
<html>
<head>
<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>은밀한 과외 가입하기</title>
</head>
<body>
<%@ include file="/header.jsp" %>

<nav class="contents">

<div id="wrapper">
	<br>
	<h1 align="center">은밀한 과외 가입하기</h1>
	<hr>
	
	<center>
	 <div float="left" style="padding: 80px">
    <a href="/prototype/04.OJK/join_teacher.jsp"><button type="button" class="btn btn-primary" style="width:300px; height: 250px;
    margin: 50px; font-size: 30px; ">
    선생님으로 가입</button></a>
  	
    <a href="/prototype/04.OJK/join_student.jsp"><button type="button" class="btn btn-info" style="width:300px; height: 250px;
    margin: 50px; font-size: 30px;">학생으로 가입</button></a>

    </div>
	</center>
</div>

</nav>
</body>
</html>