<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Users us=(Users)session.getAttribute("loginUser");

%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="/prototype/common/resources/js/jquery-3.3.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학생 정보 보기</title>
<script>
//배우고싶어요
$(function(){
	
	if('<%=us%>'== null){
		alert("정상적인 경로를 이용해주세요");
		location.href="/prototype/index.jsp";
	}else{
	 if(<%=us.getUserTypeNo()%>!=1001 ) {
		 alert("정상적인 경로를 이용해주세요");
	 	location.href="/prototype/index.jsp";
	 }
	}
		
	
	
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
					+"</td><td><button type='button' class='btn btn-info' id='"+json.onlesson[i].lesson_no+"' onclick='DetailLesson(this)'>상세보기</button></td>"
					+"<td><button type='button' class='btn btn-warning' id='"+json.onlesson[i].lesson_no+"'>대기중</button></td>"	
				    +"<td><button type='button' class='btn btn-default' id='"+json.onlesson[i].lesson_no+"' onclick='upstudentlesson(this)'>수정하기</button></td>"			
					+"<td><button type='button' class='btn btn-danger' id='"+json.onlesson[i].lesson_no+"' onclick='CancleLesson(this)'>취소</button></td></tr>"			
			}else{	
				values +=
				"<tr><input type='hidden' class='btn btn' value='"+json.onlesson[i].lesson_no+"'>"+"<td>"+json.onlesson[i].lesson_title
				+"</td><td><button type='button' class='btn btn-info' id='"+json.onlesson[i].lesson_no+"' onclick='DetailLesson(this)'>상세보기</button></td>"
				+"<td><button type='button' class='btn btn-success' id='"+json.onlesson[i].lesson_no+"'>수업중</button></td>"			
			    +"<td><button type='button' class='btn btn-default' id='"+json.onlesson[i].lesson_no+"' onclick='upstudentlesson(this)'>수정하기</button></td>"			
				+"<td><button type='button' class='btn btn-danger' id='"+json.onlesson[i].lesson_no+"' onclick='CancleLesson(this)'>취소</button></td></tr>"		
				
			}		
		
		}
			
		$('#ongoing_table').html(values);
		}, error: function(a,b,c){
			console.log(b+c);
		}	
	});
	
	
	
	
	
	//진행중인 강의
	$.ajax({   //레슨로그에서 본인(학생)의 번호로 검색, 스테이스에 수업이 진행중인 것만 가져 가져옴.
		url:"/prototype/llteaher2",
		data: {user : $('#userno').val()},
		type: "get",
		dataType: "json",
		success: function(data) {
			
	var jsonStr = JSON.stringify(data);
	var json = JSON.parse(jsonStr);
	var values = $('#ongoing_table2').html();
	for(var i in json.onlesson) {
		
	if(json.onlesson[i].type == 7000) {
	//선생이 올린 계시판으로 가기
	values += "<tr><input type='hidden' class='btn btn' value='"+json.onlesson[i].lesson_no+"'>"+"<td>"+json.onlesson[i].lesson_title
			+"</td><td>"+json.onlesson[i].username+"</td><td>"+json.onlesson[i].phone+"</td><td>"+json.onlesson[i].log_date+"</td>"
			+"<td><button type='button' class='btn btn-info' id='"+json.onlesson[i].lesson_no+"' onclick='DetailLesson1(this)'>상세보기</button></td>"
			+"<td><button type='button' class='btn btn-danger' id='"+json.onlesson[i].stuno +"/"+json.onlesson[i].teano+"/"+json.onlesson[i].lesson_no+"' onclick='finishLesson(this)'>종료</button></td></tr>";			
			
	}
	else if(json.onlesson[i].type == 8000 ){ 
		//학생이 올린 계시판으로 가기
	values += "<tr><input type='hidden' class='btn btn' value='"+json.onlesson[i].lesson_no+"'>"+"<td>"+json.onlesson[i].lesson_title
		+"</td><td>"+json.onlesson[i].username+"</td><td>"+json.onlesson[i].phone+"</td><td>"+json.onlesson[i].log_date+"</td>"
		+"<td><button type='button' class='btn btn-info' id='"+json.onlesson[i].lesson_no+"' onclick='DetailLesson(this)'>상세보기</button></td>"
		+"<td><button type='button' class='btn btn-danger' id='"+json.onlesson[i].stuno +"/"+json.onlesson[i].teano+"/"+json.onlesson[i].lesson_no+"' onclick='finishLesson(this)'>종료</button></td></tr>";			
	}
	
	$('#ongoing_table2').html(values)}
	
	}, error: function(a,b,c){
		console.log(b+c);
		}
	})

