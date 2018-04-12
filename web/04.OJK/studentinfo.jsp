<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="/prototype/common/resources/js/jquery-3.3.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학생 정보 보기</title>
<script>
//수강 중인 강좌
$(function(){
	$.ajax({
		url: "/prototype/onlesson2",
		data: {user : $('#userno').val()},
		type: "get",
		dataType: "json",
		success: function(data) {
			
			var jsonStr = JSON.stringify(data);
			var json = JSON.parse(jsonStr);
			
			var values = $('#ongoing_table').html() + "<br>";
			
			for(var i in json.onlesson) {	
					if(json.onlesson[i].state == 1 && json.onlesson[i].lesson_state == 1) {
					values += "<tr><input type='hidden' class='btn btn' value='"+json.onlesson[i].lesson_no+"'>"+"<td>"+json.onlesson[i].lesson_title
					+"</td><td>"+json.onlesson[i].username+"</td><td><button type='button' class='btn' id='"+json.onlesson[i].lesson_no+"' onclick='DetailLesson(this)'>상세보기</button></td>"
					+"<td><button type='button' id='"+json.onlesson[i].lesson_no+"' class='btn btn-warning' onclick='insertReview(this)'>후기쓰기</button></td>"
					+"<td><button type='button' class='btn btn-danger' id='"+json.onlesson[i].lesson_no+"' onclick='CancleLesson(this)'>취소</button></td></tr>"			
					}
			}
			
			$('#ongoing_table').html(values);
		}, error: function(a,b,c){
			console.log(b+c);
		}	
	});

});
//수강 내역
$(function(){
	$.ajax({
		url: "/prototype/onlesson2",
		data: {user : $('#userno').val()},
		type: "get",
		dataType: "json",
		success: function(data) {
			
			var jsonStr = JSON.stringify(data);
			var json = JSON.parse(jsonStr);
			
			var values = $('#previous_table').html() + "<br>";
			
			for(var i in json.onlesson) {	
					if(json.onlesson[i].state == 1 && json.onlesson[i].lesson_state == 2) {
					values += "<tr><input type='hidden' class='btn btn' value='"+json.onlesson[i].lesson_no+"'>"+"<td>"+json.onlesson[i].lesson_title
					+"</td><td>"+json.onlesson[i].username+"</td><td><button type='button' class='btn' id='"+json.onlesson[i].lesson_no+"' onclick='DetailLesson(this)'>상세보기</button></td>"
					+"<td>"+json.onlesson[i].lesson_enddate+"</td></tr>"			
					}
			}
			
			$('#previous_table').html(values);
		}, error: function(a,b,c){
			console.log(b+c);
		}	
	});

});

//강의 상세보기

function DetailLesson(val) {
	
	console.log(val.id);
	location.href="/prototype/lessondetail?no=" + val.id;
	
} 

//강의 취소하기
function CancleLesson(val) {
	var result = confirm('삭제 하시겠습니까?'); 
	console.log(val.id);
	var userno = $('#userno').val();
	console.log(userno);
	if(result) {
		location.href="/prototype/canclelesson?no=" + val.id + "&userno=" + userno;
	}else {
		
	}
}

//리뷰작성하기
function insertReview(val) {
	var userno = $('#userno').val();
	console.log(userno);
	var popUrl = "/prototype/popreview?no="+val.id+"&userno="+userno;
	var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

	window.open(popUrl,"a",popOption);
}
//프로필 업로드하기
function upload_profile() {
	
	var popUrl = "/prototype/04.OJK/profile_upload.jsp"; 
	//팝업창에 출력될 페이지 URL
	
	var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

		window.open(popUrl,"a",popOption);
	
}
</script>

</head>
<body>
<%@include file="/common/navbar.jsp" %>

<nav class="contents">
	<input type="hidden" value="<%= loginUser.getUserNo() %>" name="userno" id="userno">
	<h1 align="center">학생 정보 보기</h1>
	<hr>

	<div id="wrapper">
		<div align="center">
			<div id="info"
				style="width: 1100px; height: 300px; border: 1px solid gray; margin-top: 50px;">
				<div style="width: 100%; height: 230px; background: #f2f2f2;">
					<div
						style="width: 250px; height: 230px; float: left; margin-top: 10px; padding: 5px;">
						<%if(loginUser.getUserRenamePhoto() != null) { %>
						<img src="/prototype/userTitleimg/<%= loginUser.getUserRenamePhoto() %>"
							class="img-circle" alt="Cinque Terre" width="200px"
							height="200px">
						<% }else {%>
							<img src="/prototype/userTitleimg/rakoon.jpg"
							class="img-circle" alt="Cinque Terre" width="200px"
							height="200px">
						<%} %>
					</div>
					<div style="float: left; margin-top: 20px;">
						<span style="font-weight: bold; font-size: 25pt;"><%= loginUser.getUserName() %> 님</span>
					</div>


				</div>
				<div style="width: 100%; height: 70px; padding: 20px;">
					<button type="button" class="btn">개인정보 수정하기</button>
					&nbsp;
					<button type="button" class="btn" onclick="upload_profile();">프로필 사진 수정</button>
					&nbsp;
					<button type="button" class="btn">메세지 보기</button>
					&nbsp;
					<button type="button" class="btn">게시판 이용내역 보기</button>


				</div>


			</div>
			<br> <br>
			<h1>진행중인 강의</h1>
			<hr>
			<div id="info"
				style="width: 1100px; height: 300px; border: 1px solid gray; margin-top: 50px;">
				<div style="width:100%;">
					<table class="table table-hover" id="ongoing_table">
						<thead>
							<tr>
								<th>강의명</th>
								<th>선생님</th>
								<th>상세보기</th>
								<th>후기작성</th>
								<th>취소하기</th>
							</tr>
						</thead>
						
					</table>
				</div>
			</div>
			<br> <br>
			<h1>수강내역</h1>
			<hr>

			<div id="info"
				style="width: 1100px; height: 300px; border: 1px solid gray; margin-top: 50px;">
				<div style="width:100%;">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>강의명</th>
								<th>선생님</th>
								<th>과목</th>
								<th>리뷰쓰기</th>
								<th>상세보기</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>java강의</td>
								<td>Doe</td>
								<td>컴퓨터/IT</td>
								<td><button type="button" class="btn">리뷰</button></td>
								<td><button type="button" class="btn">상세보기</button></td>
								<td><button type="button" class="btn btn-danger">거절됨</button></td>
								
							</tr>
							<tr>
								<td>Mary</td>
								<td>Moe</td>
								<td>mary@example.com</td>
								<td><button type="button" class="btn">취소</button></td>
								<td><button type="button" class="btn">상세보기</button></td>
								<td><button type="button" class="btn btn-primary">수업종료</button></td>
							</tr>
							<tr>
								<td>July</td>
								<td>Dooley</td>
								<td>july@example.com</td>
								<td><button type="button" class="btn">취소</button></td>
								<td><button type="button" class="btn">상세보기</button></td>
								<td><button type="button" class="btn btn-primary">수업종료</button></td>
							</tr>
							<tr>
								<td>July</td>
								<td>Dooley</td>
								<td>july@example.com</td>
								<td><button type="button" class="btn">취소</button></td>
								<td><button type="button" class="btn">상세보기</button></td>
								<td><button type="button" class="btn btn-primary">수업종료</button></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		
		
		
		
	</div>




	</nav>

</body>
</html>