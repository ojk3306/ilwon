<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>관리자 마이페이지</title>
<meta charset="utf-8">
<link rel="stylesheet" href="/food/resources/css/top-menu.css">
<link rel="stylesheet" href="/food/resources/css/foot.css">
<link rel="stylesheet" href="/food/resources/css/left-menu.css">
<link rel="stylesheet" href="/food/resources/css/left-menu-tab.css">
<link rel="stylesheet" href="/food/resources/css/right-menu.css">
<link rel="stylesheet" href="/food/resources/css/modInfo.css">
<link rel="stylesheet" href="/food/resources/css/review.css">
<link rel="stylesheet" href="/food/resources/css/replay.css">

<script src="/food/resources/js/jquery.min.js"></script>
<script src="/food/resources/js/jquery.scrolly.min.js"></script>
<script src="/food/resources/js/jquery.scrollzer.min.js"></script>
<script src="/food/resources/js/skel.min.js"></script>
<script src="/food/resources/js/util.js"></script>
<script src="/food/resources/js/main.js"></script>
<script type="text/javascript">
	$(function() {
		$('.tabs li').click(function() {
			var tab_cl = $(this).attr('data-tab');

			$('.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');

			$(this).addClass('current');
			$("." + tab_cl).addClass('current');
		})

	})
</script>
</head>
<body>
	<div class="navcl">
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="nav">
					<a class="navbar-brand" href="/food/index.jsp">Logo</a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav">
						<li class="active"><a href="/food/index.jsp">Home</a></li>
						<li><a href="/food/views/search/search_location.jsp">지역검색</a></li>
						<li><a href="/food/views/food_Truck/food_Truck.jsp">푸드트럭</a></li>
						<li><a href="/food/views/festival/festival.jsp">축제검색</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="/food/views/logIn/logIn.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
						<li><a href="/food/views/signUp/select_signUp.jsp"><span class="glyphicon glyphicon-log-in"></span> 회원가입</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
	<div id="header" style="top: 50px">
		<nav id="nav">
			<ul id="ul" class="tabs">
				<li class="current" data-tab="tab-1"><a href="#edit" class="active"><span class="icon fa-edit">일반  회원 관리</span></a></li>
				<li data-tab="tab-2"><a href="#edit"><span class="icon fa-edit">사업자 관리</span></a></li>
				<li data-tab="tab-3"><a href="#agree"><span class="icon fa-edit">사업자 승인</span></a></li>
				<li data-tab="tab-4"><a href="#festival"><span class="icon fa-edit">축제정보</span></a></li>
			</ul>
		</nav>
	</div>
	<div class="tab-content current tab-1">
		<div  style="margin-left:15%; margin-right:15%; margin-top:3%; min-width:300px;">	
		<!-- tab-1 시작 -->
  	
	<div>
	<ul class="pagination" >
	<li class="page-item"><h1>일반 회원 관리</h1></li>
	<li class="page-item" style="margin-top:20px; position: absolute; right:20%;"><input type="text" class="form-control" placeholder="아이디 검색" style="width-min:130px;"></li>
	<li class="page-item" style="margin-top:30px; position: absolute; right:16%;"> <button class="btn btn-outline-primary;">검색</button></li>
	</ul></div>
	
	
		 <table class="table table-striped">
    <thead>
      <tr>
        <th style="width:10%; min-width:100px;" >아이디</th>
      	<th style="width:10%; min-width:100px;">이름</th>
      	<th >이메일</th>
       	<th style="width:8%"> </th>
      </tr>
    </thead>
    
    <tbody style="text-align:center;">
      <tr >
        <td>아이디</td>
        <td >이름</td>
        <td>이메일</td>
        <td  style="float:right;"><button type="button" class="btn btn-outline-primary" >강퇴</button></td>
      </tr>
        <tr >
        <td>아이디</td>
        <td >이름</td>
        <td>이메일</td>
        <td  style="float:right;"><button type="button" class="btn btn-outline-primary" >강퇴</button></td>
      </tr>
        <tr >
        <td>아이디</td>
        <td >이름</td>
        <td>이메일</td>
        <td  style="float:right;"><button type="button" class="btn btn-outline-primary" >강퇴</button></td>
      </tr>
        <tr >
        <td>아이디</td>
        <td >이름</td>
        <td>이메일</td>
        <td  style="float:right;"><button type="button" class="btn btn-outline-primary" >강퇴</button></td>
      </tr>
        <tr >
        <td>아이디</td>
        <td >이름</td>
        <td>이메일</td>
        <td  style="float:right;"><button type="button" class="btn btn-outline-primary" >강퇴</button></td>
      </tr>
        <tr >
        <td>아이디</td>
        <td >이름</td>
        <td>이메일</td>
        <td  style="float:right;"><button type="button" class="btn btn-outline-primary" >강퇴</button></td>
      </tr>
      
       
      
    
      
   
      
 
    </tbody>
  </table>
		<hr style="margin-top:30px;">