//학생이 이때까지 배운 내역
	$.ajax({
		url:"/prototype/teachlogofteacher2",
		data: {user : $('#userno').val()},
		type: "get",
		dataType: "json",
		success: function(data) {
			
	var jsonStr = JSON.stringify(data);
	var json = JSON.parse(jsonStr);
	var values = $('#ongoing_table3').html();
	for(var i in json.onlesson) {
		
			values += "<tr><input type='hidden' class='btn btn' value='"+json.onlesson[i].lesson_no+"'>"+"<td>"+json.onlesson[i].lesson_title
			+"</td><td>"+json.onlesson[i].username+"</td><td>"+json.onlesson[i].phone+"</td><td>"+json.onlesson[i].log_date+"</td>"
			+"<td><button type='button' class='btn btn-default' id='"+json.onlesson[i].lesson_no+"' onclick='insertReview(this)'><i class='fa fa-pencil-square-o' style='font-size:20px'></i>리뷰쓰기</button></td>"
	}
	$('#ongoing_table3').html(values);
		}, error: function(a,b,c){
			console.log(b+c);
		}	
	}) 
	
// 세미나 신청내역보기	
	$.ajax({
	url:"/prototype/checksemina",
	data: {no : $('#userno').val()},
	type: "get",
	dataType: "json",
	success: function(data) {
			
	var jsonStr = JSON.stringify(data);
	var json = JSON.parse(jsonStr);
	var values = $('#ongoing_table4').html();
	for(var i in json.semi) {
		if(json.semi[i].SEMINA_DETAIL_STATE == 1){
	values += "<tr><td>"+json.semi[i].SEMINA_TITLE+"</td><td>"+json.semi[i].USER_PHONE+"</td>"
	+"<td><input type='button' class='btn btn-info' id='"+json.semi[i].SEMINA_NO+"' onclick='detailsemina(this)' value='상세보기'></td><td>"+json.semi[i].SEMINA_ENDDATE+"</td>"
	+"<td><button class='btn btn-warning'> 신청중 </button></td>"
	+"<td><button type='button' class='btn btn-danger' id='"+json.semi[i].SEMINA_DETAIL_NO+"' onclick='cans(this)'>취소하기</button></td>"
	
		/*
			<th>세미나명</th>
			<th>진행자 연락처</th>
			<th>세미나 상세보기</th>
			<th>세미나당일</th>
			<th>상태</th>
			<th>취소하기</th>
			
			job.put("SEMINA_DETAIL_NO", l.getSEMINA_NO());
			job.put("SEMINA_DETAIL_STATE", l.getSEMINA_DETAIL_STATE());
			job.put("SEMINA_ENDDATE", l.getSEMINA_ENDDATE());
			job.put("SEMINA_LOCATION", l.getSEMINA_LOCATION());
			job.put("SEMINA_NO", l.getSEMINA_NO());
			job.put("SEMINA_NOW", l.getSEMINA_NOW());
			job.put("SEMINA_STATE", l.getSEMINA_STATE());
			job.put("SEMINA_TITLE", l.getSEMINA_TITLE());
			job.put("USER_NO", l.getUSER_NO());
			job.put("USER_PHONE", l.getUSER_PHONE());
			jarr.add(job);*/
		}else if(json.semi[i].SEMINA_DETAIL_STATE == 2){
		values += "<tr><td>"+json.semi[i].SEMINA_TITLE+"</td><td>"+json.semi[i].USER_PHONE+"</td>"
		+"<td><input type='button' class='btn btn-info' id='"+json.semi[i].SEMINA_NO+"' onclick='detailsemina(this)' value='상세보기'></td><td>"+json.semi[i].SEMINA_ENDDATE+"</td>"
		+"<td><button class='btn btn-danger'> 취소됨 </button></td> <td>...</td></tr>"
	}
	}
	
	$('#ongoing_table4').html(values);
	}, error: function(a,b,c){
			console.log(b+c);
		}	
	})
});

function upstudentlesson(a){
	location.href="/prototype/findstules?no="+a.id
}
function updateUser(){ //개인 정보 수정
	location.href="/prototype/04.OJK/userupdate.jsp";
}

function DetailLesson1(val){
	console.log(val.id);
	var userno = $("#userno").val();
	location.href="/prototype/lessondetail?no=" + val.id + "&userno=" + userno;
}
//학생의 강의 상세보기
function DetailLesson(val) {
	console.log(val.id);
	var userno = $('#userno').val();
	console.log(userno);
	location.href="/prototype/studentdetail?no=" + val.id + "&userno=" + userno;
} 

