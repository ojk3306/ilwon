<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@
   page import="users.model.vo.Users , semina.model.vo.* ,seminaDetail.model.vo.*"
    %> 
 <%
    Semina semi=(Semina)request.getAttribute("semina");
    Users user=(Users)request.getAttribute("user");
    SeminaDetail semideta=(SeminaDetail)request.getAttribute("semideta");
%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/prototype/common/resources/js/jquery-3.3.1.min.js"></script>
<link href="/prototype/common/resources/css/bootstrap-theme.min.css" rel="stylesheet">
<link href="/prototype/01.CJS\js\jquery.stepProgressBar.css" rel="stylesheet" type="text/css">
 
 <script type="text/javascript">
 function enrollsemina(){
	 $.ajax({
		url:"/prototype/enrollsemina",
		data:{semino:<%=semi.getSeminaNo()%>,teacherno:<%=user.getUserNo()%>,studentno:$("#studentno").val()},
		success:function(data){
		$("#enrollstat").html('<button type="button"  style="margin-top : 50px;"  class="btn btn-warning">신청된 상태입니다!</button>');
		history.go(0);
		}		 	
	 })
 }
 
 
 
 </script>
 
 
<style type="text/css">
.btn-primary,
.btn-warning{
    -webkit-box-shadow: 0px 3px 0px rgba(0, 0, 0, 0.3);
    -moz-box-shadow:    0px 3px 0px rgba(0, 0, 0, 0.3);
    box-shadow:         0px 3px 0px rgba(0, 0, 0, 0.3);
}
.btn-default:active,
.btn-primary:active,
.btn-success:active,
.btn-info:active,
.btn-warning:active,
.btn-danger:active {
    margin-top: 3px;
    margin-bottom: -3px;
}
.contentbody{
background:#eeeeee;
width: 100%;
height: 1600px; 
text-align: center;
padding: 20px;
margin-top: -900px;
}
	.contents{
	margin: auto; 
	left:0;
	right: 0;
	top: 110px;
	bottom: 0;
	overflow: hidden;
	position: absolute;
	
	
	} 
	.topbend{
	background:#d0e1e1;
	margin:0px auto;
	width:900px;
	height:50px;
	text-align: center;
	padding:12px;
	border: 1px solid white;
	border-radius:5px 5px 0px 0px;
	}
	.topdetail{
	margin:0 auto;
	width:900px;
	height:280px;
	border: 1px solid #ffffff;
	background:#eff5f5;
	border-radius: 0 0 5px 5px;
	}
	.topdiv{
	float: left;
	list-style:none;
	margin-left:10px;
	}
	.topdiv[name=img]{
	width:230px;
	height:300px;
	}
	.topdiv[name=title]{
	width:400px;
	height:300px;
	}
	.topdiv[name=option]{
	width:90px;
	height:300px;
	}
	.imticon{
	margin-top:110px;
	margin-left:-500px;
	}
	.topdiv[name=img]>ul>li{/*사진이 속한 영역 리스트형식 */
	list-style:none;
	margin-top:20px;
	margin-left: -30px;
	}
	.topdiv[name=img]>ul>li>img{/*사진의 크기 및 위치 백그라운드*/
	width:200px;
	height:200px;
	padding-left:0px;
	padding-top:0px;
	padding-right:0px;
	padding-bottom:0px;
	border-radius: 50%;
	}
	.underpic{/*사진 바로 및 이름 및,나이 성별*/
	margin-top:15px;
	text-align: center;
	margin-left: 15px;
	}
