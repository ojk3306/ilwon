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
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script type="text/javascript">
  	function movePage(id) {  		
  		location.href = "/prototype/03.OHW/views/find_teacher.jsp?id=" + id; 		
  	}
 $(function(){
	 $("#hd").on("keyup", "#sch_stx", function(){
			var stx = $(this).val(); /* 입력한 검색어 */
			$(this).autocomplete({
				source:function(request, response) {
					$.getJSON(g5_url+"/_search_popular.php", {
						/* _search_popular.php 파일로 넘길 변수값을 이곳에 작성하시면 됩니다. GET 으로 넘어갑니다. */
						/* 콤마로 구분하시면 되요 ex) sfl:"wr_subject", stx:stx, ........ */
						stx : stx
					}, response);
				},
				minLength:2, /*최소 검색 글자수*/
				delay: 150,  /* 검색어 입력후 표시되는 시간 - 숫자가 클수록 느리게 출력 */
				focus:function(event, ui) {
					/* 검색을 통하여 넘어온 값을 여기서 처리 */
					console.log(ui.item.value); /* 콘솔 확인용이므로 삭제하거나 주석처리 하여도 됩니다. */
				},
				close:function(event, ui) {

				}
			})
		});
		// 오토컴플리트 종료
 });
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
        <li><a href="/prototype/03.OHW/views/find_stu.jsp">배우고 싶어요</a></li>
        <li><a href="/prototype/01.CJS/semina.jsp">세미나  찾기</a></li>
       
        <li><a href="/prototype/01.CJS/reportForm.jsp">신고하기</a></li>
        <li><a href="/prototype/04.OJK/report.jsp">건의하기</a></li>
        <li><a href="/prototype/01.CJS/adminpage.jsp">관리자</a></li>
      </ul>
     
      <ul class="nav navbar-nav navbar-right" style = "overflow : hidden;">
        <li><a href="/prototype/02.KSH,LTH/login.jsp"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
    <li><form class="form-inline mt-2 mt-md-0" action="<%=request.getContextPath()%>/Insertlog" method="post">
         
         
      <input class="form-control mr-sm-2" type="text" name="seachcontent" id="seachcontent" placeholder="Search Tag" aria-label="Search" style="margin-top:7px;">
		 
		 
		 
		 <button class="btn btn-outline-success my-2 my-sm-0" type="submit" style="margin-top:7px;">Search</button>
          </form>
         </li>
      </ul>      
      <div id="hd"> </div>
    </div>
  </div>
</nav>
</body>
</html>
