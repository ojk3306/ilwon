<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="users.model.vo.Users, java.util.*, java.sql.*" %>
    
<%
    Users loginUser = (Users)session.getAttribute("loginUser");    
%>    

<!DOCTYPE html>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>MenuBar</title>

<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> 반응형 메뉴 옵션-->

<link rel="stylesheet" href="/prototype/common/resources/css/bootstrap.css">
 
<script src="/prototype/common/resources/js/jquery-3.3.1.min.js"></script>
 
<script src="/prototype/common/resources/js/bootstrap.js"></script>
 
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<link href="/prototype/common\resources\css/select2.css" rel="stylesheet"/>
 
<script src="/prototype/common/resources/js/select2.js"></script>
   
<script type="text/javascript">

	function search(){
     
		location.href="/prototype/insertlog?seachcontent="+$('#select2-chosen-1').text()+"&user="+$("#userno").val();    
   
    //후에 섹션의 로그인유저의 번호까지 넣기.
	}
	$(document).ready(function (){
		
    	$.ajax({        
    		url:"<%=request.getContextPath()%>/search",
    	    data:{
    	    word:$("a").val(),
    	    user:$("#userno").val()
    	    },//추가로 유저 번호도 보낸다.
			type:"get",
    	    dataType:"json",
    	    success:function(data) {
    	    	$("#menubar-searchbar").html("<option>키워드로 검색합니다.</option>");
   		     	var jsonStr = JSON.stringify(data);
    	    	//문자열을 다시 변경
   		     	//json 객체로 파싱함. 
				var json= JSON.parse(jsonStr);
					
				for(var i in json.list) {            
        			/* console.log(json.list[i]); */       
					$("#menubar-searchbar").html($("#menubar-searchbar").html()+'<option>'+json.list[i]+'</option>')         
        		};
        	
			}, error:function(a,b,c) {         
        		console.log(b+c)
			}, complete: function() {
				$("#select2-chosen-1").html($("#s2id_autogen1_search").val());
				//select2-results에 li로 나열.	
				
			}
		});    	
    	
		$("#menubar-searchbar").select2();     
		
		$("#s2id_autogen1_search").keyup(function(){
		$.ajax({      
			url:"<%=request.getContextPath()%>/search",
			data:{
				word:$("a").val(),
				user:$("#userno").val()
				},//추가로 유저 번호도 보낸다.
			type:"get",
			dataType:"json",
			success: function(data){
				$("#menubar-searchbar").html("<option>키워드로 검색합니다.</option>");
				var jsonStr=JSON.stringify(data);
				//문자열을 다시 변경
				//json 객체로 파싱함. 
				var json= JSON.parse(jsonStr); 
            
				for(var i in json.list) {
            		/* console.log(json.list[i]); */
            		$("#menubar-searchbar").html($("#menubar-searchbar").html()+'<option>'+json.list[i]+'</option>')               
				};
			}, error:function(a,b,c) {
        		console.log(b+c)
			}, complete: function() {
        		$("#select2-chosen-1").html($("#s2id_autogen1_search").val());
        		console.log($("#s2id_autogen1_search").val());
        		$(".ohw-navbar-search-hidden").val($(".select2accessible").text());
        		console.log($(".ohw-navbar-search-hidden").val());
        	
        		
            //select2-results에 li로 나열.
			}
		});            
	});   
		
//클릭후, 검색창에 갱신이 안되게하는 함수↓↓  삭제할것인지, 중요한 함수인지.?
$("#menubar-searchbar").click(function(){
$(".ohw-navbar-search-hidden").val($(".select2accessible").text());	
})
})  
</script>  
  
<style type="text/css">

	body {
		width:100%;		
		position:absolute;
		overflow:auto;
		background : #e9e9e9;
	
	}	
	
    .ohw-li {
        margin-top:13px;
        margin-right:15px;
        padding-left:15px;
        height:27px;        
    }
     
    .ohw-btn {
    	padding-left:15px;
    }
    
    .ohw-primary {
    	width:90px;
    	height:26.3px;
    	padding-top:3px;
    } 
    .ohw-searchbar {
    	margin-top:3px;
    }
    
    a {
		cursor:pointer;
		color:gray !important;
		text-decoration:none !important;
	}
	
	a:hover {
		color:#7800f0  !important;		
	}
</style>

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
			<a class="navbar-brand" href="/prototype/index.jsp">은밀한 과외</a>
		</div>
		
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				<li><a href="/prototype/nlist?page=1">은밀한 공지사항</a></li>
				<li><a href="/prototype/03.OHW/views/find_teacher.jsp">은밀한 선생</a></li>
				<li><a href="/prototype/03.OHW/views/find_learn.jsp">은밀한 학생</a></li>
				<li><a href="/prototype/semilist?page=1">은밀한 세미나</a></li>
				<li><a href="/prototype/01.CJS/reportForm.jsp">은밀한 신고</a></li>
				<li><a href="/prototype/plist">은밀한 건의</a></li>
				<% if( loginUser == null ){%>
				
				<%}else{%>
					<% if(loginUser.getUserTypeNo() == 1003 ){%>
					<li><a href="/prototype/rtsearch">은밀한 관리자</a></li>
					<%} %>
				<%} %>
			
			
			</ul>
			
			<ul class="nav navbar-nav navbar-right ohw-btn-ul" style = "overflow : hidden;"> <!-- 메뉴바 오른쪽 -->
				
				<% if(loginUser == null) { %>
				
				<li>
					<a href="/prototype/03.OHW/views/login.jsp">
						<span class="glyphicon glyphicon-log-in"></span>Login
					</a>
				</li> 
				     
				<% } else { %>  
				    
				<li><a><%= loginUser.getUserName() %>님</a></li>
				<li class = "ohw-li form-inline mt-2 mt-md-0 input-group">
					<table>
            			<tr>
                			<td>
                				<% if( loginUser.getUserTypeNo() == 1002 ) { %>
                					<a class = "active" href="<%= request.getContextPath() %>/04.OJK/teacherinfo.jsp">
										<span class="glyphicon glyphicon-user ohw-btn"></span>My Info
									</a> 
                				<% } else { %>
                					<a class = "active" href="<%= request.getContextPath() %>/04.OJK/studentinfo.jsp">
										<span class="glyphicon glyphicon-user ohw-btn"></span>My Info
									</a> 
                				<% } %>                				                				             			
                			</td>
                			<td>                			
                				<a class = "active" href="<%= request.getContextPath() %>/logout">
									<span class="glyphicon glyphicon-log-out ohw-btn"></span>LogOut
								</a>
                			</td>
            			</tr>
            		</table>
				</li>
				        
				<% } %>
				
				 <li>
					<form class="form-inline mt-2 mt-md-0 input-group ohw-searchbar" action = "/prototype/lnsearch" method="post">
						<input type = "hidden" class = "ohw-navbar-search-hidden" name = "ohw-keyword">
					
						<select id="menubar-searchbar" name="seachcontent" aria-label="Search" style="margin-top:7px;">    
							<option>여기에 값을 입력하세요</option>
						</select>
						&nbsp;
						<button class="btn btn-default ohw-primary" type = "submit" onclick="search();" style="margin-top:7px; padding-top:3px;">
							<span class="glyphicon glyphicon-search" aria-hidden="true"></span> Search
						</button>						
						
						<% if(loginUser != null) { %>
							<input type = "hidden" name = "userno" value ="<%= loginUser.getUserNo() %>">
						<% } else { %>
							
						<% } %>						
					</form>
				</li>
			</ul>      
		</div>
	</div>
</nav>

</body>

</html>