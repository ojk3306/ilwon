<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>은밀한 선생</title>
<script type="text/javascript">
	
	function changeLocation(value){	
		switch(value) {
		
		case "지역" : $('#location_do').hide(); break;
		case "서울" : $('#location_do').hide();
					$('#location_do').load("parts/location/seoul.jsp");
					$('#location_do').show(); break;
		}
	}
	
	function changeClass(id) {
		
		switch(id) {
		
		case "게임": $(".tclass").hide(); $("#ohw_게임").show(); break;
		case "스포츠": $(".tclass").hide(); $("#ohw_스포츠").show(); break;
		case "음악": $(".tclass").hide(); $("#ohw_음악").show(); break;
		case "댄스": $(".tclass").hide(); $("#ohw_댄스").show(); break;
		case "기타": $(".tclass").hide(); $("#ohw_기타").show(); break;		
		}
	}
	
	function infoView(id) {

		switch(id) {
		
		case "ti": $("#person_info").toggle("1"); break;		
		case "ci": $("#class_dinfo").toggle("1"); break;		
		}
	}
	
	function searchView() {
		
		$("#show_table").hide();
		$("#search_table").show();
		
	}
	
	function hideView() {
		
		$("#search_table").hide();
		$("#show_table").show();
		
	}
	
	function searchTeacher() {
		
		var classValue = $("input[type=radio][name=tclass-radio]:checked").val();
		alert(classValue);
		
	}
	
	<%-- $(document).ready(function selectCategory() {
		
		<% String cate = request.getParameter("id"); %>
		
		var cate = "<%= cate %>";
		 		
		switch(cate) {
		
		case "cate_game" : $(".tclass").hide(); $("#tgame").show(); break; 
		case "cate_sport" : $(".tclass").hide(); $("#tsport").show(); break; 
		case "cate_music" : $(".tclass").hide(); $("#tmusic").show(); break; 
		case "cate_dance" : $(".tclass").hide(); $("#tdance").show(); break; 
		case "cate_etc" : $(".tclass").hide(); $("#tetc").show(); break; 
		
		}		
	}); --%>
	
	 
	
</script>

<style type="text/css">
			
	.tclass, #person_info, #class_dinfo, #search_table {
		display : none;	
	}
	
	#left_bar {	
			
		background : rgba(50, 50, 50, .5);
		width : 100px;
		height : 680px;
		float : left;
	}
	
	#right_bar {
		background : rgba(50, 50, 50, .5);
		width : 100px;
		height : 680px;
		float : right;		
	}
		
	 .header_text {		
		color : #4988ed;
	}
	
	.teacher_location, .teacher_class, .teacher_info, .class_info {		
		overflow : auto;
		margin-left : 30%;
		margin-right : 30%;		
		min-width : 30%;
		max-width : 70%;
		margin-top : 30px;
	
	}
	
	.teacher_class a {
		
		overflow : auto;
		margin-left : 20px;		
	}	
			
	#show_table, #search_table {
		width:50%;
		height:700px;
		margin-left:30%;
	}
	
	.ohw-ready-table, .ohw-search-table {
		width:50%;
		height:700px;
		padding:0px;
	}
	
	.ohw-ready-photo, .ohw-search-photo {
		width:110px;
		height:110px;
	}
	
	.ohw-ready-name, .ohw-search-name {
	
	}
	
	.ohw-ready-category, .ohw-search-category {
	
	}
	
	.ohw-ready-comment, .ohw-search-comment {
	
	}
	
	.ohw-ready-th, .ohw-search-th {
		text-align:center;
		height:30px;
	}
	
	
</style>
</head>

