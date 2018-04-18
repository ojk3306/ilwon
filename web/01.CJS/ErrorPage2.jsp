<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>가벼운 에러발생</title>

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
          <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span> 오류:500
          <small>가벼운 오류 발생 <b> </b></small>
          </h3>
        </div>
        <div class="panel-body">
          <p>현재 페이지 로딩중 간단하고 가벼운 오류가 발상하였습니다. 아래의 지시사항을 따라주시면 매우 감사하겠습니다.</p>
            <ul class="list-group">
              <li class="list-group-item">1. 해당사이트에 접속하는 주소가 확실한지 다시한번 확인해주세요.</li>
              <li class="list-group-item">2. 잠시 후, 다시 시도해주세요, 만일 동일한 현상이 반복된다면 관리자에게 연락바랍니다.
                <a href="#"><b>contact us</b></a></li>
                <li class="list-group-item">3.불편을 끼쳐드려서 무쟈게 죄송하네요 ㅋㅋ! :)</li>
              </ul>
              <button class="btn btn-success btn-number" onclick="location.href='/prototype/index.jsp'">메인화면으로가기</button>
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