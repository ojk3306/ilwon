<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%
	String message = (String)request.getAttribute("message");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>noticeError</title>
</head>
<body>
	<%@ include file="../../header.jsp" %>
	<hr style="clear:both;">
	
	<section style="height : 400px; background : gray;">
	
	<% if(message != null) { %>
		에러 발생 : <%= message %>
	<% } else { %>
		에러 발생 : <%= exception.getMessage() %>
	<% } %>
		
	<a href="/first/index.jsp">시작페이지로 이동</a>
	
	</section>
	<%@ include file= "../../footer.html" %>	
</body>
</html>