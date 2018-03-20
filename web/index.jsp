<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="utf-8">
    <meta name="description" content="">
    <meta name="author" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>은밀한 과외</title>

    <!-- Bootstrap core CSS -->
	<!-- Bootstrap core JavaScript -->
    <script src="resources/vendor/jquery/jquery.min.js">
    
    </script>
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
    <!-- Custom fonts for this template -->
    <link href="resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="resources/vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template -->
    <link href="resources/css/landing-page.min.css" rel="stylesheet">
    <link href="resources/css/menu.css" rel="stylesheet">
   
	<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>

<style type="text/css">
html {
height: 5px;
}
body {
margin: 0;
height: 60%;
}
.contents{
min-height: 100%;
position: relative;
margin-top:200px;
padding-bottom:10px;
}
.footer{
<!--position:fixed;포지션픽스시, 화면을 따라다님 -->
position: absolute;
margin-bottom: 0%;
width:100%;
height:200px;
color: white;
background-color: silver;
}

</style>
    
   
  </head>

  <body>

    <!-- Navigation -->
    <script src="resources/js/topmenu.js"></script>
   	   <script>
   	      $(function(){
   	      	var pull=$('#pull');
   	      	    menu=$('nav ul');
   	      	    menuHeight=menu.height();   	      
   	      $(pull).on('click', function(e){
   	      	e.preventDefault();
   	      	menu.slideToggle();   	      	
   	      });
   	      $(window).resize(function(){
   	      	var w=$(window).width();
   	      	if(w>600 && menu.is(':hidden'))
   	      		{menu.removeAttr('style');}
   	      });
   	  });
   	   </script>
 
    <!-- Header-->
    <header class="masthead text-white text-center">
     <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <a class="navbar-brand" href="#">Carousel</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
         <ul class="navbar-nav mr-auto" style="width: 500px; margin:0 auto;">
            <li class="nav-item active" >
			  <a class="nav-link" href="/prototype/viewstudent.jsp">선생찾기<span		class="sr-only">(current)</span></a>
            </li>
			    <li class="nav-item">
              <a class="nav-link" href="#">학생찾기</a>
            </li>
			</li>
			    <li class="nav-item">
              <a class="nav-link" href="#">카테고리찾기</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled" href="\prototype\01.CJS\report.jsp">신고합니다!</a>
            </li>
			</li>
			    <li class="nav-item" style="margin-right:0px;">
              <a class="nav-link" href="/prototype/04.OJK\report.jsp">건의합니다</a>
            </li>
          </ul>
          
		  <form class="form-inline mt-2 mt-md-0">
            <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
          </form>
        </div>
      </nav>
      <div class="overlay"></div>
      <div class="container"  style="margin-top:250px"> <!--마진탭이 배경화면 사진의 크기.-->
        <div class="row">
          <div class="col-xl-9 mx-auto">
             <h1 class="mb-5">df</h1>
          </div>
          <div class="col-md-10 col-lg-8 col-xl-7 mx-auto" >
            <form action="#" method="post"> <!-- 검색기능 -->
              <div class="form-row"  >
                <div class="col-12 col-md-9 mb-2 mb-md-0" >
                  <input type="text" class="form-control form-control-lg" placeholder="뭐 배울래?">
                </div>
                <div class="col-12 col-md-3">
                  <button type="submit" class="btn btn-block btn-lg btn-primary">검색!</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </header>   
<!--내용물-->

<!--내용 끝-->
    <!-- Footer -->
     <footer class="footer">
      <div class="container">
        <div class="row">
          <div class="col-lg-6 h-100 text-center text-lg-left my-auto">
            <ul class="list-inline mb-2">
              <li class="list-inline-item">
                <a href="#">About</a>
              </li>
              <li class="list-inline-item">&sdot;</li>
              <li class="list-inline-item">
                <a href="#">Contact</a>
              </li>
              <li class="list-inline-item">&sdot;</li>
              <li class="list-inline-item">
                <a href="#">Terms of Use</a>
              </li>
              <li class="list-inline-item">&sdot;</li>
              <li class="list-inline-item">
                <a href="#">Privacy Policy</a>
              </li>
            </ul>
            <p class="text-muted small mb-4 mb-lg-0">&copy; Your Website 2018. All Rights Reserved.</p>
          </div>
          <div class="col-lg-6 h-100 text-center text-lg-right my-auto">
            <ul class="list-inline mb-0">
              <li class="list-inline-item mr-3">
                <a href="#">
                  <i class="fa fa-facebook fa-2x fa-fw"></i>
                </a>
              </li>
              <li class="list-inline-item mr-3">
                <a href="#">
                  <i class="fa fa-twitter fa-2x fa-fw"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fa fa-instagram fa-2x fa-fw"></i>
                </a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </footer>
  </body>

</html>