<body style="min-width : 800px; overflow : auto; display : absolute;">
	<nav><%@ include file = "../../common/navbar.jsp" %></nav>
	<div id = "left_bar">왼쪽 구역</div>
	<div id = "right_bar">오른쪽 구역</div>
	<header style="text-align : center;"><h3 class="header_text">선생님 찾기</h3></header>
	
	<hr>
	
	<section class = "teacher_location">
		<table>
			<tr>
			<td style = "width : 100px; vertical-align : top;">
				<h3 class="header_text">지역</h3>
			</td>
			<td style = "vertical-align : top; padding-top : 19px;">
				<select onchange = "changeLocation(this.value);">
					<option value="지역">지역</option>
					<option value="서울">서울</option>
					<option value="인천">인천</option>
					<option value="세종">세종</option>
					<option value="대전">대전</option>
					<option value="울산">울산</option>
					<option value="대구">대구</option>
					<option value="광주">광주</option>
					<option value="부산">부산</option>
					<option value="경기">경기</option>
					<option value="강원">강원</option>
					<option value="충북">충북</option>
					<option value="충남">충남</option>
					<option value="전북">전북</option>
					<option value="전남">전남</option>
					<option value="경북">경북</option>
					<option value="경남">경남</option>
					<option value="제주">제주</option>
				</select>
			</td>
			<td><span id = "location_do"></span></td>					

			</tr>
		</table>
			
	</section>
	
	<hr>
	
	<section class = "teacher_class">
	
		<table>
			<tr>
				<th style = "width : 100px;"><h3 class="header_text">수업</h3></th>
				<th style = "padding-top : 18px;">
					<a onclick="changeClass(this.id);" id = "게임">게임</a>
					<a onclick="changeClass(this.id);" id = "스포츠">스포츠</a>
					<a onclick="changeClass(this.id);" id = "음악">음악</a>
					<a onclick="changeClass(this.id);" id = "댄스">댄스</a>
					<a onclick="changeClass(this.id);" id = "기타">기타</a>
				</th>
			</tr>
		</table>			
			
		<p class = "select_class">
			<div class="tclass" id="ohw_게임">
				<input type="radio" name = "tclass-radio" value="배틀그라운드">배틀그라운드
				<input type="radio" name = "tclass-radio" value="오버워치">오버워치
				<input type="radio" name = "tclass-radio" value="리그오브레전드">리그 오브 레전드
				<input type="radio" name = "tclass-radio" value="철권">철권
			</div>
			
			<div class="tclass" id="ohw_스포츠">
				<input type="radio" name = "tclass-radio" value="축구">축구
				<input type="radio" name = "tclass-radio" value="농구">농구
				<input type="radio" name = "tclass-radio" value="야구">야구
			</div>
			
			<div class="tclass" id="ohw_음악">
				<input type="radio" name = "tclass-radio" value="현악기">현악기
				<input type="radio" name = "tclass-radio" value="관악기">관악기
				<input type="radio" name = "tclass-radio" value="타악기">타악기
				<input type="radio" name = "tclass-radio" value="보컬">보컬
				<input type="radio" name = "tclass-radio" value="랩">랩
			</div>
			
			<div class="tclass" id="ohw_댄스">
				<input type="radio" name = "tclass-radio" value="방송댄스">방송댄스
				<input type="radio" name = "tclass-radio" value="팝핀">팝핀
			</div>
			
			<div class="tclass" id="ohw_기타">
				<input type="radio" name = "tclass-radio" value="웃음">웃음
			</div>
		</p>						
	</section>
	
	<hr>
	
	<section class = "teacher_info">
		<table>
			<tr>
				<td style = "width : 200px;">
				<h3 class="header_text">기본정보</h3>
				</td>
				<td style="padding-top : 10px; width : 300px;">
				<a onclick="infoView(this.id);" id="ti"><h5>선생님의 기본 정보로 검색해보세요.</h5></a>
				</td>
			</tr>
		</table>
			<div id = "person_info">					
				<div>
					<label>선생님 성별</label>
					<input type="radio" name="gender">남  &nbsp;
					<input type="radio" name="gender">여  &nbsp;
					<input type="radio" name="gender">무관
				</div>
					
				<div>
					<label>선생님 연령대</label>
					<select>
						<option>선택</option>
						<option>20대</option>
						<option>30대</option>
						<option>40대</option>
						<option>50대</option>
					</select> ~
				
					<select>
						<option>선택</option>
						<option>20대</option>
						<option>30대</option>
						<option>40대</option>
						<option>50대</option>
					</select>
				</div>
					
				<div>
					<label>경력사항</label>
					<input type="checkbox" value = "pro">프로 게이머 출신 &nbsp;
					<input type="checkbox" value = "trophy">대회 입상 &nbsp;
				</div>					
							
			</div>
		
	</section>
	
	<hr>
	
	<section class = "class_info">
		<table>
			<tr>
				<td style = "width : 200px;">
					<h3 class="header_text">수업정보</h3>
				</td>
				<td style="padding-top : 10px; width : 300px;">
					<a onclick="infoView(this.id);" id="ci"><h5>원하는 수업만 받고 싶으신가요?</h5></a>
				</td>
			</tr>
		</table>
		
		<div id = "class_dinfo">
			<div>
					<label>수업료</label>
					<select>
						<option>선택</option>
						<option>0</option>
						<option>10</option>
						<option>20</option>
						<option>30</option>
					</select> ~
				
					<select>
						<option>선택</option>
						<option>10</option>
						<option>20</option>
						<option>30</option>
						<option>40</option>
					</select>
				</div>		
			
			<div>			
			<table>
				<tr>
					<td><label>수업레벨</label></td>
					<td>
					<select>
						<option>선택</option>
						<option>초보과정</option>
						<option>중급과정</option>
						<option>고급과정</option>						
					</select>
					</td>
				</tr>				
			</table>
			</div>
			
			<div>
			<label>수업 횟수</label>
			<table>
				<tr>
					<td>
						
					</td>
				</tr>				
			</table>
			</div>		
			
		</div>
		
	</section>
	
	<hr>
	
	<section class="button_section">
	<div align = "center">
		<div style="width : 40%; overflow:hidden; margin-top : 30px; margin-bottom : 30px;">
			<button type="submit" class="btn btn-info" onclick="searchView(); searchTeacher();">검색하기</button>
			<button type="reset" class="btn btn-info" onclick="hideView();">초기화하기</button>		
		</div>
	</div>	
	</section>
	
