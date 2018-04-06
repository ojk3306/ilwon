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
<title>noticeDetail</title>

<style type="text/css">

	body {
		overflow:auto;
		
	}

	.ohw-div {
		align:center;
		border:1px solid #b3b3b3;
		width:850px;
	}
	
	.ohw-div-header {
		width:800px;
		height:40px;
		border-bottom:1px dashed #e6e6e6;
	}
	
	.ohw-div-header2 {
		width:800px;
		height:40px;
		border-bottom:1px dashed #e6e6e6;
	}
	
	.ohw-table-header {
		width:800px;
		height:40px;		
	}
	
	.ohw-table-header2 {
		width:800px;
		height:40px;
	}
	
	.ohw-notice-no {
		width:100px;
		height:40px;
		text-align:center;
	}
	
	.ohw-notice-title {
		width:500px;
		height:40px;
		text-align:left;
		padding-left:20px;
	}
	
	.ohw-notice-date {
		width:150px;
		height:40px;
		text-align:right;
		padding-right:20px;
	}
	
	.ohw-notice-name {
		min-width:20px;		
		height:40px;
		text-align:left;
		padding-left:40px;
	}
	
	.ohw-notice-paper {
		width:150px;
		height:40px;
		text-align:left;
	}
	
	.ohw-notice-address {
		width:500px;
		height:40px;
		text-align:right;
		padding-right:20px;
		color:gray;
	}	
	
	.ohw-div-content {
		width:800px;
		height:450px;
		text-align:left;
		background:#e6e6e6;
		padding:20px;
		margin-bottom:20px;
	}
	
	.ohw-tag-a {
		color:gray;
	}
	
	.ohw-div-btn {
		padding-top:30px;
	}
	
</style>
</head>
<body>
<%@ include file="/common/navbar.jsp" %>
<br>
<hr>
<br>
<div align = "center">
<form action="<%= request.getContextPath() %>/nupdate" method = "post">
<input type = "hidden" name = "dwritern" value = "<%= loginUser.getUserNo() %>">

<div class = "ohw-div">
<div>
	<div class = "ohw-div-header">
	<table class = "ohw-table-header">
	
		<tr>
			<td class = "ohw-notice-no"><%= notice.getNoticeNo() %></td>
			<td class = "ohw-notice-title">[공지] <%= notice.getNoticeTitle() %></td>
			<td class = "ohw-notice-date"><%= notice.getNoticeDate() %></td>
		</tr>
		
	</table>
	</div>
	
	<table class = "ohw-table-header2">
				
		<tr>
			<td class = "ohw-notice-name"><label><%= loginUser.getUserName() %></label></td>
			<td class = "ohw-notice-paper">
				<button type="button" class="btn btn-default btn-xs">
					<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span> 쪽지
				</button>
			</td>
			<td class = "ohw-notice-address"><a class = "ohw-tag-a"><font size = "1em"><%= request.getRequestURL() %></font></a></td>
		</tr>
		
	</table>
</div>

<div class = "ohw-div-content">
<font>
	<%= notice.getNoticeContent() %>
</font>
</div>
</div>
<div class = "ohw-div-btn" align = "center">
	<table>
		<tr>
			<td style = "padding-right:5px;">
				<button type="submit" class="btn btn-default">
					<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 수정
				</button>
			</td>
			<td>
				<button type="button" class="btn btn-default">
					<span class="glyphicon glyphicon-trash" aria-hidden="true"></span> 목록
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