section{
margin-top:660px;
	padding: 60px 0;
	margin-left: auto; 
	margin-right: auto;
	top: 110px;
	bottom: 0;
}
section .section-title{
	text-align:center;
	color:#007b5e;
	margin-bottom:50px;
	text-transform:uppercase;
}
#what-we-do{
	background:#eff5f5;
	width:900px;
	border-radius: 8px;
}
#what-we-do .card{
	padding: 1rem!important;
	border: none;
	width:260px;
	
	margin-bottom:1rem;
	-webkit-transition: .5s all ease;
	-moz-transition: .5s all ease;
	transition: .5s all ease;
}
#what-we-do .card:hover{
	-webkit-box-shadow: 5px 7px 9px -4px rgb(158, 158, 158);
	-moz-box-shadow: 5px 7px 9px -4px rgb(158, 158, 158);
	box-shadow: 5px 7px 9px -4px rgb(158, 158, 158);
}
#what-we-do .card .card-block{
	padding-left: 20px;
    position: relative;
}
#what-we-do .card .card-block a{
	color: #007b5e !important;
	font-weight:700;
	text-decoration:none;
}
#what-we-do .card .card-block a i{
	display:none;
	
}
#what-we-do .card:hover .card-block a i{
	display:inline-block;
	font-weight:700;
	
}
#what-we-do .card .card-block:before{
	font-family: FontAwesome;
    position: absolute;
    font-size: 39px;
    color: #007b5e;
    left: 0;
	-webkit-transition: -webkit-transform .2s ease-in-out;
    transition:transform .2s ease-in-out;
}
#what-we-do .card .block-1:before{
    content: "\f0e7";
}
#what-we-do .card .block-2:before{
    content: "\f0eb";
}
#what-we-do .card .block-3:before{
    content: "\f00c";
}
#what-we-do .card .block-4:before{
    content: "\f209";
}
#what-we-do .card .block-5:before{
    content: "\f0a1";
}
#what-we-do .card .block-6:before{
    content: "\f218";
}
#what-we-do .card:hover .card-block:before{
	-webkit-transform: rotate(360deg);
	transform: rotate(360deg);	
	-webkit-transition: .5s all ease;
	-moz-transition: .5s all ease;
	transition: .5s all ease;
}
	$(document).ready(function () {
	$('#deleteProductModal').on('show.bs.modal', function (event) { // id of the modal with event
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var productid = button.data('productid') // Extract info from data-* attributes
	  var productname = button.data('productname')
	  
	  var title = 'Confirm Delete #' + productid
	  var content = 'Are you sure want to delete ' + productname + '?'
	  var content1 = '<label for="message-text" class="form-control-label">Work Order:</label><textarea class="form-control" id="message-text"></textarea>';
	  
	  // Update the modal's content.
	  var modal = $(this)
	  modal.find('.modal-title').text(title)
	  modal.find('.modal-body').html(content1)	  
	  
	  // And if you wish to pass the productid to modal's 'Yes' button for further processing
	  modal.find('button.btn-danger').val(productid)
	})
})
</style>
<script type="text/javascript">
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>세미나 디테일</title>
</head>
<body>
<%@include file="/common/navbar.jsp" %>
<%@include file="/01.CJS\sidebar.jsp" %>

<div class="contentbody">
			<div class="contents">
				<nav class="topbend"> <!--최상단 띠.-->
			
				</nav>
				<nav class="topdetail"><!--선생소개-->
				<ul>
				<li class="topdiv" name="img">
					<ul>
					<li>
					<%if(user.getUserRenamePhoto()== null){ //유저가 사진이 있나 없나 유무확인%>
					<!-- 사진이 없을경우 기본 디폴트 로간다. -->
						
						<%if( user.getUserGender().equals("F")){ %>
						
				   <!-- 여성용사진 -->	여자용사진으로 대채후 이글 삭제.
						<img src="/prototype/userTitleimg/black-suit-1295853_640.png">
						
						<%}else{ %>
						
					<!-- 남성용사진 -->남성용사진 으로 대채후 이글 삭제
					
						<img src="/prototype/userTitleimg/black-suit-1295853_640.png">
						
						<%} %>
					
					<%}else{ %> 
					
					<img Style="border-radius:501px; " src="/prototype/userTitleimg/<%=user.getUserRenamePhoto()%>">
					
					<%} %>
					</li>
					
					<li class="underpic">
					이름 : <%=user.getUserName() %>
					<br>
				
					</li>
				</ul>	
				</li>
					<li class="topdiv" name="title" > 
					<ul style="list-style: none; margin-left: 10px; width: 500px; height: 75%">
						<li class=""><h2><%=semi.getSeminaTitle() %></h2></li>
						<li class=""><h3> From :<%=semi.getSeminaStartDate()%> ~~  to:<%=semi.getSeminaEndDate() %></h3> </li>
						<li class=""><h4> 참가 비 :<%=semi.getSeminaPrice()%>원  </h4>      </li> 
						<li class=""> <h4>강연 위치 :<%=semi.getSeminaLocation() %></h4></li>
						<li class=""> 
						<button class="btn btn-warning" onclick="window.open('/prototype/01.CJS/seminamap.jsp?loc=<%=semi.getSeminaLocation()%>','window_name','left=300px, top=100px, resizable=no, toolbar=no, menubar=no, width=790, height=790, location=no, status=no, scrollbars=yes');">약도 확인하기</button>
						</li>
						
						
					</ul>
					</li>
				</ul>
				</nav>
			
			</div>
			<section id="what-we-do">
			
		<div class="container-fluid">
			<h2 class="section-title mb-2 h1">세미나 에 어서오세요</h2>
			<div class="row mt-5">
				<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 col-xl-4">
					<div class="card">
						<div class="card-block block-2">
							<h3 class="card-title"><%=semi.getSeminatitle1() %> </h3>
							<p class="card-text">
							<%=semi.getSeminaContent1() %>
							</p>
							</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 col-xl-4">
					<div class="card">
						<div class="card-block block-2">
							<h3 class="card-title"><%=semi.getSeminatitle2() %></h3>
							<p class="card-text">
							<%=semi.getSeminaContent2() %>
							</p>
						
							</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 col-xl-4">
					<div class="card">
						<div class="card-block block-3">
							<h3 class="card-title"><%=semi.getSeminatitle3() %></h3>
							<p class="card-text">
	<%=semi.getSeminaContent3() %>
