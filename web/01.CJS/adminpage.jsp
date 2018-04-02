<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link href="./css/bootstrap.min.css" rel="stylesheet">
    <link href="./css/adminpage.css" rel="stylesheet" type="text/css" >
  </head>
  <body>
  <%@include file="/common\navbar.jsp" %>
<section id="main" style="margin-top:60px; margin-bottom:30px;">
  <div class="container">
    <div class="row">
      <div class="col-md-3">
        <div class="list-group">
      <a href="index.html" class="list-group-item active main-color-bg"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
      대싀보드 <span class="badge">아랫 숫 합</span>
      </a>
      <a href="pages.html" class="list-group-item"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>공지사항관리<span class="badge">25</span></a>
      <a href="posts.html" class="list-group-item"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>카테고리관리<span class="badge">126</span></a>
      <a href="posts.html" class="list-group-item"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>카테고리관리<span class="badge">126</span></a>
      <a href="posts.html" class="list-group-item"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>카테고리관리<span class="badge">126</span></a>
      <a href="./adminSeachUser.jsp" class="list-group-item"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> 유저검색
       <span class="badge">12</span></a>
    </div>

  
      </div>
      <div class="col-md-9">
          <div class="panel panel-default">
  <div class="panel-heading" style="background-color:  #095f59;">
    <h3 class="panel-title" style="color:#ffffff">사이트 전체보기</h3>
  </div>
  <div class="panel-body">
   <div class="col-md-3">
     <div class="well dash-box">
       <h2><span class="glyphicon glyphicon-user" aria-hidden="true"></span> 12</h2>
       <h4>Users</h4>
     </div>
   </div>
   <div class="col-md-3">
     <div class="well dash-box">
       <h2><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> 25</h2>
       <h4>Pages</h4>
     </div>
   </div>
   <div class="col-md-3">
     <div class="well dash-box">
       <h2><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>126</h2>
       <h4>Posts</h4>
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
<!--Latest User-->
<div class="panel panel-default">
  <div class="panel-heading"style="background-color:  #095f59;">
    <h3 class="panel-title" style="color:#ffffff">최신 ~</h3>
  </div>
  <div class="panel-body">
    <table class="table table-striped table-hover">
      <tr>
        <th>이름</th>
        <th>메일</th>
        <th>가입일</th>
      </tr>
   
   
    <tr>
      <td>Madhav Prasad</td>
      <td>mr.madhavprasad@gmail.com</td>
      <td>Dec 13,2014</td>
    </tr>
    <tr>
      <td>Nagendra Kushwaha</td>
      <td>nkushwaha822@gmail.com</td>
      <td>Feb 15,2014</td>
    </tr>
    <tr>
      <td>Arun Kumar</td>
      <td>kumarun@yahoo.com</td>
      <td>Aug 17, 2015</td>
    </tr>
    <tr>
      <td>Nabin Singh</td>
      <td>singhNavs@outlook.com</td>
      <td>March 08,2016</td>
    </tr>
    </table>

  </div>
</div>
<!--  -->

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
   
   
    <tr>
      <td>Madhav Prasad</td>
      <td>mr.madhavprasad@gmail.com</td>
      <td>Dec 13,2014</td>
    </tr>
    <tr>
      <td>Nagendra Kushwaha</td>
      <td>nkushwaha822@gmail.com</td>
      <td>Feb 15,2014</td>
    </tr>
    <tr>
      <td>Arun Kumar</td>
      <td>kumarun@yahoo.com</td>
      <td>Aug 17, 2015</td>
    </tr>
    <tr>
      <td>Nabin Singh</td>
      <td>singhNavs@outlook.com</td>
      <td>March 08,2016</td>
    </tr>
    </table>

  </div>
</div>

      </div>
    </div>
  </div>
</section>

  <%@include file="/common\footer.jsp" %>

  </body>
</html>