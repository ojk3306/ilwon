<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/common/navbar.jsp"%>
	<!-- 헤더 -->

	<!-- 바디 -->
	<div align="center">

		<div id="wrapper" style="width: 1100px; text-align: center;">

			<div style="width: 1100px; height: 600px; border: 1px solid black;">


				<main class="container">
				<form novalidate>
					<div class="row">
						<div data-item-name="email" class="form-holder form-group col">
							<label for="email">이메일 주소</label> <input name="email" id="email"
								type="email" placeholder="name@company.com"
								class="input-box form-control" data-validate="email" required>
							<div class="feedback">올바른 형식의 이메일을 입력해 주세요.</div>
						</div>
					</div>
					<div class="row">
						<div data-item-name="password" class="form-holder form-group col">
							<label for="password">비밀번호</label> <input name="password"
								id="password" type="password" placeholder="비밀번호"
								class="input-box form-control" required>
							<div class="feedback">비밀번호가 일치하지 않습니다.</div>
						</div>
					</div>
					<div class="submit-row">
						<div class="form-check">
							<label class="form-check-label"> <input
								name="remember-me" type="checkbox" class="form-check-input">
								로그인 상태 유지
							</label>
						</div>
						<div class="submit-wrapper order-md-first">
							<button type="submit" id="btn-login" class="btn btn-primary">로그인</button>
						</div>
					</div>
				</form>
				<div class="actions-wrapper">
					<div class="actions list-group" role="button">
						<a class="actions__item list-group-item list-group-item-action"
							href="#"> <span>혹시 계정이 없으신가요?</span> <span
							class="action-name">회원 가입 &#xe001;</span>
						</a>
					</div>
				</div>
				</main>
</body>

</div>
</div>
</div>





</body>
</html>