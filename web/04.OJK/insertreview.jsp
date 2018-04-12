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
		<div id="wrapper" style="width: 1100px; height: 1000px;">
		
			<h1 align="center">리뷰작성하기</h1>
			<br>
			<hr>


			<div style="width: 1100px; height: 200px; b">
				<div style="width: 1100px; height: 120px; ">
					<br>
					<h3 style="margin-top: 30px;"><%= lesson.getUser_name()%>&nbsp;선생님</h3>
					<h2><%= lesson.getLesson_title() %></h2>



				</div>

				<div style="width: 1100px; height: 80px; ">
					<br> <span style="font-weight: bold;font-size: 15pt;">성실성</span>&nbsp;&nbsp;<%@ include
						file="../01.CJS/Fixedstar.jsp"%>
				</div>

				<div style="width: 1100px;">

					<div>
						<br>
						
						<br>
						<form>
							<div class="form-group">

								<textarea class="form-control" rows="15"  id="comment" style="resize: vertical;"></textarea>
							</div>
						</form>
					</div>
				</div>

				<div><button type="button" class="btn">등록하기</button></div>
			</div>
			</div>
	</div>



	</nav>

</body>
</html>