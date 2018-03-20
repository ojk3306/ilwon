<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Google Optimize Plugin -->
<style>
.async-hide {
	opacity: 0 !important
}
</style>
<script>(function(a,s,y,n,c,h,i,d,e){s.className+=' '+y;h.start=1*new Date;
	h.end=i=function(){s.className=s.className.replace(RegExp(' ?'+y),'')};
	(a[n]=a[n]||[]).hide=h;setTimeout(function(){i();h.end=null},c);h.timeout=c;
	})(window,document.documentElement,'async-hide','dataLayer',4000,
	{'GTM-MRQXD32':true});</script>

<script>
	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

	ga('create', 'UA-102282505-4', 'auto');  // Update tracker settings 
	ga('require', 'GTM-MRQXD32');           // Add this line
	// Remove pageview call
	</script>
<!-- End Google Optimize Plugin -->

<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
	new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
	j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
	'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
	})(window,document,'script','dataLayer','GTM-KV9PR8H');</script>
<!-- End Google Tag Manager -->

<!-- Google Search Console -->
<meta name="google-site-verification"
	content="hwNUdh1EhTXdejGDTteI5VbSAXC8apOKQBPbtOe-HQ4" />

<title>Jober</title>
<link rel="stylesheet" type="text/css" href="../resources/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="../resources/css/main.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>

<body class="body--login layout--login-signup">
	<!-- Google Tag Manager (noscript) -->
	<noscript>
		<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-KV9PR8H" height="0" width="0" style="display: none; visibility: hidden"></iframe>
	</noscript>
	<!-- End Google Tag Manager (noscript) -->
<%@ include file="/header.jsp" %>

	<header>
		<h1>
			<p class="sr-only">로그인</p>
		</h1>
	</header>

	<main class="container">
	<form novalidate>
		<div class="row">
			<div data-item-name="email" class="form-holder form-group col">
				<label for="email">이메일 주소</label>
				<input name="email" id="email" type="email" placeholder="name@company.com" class="input-box form-control" data-validate="email" required>
				<div class="feedback">
					올바른 형식의 이메일을 입력해 주세요.
				</div>
			</div>
		</div>
		<div class="row">
			<div data-item-name="password" class="form-holder form-group col">
				<label for="password">비밀번호</label>
				<input name="password" id="password" type="password" placeholder="비밀번호" class="input-box form-control" required>
				<div class="feedback">
					비밀번호가 일치하지 않습니다.
				</div>
			</div>
		</div>
		<div class="submit-row">
			<div class="form-check">
				<label class="form-check-label">
					<input name="remember-me" type="checkbox" class="form-check-input">
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
			<a class="actions__item list-group-item list-group-item-action" href="#">
				<span>혹시 계정이 없으신가요?</span> 
				<span class="action-name">회원 가입 &#xe001;</span>
			</a>
		</div>
	</div>
	</main>

	<!-- <footer>
		<ul class="footer-menu">
			<li><a class="btn-show-modal" href="javascript:;" role="button" data-modal-name="support">문의하기</a></li>
			<li><a href="/policy.html">서비스 이용약관</a></li>
			<li><a href="/privacy.html">개인정보처리방침</a></li>
		</ul>
		<p class="copyright">Copyright © 2017 Jober</p>
	</footer> -->

  <script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/2.3.0/mustache.min.js"></script>
<!--   <script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/loginSignup.js"></script>
	<script src="js/modal.js"></script> -->

	<script type="text/javascript">
		// 로그인 버튼 이벤트 핸들러
		var $form = $('.body--login form');

		$form.submit(function(e) {
			e.preventDefault();
			$('.form-holder').addClass('validate-error');
		});
	</script>
  <%@include file="/footer.jsp" %>
	
</body>
</html>