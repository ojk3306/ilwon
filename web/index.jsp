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
		height:500px;
		margin-bottom:0px;
	}
	.ohw_footer {
	background:olive;
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
	<form class="form-inline">
		<div class="input-group"  style="margin-top:10%;">
		<input type="search" class="form-control" size="50" placeholder="Search Tag">
		<div class="input-group-btn">
        	<button type="button" class="btn">Search</button>
		</div>
		</div>
	</form>
	</div>	
</div>
	<div  style="width:100%; height:480px; background:yellow; magin-bottom:0px;">
	<div class="ohw_div_con" style="background:red;"></div>
	<div class="ohw_div_con" style="background:green;"></div>
	<div class="ohw_div_con" style="background:blue;"></div>
	</div>

<div class="ohw_footer">
	<h1>Footer!! 호우!</h1>
</div>

</body>
</html>