<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Footer</title>

<!-- <link rel="stylesheet" href="/prototype/common/resources/fontawesome-free-5.0.9/web-fonts-with-css/css/fontawesome.min.css"> -->

<style type="text/css">

	@import url('https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'); %>
	section {
    padding: 60px 0;    
  
	}

	section .section-title {
    text-align: center;
    color: #007b5e;
    margin-bottom: 50px;
    text-transform: uppercase;
      width: 100%;
	}
	#footer {	
    background: #222222 !important;
      width: 100%;
	}
	#footer h5{
	padding-left: 10px;
    border-left: 3px solid #eeeeee;
    padding-bottom: 6px;
    margin-bottom: 20px;
    color:#ffffff;  width: 100%;
	}
	#footer a {
    color: #ffffff;
    text-decoration: none !important;
    background-color: transparent;
    -webkit-text-decoration-skip: objects;  width: 100%;
	}
	#footer ul.social li{
	padding: 3px 0;
	}
	#footer ul.social li a i {
    margin-right: 5px;
	font-size:25px;
	-webkit-transition: .5s all ease;
	-moz-transition: .5s all ease;
	transition: .5s all ease;
	}
	#footer ul.social li:hover a i {
	font-size:30px;
	margin-top:-10px;
	}
	#footer ul.social li a,
	#footer ul.quick-links li a{
	color:#ffffff;
	}
	#footer ul.social li a:hover{
	color:#eeeeee;
	}
	#footer ul.quick-links li{
	padding: 3px 0;
	-webkit-transition: .5s all ease;
	-moz-transition: .5s all ease;
	transition: .5s all ease;
	}
	#footer ul.quick-links li:hover{
	padding: 3px 0;
	margin-left:5px;
	font-weight:700;
	}
	#footer ul.quick-links li a i{
	margin-right: 5px;
	}
	#footer ul.quick-links li:hover a i {
    font-weight: 700;
	}

	@media (max-width:767px){
		#footer h5 {
		padding-left: 0;
		border-left: transparent;
		padding-bottom: 0px;
		margin-bottom: 10px;
		}
	}
	.row{
	background:#e9e9e9;  width: 100%;
	}
</style>
</head>

<body style="  width: 100%;">
<!-- Footer -->
	<section id="footer" style="  width: 100%;">
		<div class="container" >
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-5" style="background:#222222">
					<ul class="list-unstyled list-inline social text-center">
						<li class="list-inline-item"><a href="javascript:void();"><i class="fa fa-facebook"></i></a></li>
						<li class="list-inline-item"><a href="javascript:void();"><i class="fa fa-twitter"></i></a></li>
						<li class="list-inline-item"><a href="javascript:void();"><i class="fa fa-instagram"></i></a></li>
						<li class="list-inline-item"><a href="javascript:void();"><i class="fa fa-google-plus"></i></a></li>
						<li class="list-inline-item"><a href="javascript:void();" target="_blank"><i class="fa fa-envelope"></i></a></li>
					</ul>
				</div>
				</hr>
			</div>	
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-2 text-center text-white" style="background:#222222; color:white;">
					<p>National Transaction Corporation is a Registered MSP/ISO of Elavon, Inc. Georgia [a wholly owned subsidiary of U.S. Bancorp, Minneapolis, MN]</p>
					<p class="h6">&copy All right Reversed.<a class="text-green ml-2" href="https://www.sunlimetech.com" target="_blank">Sunlimetech</a></p>
				</div>
				</hr>
			</div>	
		</div>
	</section>
	<!-- ./Footer -->
</body>
</html>