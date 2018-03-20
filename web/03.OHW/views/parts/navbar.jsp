<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MenuBar</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  	function movePage(id) {  		
  		location.href = "/prototype/03.OHW/views/find_teacher.jsp?id=" + id; 		
  	}
  </script>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">은밀한 과외</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">은밀한 과외란...</a></li>
        <li><a href="/prototype/03.OHW/views/find_teacher.jsp">선생 찾기</a></li>
        <li><a href="/prototype/03.OHW/views/find_stu.jsp">학생 찾기</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">카테고리로 찾기<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a id = "cate_game" onclick="movePage(this.id)">게임</a></li>
            <li><a id = "cate_sport" onclick="movePage(this.id)">스포츠</a></li>
            <li><a id = "cate_music" onclick="movePage(this.id)">음악</a></li>
            <li><a id = "cate_dance" onclick="movePage(this.id)">댄스</a></li>
            <li><a id = "cate_etc" onclick="movePage(this.id)">기타</a></li>
          </ul>
        </li>
        <li><a href="#">신고하기</a></li>
        <li><a href="#">건의하기</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
      	<li><form class="form-inline mt-2 mt-md-0">
         <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search" style="margin-top:7px;">
		 <button class="btn btn-outline-success my-2 my-sm-0" type="submit" style="margin-top:7px;">Search</button>
          </form>
         </li>
      </ul>       
    </div>
  </div>
</nav>
</body>
</html>

</head>
<body>

</body>
</html>