<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="/prototype/common\resources\js\jquery-3.3.1.min.js"></script>
<script 
	src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
function juso(){  
	new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	            console.log(data.roadAddress);
	            $("#loc").val(data.roadAddress);
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
    level: 4 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 


//주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();
//주소로 좌표를 검색합니다

geocoder.addressSearch(loc, function(result, status) {
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

</script>
<meta charset="UTF-8">
<title>선생님으로 가입하기</title>
</head>
<body>
<%@ include file="/common/navbar.jsp"%>
	
	
	<nav class="contents">
		<br>
		<h1 align="center">선생님으로 가입하기</h1>
		<hr>

		<div id="wrapper">
			<div align="center">
				<div style="width: 1100px; height: 1200px;">
					<div style="margin-top: 50px;">
						<div style="width: 600px;">
							<hr>
							<form class="form-horizontal" action="<%=request.getContextPath()%>/Insertuser" method="post">
								<div class="form-group">
									<label class="control-label col-sm-2" for="email">이메일:</label>
									<div class="col-sm-10">
										<input type="email" class="form-control" id="email"
											placeholder="Enter email" name="email">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2" for="pwd-1">비밀번호:</label>
									<div class="col-sm-10">
										<input type="password" class="form-control"
											placeholder="Enter password" id="pwd" name="pwd">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2" for="pwd-1">비밀번호<br>재확인:</label>
									<div class="col-sm-10">
										<input type="password" class="form-control"
											placeholder="Enter password" id="repwd">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2" for="pwd-2">이름:</label>
									<div class="col-sm-10">
										<input type="text" class="form-control"
											placeholder="Enter name" name="pwd-2" id="pwd-2">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2" for="phone">전화번호:</label>
									<div class="col-sm-10">
										<input type="text" class="form-control"
											placeholder="Enter phone" name="phone" id="phone">
									</div>
								</div>

								<div class="form-group">
									<label class="control-label col-sm-2" for="gender">성별:</label>
									<div class="col-sm-10">
										남&nbsp;&nbsp;<input type="radio" name="gender">
										여&nbsp;&nbsp;<input type="radio" name="gender">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2" >나이:</label>
									<div class="col-sm-10">
					<input type="number" name="age" class="form-control">
									
									</div>
								</div>
								<div class="form-group">
								<label class="control-label col-sm-2" for="loc">주소:</label>
								<div class="col-sm-10">
								<input type="text" name="loc" placeholder="이곳을 클릭해서 주소를 검색해주세요" id="loc" class="form-control" onclick="juso()" readonly="readonly">
								</div>
								</div>
								

							
								<hr>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn" value="확인">
					<input type="reset" class="btn" value="초기화">
					<input type="hidden" name="user_type" value="102">
					
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>


	</nav>
	
<%@ include file="/common/footer.jsp" %>
</body>
</html>