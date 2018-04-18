<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="users.model.vo.*"%>
    
<%
String one=(String)request.getAttribute("first"); 
String two=(String)request.getAttribute("second"); 
String three=(String)request.getAttribute("third"); 
String four=(String)request.getAttribute("fourth"); 
String five=(String)request.getAttribute("fifth");
ArrayList<Users> list = (ArrayList<Users>)(request.getAttribute("newUserList"));
ArrayList<NewestLessonByAdmin> list2 = (ArrayList<NewestLessonByAdmin>)(request.getAttribute("newestlist"));
Users use=(Users)session.getAttribute("loginUser");    
%> 
   
<!DOCTYPE html>

<html>
  <head>

<script src="/prototype\common\resources\js\jquery-3.3.1.min.js"></script>

<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   
  
    <title>관리자 페이지</title>

    <!-- Bootstrap core CSS -->
    <link href="/prototype/01.CJS\css\bootstrap.min.css" rel="stylesheet">
    <link href="/prototype/01.CJS\css\adminpage.css" rel="stylesheet" type="text/css" >
    <style>
    body {
  color: #DAD6D6;
  background: #171A21;
  text-align: center;
}

#start {
  margin: 40px auto;
  text-align: center;
  color: #DAD6D6;
  background: #48633B;
  border:solid 2px #35492C;
  border-radius:5px;
  padding:16px 40px 16px;
  letter-spacing: 2px;
  cursor:pointer;
}

#stop {
  margin: 40px 5px auto;
  text-align: center;
  color: #DAD6D6;
  background: #721329;
  border:solid 2px #590F20;
  border-radius:5px;
  padding:16px 40px 16px;
  letter-spacing: 2px;
  cursor:pointer;
}

#clear {
  margin: 40px auto;
  text-align: center;
  color: #DAD6D6;
  background: #564E58;
  border:solid 2px #3E383F;
  border-radius:5px;
  padding:16px 40px 16px;
  letter-spacing: 2px;
  cursor:pointer;
}

h2
{
  font-size: 46px;
  letter-spacing: 2px;
  margin: 200px 0 0 ;
}
    </style>
<script type="text/javascript">

function bomm(){
	location.href="/prototype/nuclear?no="+<%=use.getUserTypeNo()%>;	
}

$(function(){
	setInterval(function() {
		$.ajax({
			url:"/prototype/realtimelog",
			data: {},
			type: "get",
			dataType: "json",
			success: function(data) {
	    var jsonStr = JSON.stringify(data);
		var json = JSON.parse(jsonStr);
	$("#realtime").html(
	"<tr style='text-align:center; background-color:#337ab7'>"		
	+"<th colspan='2' style='color:white; text-align:center;'>실시간 검색어 순위</th></tr>"
	+"<tr><th>1.</th><td style='text-align:center;'><span>"+json.list[0]+"</span></td></tr>"
	+"<tr><th>2.</th><td style='text-align:center;'><span>"+json.list[1]+"</span></td></tr>"
	+"<tr><th>3.</th><td style='text-align:center;'><span>"+json.list[2]+"</span></td></tr>"
	+"<tr><th>4.</th><td style='text-align:center;'><span>"+json.list[3]+"</span></td></tr>"
	+"<tr><th>5.</th><td style='text-align:center;'><span>"+json.list[4]+"</span></td></tr>"
	)
		
	}, error: function(a,b,c){
				console.log(b+c);
			}	
		})	
		
	}, 5000);
	
	
	
})
var timer,
 i = 1000,
 divide = 100;
function start(){
 // setInterval()은 지정된 시간후 특정 자바스크립트 코드가 포함된 문자열을 반복하여 호출하는 메소드
 // 지정된 시간 increment() 함수를 의미

 timer = self.setInterval('increment()',    (1000 / divide));


}

function increment(){
 // ( i / divide )??
i-=1;
 console.log(i);
 if(i==0){
 stop();
 }
 
 document.getElementById('time_out').innerHTML = (i / divide);
}

function stop(){
 // clearInterval : setInterval을 멈출 때 사용
 // timer = null을 준 이유는?
 clearInterval(timer);
 timer = null;
 bomm();
}

function reset(){
 stop();
 i = 1000
 document.getElementById('time_out').innerHTML = (i / divide);
}


</script>    
    
    
  </head>
  <body>
  <%@include file="/common\navbar.jsp" %>
  
