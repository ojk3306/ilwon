<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<<meta charset="UTF-8">
<title>선생님으로 가입하기</title>
</head>
<body>
<%@ include file="/header.jsp" %>
<nav class="contents">
		<br>
		<h1 align="center">선생님으로 가입하기</h1>
		<hr>

		<div id="wrapper">
			<center>
				<div style="width: 1100px; height: 1200px;">
					<div style="margin-top: 50px;">
						<div style="width: 400px;">
							<hr>
							<form class="form-horizontal" action="/action_page.php">
								<div class="form-group">
									<label class="control-label col-sm-2" for="email">Email:</label>
									<div class="col-sm-10">
										<input type="email" class="form-control" id="email"
											placeholder="Enter email" name="email">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2" for="pwd-1">Password:</label>
									<div class="col-sm-10">
										<input type="password" class="form-control"
											placeholder="Enter password" id="pwd-1" name="pwd-1">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2" for="pwd-2">Password:</label>
									<div class="col-sm-10">
										<input type="password" class="form-control"
											placeholder="Enter password" name="pwd-2" id="pwd-2">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2" for="phone">phone:</label>
									<div class="col-sm-10">
										<input type="text" class="form-control"
											placeholder="Enter phone" name="phone" id="phone">
									</div>
								</div>

								<div class="form-group">
									<label class="control-label col-sm-2" for="gender">gender:</label>
									<div class="col-sm-10">
										남&nbsp;&nbsp;<input type="radio" name="gender" id="gender">
										여&nbsp;&nbsp;<input type="radio" name="gender" id="gender">
									</div>
								</div>
								<hr>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<button type="submit" class="btn">Submit</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</center>
		</div>


	</nav>

<%@ include file="/footer2.jsp" %>
</body>
</html>