<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeDetail</title>

<style type="text/css">

	body {
		overflow:auto;		
	}

	.ohw-div {
		align:center;
	}
	.ohw-div-textbox {
		width:750px;
		height:30px;		
	}
	.ohw-div-textarea {
		width:750px;
		height:450px;		
	}
	
</style>
</head>
<body>
<%@ include file="/common/navbar.jsp" %>

<div align = "center" class = "ohw-div">
	<h1>공지사항 작성</h1>
</div>

<hr>
<div align = "center">
<form action="/prototype/ninsert" method = "post">
<input type = "hidden" name = "nwriter" value = "<%= loginUser.getUserName() %>">
<input type = "hidden" name = "nwritern" value = "<%= loginUser.getUserNo() %>">
<div class = "ohw-div-textbox">
	<input class = "form-control" type="text" name = "ntitle" placeholder = "제목" size = "98px" required>
</div>

<hr>

<div class = "ohw-div-textarea">
	<textarea class = "form-control" name = "ncontent" rows="21" cols="100" style = "resize:none" placeholder = "내용"></textarea>
</div>

<div align = "center">
	<table>
		<tr>
			<td style = "padding-right:5px;">
				<button type="submit" class="btn btn-default">
					<span class="glyphicon glyphicon-ok" aria-hidden="true"></span> 작성 완료
				</button>
			</td>
			<td>
				<button type="reset" class="btn btn-default">
					<span class="glyphicon glyphicon-refresh" aria-hidden="true"></span> 초기화
				</button>
			</td>
		</tr>
	</table>
</div>
</form>
</div>
<hr>
	
<%@ include file="/common/footer.jsp" %>
</body>
</html>