<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="lesson.model.vo.*,users.model.vo.*" %>
  
<%
Users login=(Users)session.getAttribute("loginUser");    
Users user=(Users)request.getAttribute("user");
LessonSearch lessondetail =(LessonSearch)request.getAttribute("lesson");
%>
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>배우고 싶어요!</title>
<script type="text/javascript" src="/prototype/common\resources\js\jquery-3.3.1.min.js"></script>
<script type="text/javascript">
 
	function submitLesson(a){
		//강좌 번호와, 로그인한 유저의 번호를 보낸다.
		location.href="/prototype/submitlesson?no="+a.id;	
	}
	
	$(function() {
	
		if( "<%=user%>" != null ){
			teano=$("#teano").val();
			leno=$("#leno").val();
			userno=$("#userno").val();
			$.ajax({//이 강의를 들었는지 안들었는지 확인.
				url:"/prototype/checkLesson",
				data:{teano:teano,leno:leno,userno:userno},
				
				success:function(da){
					console.log(da);
					if(da!=0){
						$("#lessonsubmit").html("<Br><Br><Br><Br><button type='button' class='btn'>이미 수강중!</button>");
					}
				},
				error:function(){
					
				}				
			});		
		}	
		//학생의 레슨을 선생이 교육을 신청했는지 안했는지
		if("<%=login%>" != null )
		teano=$("#teano").val();
		leno=$("#leno").val();
		userno=$("#userno").val();
			$.ajax({//이 강의를 들었는지 안들었는지 확인.
				url:"/prototype/checkLesson",
				data:{teano:teano,leno:leno,userno:userno},
				success:function(da){
					console.log(da);
					if(da!=0){
						$("#lessonsubmit").html("<Br><Br><Br><Br><button type='button' class='btn'>이미 수강중!</button>");
					}
				},
				error:function(){
					
				}
					
			});
	});

</script>
	
<style type="text/css">
/* 스타 별점 */

/*스타별점 */
	html {
		height: 100%;
	}
	
	body {
		margin: 0;
		height: 100%;
	}
	
	.contents{
		min-height: 100%;
		margin-top:90px;
		padding-bottom:20px;
	}
	
	.container{
		overflow: hidden;
		position: absolute;
	}
	
	.panel-heading{
		width:100%;
	}
	
	.panel-body{
		width:100%;
	}

	.topbend{
		background: #d0e1e1;
		border-radius:25px 25px 0 0 ;
		border: 1px solid white;		
		margin:0px auto;
		width:1100px;
		height:50px;
		text-align: center;
		padding:12px;
	}

	.topdetail{
		margin:0 auto;
		width:1100px;
		height:310px;
		border: 1px solid white;
		background: #eff5f5;
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
		width:600px;
		height:300px;
	}

	.topdiv[name=option]{
		width:180px;
		height:300px;
		margin-left:10px; 
		padding:45px;
	}
	
	.imticon{
		margin-top:110px;
		margin-left:-39px;
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
	
	.review{/*리뷰의 가장상위 영역*/
		margin:0 auto;
		margin-top:3px;
		width:1100px;
		min-height:250px;
	}
	
	.howteach{/*커리큘럼의 가장 상위영역*/
		margin:0 auto;
		margin-top:3px;
		width:1100px;
		height:600px;
	}
	
	.reviewtop{/*리뷰의 상위*/
		list-style:none;
		padding-top:5px;
	}
	
	.reviewdetail{/*리뷰의 내용이 들어감. (li)*/
		padding-top:30px;
	}

	.school{/*학력*/
		margin:0 auto;
		margin-top:3px;
		width:1100px;
		height:200px;
		border: 1px solid #ffffff;
	}

	.divOfreviewdetail{/*리뷰 내용이 들어감(nav) */
		width:930px;
		height:130px;
	}

	.schoolofdetail{
		list-style:none;
		margin-top:10px;
		margin-left:-20px;
		margin-right:10px;
	}

	.schoolOfdetailIOfli{
		float:left;
		width:225px;
		margin: 20px;
		height:140px;
		padding:20px;
		border : 1px solid gray;
	}
	
	.howteachofbtn{

	}
	
	.howteachOfchange{
		margin-top:30px;
		padding-top:10px;
		width:1000px;
		min-height:100px;
		max-height:500px;
	}
	
	.info1Oftop{
		width:100%;
		margin-top:2px; 
		min-height:70px;
		border:1px solid; #000000;
	}

	#info10{
		width:100%;
		margin-top:2px; 
		min-height:200px;
		border:1px solid; #000000;
	}

	.in3{
		padding: 20px;
	}

	.item{

	}
	.item>img{
		width:600px;
		height:600px;
		margin-left: auto; 
		margin-right: auto;
		border-radius: 35px;
	}

