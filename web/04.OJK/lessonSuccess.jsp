<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강의 등록 성공!</title>
<script>

function moveInfoPage() {
	location.href = "<%= request.getContextPath() %>/04.OJK/teacherinfo.jsp"
}
</script>
</head>
<body>
<%@include file="/common/navbar.jsp" %>

<div id="wrapper" style="width:100%; height:1500px;" align="center">
	<h1 align="center" style="margin-top:300px;">강의 등록 성공!</h1>
	<h3>양질의 강의 부탁드립니다!</h3>
	<br>
	<button type="button" class="btn btn-success" onclick="moveInfoPage()">돌아가기</button>


</div>

<%@ include file="/common/footer.jsp" %>
</body>
</html>