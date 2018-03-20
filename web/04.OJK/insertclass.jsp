<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="/prototype/resources/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta name="viewport" content="initial-scale=1.0, user-scalable=no">

<script type="text/javascript">
	
</script>
<style type="text/css">
html {
	height: 100%;
}

body {
	margin: 0;
	height: 100%;
}

.contents {
	min-height: 100%;
	position: relative;
	margin-top: 90px;
	padding-bottom: 20px;
}

/* 버튼테마 */
.btn {
	display: inline-block;
	padding: 6px 12px;
	margin-bottom: 0;
	font-size: 14px;
	font-weight: 400;
	line-height: 1.42857143;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	-ms-touch-action: manipulation;
	touch-action: manipulation;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	background-image: none;
	border: 1px solid transparent;
	border-radius: 4px
}

.btn.active.focus, .btn.active:focus, .btn.focus, .btn:active.focus,
	.btn:active:focus, .btn:focus {
	outline: 5px auto -webkit-focus-ring-color;
	outline-offset: -2px
}

.btn.focus, .btn:focus, .btn:hover {
	color: #333;
	text-decoration: none
}

.btn.active, .btn:active {
	background-image: none;
	outline: 0;
	-webkit-box-shadow: inset 0 3px 5px rgba(0, 0, 0, .125);
	box-shadow: inset 0 3px 5px rgba(0, 0, 0, .125)
}

.btn.disabled, .btn[disabled], fieldset[disabled] .btn {
	cursor: not-allowed;
	filter: alpha(opacity = 65);
	-webkit-box-shadow: none;
	box-shadow: none;
	opacity: .65
}

a.btn.disabled, fieldset[disabled] a.btn {
	pointer-events: none
}
</style>

<meta charset="UTF-8">
<title>선생가입</title>
</head>
<body>
	<!-- 헤더 시작-->
	<%@ include file="/header.jsp"%>
	<!-- 헤더 종료-->
	<!-- 내용 시작 -->

	<nav class="contents">
		<br>
		<h1 align="center">강의등록하기</h1>
		<hr>
		
		<div class="modal-body" style="width: 1100px;">
			<div class="tab-content">
				<div role="tabpanel" id="basic" class="tab-pane active">
					<form id="id_form_basic" method="post">
						<h3>내 정보 변경하기</h3>
						<div class="form-group">
							<label for="id_companyname">업체 이름 / 서비스 이름</label> <input
								type="text" class="form-control input-lg" id="id_companyname"
								name="companyname"
								placeholder="업체 이름이 없다면 '초보자를 위한 피아노레슨'처럼 서비스에 대해 알 수 있는 이름을 만들어 주세요."
								value="오주경 고수의 게임 레슨 서비스">
							<p class="error"></p>
						</div>
						<div class="form-group providername-wrap">
							<label for="id_providername"><span>이름</span> <span
								data-toggle="tooltip" data-placement="auto right" title=""
								data-original-title="본인 인증된 이름을 사용하시면 고용율이 150% 상승합니다."><i
									class="fa fa-question-circle"></i></span></label> <input type="text"
								class="form-control input-lg" id="id_providername"
								name="providername" placeholder="" value="오주경">
							<p class="error"></p>
						</div>
						<div class="form-group">
							<label for="id_zip">우편번호</label> <input type="hidden" id="id_lat"
								name="lat" value="37.4796"> <input type="hidden"
								id="id_lng" name="lng" value="127.08">
							<div id="daumAddressSearch"></div>
							<div class="input-group" style="width: 100%;">
								<input type="text" id="id_zip" name="zip" placeholder=""
									value="06359" disabled="disabled" class="form-control input-lg">
								<span class="input-group-btn"><button type="button"
										onclick="getDaumPostcode();return false;"
										class="btn btn-default btn-border input-lg">우편번호 찾기</button></span>
							</div>
						</div>
						<div class="form-group">
							<label for="id_addr2">주소</label> <input type="text" id="id_addr1"
								name="addr1" placeholder="기본 주소"
								value="서울 강남구 광평로10길 6 (일원동, 한솔마을아파트)" disabled="disabled"
								class="form-control input-lg">
							<p class="error"></p>
						</div>
						<div class="form-group">
							<input type="text" id="id_addr2" name="addr2" placeholder="상세 주소"
								value="" class="form-control input-lg">
						</div>
						<div class="form-group">
							<label for="id_addr2">강의내용</label><br> 
							<textarea rows="20" cols="150pt"></textarea>
						</div>
							<div class="form-group">
							<label for="id_addr2">이미지</label>
							<input type="file">
						</div>
						<div class="form-group">
							<label for="id_addr2">카테고리</label><br>
							<input type="radio">피아노
						</div>
						<div class="form-group">
							<label for="id_addr2">지도</label><br>
							
						</div>
						
					</form>
				</div>
			</div>
		</div>
		
	</nav>













	<!--내용 끝-->

	<!-- 바닥 -->

	<!--바닥종료-->


</body>
</html>