</style>

</head>

<body>

<input type="hidden" value="<%=lessondetail.getUser_no1()%>" id="userno"> 
<input type="hidden" value="<%=lessondetail.getLesson_no()%>" id="leno">
<% if(user!=null){ %>
<input type="hidden" value="<%=login.getUserNo()%>" id="teano"> 
<%} %>


	<!-- 헤더 시작-->
<%@ include file="/common\navbar.jsp" %>

<!-- 헤더 종료-->

<!--내용물-->

<br>

<hr> 
<nav class="contents">
	<nav class="topbend"> <!--최상단 띠.-->
		
	</nav>
	
	<nav class="topdetail"><!--선생소개-->
	<br><br><br>
		<ul>
			<li class="topdiv">
				<ul>
				
					<%if(user.getUserRenamePhoto() != null) { %>
					<Br><Br>
						<img src="/prototype/userTitleimg/<%= user.getUserRenamePhoto() %>"
							class="img-circle" alt="Cinque Terre" width="200px"
							height="200px" >
						<% }else {%>
							<img src="/prototype/userTitleimg/rakoon.jpg"
							class="img-circle" alt="Cinque Terre" width="200px"
							height="200px">
						<%} %>
				
				</ul>	
			</li>
			<li class="topdiv" style="width:540px;">		
				<ul style="list-style: none;">			
					<li class="">		
						<br>		
						<div align = "center">		<h1><%=lessondetail.getLesson_title()%></h1>
							<% System.out.print("유저 성별 : " + user.getUserGender() + " / (To.StudentDetail)");%>
		
							<% if( user.getUserGender().equals("M")) { %>
		
								<h4>(<%=user.getUserAge()%>) <%=user.getUserName()%></h4>	
		
								<h5>남성</h5>
		
								희망 분야 : <%=lessondetail.getCategory_smallName()%>	
		
							<% } else { %>
		
								<h4>(<%=user.getUserAge()%>) <%=user.getUserName()%></h4>
		
								<h5>여성</h5>
		
								희망 분야 : <%=lessondetail.getCategory_smallName()%> 	
		
							<%} %>
					
						</div>		
					</li>		
					<li class=""><br></li>		
				</ul>
			</li>		
			<li class="topdiv">
				<h4>등록일 :<br><%=lessondetail.getLesson_startdate()%><br></h4>
				<div id="lessonsubmit">

					<% if(loginUser!=null) { %>
					
						<% if(user.getUserNo()==loginUser.getUserNo()) { %>
						
							<button type='button' class='btn'>본인의 요청입니다</button>
							
						<% } else if(loginUser.getUserTypeNo()==1002) { %>
						
							<button type='button' id="<%=user.getUserNo()%>/<%=loginUser.getUserNo()%>/<%=lessondetail.getLesson_no()%>/<%=loginUser.getUserTypeNo()%>"  onclick="submitLesson(this)" class='btn'>레슨신청!</button>
						<% }%>
				
				<% }else{ %>
					
					
							<button type='button' class='btn'>선생님이신가요?? 로그인을 해주세요</button>
					<%} %>
				</div>
			</li>	
		</ul>
	</nav>
	<!-- 강의료 부분 -->
	<div align="center" style="margin-top:5px;">
		<nav style="width:1100px; height:150px; border: 1px solid white; background: #eff5f5;">
			<div style="width:500px; height: 140px; float:left;">
				<h2>수강료</h2>
				<br>
				<table>
					<tr>
						<td><p style="font-size: 25pt;"><%=lessondetail.getLesson_price() %></p></td>
						<td><p style="font-size: 10pt; margin-top: 6px; margin-left: 3px;">만원</p></td>		
					</tr>
				</table>
			</div>
			<div style="width:500px; height: 140px; float:right;">
				<h2>수업횟수</h2><br>
				<table>
					<tr>
						<td><p style="font-size: 25pt;"><%=lessondetail.getLesson_count() %></p></td>
						<td><p style="font-size: 10pt; margin-top: 6px; margin-left: 3px;">회</p></td>		
					</tr>
				</table>
			</div>
		</nav>	
	</div>

	<nav class="howteach" style="padding-top:5px;"><!--커리큘럼란-->	
		<div class="container" style="background:#eff5f5; width:1100px;  border: 1px solid white; border-radius: 0 0 30px 30px" >
			<div class="col-md-6" Style="margin-left:150px; margin-top: 15px; ">   
				<div class="panel with-nav-tabs panel-info" Style="width:800px; " >
					<div class="panel-heading">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#tab1info" data-toggle="tab">위치와 반경</a></li>
							<li><a href="#tab2info" data-toggle="tab">희망수업방식</a></li>
						</ul>
					</div>           
					<div class="panel-body">
						<div class="tab-content">                    
							<div class="tab-pane fade in active" id="tab1info">
								<div style="padding: 10px; width: 770px; height: 300px;" id="map">          
           
								</div>         
							</div>                    
							<div class="tab-pane fade" id="tab2info">
								<nav class="in1">
									<nav class="info1Oftop">
										<!-- 간단한소개 -->
										<%=lessondetail.getLesson_contop() %>
									</nav>
								</nav>		 
							</div>
							<div class="tab-pane fade" id="tab3info">
								<div class="in3" >
									<div class="container1" >
										<div id="main_area">
											<!-- Slider -->
											<div class="row">
												<div class="span12" id="slider">
													<!-- Top part of the slider -->
													<div class="row">
														<div class="span8" id="carousel-bounding-box">
															<div class="carousel slide" id="myCarousel">
																<!-- Carousel items -->
																<div class="carousel-inner"> 
																	<!-- 이미지 받기 -->                     
																</div><!-- Carousel nav -->
																<a class="carousel-control left" data-slide="prev" href="#myCarousel">‹</a> <a class="carousel-control right" data-slide="next" href="#myCarousel">›</a>
															</div>
														</div>
													</div>
												</div>
											</div><!--/Slider-->      
										</div>	
									</div>
								</div>
							</div>          