<div  style="margin-left:35%;">
<ul class="pagination">
    <li class="page-item" style="min-width:36px;"><a class="page-link" href="#"><</a></li>
    <li class="page-item" style="min-width:36px;"><a class="page-link" href="#">1</a></li>
    <li class="page-item" style="min-width:36px;"><a class="page-link" href="#">2</a></li>
    <li class="page-item" style="min-width:36px;"><a class="page-link" href="#">3</a></li>	
    <li class="page-item" style="min-width:36px;"><a class="page-link" href="#">></a></li>
   
  </ul>
		</div>


</div>
  
 <!-- tab-1끝 -->
</div> 	


<div class="tab-content tab-2">
		<div  style="margin-left:15%; margin-right:15%; margin-top:3%; min-width:300px;">
			<!-- tab-2 시작 -->


<div>
	<ul class="pagination" >
	<li class="page-item"><h1>사업자 회원 관리</h1></li>
	<li class="page-item" style="margin-top:20px; position: absolute; right:20%;"><input type="text" class="form-control" placeholder="아이디 검색" style="width-min:130px;"></li>
	<li class="page-item" style="margin-top:30px; position: absolute; right:16%;"> <button class="btn btn-outline-primary;">검색</button></li>
	</ul></div>
	
	
		 <table class="table table-striped">
    <thead>
      <tr>
        <th style="width:10%; min-width:100px;" >아이디</th>
      	<th style="width:10%; min-width:100px;">이름</th>
      	<th >이메일</th>
       	<th style="width:8%"> </th>
      </tr>
    </thead>
    
    <tbody style="text-align:center;">
      <tr >
        <td>아이디</td>
        <td >이름</td>
        <td>이메일</td>
        <td  style="float:right;"><button type="button" class="btn btn-outline-primary" >강퇴</button></td>
      </tr>
        <tr >
        <td>아이디</td>
        <td >이름</td>
        <td>이메일</td>
        <td  style="float:right;"><button type="button" class="btn btn-outline-primary" >강퇴</button></td>
      </tr>
        <tr >
        <td>아이디</td>
        <td >이름</td>
        <td>이메일</td>
        <td  style="float:right;"><button type="button" class="btn btn-outline-primary" >강퇴</button></td>
      </tr>
        <tr >
        <td>아이디</td>
        <td >이름</td>
        <td>이메일</td>
        <td  style="float:right;"><button type="button" class="btn btn-outline-primary" >강퇴</button></td>
      </tr>
        <tr >
        <td>아이디</td>
        <td >이름</td>
        <td>이메일</td>
        <td  style="float:right;"><button type="button" class="btn btn-outline-primary" >강퇴</button></td>
      </tr>
        <tr >
        <td>아이디</td>
        <td >이름</td>
        <td>이메일</td>
        <td  style="float:right;"><button type="button" class="btn btn-outline-primary" >강퇴</button></td>
      </tr>

    </tbody>
  </table>
		<hr style="margin-top:30px;">
