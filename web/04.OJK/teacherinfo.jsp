<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<script type="text/javascript"
	src="/prototype/common/resources/js/jquery-3.3.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>선생정보보기</title>
<script type="text/javascript">

//운영중인 강좌
$(function(){
	$.ajax({
		url: "/prototype/onlesson",
		data: {user : $('#userno').val()},
		type: "get",
		dataType: "json",
		success: function(data) {
			
			var jsonStr = JSON.stringify(data);
			var json = JSON.parse(jsonStr);
			
			var values = $('#ongoing_table').html() + "<br>";
			
			for(var i in json.onlesson) {
				if(json.onlesson[i].state == "수강중") {
					values += "<tr><input type='hidden' class='btn btn' value='"+json.onlesson[i].lesson_no+"'>"+"<td>"+json.onlesson[i].lesson_title
					+"</td><td>레슨</td><td><button type='button' class='btn' id='"+json.onlesson[i].lesson_no+"' onclick='DetailLesson(this)'>상세보기</button></td>"
					+"<td><button type='button' class='btn btn-primary'>"+json.onlesson[i].state+"</button></td>"
					+"<td><button type='button' class='btn btn-warning' id='"+json.onlesson[i].lesson_no+"' onclick='updateLesson(this)'>수정</button></td>"
					+"<td><button type='button' class='btn btn-danger' id='"+json.onlesson[i].lesson_no+"' onclick='finishLesson(this)'>종료</button></td></tr>"			
					}
			}
			for(var i in json.semi) {
			if(json.semi[i].state==1){
			values += "<tr><input type='hidden' class='btn btn' value='"+json.semi[i].semi_no+"'>"+"<td>"+json.semi[i].Title
			+"</td><td>세미나</td><td><button type='button' class='btn' id='"+json.semi[i].semi_no+"' onclick='Detailsemina(this)'>상세보기</button></td>"
			+"<td><button type='button' class='btn btn-primary'>모집중</button></td>"
			+"<td><button type='button' class='btn btn-warning' id='"+json.semi[i].semi_no+"' onclick='updatesemina(this)'>수정</button></td>"
			+"<td><button type='button' class='btn btn-danger' id='"+json.semi[i].semi_no+"' onclick='finishsemina(this)'>종료</button></td></tr>"			
			}
		}
		$('#ongoing_table').html(values);
		}, error: function(a,b,c){
			console.log(b+c);
		}	
	});

});
function updatesemina(a){ //세미나 수정.
	
	location.href="/prototype/semiup?semino="+a.id;

}
function finishsemina(a){ //세미나 끝내기
	location.href="/prototype/semistop?semino="+a.id;
}
function Detailsemina(a){ //세미나 상세보기
	location.href="/prototype/sdetail?userno="+a.id;
}
function updateLesson(a){ //레슨 수정.
	location.href="/prototype/lessonupdate?lessno="+a.id;
}
function updateUser(){ //개인 정보 수정
	location.href="/prototype/04.OJK/userupdate.jsp";
}
//강의내역
$(function(){
	$.ajax({
		url: "/prototype/onlesson",
		data: {user : $('#userno').val()},
		type: "get",
		dataType: "json",
		success: function(data) {
			
var jsonStr = JSON.stringify(data);
var json = JSON.parse(jsonStr);
var values = $('#previous_table').html() + "<br>";
for(var i in json.onlesson) {	
if(json.onlesson[i].state == "숨김") {
values += "<tr><input type='hidden' class='btn btn' value='"+json.onlesson[i].lesson_no+"'>"+"<td>"+json.onlesson[i].lesson_title
+"</td><td>레슨</td><td><button type='button' class='btn' id='"+json.onlesson[i].lesson_no+"' onclick='DetailLesson(this)'>상세보기</button></td>"
+"<td>"+json.onlesson[i].lesson_enddate+"</td></tr>"}}
			
for(var i in json.semi) {
	if(json.semi[i].state==2){
		values += "<tr><input type='hidden' class='btn btn' value='"+json.semi[i].semi_no+"'>"+"<td>"+json.semi[i].Title
		+"</td><td>세미나</td><td><button type='button' class='btn' id='"+json.semi[i].semi_no+"' onclick='Detailsemina(this)'>상세보기</button></td>"
		+"<td>"+json.semi[i].end_date+"</td></tr>"			
		}
			}
			
			
			$('#previous_table').html(values);
		}, error: function(a,b,c){
			console.log(b+c);
		}	
	});

	
//학생 신청 내역
$.ajax({   //레슨로그에서 선생의 번호로 검색, 스테이스에 수업이 진행중인 것만 가져온ㄷ상관없이 가져옴.
	url:"/prototype/llteaher",
	data: {user : $('#userno').val()},
	type: "get",
	dataType: "json",
	success: function(data) {
		
var jsonStr = JSON.stringify(data);
var json = JSON.parse(jsonStr);
var values = $('#ongoing_table2').html();
for(var i in json.onlesson) {
	
if(json.onlesson[i].state == 1) {
		values += "<tr><input type='hidden' class='btn btn' value='"+json.onlesson[i].lesson_no+"'>"+"<td>"+json.onlesson[i].lesson_title
		+"</td><td>레슨</td><td>"+json.onlesson[i].username+"</td><td>"+json.onlesson[i].log_date+"</td>"
		+"<td><button type='button' class='btn' id='"+json.onlesson[i].lesson_no+"' onclick='DetailLesson(this)'>상세보기</button></td>"
		+"<td><button type='button' class='btn btn-warning' id='"+json.onlesson[i].lesson_no+"/"+json.onlesson[i].stuno+"' onclick='confirm1(this)'>수업확인</button></td>"
		+"<td><button type='button' class='btn btn-danger' id='"+json.onlesson[i].stuno+"/"+json.onlesson[i].teano+"/"+json.onlesson[i].lesson_no+"' onclick='finishstudent(this)'>이학생 종료</button></td></tr>"			
		}

else if(json.onlesson[i].state == 2 ){ 
	//일단 보류
	}
}
$('#ongoing_table2').html(values);
	}, error: function(a,b,c){
		console.log(b+c);
	}	
})


//학생을 가르친 과거내역
$.ajax({
	url:"/prototype/teachlogofteacher",
	data: {user : $('#userno').val()},
	type: "get",
	dataType: "json",
	success: function(data) {
		
var jsonStr = JSON.stringify(data);
var json = JSON.parse(jsonStr);
var values = $('#ongoing_table3').html();
for(var i in json.onlesson) {
	
		values += "<tr><input type='hidden' class='btn btn' value='"+json.onlesson[i].lesson_no+"'>"+"<td>"+json.onlesson[i].lesson_title
		+"</td><td>레슨</td><td>"+json.onlesson[i].username+"</td><td>"+json.onlesson[i].log_date+"</td>"
		+"<td><button type='button' class='btn' id='"+json.onlesson[i].lesson_no+"' onclick='DetailLesson(this)'>상세보기</button></td>"
}
$('#ongoing_table3').html(values);
	}, error: function(a,b,c){
		console.log(b+c);
	}	
})
	

	

	
});

	
</script>
<script>
//수업확인 

