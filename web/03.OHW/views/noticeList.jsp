<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="notice.model.vo.*" %>
    
<% 
ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
int listCount = ((Integer)(request.getAttribute("listCount"))).intValue();
int startPage = ((Integer)(request.getAttribute("startPage"))).intValue();
int endPage = ((Integer)(request.getAttribute("endPage"))).intValue();
int maxPage = ((Integer)(request.getAttribute("maxPage"))).intValue();
int currentPage = ((Integer)(request.getAttribute("currentPage"))).intValue();
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건의게시판</title>
	
<style type="text/css">
	
	body {
		overflow:auto;
	}
	
	.ohw-notice {
		
	}
	
	.ohw-notice-tr {
		
	}
	
	.ohw-notice-conn {
		text-align:center;
	}
	
	.ohw-notice-cont {
		text-align:center;
	}
	
	.ohw-notice-cond {
		text-align:center;
	}
	
	.ohw-notice-page {
		text-align:center;
		align:center;
	}
		
</style>
	
</head>
<body> 
<%@ include file="/common/navbar.jsp" %>

<script type="text/javascript">
	
	$(function () {
	
	$.ajax({
		url:"<%= request.getContextPath() %>/nlist",
		dataType:"json",
		success:function(data) {
			
			//json 객체 하나(data)를 문자열 형태로 바꿈
			var jsonStr = JSON.stringify(data);
			//문자열을 다시 자바스크립트가 사용할 수 있는
			//json 객체로 파싱함
			var json = JSON.parse(jsonStr);		 
			
			console.log(data);
			
			for(var i in json.list) {
				
				$('.ohw-notice').append(
						
					"<tr class = 'ohw-notice-tr'><td class = 'ohw-notice-conn'>" + json.list[i].noticeNo + "</td>" +
						
					<% if(loginUser != null) { %>
				
						"<td class = 'ohw-notice-cont'><a href = '<%= request.getContextPath() %>/ndetail?no=" + json.list[i].noticeNo + "&page=1'>" + json.list[i].noticeTitle + "</a></td>"

					<% } else { %>
				
						"<td class = 'ohw-notice-cont'>" + json.list[i].noticeTitle + "</td>"
			
					<% } %>	+			
										 
					"<td class = 'ohw-notice-conw'>" + json.list[i].userName + "</td>" + 
					"<td class = 'ohw-notice-cond'>" + json.list[i].noticeDate + "</td></tr>"
				
				);				
			}			
		}	
	});	
});	
	
</script>

<nav class="contents">
<br>
<h1 align="center">공지 사항</h1>
<hr>	
<div id="wrapper">	
	<div align="center">
		<div style="width: 1100px; height: 100%;">
			
		
		 	 <!-- 게시판 몸통 -->		 	 
		 	<div style="margin-top: 30px;">
		 		<table class="table table-hover ohw-notice">
		 			<tr class = 'ohw-notice-tr'>
		 				<th class = 'ohw-notice-conn'>번호</th>
		 				<th class = 'ohw-notice-cont'>제목</th>
		 				<th class = 'ohw-notice-conw'>작성자</th>
		 				<th class = 'ohw-notice-cond'>작성일</th>
		 			</tr>		 		
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
	 		
	 		<div style = "text-align : center;">
				<% if(currentPage <= 1) { %>
					[맨처음]&nbsp;
				<% } else { %>
					<a href = "/prototype/nlist?page=1">[맨처음]</a>
				<% } %>
	
				<!-- Prev -->

				<% if(!((currentPage - 10) > startPage && (currentPage - 10) < 1)) { %>
					[Prev]&nbsp;
				<% } else { %>
					<a href = "/prototype/nlist?page=<%= startPage - 10 %>">[Prev]</a>
				<% } %> &nbsp; &nbsp;

			<!-- 현재 페이지가 포함된 그룹의 페이지 숫자 출력 -->
			<% for(int p = startPage; p<= endPage; p++) { 
				 if(p == currentPage) { %>
	
				<font color = "red" size="4"><b>[<%= p %>]</b></font>
			<% } else { %>
				<a href = "/prototype/nlist?page=<%= p %>"><%= p %></a>
			<% }
			} %> &nbsp; &nbsp;

				<!-- Next -->

				<% if(!((currentPage + 10) > endPage && (currentPage + 10) < maxPage)) { %>
					[Next]&nbsp;
				<% } else { %>
					<a href = "/prototype/nlist?page=<%= endPage + 10 %>">[Next]</a>
				<% } %>
	
				<!-- End -->

				<% if(currentPage >= maxPage) { %>
					[맨 끝]&nbsp;
				<% } else { %>
					<a href = "/prototype/nlist?page=<%= maxPage %>">[맨 끝]</a>
				<% } %>
			</div>
	 		
	 		<!-- 페이징 바디
	 		<div class="ohw-notice-page">
		 		<ul class="pagination">
					<li class="page-item"><a class="page-link" href="#">Previous</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">4</a></li>
					<li class="page-item"><a class="page-link" href="#">5</a></li>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>	 		
			</div>
			페이징 바디 -->
		</div>	 
	</div>	
</div>
</nav>
</body>
</html>