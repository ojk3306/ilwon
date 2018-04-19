<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
Users  user = (Users)session.getAttribute("loginUser");    
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>검색결과가 없습니다!</title>

</head>
<body>
<%@ include file="/common\navbar.jsp" %>
<%@ include file="/01.CJS\sidebar.jsp" %>


<div style="margin-top:-650px; width: 100%; height: 750px; background:#e9e9e9; padding-top:150px; ">


<center>

<div style="width:1000px; height: 600px; background:#e9e9e9">
  <div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-8">
      <div class="panel panel-danger">
        <div class="panel-heading">
          <h3 class="text-center">
          <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span> 오류: No Search List
          <small>검색 결과가 없습니다. <b> </b></small>
          </h3>
        </div>
        <div class="panel-body">
          <p>현재 페이지 로딩중 간단하고 가벼운 오류가 발상하였습니다. 아래의 지시사항을 따라주시면 매우 감사하겠습니다.</p>
            <ul class="list-group">
              <li class="list-group-item">1. 본인이 검색하려던 내용이 맞는지 다시한번 확인해주세요.</li>
              <li class="list-group-item">2. 잠시 후, 다시 시도해주세요, 만일 동일한 현상이 반복된다면 진짜 그런 강의는 없는겁니다.
               </li>
                <li class="list-group-item">3.지금 당장 로그인해서 배우고싶어요를 등록해주세요!</li>
                <li class="list-group-item">4.불편을 끼쳐드려서 무쟈게 죄송하네요 ㅋㅋ! :)</li>
              </ul>
        	<%if( user == null) {%>      
        	 <button class="btn btn-success btn-number" onclick="location.href='/prototype/03.OHW/views/login.jsp'">로그인 하러가기</button>
        	<%}else if(user.getUserTypeNo()==1001  ){ %>
        	 <button class="btn btn-success btn-number" onclick="location.href='/prototype/04.OJK/insertclass3.jsp'">배우고싶어요 등록하러가기</button>
        	<%}else{ %>
    	     <button class="btn btn-success btn-number" onclick="location.href='/prototype/index.jsp'">메인화면으로가기</button>
        	<%} %>
          </div>
        </div>
      </div>
      <div class="col-md-2">

      </div>
    </div>
</div>
</center>


<%@ include file="/common\footer.jsp" %>
</body>
</html>