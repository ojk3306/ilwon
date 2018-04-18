<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="lesson.model.vo.LessonDetail" %>        
<% 
	LessonDetail lesson =(LessonDetail)request.getAttribute("lesson");
	int lesson_no = ((Integer)request.getAttribute("lesson_no"));
	int user_no = ((Integer)request.getAttribute("user_no"));
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰작성</title>
</head>
<body>


<nav class="contents">
	<div align="center">
		<div id="wrapper" style="width: 600px; height: 800px;">
		
			<h1 align="center">리뷰작성하기</h1>
			<br>
			<hr>


			<div style="width: 600px; height: 200px; b">
				<div style="width: 600px; height: 120px; ">
					<h3 style="margin-top: 30px;"><%= lesson.getUser_name()%>&nbsp;선생님</h3>
					<h2><%= lesson.getLesson_title() %></h2>
				</div>
				
				<!-- 입력란 -->
				<form action="/prototype/insertr" method="post">
					<div style="width: 600px; height: 200px; ">
						<hr>
						<br>
					<%-- <%@ include file="../01.CJS/Fixedstar.jsp"%> --%>
					<table>
						<tr>
							<th>성실성</th>
								<td><input type="radio" name="s" value="1" checked>1</td>
								<td><input type="radio" name="s" value="2">2</td>
								<td><input type="radio" name="s" value="3">3</td>
								<td><input type="radio" name="s" value="4">4</td>
								<td><input type="radio" name="s" value="5">5</td>
						</tr>
						<tr>
							<th>준비성</th>
								<td><input type="radio" name="p" value="1" checked>1</td>
								<td><input type="radio" name="p" value="2">2</td>
								<td><input type="radio" name="p" value="3">3</td>
								<td><input type="radio" name="p" value="4">4</td>
								<td><input type="radio" name="p" value="5">5</td>
						</tr>
						<tr>
							<th>정보전달력</th>
								<td><input type="radio" name="d" value="1" checked>1</td>
								<td><input type="radio" name="d" value="2">2</td>
								<td><input type="radio" name="d" value="3">3</td>
								<td><input type="radio" name="d" value="4">4</td>
								<td><input type="radio" name="d" value="5">5</td>
						</tr>
					</table>
					<br>
					<hr>
				</div>
					<div style="width: 600px; height: 200px;">
					<textarea rows="20" cols="80" name="content" placeholder="솔직한 리뷰를 작성해주세요" style="margin-bottom: 15px" required></textarea>
					
					<input type="submit" value="등록하기">
					<input type="hidden" value="<%= lesson_no%>" name="lesson_no">
					<input type="hidden" value="<%= user_no%>" name="user_no">
					</div>		
					
				</form>		
			</div>
			</div>
	</div>



	</nav>

</body>
</html>