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
		
		case "000" : $('#location_do').hide(); break;
		case "111" : $('#location_do').hide();
					$('#location_do').load("parts/location/111.jsp");
					$('#location_do').show(); break;
		}
	}
	
	function changeClass(id) {	
		switch(id) {
		
		case "gamet": $(".tclass").hide(); $("#tgame").show(); break;
		case "sportt": $(".tclass").hide(); $("#tsport").show(); break;
		case "musict": $(".tclass").hide(); $("#tmusic").show(); break;
		case "dancet": $(".tclass").hide(); $("#tdance").show(); break;
		case "etct": $(".tclass").hide(); $("#tetc").show(); break;		
		}
	}
	
	function infoView(id) {

		switch(id) {
		
		case "ti": $("#person_info").toggle("1"); break;		
		case "ci": $("#class_dinfo").toggle("1"); break;		
		}
	}
	
	function searchView() {
		
		$("#search_table").show();
		
	}
	
	function hideView() {
		
		$("#search_table").hide();
		
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
					<option value="000">지역</option>
					<option value="111">서울</option>
					<option value="222">인천</option>
					<option value="333">세종</option>
					<option value="444">대전</option>
					<option value="555">울산</option>
					<option value="666">대구</option>
					<option value="777">광주</option>
					<option value="888">부산</option>
					<option value="1111">경기</option>
					<option value="2222">강원</option>
					<option value="3333">충북</option>
					<option value="4444">충남</option>
					<option value="5555">전북</option>
					<option value="6666">전남</option>
					<option value="7777">경북</option>
					<option value="8888">경남</option>
					<option value="9999">제주</option>
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
					<a onclick="changeClass(this.id);" id = "gamet">게임</a>
					<a onclick="changeClass(this.id);" id = "sportt">스포츠</a>
					<a onclick="changeClass(this.id);" id = "musict">음악</a>
					<a onclick="changeClass(this.id);" id = "dancet">댄스</a>
					<a onclick="changeClass(this.id);" id = "etct">기타</a>
				</th>
			</tr>
		</table>			
			
		<p class = "select_class">
			<div class="tclass" id="tgame">
				<input type="checkbox" value="">배틀 그라운드
				<input type="checkbox" value="">오버워치
				<input type="checkbox" value="">리그 오브 레전드
				<input type="checkbox" value="">철권
			</div>
			
			<div class="tclass" id="tsport">
				<input type="checkbox" value="">축구
				<input type="checkbox" value="">농구
				<input type="checkbox" value="">야구
			</div>
			
			<div class="tclass" id="tmusic">
				<input type="checkbox" value="">현악기
				<input type="checkbox" value="">관악기
				<input type="checkbox" value="">타악기
				<input type="checkbox" value="">보컬
				<input type="checkbox" value="">랩
			</div>
			
			<div class="tclass" id="tdance">
				<input type="checkbox" value="">방송댄스
				<input type="checkbox" value="">팝핀
			</div>
			
			<div class="tclass" id="tetc">
				<input type="checkbox" value="">웃음
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
				<input type="checkbox">프로 게이머 출신 &nbsp;
				<input type="checkbox">대회 입상 &nbsp;
				</div>	
					
				<div>
				<label>추가정보</label>
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
	<center>
		<div style="width : 40%; overflow:hidden; margin-top : 30px; margin-bottom : 30px;">
			<button type="submit" class="btn btn-info" onclick="searchView();">검색하기</button>
			<button type="reset" class="btn btn-info" onclick="hideView();">초기화하기</button>		
		</div>
	</center>	
	</section>
	
	<section id="search_table">
		<table class="table table-hover" style="width : 50%; margin-left : 30%;">
    <thead>
      <tr>
        <th>Photo</th>
        <th>Name</th>
        <th>Comment</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td style="height : 100px; width : 100px;">
        <img src="" style="height : 50px; width : 40px;"></td>
        <td>Doe</td>
        <td>john@example.com</td>
      </tr>
      <tr>
        <td style="height : 100px; width : 100px;">
        <img src="" style="height : 50px; width : 40px;"></td>
        <td>Moe</td>
        <td>mary@example.com</td>
      </tr>
      <tr>
        <td style="height : 100px; width : 100px;">
        <img src="" style="height : 50px; width : 40px;"></td>
        <td>Dooley</td>
        <td>july@example.com</td>
      </tr>
    </tbody>
  </table>
	</section>
	
	<div>
		<%@ include file = "../../common/footer.jsp" %>
	</div>
	
</body>
</html>