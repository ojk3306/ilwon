<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "notice.model.vo.*, java.util.*, java.sql.*" %>
    
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
<title>공지사항</title>
	
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

<%-- <script type="text/javascript">
	
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
	
</script> --%> <!-- ajax의 흔적 ㅜㅜ... -->

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
		 			
		 			<% for(Notice notice : list) { %>
	
					<tr class = 'ohw-notice-tr'>
						<td class = 'ohw-notice-conn' align="center"><%= notice.getNoticeNo() %></td>
						<td class = 'ohw-notice-cont'>		
						<!-- 로그인한 상태일 때만 상세보기 링크 처리함 -->
						<% if(loginUser != null) { %>
							<a href = "/prototype/ndetail?no=<%= notice.getNoticeNo() %>&page=<%= currentPage %>"><%= notice.getNoticeTitle() %></a>
						<% } else { %>
							<%= notice.getNoticeTitle() %>
						<% } %>		
						</td>
						<td class = 'ohw-notice-conw'><%= notice.getUserName() %></td>
						<td class = 'ohw-notice-cond'><%= notice.getNoticeDate() %></td>												
					</tr>
	
					<% } //for close%>
							 				 		
		 		</table>		 	
			</div>
		 	<!-- 게시판 몸통끝 -->
		 	
		 	<!-- 검색바 -->
			<!-- <div>
	 			<select>
					<option>제목</option>
					<option>내용</option>
				</select>
				
	 			<input type="text">	 
	 			<input type="submit" name="search_submit" class="btn" value="검색">				
				 				
	 		</div> -->
	 		<!-- 검색바 --> 		
			
			<!-- paging 처리 -->

			<!-- Start -->
	
			<div style = "text-align : center;">
				<ul class="pagination">
				<% if(currentPage <= 1) { %>
					<li class="page-item"><a style = "cursor:no-drop" class="page-link" href="javascript:void(0)">First</a></li>
				<% } else { %>
					<li class="page-item"><a class="page-link" href="/prototype/nlist?page=1">First</a></li>					
				<% } %>
	
				<!-- Prev -->

				<% if(!((currentPage - 10) > startPage && (currentPage - 10) < 1)) { %>
					<li class="page-item"><a style = "cursor:no-drop" class="page-link" href="javascript:void(0)">Pre</a></li>
				<% } else { %>
					<li class="page-item"><a class="page-link" href="/prototype/nlist?page=<%= startPage - 10 %>">Pre</a></li>				
				<% } %>

				<!-- 현재 페이지가 포함된 그룹의 페이지 숫자 출력 -->
				
				<% for(int p = startPage; p<= endPage; p++) { 
					 if(p == currentPage) { %>
					<li class="page-item"><a style = "cursor:no-drop" class="page-link" href="javascript:void(0)"><%= p %></a></li>					
				<% } else { %>
					<li class="page-item"><a class="page-link" href="/prototype/nlist?page=<%= p %>"><%= p %></a></li>					
				<% }
				} %>

				<!-- Next -->

				<% if(!((currentPage + 10) > endPage && (currentPage + 10) < maxPage)) { %>
					<li class="page-item"><a style = "cursor:no-drop" class="page-link" href="javascript:void(0)">Next</a></li>					
				<% } else { %>
					<li class="page-item"><a class="page-link" href="/prototype/nlist?page=<%= endPage + 10 %>">Next</a></li>					
				<% } %>
	
				<!-- End -->

				<% if(currentPage >= maxPage) { %>
					<li class="page-item"><a style = "cursor:no-drop" class="page-link" href="javascript:void(0)">End</a></li>					
				<% } else { %>
					<li class="page-item"><a class="page-link" href="/prototype/nlist?page=<%= maxPage %>">End</a></li>					
				<% } %>
				</ul>			
			</div>
			
		</div>	 
	</div>	
</div>
</nav>
</body>
</html>