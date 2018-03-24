<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MenuBar</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/prototype/common/resources/css/bootstrap.css">
  <script src="/prototype/common/resources/js/jquery-3.3.1.min.js"></script>
  <script src="/prototype/common/resources/js/bootstrap.js"></script>
  <script type="text/javascript">
  	function movePage(id) {  		
  		location.href = "/prototype/03.OHW/views/find_teacher.jsp?id=" + id; 		
  	}
  </script>
</head>
<body >
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="/prototype/index.jsp">은밀한 과외</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">은밀한 과외란...</a></li>
        <li><a href="/prototype/03.OHW/views/find_teacher.jsp">선생 찾기</a></li>
        <li><a href="/prototype/03.OHW/views/find_stu.jsp">학생 찾기</a></li>
        <li><a href="/prototype/01.CJS/semina.jsp">세미나  찾기</a></li>
       
        <li><a href="/prototype/01.CJS/reportForm.jsp">신고하기</a></li>
        <li><a href="/prototype/04.OJK/report.jsp">건의하기</a></li>
        <li><a href="/prototype/01.CJS/adminpage.jsp">관리자</a></li>
      </ul>
     
      <ul class="nav navbar-nav navbar-right" style = "overflow : hidden;">
        <li><a href="/prototype/02.KSH,LTH/login.jsp"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
      	<li><form class="form-inline mt-2 mt-md-0">
         <input class="form-control mr-sm-2" type="text" placeholder="Search Tag" aria-label="Search" style="margin-top:7px;">
		 <button class="btn btn-outline-success my-2 my-sm-0" type="submit" style="margin-top:7px;">Search</button>
          </form>
         </li>
      </ul>       
    </div>
  </div>
</nav>
</body>
</html>
