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
		background:#E9E9E9;
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
	
	.ohw-main-tab {		
		color:black !important;
		border: 1px solid #0000005c !important;
    	border-radius: 4px 4px 0 0;
	}
	
	.ohw-main-teacher, .ohw-main-student {		
		width:100%;
		margin-top:20px;				
	}
	
	.ohw-main-teacher-tr, .ohw-main-student-tr {	
		width:100%;
		height:110px;
		text-align:center;				
	}
	.ohw-main-teacher-tr > th, .ohw-main-student-tr > th {			
		text-align:center;			
	}
	
	.ohw-man-teacher-conp, .ohw-man-student-conp {
		width:5%;		
		padding-top:5px;
		padding-bottom:5px;
	}
	
	.ohw-man-teacher-conw, .ohw-man-student-conw {
		width:5%;		
		padding-top:5px;
		padding-bottom:5px;
	}
	
	.ohw-man-teacher-conc, .ohw-man-student-conc {
		width:5%;		
		padding-top:5px;
		padding-bottom:5px;
	}
	
	.ohw-man-teacher-cond, .ohw-man-student-cond {
		width:5%;		
		padding-top:5px;
		padding-bottom:5px;
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
		
		</form>
	</div>	
</div>

<div style="width:100%; height:330px; magin-bottom:0px;">
	<div class="ohw_div_con" align="center">
		<ul class="nav nav-tabs">
			<li><a class = "ohw-main-tab" data-toggle="tab" href="#home">최신 은밀한 공지</a></li>
			<li><a class = "ohw-main-tab" data-toggle="tab" href="#menu1">최신 은밀한 선생</a></li>
			<li><a class = "ohw-main-tab" data-toggle="tab" href="#menu2">최신 은밀한 학생</a></li>
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
			
<script type="text/javascript"> /* 메인화면 공지사항 시작 */
	
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
								"<tr class = 'ohw-main-notice-tr'><td class = 'ohw-main-notice-cont'><a style = 'color:black !important;' href = '<%= request.getContextPath() %>/ndetail?no=" + json.list[i].noticeNo + "&page=1'>" + json.list[i].noticeTitle + "</a></td>"
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
	
</script> <!-- 메인화면 공지사항 끝 -->

			<div id="menu1" class="tab-pane fade">
				<div>
					<table class = "ohw-main-teacher">
						<tr class = "ohw-main-teacher-tr" style = "height:40px;">
							<th class = "ohw-main-teacher-conp">사진</th>
							<th class = "ohw-main-teacher-conw">작성자</th>
							<th class = "ohw-main-teacher-conc">카테고리</th>
							<th class = "ohw-main-teacher-cond">날짜</th>
						</tr>
					</table>
				</div>
			</div>
			
<script type="text/javascript">/* 메인화면 선생 시작 */
	
	$(document).ready(function readyList() {	
		$.ajax({
			url:"<%= request.getContextPath() %>/lmteacher",			
			dataType:"json",
			success:function(data) {			
				var jsonStr = JSON.stringify(data);
				var json = JSON.parse(jsonStr);		 
				console.log("LessonMainTeacherList : ") + console.log(data);			
				for(var i in json.list) {				
					$('.ohw-main-teacher').append(						
					 	<% if(loginUser != null) { %>				 	
							"<tr class = 'ohw-main-teacher-tr'><td class = 'ohw-main-teacher-conp'><a href = '<%= request.getContextPath() %>/lessondetail?no=" + json.list[i].lessonNo + "&page=1'><img src = '/prototype/03.OHW/resources/images/rakoon.jpg' style = 'width:100px; height:100px;'></a></td>" + 
				
					 	<% } else { %>					
							"<tr class = 'ohw-main-teacher-tr'><td class = 'ohw-main-teacher-conp'><img src = '/prototype/03.OHW/resources/images/rakoon.jpg' style = 'width:100px; height:100px;'></td>" + 
					 	<% } %>						
						"<td class = 'ohw-main-teacher-conw'>" + json.list[i].userName2 + "</td>" +				
						"<td class = 'ohw-main-teacher-conc'>" + json.list[i].categoryBName + " / " + json.list[i].categorySName + "</td>" +				
						"<td class = 'ohw-main-teacher-cond'>" + json.list[i].lessonStartDate + "</td></tr>"				
					);				
				}			
			}		
		});	
	});
	
</script><!-- 메인화면 선생 끝 -->
			
			<div id="menu2" class="tab-pane fade">
				<div>
					<table class = "ohw-main-student">
						<tr class = "ohw-main-student-tr" style = "height:40px;">
							<th class = "ohw-main-student-cont">사진</th>
							<th class = "ohw-main-student-conw">작성자</th>
							<th class = "ohw-main-student-conc">카테고리</th>
							<th class = "ohw-main-student-cond">날짜</th>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	
<script type="text/javascript">/*메인화면  학생 시작 */
	
	$(document).ready(function readyList() {	
		$.ajax({
			url:"<%= request.getContextPath() %>/lmstudent",			
			dataType:"json",
			success:function(data) {			
				var jsonStr = JSON.stringify(data);
				var json = JSON.parse(jsonStr);		 
				console.log("LessonMainStudentList : ") + console.log(data);			
				for(var i in json.list) {				
					$('.ohw-main-student').append(						
					 	<% if(loginUser != null) { %>				 	
							"<tr class = 'ohw-main-student-tr'><td class = 'ohw-main-student-conp'><a href = '<%= request.getContextPath() %>/studentdetail?no=" + json.list[i].lessonNo + "&page=1'><img src = '/prototype/03.OHW/resources/images/rakoon.jpg' style = 'width:100px; height:100px;'></a></td>" +
						<% } else { %>					
							"<tr class = 'ohw-main-student-tr'><td class = 'ohw-main-student-conp'><img src = '/prototype/03.OHW/resources/images/rakoon.jpg' style = 'width:100px; height:100px;'></td>" + 
					 	<% } %>						
						"<td class = 'ohw-main-student-conw'>" + json.list[i].userName1 + "</td>" +				
						"<td class = 'ohw-main-student-conc'>" + json.list[i].categoryBName + " / " + json.list[i].categorySName + "</td>" +				
						"<td class = 'ohw-main-student-cond'>" + json.list[i].lessonStartDate + "</td></tr>"				
					);				
				}			
			}		
		});	
	});
	
</script><!--메인화면 학생 끝 -->
		
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