<div  style="margin-left:35%;">
<ul class="pagination">
    <li class="page-item" style="min-width:36px;"><a class="page-link" href="#"><</a></li>
    <li class="page-item" style="min-width:36px;"><a class="page-link" href="#">1</a></li>
    <li class="page-item" style="min-width:36px;"><a class="page-link" href="#">2</a></li>
    <li class="page-item" style="min-width:36px;"><a class="page-link" href="#">3</a></li>	
    <li class="page-item" style="min-width:36px;"><a class="page-link" href="#">></a></li>
   
  </ul>
		</div>


</div>

  
 <!-- tab-2끝 -->
</div>


<div class="tab-content tab-3">
		<div  style="margin-left:15%; margin-right:15%; margin-top:3%; min-width:300px;">
			<!-- tab-3 시작 -->


<div>
	<ul class="pagination" >
	<li class="page-item"><h1>사업자 회원 승인</h1></li>
	<li class="page-item" style="margin-top:20px; position: absolute; right:20%;"><input type="text" class="form-control" placeholder="아이디 검색" style="width-min:130px;"></li>
	<li class="page-item" style="margin-top:30px; position: absolute; right:16%;"> <button class="btn btn-outline-primary;">검색</button></li>
	</ul></div>
	
	
		 <table class="table table-striped">
    <thead>
      <tr>
        <th style="width:10%; min-width:100px;" >아이디</th>
      	<th style="width:10%; min-width:100px;">이름</th>
      	<th >이메일</th>
       	<th style="width:8%"> </th>
      </tr>
    </thead>
    
    <tbody style="text-align:center;">
      <tr >
        <td>아이디</td>
        <td >이름</td>
        <td>이메일</td>
        <td  style="float:right;"><button type="button" class="btn btn-outline-primary" >승인</button></td>
      </tr>
        <tr >
        <td>아이디</td>
        <td >이름</td>
        <td>이메일</td>
        <td  style="float:right;"><button type="button" class="btn btn-outline-primary" >승인</button></td>
      </tr>
        <tr >
        <td>아이디</td>
        <td >이름</td>
        <td>이메일</td>
        <td  style="float:right;"><button type="button" class="btn btn-outline-primary" >승인</button></td>
      </tr>
        <tr >
        <td>아이디</td>
        <td >이름</td>
        <td>이메일</td>
        <td  style="float:right;"><button type="button" class="btn btn-outline-primary" >승인</button></td>
      </tr>
        <tr >
        <td>아이디</td>
        <td >이름</td>
        <td>이메일</td>
        <td  style="float:right;"><button type="button" class="btn btn-outline-primary" >승인</button></td>
      </tr>
        <tr >
        <td>아이디</td>
        <td >이름</td>
        <td>이메일</td>
        <td  style="float:right;"><button type="button" class="btn btn-outline-primary" >승인</button></td>
      </tr>

    </tbody>
  </table>
		<hr style="margin-top:30px;">
<div  style="margin-left:35%;">
<ul class="pagination">
    <li class="page-item" style="min-width:36px;"><a class="page-link" href="#"><</a></li>
    <li class="page-item" style="min-width:36px;"><a class="page-link" href="#">1</a></li>
    <li class="page-item" style="min-width:36px;"><a class="page-link" href="#">2</a></li>
    <li class="page-item" style="min-width:36px;"><a class="page-link" href="#">3</a></li>	
    <li class="page-item" style="min-width:36px;"><a class="page-link" href="#">></a></li>
   
  </ul>
		</div>


</div>


<!--  tab-3끝 -->
</div>

