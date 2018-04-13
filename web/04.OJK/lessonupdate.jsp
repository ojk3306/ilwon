<%@page import="lesson.model.vo.Lesson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
Lesson l=(Lesson)request.getAttribute("list");
%>
<html>
<head>
<script type="text/javascript"
	src="/prototype/common/resources/js/jquery-3.3.1.min.js"></script>
	<script 
	src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=120b01867e29e09658100681cf1d0604&libraries=services"></script>
<style type="text/css">
	.palel-primary
	{
		border-color: #bce8f1;
	}
	.panel-primary>.panel-heading
	{
		background:#bce8f1;
		
	}
	.panel-primary>.panel-body
	{
		background-color: #EDEDED;
	}
	.col-md-6 col-sm-12 col-lg-6 col-md-offset-3{
		width:1000px;
	}
</style>

<script>
console.log(<%= l.getLesson_title()%>)
function juso(){ 

	new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	            console.log(data.roadAddress);
	            $("#loc").val(data.roadAddress)	
	        }
	    }).open();

	
	};


function mapshow(){

	loc=$("#loc").val();
	rad=$("#rad").val();

	$("#map").show();
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

	geocoder.addressSearch(loc , function(result, status) {
	// 정상적으로 검색이 완료됐으면 
	 if (status === daum.maps.services.Status.OK) {

	    var coords = new daum.maps.LatLng(result[0].y, result[0].x);

	    // 결과값으로 받은 위치를 마커로 표시합니다
	   var circle = new daum.maps.Circle({
	            center : coords,  // 원의 중심좌표 입니다 
	            radius: rad, // 미터 단위의 원의 반지름입니다 
	            strokeWeight: 1, // 선의 두께입니다 
	            strokeColor: '#75B8FA', // 선의 색깔입니다
	            strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	            strokeStyle: 'dashed', // 선의 스타일 입니다
	            fillColor: '#CFE7FF', // 채우기 색깔입니다
	            fillOpacity: 0.8  // 채우기 불투명도 입니다   
	        }); 

	        // 지도에 원을 표시합니다 
	        circle.setMap(map); 
	  
	        
	    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	    map.setCenter(coords);
	} 
	});    


	map.relayout();
	}
var detailCount=1;
var detailmax=3;
function addDetail(){
if(detailmax>detailCount){
$("#detail").append("<div id='"+detailCount+"'class='form-group'><label for='keyword' style='padding:auto; width:100px;'>키워드</label>	<div style='width: 99%;'><input type='text' name='keyword' class='form-control' style='width:150px; float:left'><input type='button' onclick='removeDetail(this)' id='"+detailCount+"' class='btn btn-primary center' value='정보삭제하기' style='margin-left:10px;'><input type='button' onclick='addDetail()' class='btn btn-primary center' value='키워드 추가' style='margin-left:10px;'></div></div>");
 detailCount++;
 console.log(detailCount);
	}else{
		alert("기본 키워드 개수는 3개입니다");
		
	}
	
}

