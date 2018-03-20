<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리뷰작성</title>
</head>
<body>
<%@include file="/header.jsp" %>

<nav class="contents">
	<center>
		<div id="wrapper" style="width: 1100px; height: 1000px;">
		
			<h1 align="center">리뷰작성하기</h1>
			<br>
			<hr>


			<div style="width: 1100px; height: 200px; b">
				<div style="width: 1100px; height: 120px; ">
					<br>
					<h1 style="margin-top: 30px;">선생님이름/강의이름</h1>



				</div>

				<div style="width: 1100px; height: 80px; ">
					<br> <span style="font-weight: bold;font-size: 15pt;">별점</span>&nbsp;&nbsp;<%@ include
						file="../01.CJS/Fixedstar.jsp"%>
				</div>

				<div style="width: 1100px;">

					<div class="container">
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
	</center>



	</nav>

</body>
</html>