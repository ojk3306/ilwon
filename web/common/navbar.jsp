<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MenuBar</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
 
 <link rel="stylesheet" href="/prototype/common/resources/css/bootstrap.css">
 
 <script src="/prototype/common/resources/js/jquery-3.3.1.min.js"></script>
 
 <script src="/prototype/common/resources/js/bootstrap.js"></script>
 
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

 <link href="/prototype/common\resources\css/select2.css" rel="stylesheet"/>
 
    <script src="/prototype/common\resources\js/select2.js"></script>
   
    <script>
    function search(){
    
    	console.log($('.select2-chosen').val());
    	console.log($('#select2-chosen-1').val())
    	
    	//location.href="/prototype/insertlog?seachcontent="+$('#select2-chosen-1').val();
    
    	
    	//후에 섹션의 로그인유저의 번호까지 넣기.
    }
    
    
     $(document).ready(function () {
            
        	$("#ee").select2();
         	
        	
        	
        	$("#s2id_autogen1_search").keyup(function(){
			$.ajax({
					
					url:"<%=request.getContextPath()%>/seach",
					data:{word:$("#s2id_autogen1_search").val()},//추가로 유저 번호도 보낸다.
					type:"get",
					dataType:"json",
					success: function(data){
						$("#p6").html($("#p6").text()+"<Br>"+data.userid+","+data.userpwd+","+decodeURIComponent(data.username)+","+data.age+","+data.email+","+data.phone)
				},
				complete: function(){
					$("#select2-chosen-1").html($("#s2id_autogen1_search").val());
					//select2-results에 li로 나열.
		    	}
			})		
				
				
			
				
         	
})
       
        });
        
    </script>
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
    <li>
    
    <form class="form-inline mt-2 mt-md-0" action="#" method="post">

        <li><a href="/prototype/03.OHW/views/login.jsp"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
    <li><form class="form-inline mt-2 mt-md-0" action="<%=request.getContextPath()%>/Insertlog" method="post">

         
         
      
<select id="ee" name="seachcontent" aria-label="Search" style="margin-top:7px;">
    
    <option value="#">여기에 값을 입력하세요</option>
	
</select>		 
	
		 <button class="btn btn-outline-success my-2 my-sm-0" type="button" style="margin-top:7px;" onclick="search();">Search</button>
          </form>
         </li>
      </ul>      
      <div id="hd"> </div>
    </div>
  </div>
</nav>
</body>
</html>
