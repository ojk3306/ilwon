<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 업로드</title>

<style type="text/css">

	@import url('https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css');
	
	input {
		width:120px;
		height:40px; 
 		opacity: 0;
		position: relative;
	}
	
	.ohw-file-btn {    /*button tag 에 원하는 스타일 적용*/
		width:120px;
		height:40px;
		position: absolute;						
		cursor: pointer;
	}
	
	
</style>

</head>
<body>
<%@include file="/common/navbar.jsp" %>

<form action="/prototype/uploadp" method="post" enctype="multipart/form-data">
	<input type="hidden" value="<%= loginUser.getUserNo() %>" name="userno" id="userno">
	<div>
	<button class = "btn btn-default ohw-file-btn" name="upfile">
		<i class="fa fa-id-badge" style="font-size:20px"></i> 사진 올리기
	</button>
	<input  class = "btn btn-default" type = "file" name = "upfile">
	</div>
	<button type="submit" class = "btn btn-default" value="등록">
		<i class="fa fa-check" style="font-size:20px"></i> 등록
	</button>
</form>
</body>
</html>