function finishstudent(a){
	var result = confirm('이 학생의 레슨을 끝내실건가요?'); 
	if(result) 
	{
	location.href="/prototype/finishstudent?no=" +a.id;
	}else {
		
	} 
	
}

function confirm1(a){
	var result = confirm('확실히 레슨을 진행하셨나요??'); 
	if(result) {
		location.href="/prototype/confirmlesson?no="+a.id;
		
	}else {
			
		} 
	
	
}
	

//종료하기
function finishLesson(val){
	
	var result = confirm('종료 하시겠습니까?'); 
	console.log(val.id);
	
	if(result) {
		location.href="/prototype/stoplesson?no=" + val.id;
		
	}else {
		
	} 
	
	
}
//강의삭제하기
function DeleteLesson(val){
	
	var result = confirm('삭제 하시겠습니까?'); 
	console.log(val.id);
	
	if(result) {
		location.href="/prototype/stoplesson?no=" + val.id;
		
	}else {
		
	} 
	
	
}
//강의상세보기
function DetailLesson(val){
	
	
	console.log(val.id);
	var userno = $("#userno").val();
	location.href="/prototype/lessondetail?no=" + val.id + "&userno=" + userno;
	

	
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
 	<input type="hidden" value="<%= loginUser.getUserNo() %>"  id="userno">
	<h1 align="center">선생 정보 보기</h1>
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
					<button type="button" class="btn" onclick="updateUser();" >개인정보 수정하기</button>
					&nbsp;
					<button type="button" class="btn" onclick="upload_profile();">프로필 사진 수정</button>
					&nbsp;


				</div>


			</div>
			<br> <br>
			<h1>운영중인 강좌</h1>
			<hr>
			<div id="info"
				style="width: 1100px; height: 300px; border: 1px solid gray; margin-top: 50px; overflow:auto;">
				<div style="width:100%;">
					<table class="table table-hover" id="ongoing_table"> 
						<thead>
							<tr>
								<th>강의명</th>
								<th>강의타입</th>
								<th>상세보기</th>
								<th>상태</th>
								<th>수정하기</th>
								<th>종료하기</th>
							</tr>
						</thead>
					</table>
				</div>
			<hr>
			<center>
			<button type="button" class="btn btn-info" onclick="location.href = 'insertSemina.jsp' ">세미나 등록</button>
			<button type="button" class="btn btn-info" onclick="location.href = 'insertclass2.jsp' ">강의 등록</button>
			</center>
			</div>
			
			<br> <br>
			<h1>강의 계시판 내역</h1>
			<hr>
			<div id="info"
				style="width: 1100px; height: 300px; border: 1px solid gray; margin-top: 50px; overflow:auto;">
				<div style="width:100%;">
					<table class="table table-hover" id="previous_table">
						<thead>
							<tr>
								<th>강의명</th>
								<th>강의타입</th>
								<th>상세보기바로가기</th>
								<th>종료일</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
			<br> <br> <br> <br><br>
			<h1>학생 신청 내역</h1>
			<hr>
			
			<div id="info" style="width: 1100px; height: 300px; border: 1px solid gray; margin-top: 50px; overflow:auto;">
				<div style="width:100%;">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>강의명</th>
								<th>타입</th>
								<th>학생명</th>
								<th>수업시작일</th>
								<th>상세보기바로가기</th>
								<th>수업확인</th>
								<th>수업종료</th>
							</tr>
						</thead>
						<tbody id="ongoing_table2">
							
						</tbody>
					</table>
				</div>
			</div>
			
			<br> <br><br>
			<h1>학생 교육 내역</h1>
			<hr>
			<div id="info" style="width: 1100px; height: 300px; border: 1px solid gray; margin-top: 50px; overflow:auto;">
				<div style="width:100%;">
					<table class="table table-hover">
						<thead>
						<tr>
								<th>강의명</th>
								<th>타입</th>
								<th>학생명</th>
								<th>레슨날</th>
								<th>해당레슨상세보기</th>
							
						</tr>
						</thead>
						<tbody id="ongoing_table3">
							
						</tbody>
					</table>
				</div>
			</div>
			
			
		</div>
	</div>   
	</nav>
	<Br><Br>
<%@ include file="/common/footer.jsp" %>
</body>
</html>