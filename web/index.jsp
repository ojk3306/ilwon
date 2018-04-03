<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>은밀한 과외</title>

<style type="text/css">

	body {
		width:100%;
		min-width:800px;
		margin:0;
		padding:0;
		overflow : auto;
		position:absolute;		
	}
	.ohw_img_header {
		background-image:url("common/resources/img/sailboat.jpg");
		background-size:100% 500px;
		width:100%;
		height:500px;
		margin-bottom:0px;	
	}
	.ohw_div_con {
		float:left;
		width:33.33%;
		height:350px;
		margin-bottom:0px;
		border:1px solid black;
		background:gray;
	}
	.ohw_footer {
		background:gray;
		height:100px;
		width:100%;
		min-width:800px;
		text-align:center;
		margin-top:0px;
		padding:0px;
	}
	
</style>
</head>

<body>
<div style="height:52px">
<%@ include file = "common/navbar.jsp" %>
</div>
<div class="ohw_img_header">
	<div class="text-center">   
	<form class="form-inline" action="/prototype/Insertlog" method="post">
		<div class="input-group"  style="margin-top:10%;">
	<input type="text" class="form-control" name="seachcontent" size="50" placeholder="태그를 검색해주세요">
	<div class="input-group-btn">
    <input type="submit" class="btn" value="Search">
		</div>
		</div>
	</form>
	</div>	
</div>

	<div  style="width:100%; height:330px; magin-bottom:0px;">
	<div class="ohw_div_con" align="center">
	<ul class="nav nav-tabs">
		<li class="active"><a data-toggle="tab" href="#home">공지사항</a></li>
		<li><a data-toggle="tab" href="#menu1">배우고 싶어요</a></li>
		<li><a data-toggle="tab" href="#menu2">여긴 뭘까요</a></li>
	</ul>

	<div class="tab-content">
	<div id="home" class="tab-pane fade in active">
	<h3>HOME</h3>
	<p>Some content.</p>
	</div>
	
	<div id="menu1" class="tab-pane fade">
	<h3>Menu 1</h3>
	<p>Some content in menu 1.</p>
	</div>
	
	<div id="menu2" class="tab-pane fade">
	<h3>Menu 2</h3>
	<p>Some content in menu 2.</p>
	</div>
	</div>
	</div>
	
	<div class="ohw_div_con" align="center">
		<h3>여기는 세미나겠지.</h3>
		<a><img alt="" src="common/resources/img/Main.jpg" width="80%" height="auto"></a>
	</div>
	<div class="ohw_div_con" align="center">
	<h3>제휴 사이트 바로 가기</h3>	
	</div>		
	</div>

<div class="ohw_footer">
	<h1>Footer!! 호우!</h1>
</div>

</body>
</html>