</p>
							</div>
					</div>
				</div>
			</div>
			
			<div class="row" >
				<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 col-xl-4">
					<div class="card">
						<div class="card-block block-4">
							<h3 class="card-title"><%=semi.getSeminatitle4() %></h3>
							<p class="card-text"><%=semi.getSeminaContent4() %></p>
							</div>
					</div>
				</div>
			
			
			<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 col-xl-4">	
		   <h4> 현재 인원 상태</h4>
	
		   <div class="progress" Style="height: 100%;"> 
		   
  <div id="pb1" class="progress-bar progress-bar-success" role="progressbar" style="width:100%">
  현재 : <%=semi.getSeminaNow()%> <br>
  최소:<%=semi.getSeminaMin()%> <br>
  최대 : <%=semi.getSeminaMax()%>
  </div>
</div>
<input type="hidden" id="max" value="<%=semi.getSeminaMax()%>">
<input type="hidden" id="min" value="<%=semi.getSeminaMin()%>">
<input type="hidden" id="now" value="<%=semi.getSeminaNow()%>">
			
<script>
min=$("#min").val();
max=$("#max").val();
now=$("#now").val();

if(now>min)
	$("#pb1").attr("class","progress-bar progress-bar-warning");
if(now<min)
	$("#pb1").attr("class","progress-bar progress-bar-success");
if(now>=max)
	$("#pb1").attr("class","progress-bar progress-bar-danger");


console.log(min);
console.log(now);
console.log(max);
var percent= $("#now").val() / $("#max").val() * 100
if(percent<40)
percent=30;
$("#pb1").width(percent+"%");




</script>
<script type="text/javascript">
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);
  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
</script>
		    
			</div>
			<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 col-xl-4" id="enrollstat">
			
			<%if(loginUser==null){ %>
	
			<button type="button" style="margin-top : 50px;" onclick="location.href='/prototype/03.OHW/views/login.jsp'" class="btn btn-warning">지금 로그인하세요!</button>
			
			
			<%}else if(loginUser.getUserNo()==semi.getUserNo()){ %>
			<button type="button"  style="margin-top : 50px;"  class="btn btn-warning">본인의 세미나입니다!</button>
			
			<%}else{ %>
			
			<input type="hidden" value="<%=loginUser.getUserNo()%>" id="studentno">
		
			<!--1:신청완료, 2:취소됨, 3:숨김   -->	 
			<% if(Integer.parseInt(semideta.getSeminaState()) == 2 || Integer.parseInt(semideta.getSeminaState()) == 4){ %>	 
			<button type="button" style="margin-top : 50px;" onclick="enrollsemina();"  class="btn btn-primary">세미나 신청하기!</button>
			<%}else{ %>
            <button type="button"  style="margin-top : 50px;"  class="btn btn-warning">신청된 상태입니다!</button>
			
			<%}}%>	
		
				</div>
			
			</div>
		</div>	
	</section>
			
</div>
<div style="margin-top: -750px;">
<%@include file="/common/footer.jsp"  %>
</div>
</body>

</html>