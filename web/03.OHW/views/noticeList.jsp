<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건의게시판</title>
</head>
<body> 
<%@ include file="/common/navbar.jsp" %>
<nav class="contents">
<br>
<h1 align="center">공지 사항</h1>
<hr>	
<div id="wrapper">
	<div align="center">
		<div style="width: 1100px; height: 1200px;">
			<div style="padding: 10px; padding-right: 0px; float:right;">
				<button type="button" class="btn" onclick="location.href='/prototype/04.OJK/reportForm.jsp'">글쓰기</button>
		 	</div>
		 	 <!-- 게시판 몸통 -->		 	 
		 	<div style="margin-top: 30px;">
		 		<table class="table table-hover">
		 			<tr>
		 				<th>번호</th>
		 				<th>제목</th>
		 				<th>작성일</th>
		 				<th>조회수</th>
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
	 		<div id="board_page">
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
		</div>	 
	</div>	
</div>
</nav>
</body>
</html>