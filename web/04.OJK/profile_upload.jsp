<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프로필 업로드</title>
</head>
<body>
<%@include file="/common/navbar.jsp" %>
<input type="hidden" value="<%= loginUser.getUserNo() %>" name="userno" id="userno">
<form action='"/prototype/uploadp?no="+<%= loginUser.getUserNo() %>'method="post" enctype="multipart/form-data">
<input type="file" name="upfile"> 
<input type="submit" value="등록">
</form>
</body>
</html>