<!-- 포트번호 8889 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=120b01867e29e09658100681cf1d0604&libraries=services"></script>

<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level: 6 // 지도의 확대 레벨
	};
	//지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption); 

	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();
	//주소로 좌표를 검색합니다
	geocoder.addressSearch('<%=lessondetail.getLesson_loc()%>', function(result, status) {

		// 정상적으로 검색이 완료됐으면 
		if (status === daum.maps.services.Status.OK) {
			var coords = new daum.maps.LatLng(result[0].y, result[0].x);
			// 결과값으로 받은 위치를 마커로 표시합니다
			var circle = new daum.maps.Circle({
				center : coords,  // 원의 중심좌표 입니다 
				radius: <%=lessondetail.getLesson_rad()%>, // 미터 단위의 원의 반지름입니다 
				strokeWeight: 1, // 선의 두께입니다 
				strokeColor: '#75B8FA', // 선의 색깔입니다
				strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
				strokeStyle: 'dashed', // 선의 스타일 입니다
				fillColor: '#CFE7FF', // 채우기 색깔입니다
				fillOpacity: 0.5  // 채우기 불투명도 입니다   
			}); 

			// 지도에 원을 표시합니다 
			circle.setMap(map);       
			// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			map.setCenter(coords);
		} 
	});
	
</script>
						</div>        
					</div>          
				</div>
			</div>    
		</div>
	</nav><!--커리큘럼란 종료-->
</nav><!--내용 끝-->

<div align="center">
	&nbsp;<input type="submit" value="나가기">
</div>

<!-- 바닥 -->
<%@ include file="/common/footer.jsp" %>
<!--바닥종료-->

</body>
</html>