//강의 취소하기
function CancleLesson(val) {
	var result = confirm('취소 하시겠습니까?'); 
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
	var popOption = "width=700, height=650, resizable=no, status=no; left=600;";    //팝업창 옵션(optoin)

	window.open(popUrl,"a",popOption);
}
//프로필 업로드하기
function upload_profile() {
	
	var popUrl = "/prototype/04.OJK/profile_upload.jsp"; 
	//팝업창에 출력될 페이지 URL
	
	var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

		window.open(popUrl,"a",popOption);
	
}
//세미나 상세보기
function detailsemina(a){
	location.href='/prototype/sdetail?userno='+a.id+'&usernono='+<%=us.getUserNo()%>;
}
//세미나 신청 취소하기
function cans(a){
	location.href='/prototype/sdcan?no='+a.id+'&type='+<%=us.getUserTypeNo()%>	
}
//현재 강의수는 넘지않았는지, 강의등록금지에 걸렸는지.
function checklessonNum(a){
	 var id=a.id;
	$.ajax({
		url:"/prototype/checklessonNum",
		data:{no:id},
		success:function(da) {
		console.log(da);
		if(da==1)
		noexe()
		else if(da==2)
		maxlesson()
		else if(da==3) 	
		ableless()	
			
		
		},error:function(a,b,c){
			console.log(b+c)
		}
			
		})
}
function finishLesson(a){
	var result = confirm('종료 하시겠습니까?'); 
	console.log(a.id);
	
	if(result) 
	location.href="/prototype/finishstudent2?no=" + a.id;
		
}


function noexe(){

	$('#myModal').modal('show');
	
}
function maxlesson(){

	$('#myModal1').modal('show');
		
}
function ableless(){

	location.href = 'insertclass3.jsp';
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
					<button type="button" class="btn btn-default" onclick="updateUser();">
					<i class="fa fa-gear fa-spin" style="font-size:20px"></i> 개인정보 수정하기</button>
					&nbsp;
					<button type="button" class="btn btn-default" onclick="upload_profile();">
					<i class="fa fa-gear fa-spin" style="font-size:20px"></i> 프로필 사진 수정</button>
					&nbsp;


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

			<button type="button" class="btn btn-success" onclick="location.href = 'insertclass3.jsp' ">
			<i class="fa fa-handshake-o" style="font-size:20px"></i> 배우고 싶어요 등록하기</button>
			
			</center>
			</div>
			<br> <br>
			<h1>진행중인 강의</h1>
			<hr>
			<div id="info"
				style="width: 1100px; height: 300px; border: 1px solid gray; margin-top: 50px;">
				<div style="width:100%;">
					<table class="table table-hover" >
						<thead>
							<tr>
								<th>강의명</th>
								<th>선생님</th>
								<th>연락처</th>
								<th>매칭시작일</th>
								<th>상세보기</th>
								<th>취소하기</th>
							</tr>
						</thead>
						<tbody id="ongoing_table2"></tbody>
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
								<th>연락처</th>
								<th>레슨수행일</th>
								<th>리뷰쓰기</th>
							</tr>
						</thead>
						<tbody id="ongoing_table3">
							
						</tbody>
					</table>
				</div>
			</div>
				<br> <br>
			<h1>세미나 신청 내역</h1>
			<hr>
			<div id="info"
				style="width: 1100px; height: 300px; border: 1px solid gray; margin-top: 50px;">
				<div style="width:100%;">
					<table class="table table-hover" >
						<thead>
							<tr>
								<th>세미나명</th>
								<th>진행자 연락처</th>
								<th>세미나 상세보기</th>
						
								<th>세미나당일</th>
								
								<th>상태</th>
								<th>취소하기</th>
							</tr>
						</thead>
						<tbody id="ongoing_table4">
							
						</tbody>
					</table>
				</div>
			</div>
		</div>
		
		
		
		
	</div>




	</nav>
	<Br><Br><Br>
<%@include file="/common\footer.jsp" %>
<div class="modal fade"  id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content" style="width:500px; height: 200px; margin-top: 200px;">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">글쓰기 권한이없습니다!</h4>
      </div>
      <div class="modal-body">
관리자에 의해서 글쓰기 권한을 박탈당했습니다<Br>
자세한건 연락주센
<br />
<br />
 
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>

   <div class="modal fade"  id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content" style="width:500px; height: 200px; margin-top: 200px;">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">강의수 최대!</h4>
      </div>
      <div class="modal-body">
회원님의 강의수가 최대수에 도달하였습니다!<Br>
강의를 취소하시거나, 등급을 올려주세요!
<br />
<br />
 
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>
</body>
</html>