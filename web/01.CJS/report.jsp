<%@page import="report.model.vo.Report, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
ArrayList<Report> re=(ArrayList<Report>)request.getAttribute("list");

int listCount = ((Integer)request.getAttribute("listCount")).intValue();
int startPage = ((Integer)request.getAttribute("startPage")).intValue();
int endPage = ((Integer)request.getAttribute("endPage")).intValue();
int maxPage = ((Integer)request.getAttribute("maxPage")).intValue();			
int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();


int seachOption =((Integer)request.getAttribute("seachoption")).intValue();

String search = (String)request.getAttribute("search");


String message=null;
if((String)request.getAttribute("message")!=null)	
	 message=(String)request.getAttribute("message");	

String message1=null;
if((String)request.getAttribute("message1")!=null)	
message=(String)request.getAttribute("message1");	


%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/prototype/resources/js/jquery-3.3.1.min.js"></script>
<script src="/prototype/resources/vendor/jquery/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

<meta name="viewport" content="initial-scale=1.0, user-scalable=no">

<script type="text/javascript">

</script>	
<style type="text/css">

html {
height: 100%;
}
body {
margin: 0;
height: 100%;
}
.contents{
min-height: 100%;
position: relative;
margin-top:90px;
padding-bottom:20px;
}

/* 버튼테마 */
.btn {
	display: inline-block;
	padding: 6px 12px;
	margin-bottom: 0;
	font-size: 14px;
	font-weight: 400;
	line-height: 1.42857143;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	-ms-touch-action: manipulation;
	touch-action: manipulation;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	background-image: none;
	border: 1px solid transparent;
	border-radius: 4px
}

.btn.active.focus, .btn.active:focus, .btn.focus, .btn:active.focus,
	.btn:active:focus, .btn:focus {
	outline: 5px auto -webkit-focus-ring-color;
	outline-offset: -2px
}

.btn.focus, .btn:focus, .btn:hover {
	color: #333;
	text-decoration: none
}

.btn.active, .btn:active {
	background-image: none;
	outline: 0;
	-webkit-box-shadow: inset 0 3px 5px rgba(0, 0, 0, .125);
	box-shadow: inset 0 3px 5px rgba(0, 0, 0, .125)
}

.btn.disabled, .btn[disabled], fieldset[disabled] .btn {
	cursor: not-allowed;
	filter: alpha(opacity = 65);
	-webkit-box-shadow: none;
	box-shadow: none;
	opacity: .65
}

a.btn.disabled, fieldset[disabled] a.btn {
	pointer-events: none
}

th {
	background: gray;

}
</style>

<meta charset="UTF-8">
<title>신고게시판</title>
</head>
<body>
<!-- 헤더 시작-->
<%@ include file="/common\navbar.jsp" %>
<!-- 헤더 종료-->

<!-- 내용 시작 -->

<nav class="contents">
	<br>
	<h1 align="center">신고 계시판 게시판 형식은 어드민이 보는것, 누르면 바로 작성 폼으로 이동한다.</h1>
	<hr>
	<section>
<div id="wrapper">
	<center>
	<div style="width: 1100px; height: 1200px;">
		 
		 	 <!-- 게시판 몸통 -->	
		 	 
		 	<div style="margin-top: 30px;">
		 	<table class="table table-hover">
		 		
		 		<tr>
		 			<th>제목</th>
		 			<th>작성일</th>
		 			<th>첨부파일여부</th>
		 			
		 		</tr>
				<%if(re.size()!=0){ %>
		 		<% for( Report  i : re) { %>
		 		<tr>
		 		
		 			<td><a href="/prototype/redetail?pno=<%=i.getReportNo() %>"><%=i.getReportTitle() %></a></td>
		 			<td><%=i.getReportDate()%></td>
		 			<%if(i.getReportRenameFileName()==null){ %>
		 			<td>사진이 없어</td>
		 			<%}else{ %>
		 			
		 			<td>사진있어
		 			</td>
		 			<%} %>
		 		</tr>
		 		<%}}else{ %>
		 		<th><h3><%=message%></h3></th>
		 		
		 		<%} %>
		 	</table>
		 	
		 	
		 	</div>
		 	<!-- 게시판 몸통끝 -->
	 		<div>
	 			<select>
				  <option>제목</option>
				  <option>내용</option>
				</select>
	 			<input type="text">	 
	 			<input type="submit" name="search_submit" class="btn" value="검색">	
	 		</div>
	 		<div id="board_page">
		 		<ul class="pagination">
				
	 		<% if((currentPage - 10) < startPage && (currentPage - 10) > 1){ %>
			<li class="page-item"><a class="page-link" href="/prototype/reportlist?page=<%= startPage - 10 %>">Previous</a></li>
			<% }else{ %>	  
			<li class="page-item"><a class="page-link" onclick="retu()">Previous</a></li>
			<% } %> 
			
			
			<% for(int p = startPage; p <= endPage; p++){%>
			<%if(p == currentPage){%>
			<li class="page-item"><a class="page-link" href="#"><strong><%= p %></strong></a></li>
			<%}else{ %>	 
			<li class="page-item"><a class="page-link" href="/prototype/reportlist?page=<%= p %>&seach=<%=search%>&option=<%=seachOption%>"><strong><%= p %></strong></a></li>
			<% }} %> 
		
			<% if((currentPage + 10) > endPage && (currentPage + 10) < maxPage){ %>
	 		<li class="page-item"><a class="page-link" href="/prototype/reportlist?page=<%= endPage + 10 %>">Next</a></li>
			<% }else{ %>
		<li class="page-item"><a class="page-link" onclick="retu()">Next</a></li>
	<% } %> 

				</ul>	 		
	 		</div> 	
	 	</div>	 
	</div>
	
	
	</section>	
</center>

</nav>













<!--내용 끝-->

 <!-- 바닥 -->
<!--바닥종료-->


</body>
</html>