<section id="main" style="margin-top:60px; margin-bottom:30px;">
  <div class="container">
    <div class="row">
      <div class="col-md-3">
        <div class="list-group">
      <a class="list-group-item active main-color-bg"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
      설정관리<span class="badge">1</span>
      </a>
      <a href="/prototype/03.OHW\views\noticeInsert.jsp" class="list-group-item"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>공지사항쓰기</a>
      <a href="/prototype/01.CJS/categorys.jsp" class="list-group-item"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>카테고리관리</a>
      <a href="/prototype/reportlist" class="list-group-item"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>신고관리</a>
      <a href="/prototype/03.OHW/views/noticeInsert.jsp" class="list-group-item"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>공지사항작성</a>
      <a href="/prototype/adminseachuser" class="list-group-item"><span class="glyphicon glyphicon-user" aria-hidden="true" ></span> 유저검색</a>
      <a href="/prototype/adminlessnolist" class="list-group-item"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>강의관리</a>
      <a href="/prototype/adminseminalist" class="list-group-item"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>세미나관리</a>
    </div>
    
<div class="list-group">
<table style="border: 1px solid #ddd" name="realTimeSearch" class="table" >
<tbody id="realtime">
<tr style="text-align:center; background-color:#337ab7">
<th colspan="2" style="color:white; text-align:center;">실시간 검색어 순위</th></tr>
 <tr><th>1.</th><td style="text-align:center;"><span><%=one %></span></td></tr>
 <tr><th>2.</th><td style="text-align:center;"><span><%=two %></span></td></tr>
 <tr><th>3.</th><td style="text-align:center;"><span><%=three %></span></td></tr>
 <tr><th>4.</th><td style="text-align:center;"><span><%=four %></span></td></tr>
 <tr><th>5.</th><td style="text-align:center;"><span><%=five %></span></td></tr> 
</tbody> 

</table>
 
 
 </div>

<center>

<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
  Launch demo modal
</button>
</center>

      </div>
      <div class="col-md-9">
          <div class="panel panel-default">
  <div class="panel-heading" style="background-color:  #095f59;">
    <h3 class="panel-title" style="color:#ffffff">사이트 전체보기</h3>
  </div>
  <div class="panel-body">
   <div class="col-md-3">
     <div class="well dash-box">
       <h2><span class="glyphicon glyphicon-user" aria-hidden="true"></span><%=(String)request.getAttribute("user") %></h2>
       <h4>회원수</h4>
     </div>  
   </div>
   <div class="col-md-3">
     <div class="well dash-box">
       <h2><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> <%=(String)request.getAttribute("lesson") %></h2>
       <h4>등록강의수</h4>
     </div>
   </div>
   <div class="col-md-3">
     <div class="well dash-box">
       <h2><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span><%=(String)request.getAttribute("semina") %></h2>
       <h4>등록세미나수</h4>
     </div>
   </div>
   <div class="col-md-3">
     <div class="well dash-box">
       <h2><span class="glyphicon glyphicon-stats" aria-hidden="true"></span> 2129</h2>
       <h4>Visitores</h4>
     </div>
   </div>
  </div>
</div>
<!-최신 강의->




<div class="panel panel-default">
  <div class="panel-heading"style="background-color:  #095f59;">
    <h3 class="panel-title" style="color:#ffffff">최신 강의</h3>
  </div>
  <div class="panel-body">
    <table class="table table-striped table-hover">
      <tr>
        <th>강의명</th>
        <th>선생님</th>
        <th>등록일</th>
      </tr>
   
   
   <% for (int i=0; i<5; i++){ %>
    <tr>
      <td><%=list2.get(i).getLesson_title() %></td>
      <td><%=list2.get(i).getUserName() %></td>
      <td><%=list2.get(i).getLesson_startdate() %></td>
    </tr>
   <%} %>
   
    </table>

  </div>
</div>
 <!-최신유저 ->

<div class="panel panel-default">
  <div class="panel-heading"style="background-color:  #095f59;">
    <h3 class="panel-title" style="color:#ffffff">최신 유저
    </h3>
  </div>
 
  <div class="panel-body">
    <table class="table table-striped table-hover">
      <tr>
        <th>이름</th>
        <th>메일</th>
        <th>가입일</th>
      </tr>
   <% for (int i=0; i<5; i++){ %>
    <tr>
      <td><%=list.get(i).getUserName() %></td>
      <td><%=list.get(i).getUserEmail() %></td>
      <td><%=list.get(i).getUserEnrollDate()%></td>
    </tr>
   <%} %>
   </table>

  </div>
</div>

      </div>
    </div>
  </div>
</section>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">모든 데이터 날리기</h4>
      </div>
      <div class="modal-body">
 <span id="time_out">10.00</span>
<br />
<br />
 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" onclick="start()">폭파하기</button>
        <button type="button" class="btn btn-primary" onclick="reset()">취소하기</button>
      </div>
    </div>
  </div>
</div>
  <%@include file="/common/footer.jsp" %>

  </body>
</html>


