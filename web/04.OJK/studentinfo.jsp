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
//본인이 올린것.
$(function(){
	$.ajax({
		url: "/prototype/onlessonteacher",
		data: {user : $('#userno').val()},
		type: "get",
		dataType: "json",
		success: function(data) {
			
			var jsonStr = JSON.stringify(data);
			var json = JSON.parse(jsonStr);
			
			var values = $('#ongoing_table').html() + "<br>";
			
			for(var i in json.onlesson) {	
			
			if(json.onlesson[i].state==1){	
			values +=
					"<tr><input type='hidden' class='btn btn' value='"+json.onlesson[i].lesson_no+"'>"+"<td>"+json.onlesson[i].lesson_title
					+"</td><td><button type='button' class='btn' id='"+json.onlesson[i].lesson_no+"' onclick='DetailLesson(this)'>상세보기</button></td>"
					+"<td><button type='button' class='btn btn-danger' id='"+json.onlesson[i].lesson_no+"'>대기중</button></td>"			
				    +"<td><button type='button' class='btn btn-danger' id='"+json.onlesson[i].lesson_no+"' onclick='upstudentlesson(this)'>수정하기</button></td>"			
					+"<td><button type='button' class='btn btn-danger' id='"+json.onlesson[i].lesson_no+"' onclick='CancleLesson(this)'>취소</button></td></tr>"			
			}else{	
				values +=
				"<tr><input type='hidden' class='btn btn' value='"+json.onlesson[i].lesson_no+"'>"+"<td>"+json.onlesson[i].lesson_title
				+"</td><td><button type='button' class='btn' id='"+json.onlesson[i].lesson_no+"' onclick='DetailLesson(this)'>상세보기</button></td>"
				+"<td><button type='button' class='btn btn-danger' id='"+json.onlesson[i].lesson_no+"'>수업중</button></td>"			
			    +"<td><button type='button' class='btn btn-danger' id='"+json.onlesson[i].lesson_no+"' onclick='upstudentlesson(this)'>수정하기</button></td>"			
				+"<td><button type='button' class='btn btn-danger' id='"+json.onlesson[i].lesson_no+"' onclick='CancleLesson(this)'>취소</button></td></tr>"		
				
			}		
		
		}
			
			$('#ongoing_table').html(values);
		}, error: function(a,b,c){
			console.log(b+c);
		}	
	});

});

//진행중인강좌.
$(function(){
	$.ajax({
		url: "/prototype/onlesson2",
		data: {user : $('#userno').val()},
		type: "get",
		dataType: "json",
		success: function(data) {
			
			var jsonStr = JSON.stringify(data);
			var json = JSON.parse(jsonStr);
			
			var values = $('#ongoing_table2').html() + "<br>";
			
			for(var i in json.onlesson) {	
			values +="<tr><input type='hidden' class='btn btn' value='"+json.onlesson[i].lesson_no+"'>"+"<td>"+json.onlesson[i].lesson_title
			+"</td><td>"+json.onlesson[i].username+"</td>"
					
			+"</td><td>"+json.onlesson[i].log_date+"</td><td><button type='button' class='btn'>수강중</button></td>"
							
						
					+"<td><button type='button' class='btn btn-danger' id='"+json.onlesson[i].lesson_no+"' onclick='CancleLesson(this)'>취소</button></td></tr>"			
			}
			
			
			/*
			job.put("username", l.getUSER_NAME());//선생의 이름 
			job.put("state", l.getLOG_STATE());
			job.put("lesson_no", l.getLESSON_NO());
			job.put("lesson_title", l.getLESSON_TITLE());
			job.put("log_no", l.getLOG_NO());
			job.put("log_date", l.getLOG_DATE().toString());
			
			*/
			
			$('#ongoing_table2').html(values);
		}, error: function(a,b,c){
			console.log(b+c);
		}	
	});
 
});


//진행중인 강의 lesson_log테이블에서 뽑아옴.
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
	
$.ajax({
	url:"/prototype/onlesson3",
	data:{user : $('#userno').val()},

	type: "get",
	dataType: "json",
	success: function(data) {
		
		var jsonStr = JSON.stringify(data);
		var json = JSON.parse(jsonStr);
		$('#ongoing_table3').html("");
		var values = $('#ongoing_table3').html();
		
		for(var i in json.onlesson) {	
		values +="<tr><input type='hidden' class='btn btn' value='"+json.onlesson[i].lesson_no+"'>"+"<td>"+json.onlesson[i].lesson_title
		+"</td><td>"+json.onlesson[i].username+"</td>"
				
		+"</td><td>"+json.onlesson[i].log_date+"</td><td><button type='button' id="+json.onlesson[i].lesson_no+" class='btn' onclick='insertReview(this)'>리뷰쓰기</button></td>"
						
}
		
		
		/*
		job.put("username", l.getUSER_NAME());//선생의 이름 
		job.put("state", l.getLOG_STATE());
		job.put("lesson_no", l.getLESSON_NO());
		job.put("lesson_title", l.getLESSON_TITLE());
		job.put("log_no", l.getLOG_NO());
		job.put("log_date", l.getLOG_DATE().toString());
		
		*/
		
		$('#ongoing_table3').html(values);
	}, error: function(a,b,c){
		console.log(b+c);
	}	
});

	

});



//강의 상세보기
function DetailLesson(val) {
	console.log(val.id);
	var userno = $('#userno').val();
	console.log(userno);
	location.href="/prototype/studentdetail?no=" + val.id + "&userno=" + userno;
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
	var popOption = "width=700, height=920, resizable=no, scrollbars=no, status=no; left=600;";    //팝업창 옵션(optoin)

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
	<input type="hidden" value="<%= loginUser.getUserNo() %>" id="userno">
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
			<h1>배우고싶어요</h1>
			<hr>
			<div id="info" style="width: 1100px; height: 300px; border: 1px solid gray; margin-top: 50px;">
				<div style="width:100%;">
				<table class="table table-hover" id="ongoing_table">
					<thead>
						<tr>
							<th>계시판명</th>
							<th>상세보기</th>
							<th>현상태</th>
							<th>수정하기</th>
							<th>취소하기</th>
						</tr>
						<tr>
					
						</tr>
					</thead>
				</table>
				</div>
			<hr>
			<center>
			<button type="button" class="btn btn-info" onclick="location.href = 'insertclass3.jsp' ">배우고 싶어요 등록하기</button>
			</center>
			</div>
			<br> <br>
			<h1>진행중인 강의</h1>
			<hr>
			<div id="info"
				style="width: 1100px; height: 300px; border: 1px solid gray; margin-top: 50px;">
				<div style="width:100%;">
					<table class="table table-hover" id="ongoing_table2">
						<thead>
							<tr>
								<th>강의명</th>
								<th>선생님</th>
								<th>최근매칭일</th>
								<th>현 상태</th>
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
					<table class="table table-hover" >
						<thead>
							<tr>
								<th>강의명</th>
								<th>선생님</th>
								<th>강의최종일</th>
								<th>리뷰쓰기</th>
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
	<Br><Br><Br>
<%@include file="/common\footer.jsp" %>
</body>
</html>