<script type="text/javascript">

$(function () {
	
	$.ajax({
		url:"<%= request.getContextPath() %>/lrlist",			
		dataType:"json",
		success:function(data) {
			
			//json 객체 하나(data)를 문자열 형태로 바꿈
			var jsonStr = JSON.stringify(data);
			//문자열을 다시 자바스크립트가 사용할 수 있는
			//json 객체로 파싱함
			var json = JSON.parse(jsonStr);		 
			
			console.log(data);
			
			for(var i in json.list) {
				
				$('.ohw-ready-table').append(				
				
				<%-- "<tr class = 'ohw-ready-table-tr'><td class = 'ohw-ready-photo'><a href = '<%= request.getContextPath() %>/ndetail?no=" + json.list[i].noticeNo + "&page=1'>" + json.list[i].noticeTitle + "</a></td>" --%>
											
				"<tr class = 'ohw-ready-table-tr'><td class = 'ohw-ready-photo'><img src = '/prototype/03.OHW/resources/images/rakoon.jpg' style = 'width:100px; height:100px;'></td>" + 
						
				"<td class = 'ohw-ready-name'>" + json.list[i].userName2 + "</td>" +					 
				
				"<td class = 'ohw-ready-category'>" + json.list[i].categoryBName + " / " + json.list[i].categorySName + "</td>" +					 
				
				"<td class = 'ohw-ready-comment'>" + json.list[i].lessonConmid + "</td></tr>"
				
				);				
			}			
		}	
	});	
});

function searchResult() {
	
	$.ajax({
		url:"<%= request.getContextPath() %>/lslist",			
		dataType:"json",
		success:function(data) {
			
			//json 객체 하나(data)를 문자열 형태로 바꿈
			var jsonStr = JSON.stringify(data);
			//문자열을 다시 자바스크립트가 사용할 수 있는
			//json 객체로 파싱함
			var json = JSON.parse(jsonStr);		 
			
			console.log(data);
			
			for(var i in json.list) {
				
				$('.ohw-search-table').append(
				
				<%-- "<tr class = 'ohw-ready-table-tr'><td class = 'ohw-ready-photo'><a href = '<%= request.getContextPath() %>/ndetail?no=" + json.list[i].noticeNo + "&page=1'>" + json.list[i].noticeTitle + "</a></td>" --%>
											
				"<tr class = 'ohw-ready-table-tr'><td class = 'ohw-ready-photo'><img src = '/prototype/03.OHW/resources/images/rakoon.jpg' style = 'width:100px; height:100px;'></td>" + 
						
				"<td class = 'ohw-ready-name'>" + json.list[i].userName2 + "</td>" +					 
				
				"<td class = 'ohw-ready-category'>" + json.list[i].categoryBName + " / " + json.list[i].categorySName + "</td>" +					 
				
				"<td class = 'ohw-ready-comment'>" + json.list[i].lessonConmid + "</td></tr>"
				
				);				
			}			
		}	
	});	
};

</script>
	
	<div id="show_table" align = "center"> <!-- 평소에 펼쳐져 있는 테이블 -->
		<h3>새로 올라온 강의</h3>
		<table class="table table-hover ohw-ready-table">
			  
		</table>
	</div>
	
	<div id="search_table" align = "center">
		<h3>검색 결과</h3>
		<table class="table table-hover ohw-search-table">      
			<tr>
        		<td style="height : 100px; width : 100px;">
        		<img src="" style="height : 50px; width : 40px;"></td>
        		<td>Doe</td>
        		<td>john@example.com</td>
      		</tr>     
		</table>
	</div>
	
<div>
	<%@ include file = "../../common/footer.jsp" %>
</div>
	
</body>
</html>