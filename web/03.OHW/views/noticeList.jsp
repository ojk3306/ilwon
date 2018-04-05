<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			
			<% if(loginUser != null && loginUser.getUserTypeNo() == 1003) { %>
			
			<div style="padding: 0px; float:right;">
				<button type="button" class="btn" onclick="location.href='/prototype/03.OHW/views/noticeInsert.jsp'">글쓰기</button>
			</div>					
					
			<% } %>
			
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
	 		
	 		<div class="ohw-notice-page"> <!-- 페이징 바디 -->
		 		<ul class="pagination">
					<li class="page-item"><a class="page-link" href="#">Previous</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">4</a></li>
					<li class="page-item"><a class="page-link" href="#">5</a></li>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>	 		
			</div> 	<!-- 페이징 바디 -->
		</div>	 
	</div>	
</div>
</nav>
</body>
</html>