<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    

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
	
	.ohw-main-notice {
		margin-top:20px;
	}
		
	.ohw-main-notice-cont {
		width:15%;
		text-align:center;
		padding-top:5px;
		padding-bottom:5px;
	}
	
	.ohw-main-notice-conw {
		width:5%;
		text-align:center;
		padding-top:5px;
		padding-bottom:5px;
	}
	
	.ohw-main-notice-cond {
		width:8.33%;
		text-align:center;
		padding-top:5px;
		padding-bottom:5px;
	}	
	
</style>
</head>

<body>
<div style="height:52px">
	<%@ include file = "common/navbar.jsp" %>
</div>

<script type="text/javascript">
	
	$(function () {	
		$.ajax({
			url:"<%= request.getContextPath() %>/mainnotice",			
			dataType:"json",
			success:
				function(data) {				
					var jsonStr = JSON.stringify(data);				
					var json = JSON.parse(jsonStr);			
					console.log(data);			
					for(var i in json.list) {				
						$('.ohw-main-notice').append(						
							<% if(loginUser != null) { %>				
								"<tr class = 'ohw-main-notice-tr'><td class = 'ohw-main-notice-cont'><a href = '<%= request.getContextPath() %>/ndetail?no=" + json.list[i].noticeNo + "&page=1'>" + json.list[i].noticeTitle + "</a></td>"
							<% } else { %>				
								"<tr class = 'ohw-main-notice-tr'><td class = 'ohw-main-notice-cont'>" + json.list[i].noticeTitle + "</td>"			
							<% } %>	+				
							"<td class = 'ohw-main-notice-conw'>" + json.list[i].userName + "</td>" +					 
							"<td class = 'ohw-main-notice-cond'>" + json.list[i].noticeDate + "</td></tr>"				
						);				
					}			
				}	
		});	
	});	
	
</script>

<div class="ohw_img_header">
	<div class="text-center">   
		<form class="form-inline" action="/prototype/Insertlog" method="post">
		
		</form>
	</div>	
</div>

<div style="width:100%; height:330px; magin-bottom:0px;">
	<div class="ohw_div_con" align="center">
		<ul class="nav nav-tabs">
			<li><a data-toggle="tab" href="#home">공지사항</a></li>
			<li><a data-toggle="tab" href="#menu1">배우고 싶어요</a></li>
			<li><a data-toggle="tab" href="#menu2">여긴 뭘까요</a></li>
		</ul>
		<div class="tab-content">
			<div id="home" class="tab-pane fade in active">	
				<div>
					<table class = "ohw-main-notice">
						<tr class = "ohw-main-notice-tr">
							<th class = "ohw-main-notice-cont">제목</th>
							<th class = "ohw-main-notice-conw">작성자</th>
							<th class = "ohw-main-notice-cond">날짜</th>
						</tr>
					</table>
				</div>
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
<div>
	<%@ include file = "common/footer.jsp" %>
</div>

</body>
</html>