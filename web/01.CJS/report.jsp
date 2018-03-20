<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/prototype/resources/js/jquery-3.3.1.min.js"></script>
<script src="/prototype/resources/vendor/jquery/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

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
.contents{
min-height: 100%;
position: relative;
margin-top:90px;
padding-bottom:20px;
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

th {
	background: gray;

}
</style>

<meta charset="UTF-8">
<title>건의게시판</title>
</head>
<body>
<!-- 헤더 시작-->
<%@ include file="/header.jsp" %>
<!-- 헤더 종료-->
<!-- 내용 시작 -->

<nav class="contents">
	<br>
	<h1 align="center">신고 계시판</h1>
	<hr>
	<section>
<div id="wrapper">
	<center>
	<div style="width: 1100px; height: 1200px;">
		 	<div style="padding: 10px; padding-right: 0px; float:right;">
		 		<button type="button" class="btn" >글쓰기</button>
		 		
		 	</div>
		 	 <!-- 게시판 몸통 -->	
		 	 
		 	<div style="margin-top: 30px;">
		 	<table class="table table-hover">
		 		<tr>
		 			<th>번호</th>
		 			<th>제목</th>
		 			<th>작성일</th>
		 			<th>조회수</th>
		 		</tr>
		 		<tr>
		 			<td>10</td>
		 			<td><a href="#">은밀한과이 업데이트에 따른 시스템 점검 안내</a></td>
		 			<td>2018-02-05</td>
		 			<td>32</td>
		 		</tr>
		 		<tr>
		 			<td>10</td>
		 			<td><a href="#">은밀한과이 업데이트에 따른 시스템 점검 안내</a></td>
		 			<td>2018-02-05</td>
		 			<td>32</td>
		 		</tr>
		 		<tr>
		 			<td>10</td>
		 			<td><a href="#">은밀한과이 업데이트에 따른 시스템 점검 안내</a></td>
		 			<td>2018-02-05</td>
		 			<td>32</td>
		 		</tr>
		 		<tr>
		 			<td>10</td>
		 			<td><a href="#">은밀한과이 업데이트에 따른 시스템 점검 안내</a></td>
		 			<td>2018-02-05</td>
		 			<td>32</td>
		 		</tr>
		 		<tr>
		 			<td>10</td>
		 			<td><a href="#">은밀한과이 업데이트에 따른 시스템 점검 안내</a></td>
		 			<td>2018-02-05</td>
		 			<td>32</td>
		 		</tr>
		 		<tr>
		 			<td>10</td>
		 			<td><a href="#">은밀한과이 업데이트에 따른 시스템 점검 안내</a></td>
		 			<td>2018-02-05</td>
		 			<td>32</td>
		 		</tr>
		 		<tr>
		 			<td>10</td>
		 			<td><a href="#">은밀한과이 업데이트에 따른 시스템 점검 안내</a></td>
		 			<td>2018-02-05</td>
		 			<td>32</td>
		 		</tr>
		 		<tr>
		 			<td>10</td>
		 			<td><a href="#">은밀한과이 업데이트에 따른 시스템 점검 안내</a></td>
		 			<td>2018-02-05</td>
		 			<td>32</td>
		 		</tr>
		 		<tr>
		 			<td>10</td>
		 			<td><a href="#">은밀한과이 업데이트에 따른 시스템 점검 안내</a></td>
		 			<td>2018-02-05</td>
		 			<td>32</td>
		 		</tr>
		 		<tr>
		 			<td>10</td>
		 			<td><a href="#">은밀한과이 업데이트에 따른 시스템 점검 안내</a></td>
		 			<td>2018-02-05</td>
		 			<td>32</td>
		 		</tr>
		 		<tr>
		 			<td>10</td>
		 			<td><a href="#">은밀한과이 업데이트에 따른 시스템 점검 안내</a></td>
		 			<td>2018-02-05</td>
		 			<td>32</td>
		 		</tr>
		 		<tr>
		 			<td>10</td>
		 			<td><a href="#">은밀한과이 업데이트에 따른 시스템 점검 안내</a></td>
		 			<td>2018-02-05</td>
		 			<td>32</td>
		 		</tr>
		 	</table>
		 	
		 	</div>
		 	<!-- 게시판 몸통끝 -->
	 		<div>
	 			<select>
				  <option>제목</option>
				  <option>내용</option>
				</select>
	 			<input type="text">	 
	 			<input type="submit" name="search_submit" class="btn" value="검색">	
	 		</div>
	 		<div id="board_page">
		 		<ul class="pagination">
				  <li class="page-item"><a class="page-link" href="#">Previous</a></li>
				  <li class="page-item"><a class="page-link" href="#">1</a></li>
				  <li class="page-item"><a class="page-link" href="#">2</a></li>
				  <li class="page-item"><a class="page-link" href="#">3</a></li>
				  <li class="page-item"><a class="page-link" href="#">4</a></li>
				  <li class="page-item"><a class="page-link" href="#">5</a></li>
				  <li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>	 		
	 		</div> 	
	 	</div>	 
	</div>
	
	
	</section>	
</center>

</nav>













<!--내용 끝-->

 <!-- 바닥 -->
  <%@include file="/footer.jsp" %>
<!--바닥종료-->


</body>
</html>