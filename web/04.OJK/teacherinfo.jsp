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
					+"</td><td>레슨</td><td><button type='button' class='btn btn-info' id='"+json.onlesson[i].lesson_no+"' onclick='DetailLesson(this)'>상세보기</button></td>"
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
		+"<td><input type='button' class = 'btn btn-info' id='"+json.semi[i].SEMINA_NO+"' onclick='detailsemina(this)' value='상세보기'></td><td>"+json.semi[i].SEMINA_ENDDATE+"</td>"
		+"<td><button class = 'btn btn-primary' > 신청중 </button></td>"
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
			+"<td><input type='button' id='"+json.semi[i].SEMINA_NO+"' onclick='detailsemina(this)' value='상세보기'></td><td>"+json.semi[i].SEMINA_ENDDATE+"</td>"
			+"<td><button> 취소됨 </button></td> <td>...</td></tr>"
		
			
		}		
		}
		
		$('#ongoing_table4').html(values);
		}, error: function(a,b,c){
				console.log(b+c);
			}	
		})

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
function noexe(){

	$('#myModal').modal('show');
	
}
function maxlesson(){

	$('#myModal1').modal('show');
		
}
function ableless(){
	
	location.href = 'insertclass2.jsp';
}

function checklessonNum(a){//현재 강의수는 넘지않았는지, 강의등록금지에 걸렸는지.
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
values += "<tr><input type='hidden' class='btn btn-default' value='"+json.onlesson[i].lesson_no+"'>"+"<td>"+json.onlesson[i].lesson_title
+"</td><td>레슨</td><td><button type='button' class='btn btn-default' id='"+json.onlesson[i].lesson_no+"' onclick='DetailLesson(this)'>상세보기</button></td>"
+"<td>"+json.onlesson[i].lesson_enddate+"</td></tr>"}}
			
for(var i in json.semi) {
	if(json.semi[i].state==2){
		values += "<tr><input type='hidden' class='btn btn' value='"+json.semi[i].semi_no+"'>"+"<td>"+json.semi[i].Title
		+"</td><td>세미나</td><td><button type='button' class='btn btn-default' id='"+json.semi[i].semi_no+"' onclick='Detailsemina(this)'>상세보기</button></td>"
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
	if(json.onlesson[i].type == 7000){
		//선생이 올린 계시판일경우
		values += 
		"<tr><input type='hidden' class='btn btn' value='"+json.onlesson[i].lesson_no+"'>"+"<td>"+json.onlesson[i].lesson_title
		+"</td><td>레슨</td><td>"+json.onlesson[i].username+"</td><td>"+json.onlesson[i].phone+"</td><td>"+json.onlesson[i].log_date+"</td>"
		+"<td><button type='button' class='btn' id='"+json.onlesson[i].lesson_no+"' onclick='DetailLesson(this)'>상세보기</button></td>"
		+"<td><button type='button' class='btn btn-warning' id='"+json.onlesson[i].stuno+"/"+json.onlesson[i].teano+"/"+json.onlesson[i].lesson_no+"' onclick='confirm1(this)'>수업확인</button></td>"
		+"<td><button type='button' class='btn btn-danger' id='"+json.onlesson[i].stuno+"/"+json.onlesson[i].teano+"/"+json.onlesson[i].lesson_no+"' onclick='finishstudent(this)'>이학생 종료</button></td></tr>"			
	}else if(json.onlesson[i].type == 8000){
	 //학생이 올린 계시판일경우	
		values += "<tr><input type='hidden' class='btn btn' value='"+json.onlesson[i].lesson_no+"'>"+"<td>"+json.onlesson[i].lesson_title
		+"</td><td>배우고싶어요</td><td>"+json.onlesson[i].username+"</td><td>"+json.onlesson[i].phone+"</td><td>"+json.onlesson[i].log_date+"</td>"
		+"<td><button type='button' class='btn' id='"+json.onlesson[i].lesson_no+"' onclick='DetailLesson1(this)'>상세보기</button></td>"
		+"<td><button type='button' class='btn btn-warning' id='"+json.onlesson[i].stuno+"/"+json.onlesson[i].teano+"/"+json.onlesson[i].lesson_no+"' onclick='confirm1(this)'>수업확인</button></td>"
		+"<td><button type='button' class='btn btn-danger' id='"+json.onlesson[i].stuno+"/"+json.onlesson[i].teano+"/"+json.onlesson[i].lesson_no+"' onclick='finishstudent(this)'>이학생 종료</button></td></tr>"		
	}

}else if(json.onlesson[i].state == 2 ){ 
	
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
	if(json.onlesson[i].type==7000){
		values += "<tr><input type='hidden' class='btn btn' value='"+json.onlesson[i].lesson_no+"'>"+"<td>"+json.onlesson[i].lesson_title
		+"</td><td>레슨</td><td>"+json.onlesson[i].username+"</td><td>"+json.onlesson[i].log_date+"</td>"
		+"<td><button type='button' class='btn btn-default' id='"+json.onlesson[i].lesson_no+"' onclick='DetailLesson(this)'>상세보기</button></td>"
	}else if(json.onlesson[i].type==8000){
		values += "<tr><input type='hidden' class='btn btn' value='"+json.onlesson[i].lesson_no+"'>"+"<td>"+json.onlesson[i].lesson_title
		+"</td><td>배우고싶어요</td><td>"+json.onlesson[i].username+"</td><td>"+json.onlesson[i].log_date+"</td>"
		+"<td><button type='button' class='btn btn-default' id='"+json.onlesson[i].lesson_no+"' onclick='DetailLesson1(this)'>상세보기</button></td>"
	}
}
$('#ongoing_table3').html(values);
	}, error: function(a,b,c){
		console.log(b+c);
	}	
})
});
//세미나 상세보기
function detailsemina(a){
	location.href='/prototype/sdetail?userno='+a.id+'&usernono='+<%=us.getUserNo()%>;
}
//세미나 신청 취소하기
function cans(a){
	location.href='/prototype/sdcan?no='+a.id+'&type='+<%=us.getUserTypeNo()%>	
}
	
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

function DetailLesson1(a){
	
	console.log(userno);
	location.href="/prototype/studentdetail?no=" + a.id + "&userno=" + userno;
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
					<button type="button" class="btn btn-default" onclick="updateUser();" >
					<i class="fa fa-gear fa-spin" style="font-size:20px"></i> 개인정보 수정하기</button>
					&nbsp;
					<button type="button" class="btn btn-default" onclick="upload_profile();">
					<i class="fa fa-gear fa-spin" style="font-size:20px"></i> 프로필 사진 수정</button>
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
			<button type="button" class="btn btn-default" onclick="location.href = 'insertSemina.jsp' ">
			<i class="fa fa-mortar-board" style="font-size:20px"></i> 세미나 등록</button>
		
		  	 <button type="button" class="btn btn-default" id="<%=us.getUserNo() %>"  onclick="checklessonNum(this) ">
		  	<i class="fa fa-pencil fa-spin" style="font-size:20px"></i>  강의 등록</button>		
		
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
								<th>전화번호</th>
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
	<Br><Br>
<%@ include file="/common/footer.jsp" %>

   <div class="modal fade"  id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content" style="width:500px; height: 200px; margin-top: 200px;">
      <div class="modal-header">
        <button type="button" class="btn btn-info close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
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
        <button type="button" class="btn btn-info close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
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