<div class="tab-content tab-4">
<h2>&emsp;축제 정보 등록</h2>
			<hr style="height: 1px; background: black; width: 850px; float: left">
			<br> <br>
			<div class="pagemain">
				<strong>축제 이름 </strong>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; <input onfocus="this.value=''" value="ex) 역삼동 벛꽃축제" type="text" style="width: 200px; color: gray; "><font style="color: gray; font-size: 10pt">&emsp;한글, 영문, 숫자 혼용가능(한글기준 10글자)</font> <br> <br>
				<hr style="width: 850px; float: left">
				<br> <br> <strong>축제 장소</strong>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp; <input onfocus="this.value=''" value="ex) 서울특별시 강남구 역삼동" type="text" style="width: 300px; color: gray;  margin-left:-4px;"><font style="color: gray; font-size: 10pt">&emsp;한글, 영문, 숫자 혼용가능(한글기준 20글자)</font> <br> <br>
				<hr style="width: 850px; float: left">
				<br> <br> <strong>축제 기간 </strong>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; 
				<select>
					<%
						for (int i = 2018; i <= 2028; i++) {
					%>
					<option><%=i%>
					</option>
					<%
						}
					%>
				</select>년
				<select>
					<%
						for (int i = 1; i <= 12; i++) {
					%>
					<option><%=i%>
					</option>
					<%
						}
					%>
				</select>월 <select>
					<%
						for (int j = 1; j <= 31; j++) {
					%>
					<option><%=j%>
					</option>
					<%
						}
					%>
				</select>일&nbsp;~&nbsp; 
				<select>
					<%
						for (int i = 2018; i <= 2028; i++) {
					%>
					<option><%=i%>
					</option>
					<%
						}
					%>
				</select>년<select>
					<%
						for (int i = 1; i <= 12; i++) {
					%>
					<option><%=i%>
					</option>
					<%
						}
					%>
				</select>월 <select>
					<%
						for (int j = 1; j <= 31; j++) {
					%>
					<option><%=j%>
					</option>
					<%
						}
					%>
				</select>일 까지&emsp;<font style="color: gray; font-size: 10pt">달력을 잘보시고 체크해 주세요</font> <br> <br>
				<hr style="width: 850px; float: left">
				<br> <br>
				<div>
					<strong style="float: left;">축제 사진 </strong>
					<form name="form" id="form" action="" method="post" enctype="multipart/form-data" autocomplete="off" style="position: absolute; margin-left: 170px;">
						<div class="filebox">
							<div class="square" id="cma_image" style="float: left; background: #EAEAEA">
								<font style="text-align: center; position: absolute; top: 65px; font-size: 10pt; left: 15px; color: #4C4C4C">이미지를 등록하세요</font>
							</div>
							&emsp;<label class="label1" for="cma_file" style="font-size: 10pt;">등록</label><input type="file" name="cma_file" id="cma_file" accept="image/*" onchange="getThumbnailPrivew(this,$('#cma_image'))" /> &emsp;
							<pre style="color: gray">   사진은 가로 200px로 등록됩니다. 
							
   - gif, png 이미지 사용을 권장합니다. 
     jpg는 화질이 저하될 수 있습니다.</pre>
						</div>
					</form>
				</div>
				<br> <br> <br> <br> <br> <br> <br> <br> <br>
				<hr style="width: 850px; float: left">
				<br> <br> <strong>주최자(기관)명</strong>&emsp;&emsp;&emsp;&emsp; <input onfocus="this.value=''" type="text" style="width: 200px; color: gray; margin-left:-5px;" value="ex) 서울시청">&emsp;<font style="color: gray; font-size: 10pt">" - " 생략가능</font> <br> <br>

				
				<hr style="width: 850px; float: left">
				<br> <br>
				<strong>축제 고객센터</strong>&emsp;&emsp;&emsp;&emsp; <input onfocus="this.value=''" type="text" style="width: 200px; color: gray; margin-left:2px;" value="ex) 02-123-4567">&emsp;<font style="color: gray; font-size: 10pt">" - " 생략가능</font> <br> <br>
					<hr style="width: 850px; float: left">
				<br> <br>
				<div style="text-align: center; width: 850px">
					<button>등록하기</button>
				</div>
				<br> <br><br>

			</div>
	
	</div>
	<div class="foot" style="bottom: 0; position: absolute;">FoodTruck &nbsp;Copyright @ iei.or.kr &nbsp; All Rights Reserved.</div>
</body>
</html>