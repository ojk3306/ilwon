<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="/prototype/common\resources\js\jquery-3.3.1.min.js"></script>
<script 
	src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
function juso(){  
	new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	            console.log(data.roadAddress);
	            $("#loc").val(data.roadAddress);
	        }
	    }).open();
	};	
	
	//비밀번호 체크
	 $(function() {
	$('#repwd').keyup(function(pwdcheck){
		if($('#repwd').val() != $('#pwd').val()) {
			$('#la_pwd').html("비밀번호가 일치하지 않습니다")
		}else {
			
			$('#la_pwd').html("비밀번호가 일치합니다")
		}	
	
	
	
		});
	
	});  
	
	$(function() {
		$('#pwd').keyup(function(pwdcheck){
			
			var userpwd = $('#pwd').val();
			
			console.log(userpwd.length);
			if(userpwd.length<4) {
				$('#la_pwd').html("비밀번호는 4~16자리로 입력해주세요");
			}else{
			if($('#repwd').val() != $('#pwd').val()) {
				$('#la_pwd').html("비밀번호가 일치하지 않습니다");
			}else {
				
				$('#la_pwd').html("비밀번호가 일치합니다");
			}	
		
			}
		
			});
		
		});
	
	//이메일 중복 체크
	
	$(function(){
		$('#email').keyup(function(emailcheck){
			
			var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
			var useremail = $('#email').val();
			if (useremail == '' || !re.test(useremail)) {
				$('#la_email').html("올바른 email 형식으로 입력해주세요");
				
			}else{
			
				$.ajax({
					url: "/prototype/emailcheck",
					data: {email: $('#email').val()},
					type: "get",
					success: function(data){
						$('#la_email').html(data);
					}
				
				});			
			}
		});
	});
	
	
	
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학생으로 가입하기</title>
</head>
<body>
<%@ include file="/common/navbar.jsp" %>
	
	
	<nav class="contents">
		<br>
		<h1 align="center">학생으로 가입하기</h1>
		<hr>

		<div id="wrapper">
			<div align="center">
				<div style="width: 1100px; height: 1200px;">
					<div style="margin-top: 50px;">
						<div style="width: 600px;">
							<hr>
							<form class="form-horizontal" name="insertuser" action="/prototype/Insertuser.sm" method="post">
								<div class="form-group">
									<label class="control-label col-sm-2" for="email">이메일:</label>
									<div class="col-sm-10">
										<input type="email" class="form-control" id="email"
											placeholder="Enter email" name="email" required>
												<label id="la_email" name="la_email" style="color:#e65c00;"></label>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2" for="pwd-1" >비밀번호:</label>
									<div class="col-sm-10">
										<input type="password" class="form-control"
											placeholder="Enter password" id="pwd" name="pwd" maxlength="16" required>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2" for="pwd-1">비밀번호<br>재확인:</label>
									<div class="col-sm-10">
										<input type="password" class="form-control"
											placeholder="Enter password" id="repwd" name="repwd"  maxlength="16" required>
												<label id="la_pwd" name="la_pwd" style="color:#e65c00;"></label>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2" for="pwd-2">이름:</label>
									<div class="col-sm-10">
										<input type="text" class="form-control"
											placeholder="Enter name" name="name" id="name" required>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2" for="phone">전화번호:</label>
									<div class="col-sm-10">
										<input type="text" class="form-control"
											placeholder="Enter phone" name="phone" id="phone" required>
									</div>
								</div>

								<div class="form-group">
									<label class="control-label col-sm-2" for="gender">성별:</label>
									<div class="col-sm-10">
										남&nbsp;&nbsp;<input type="radio" name="gender" value="M">
										여&nbsp;&nbsp;<input type="radio" name="gender" value="F">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2" >나이:</label>
									<div class="col-sm-10">
					<input type="number" name="age" class="form-control" min="0" max="100" required>
									
									</div>
								</div>
								<div class="form-group">
								<label class="control-label col-sm-2" for="loc">주소:</label>
								<div class="col-sm-10">
								<input type="text" name="loc" placeholder="이곳을 클릭해서 주소를 검색해주세요" id="loc" class="form-control" onclick="juso()" readonly="readonly" required>
								</div>
								</div>
								

							
								<hr>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn" value="확인">
					<input type="reset" class="btn" value="초기화">
					<input type="hidden" name="user_type" value="1001">
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>


	</nav>

</body>
</html>