function removeDetail(a){
	$("#"+a.id).remove();
	detailCount--;
	console.log(detailCount);
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강의 수정합니다</title>
</head>
<body>
<%@ include file="/common/navbar.jsp" %>
<div class="container">

    <div class="col-md-6 col-sm-12 col-lg-6 col-md-offset-3">
		<div class="panel panel-primary">
			<div class="panel-heading">강의를 등록합니다.
			</div>
			<div class="panel-body">
				<form action="/prototype/insertlesson.sm" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<label for="title">강의 타이틀</label>
						<input id="title" name="title" class="form-control" type="text" data-validation="required">
						<span id="error_name" class="text-danger"></span>
					</div>
					<div class="form-group">
						<label for="category">카테고리</label><br>	
						<label>대분류 : </label>&nbsp;<select name="category1">
							<option value="음악">음악</option>
							<option value="운동">운동</option>
							<option value="게임">게임</option>
						</select>&nbsp;
						
						<label>소분류 : </label>&nbsp;<select name="category2">
							<option value="피아노">피아노</option>
							<option value="테니스">테니스</option>
							<option value="리그오브레전드">리그오브레전드</option>
						</select>
						<span id="error_lastname" class="text-danger"></span>
					</div>
					<div class="form-group">
						<label for="level">강의 수준</label><br>
						<select name="level">
							<option value="11130">초급</option>
							<option value="11131">중급</option>
							<option value="11132">고급</option>
							<option value="11133">취미</option>
						
						</select>
						<span id="error_name" class="text-danger"></span>
					</div>
					<div class="form-group">
						<label>수업료/횟수</label>
						
						<div style="width:95%; background: red">
						<label for="price" style="width: 17%; float:left;">수업료(단위/만):</label>
						<input id="price" name="price"  class="form-control" type="number" min="1" style="width: 15%; float:left">
						 <label for="count" style="margin-left:30px;    width: 7%; float:left" >횟수:</label>
						<input id="count" name="count"  class="form-control" type="number" min="1" style="width: 15%; float:left">
					 	
						</div>
						
						<span id="error_age" class="text-danger"></span>
				
					</div>
					
						<hr style="clear:both; border: 0">
					
					<div class="form-group">
						<label for="contop">강의 내용1</label>
						<textarea name="contop" id="contop" rows="10" cols="68pt"></textarea>
						<span id="error_phone" class="text-danger"></span>
					</div>
					
					<div class="form-group">
						<label for="conmid">강의 내용2</label>
						<textarea rows="10" cols="68pt" name="conmid" id="conmid"></textarea>
						<span id="error_phone" class="text-danger"></span>
					</div>
					
					<div class="form-group">
						<label for="conbot">강의 내용3</label>
						<textarea rows="10" cols="68pt" name="conbot" id="conbot"></textarea>
						<span id="error_phone" class="text-danger"></span>
					</div>
					
					<div class="form-group">
						<label for="img">포트폴리오</label>
						<input type="file" name="upfile" id="img" >
						<span id="error_phone" class="text-danger"></span>
					</div>
					<div class="form-group">
						<input type="file" name="upfile2" id="img2">
						<span id="error_phone" class="text-danger"></span>
					</div>
					<div class="form-group">
						<input type="file" name="upfile3" id="img3">
						<span id="error_phone" class="text-danger"></span>
					</div>
					
					<div class="form-group">
						<label for="loc">강의 지역</label>
						<input type="text" id="loc" name="loc" class="form-control" onclick="juso()" readonly="readonly" placeholder="클릭 해서 지역을 선택해주세요!">
						<span id="error_phone" class="text-danger"></span>
					</div>
					
					<div class="form-group">
						<label for="rad">가능 반경(단위/미터)</label>
						<input type="number" name="rad" id="rad" min="1000" class="form-control" value="1000" style="width: 100px; margin-bottom: 10px;">
								<button type="button" class="btn" onclick="mapshow()">확인하기</button>
								</div> 
									<div id="map" style="width:500px; height:350px; display: none;" ></div>
							
						<span id="error_phone" class="text-danger"></span>
					
					<div id="detail">
					<div class="form-group">
						
						<label for="keyword" style="padding:auto; width:100px;">키워드</label>
						<div style="width: 99%;">
						<input type="text" name="keyword" class="form-control" style="width:150px; float:left">
						<input type="button" onclick="addDetail()" class="btn btn-primary center" value="키워드 추가" style="margin-left:140px;">						
						</div>
						
					</div>
					</div>
					<input type="hidden" name="userno" value="<%= loginUser.getUserNo() %>">
					<input type="submit" value="강의생성" class="btn btn-primary center">
					<input type="reset" value="초기화" class="btn btn-primary center">
					<input type="button" onclick="history.back()" value="뒤로가기" class="btn btn-primary center">
					
					</div>
					
					</form>
					
					
					
					
				

			</div>
		</div>
</div>



<%@ include file="/common/footer.jsp" %>
</body>
</html>