<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "notice.model.vo.*" %>

<%
	Notice notice = (Notice)request.getAttribute("notice");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeUpdate</title>

<style type="text/css">

	body {
		overflow:auto;		
	}

	.ohw-div {
		align:center;
	}
	.ohw-div-utextbox {
		width:750px;
		height:30px;		
	}
	.ohw-div-utextarea {
		width:750px;
		height:450px;		
	}
	
</style>

</head>
<body>
<%@ include file="/common/navbar.jsp" %>

<script type="text/javascript">



</script>

<div class = "ohw-div" align = "center">
	<h1>공지사항 수정</h1>
</div>

<hr>
<div class = "ohw-update" align = "center">
<form action="<%= request.getContextPath() %>/nupdate?no=<%= notice.getNoticeNo() %>" method = "post">
<input type = "hidden" name = "uwriter" value = "<%= loginUser.getUserName() %>">
<input type = "hidden" name = "uwritern" value = "<%= loginUser.getUserNo() %>">
<input type = "hidden" name = "udate" value = "<%= notice.getNoticeDate() %>">

<div class = "ohw-div-utextbox">
	<input class = "form-control ohw-utitle" type="text" name = "utitle" placeholder = "제목" size = "98px" value = "<%= notice.getNoticeTitle() %>">
</div>

<hr>

<div class = "ohw-div-utextarea">
	<textarea class = "form-control ohw-ucontent" name = "ucontent" rows="21" cols="100" style = "resize:none" placeholder = "내용"><%= notice.getNoticeContent() %></textarea>
</div>

<div align = "center">
	<table>
		<tr>
			<td style = "padding-right:5px;">
				<button type="submit" class="btn btn-default">
					<span class="glyphicon glyphicon-ok" aria-hidden="true"></span> 수정 완료
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