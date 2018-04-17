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
		
		$(".tclass").hide(); $(".ohw-" + id).show();			
		
		console.log(".ohw-" + id);
	}
	
	function infoView(id) {

		switch(id) {
		
		case "ti": $("#person_info").toggle("1"); break;		
		case "ci": $("#class_dinfo").toggle("1"); break;		
		}
	}
	
	function searchView() {
		
		$("#show_table").hide();
		$("#keyword_table").hide();
		$("#search_table").show();
		
	}
	
	function readyView() {
		
		$("#search_table").hide();
		$("#keyword_table").hide();
		$("#show_table").show();
		
	}
	
	function keywordView(keyword) {
		
		searchKeyword(keyword);
		$("#search_table").hide();
		$("#keyword_table").show();
		$("#show_table").hide();
		
	}	
	
</script>

<style type="text/css">
			
	.tclass, #person_info, #class_dinfo, #search_table, #keyword_table {
		display : none;	
	}
	
	 .header_text {		
		color : gray;
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
			
	#show_table, #search_table, #keyword_table {		
		width:60%;
	}
	
	.ohw-ready-table, .ohw-search-table, .ohw-keyword-table {
		width:900px;		
		padding:0px;		
	}
	
	.ohw-ready-photo, .ohw-search-photo, .ohw-keyword-photo {
		width:110px;
		height:110px;
	}
	
	.ohw-ready-name, .ohw-search-name, .ohw-keyword-name {
		width:100px;
		height:110px;
	}
	
	.ohw-ready-category, .ohw-search-category, .ohw-keyword-category {
		width:300px;
		height:110px;
	}
	
	.ohw-ready-comment, .ohw-search-comment, .ohw-keyword-comment {
		width:500px;
		height:110px;
	}
	
	.ohw-table-header {
		height:50px;
		border-bottom:1 dashed gray;
	}
	
	.ohw-small-category-td {
		width:200px;
	}
	
</style>
</head>

<body style="min-width : 800px; overflow : auto; display : absolute; background:#E9E9E9;">
	<nav>
		<%@ include file = "../../common/navbar.jsp" %>
		<%@include file="/01.CJS\sidebar.jsp" %>
	</nav>
<div style="margin-top: -550px;">
	<div id = "left_bar"></div>
	<div id = "right_bar"></div>
</div>
<header style="text-align : center;"><h3 class="header_text">은밀한 선생</h3></header>
	
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
		</tr>
	</table>
	<table>
		<tr>
			<td>
				<span id = "location_do"></span>
			</td>
		</tr>
	</table>			
</section>
	
<hr>
	
<section class = "teacher_class">	
	<table class = "ohw-big-category">
		<tr class = "ohw-big-category-tr">
			<th style = "width : 100px;"><h3 class="header_text">수업</h3></th>				
		</tr>			
	</table>		
	<table class = "ohw-small-category">				
	
	</table>								
</section>	
		
<script type="text/javascript">
	
	$.ajax({
    	url:"<%= request.getContextPath() %>/tclist",
    	type:"get",
    	datatype:"json",
    	success:
    		function(data) {    		
    			console.log("CatgegoryList : ") + console.log(data);
				var jsonStr = JSON.stringify(data);
				var json = JSON.parse(jsonStr);
				var bigCategory = "";

				for(var i in json.bigCategory){ //대분류 삽입				
					bigCategory += '<td class = "ohw-big-category-td"><a onclick="changeClass(this.id);" id = "' + json.bigCategory[i].categoryBig + '">' + json.bigCategory[i].categoryBig + '</a></td>'						
				}			
				$('.ohw-big-category-tr').append(bigCategory);
				 for(var i in json.categoryInfo){ //소분류 삽입	
					 $(".ohw-small-category").append($("#"+json.categoryInfo[i].categoryBig).html()+'<tr><td class = "tclass ohw-small-category-td ohw-' + json.categoryInfo[i].categoryBig + '" align = "left"><input type="radio" name="tclass-radio" value="' + json.categoryInfo[i].categorySmall + '">' + json.categoryInfo[i].categorySmall + '</td></tr>');
				}			 
			}, 
		error : function(a,b,c) {
			console.log(b+c);
		}
	});
	
</script>
	
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
			<input type="radio" name="ohw-teacher-gender" value = "M">남  &nbsp; 
			<input type="radio" name="ohw-teacher-gender" value = "F">여  &nbsp; 
			<input type="radio" name="ohw-teacher-gender" value = null>무관
		</div>
		<div>
			<label>선생님 연령대</label>
			<select name = "ohw-teacher-age-pre">
				<option value = "0">선택</option>
				<option value = "20">20</option>
				<option value = "30">30</option>
				<option value = "40">40</option>
				<option value = "50">50</option>
			</select> ~
			<select name = "ohw-teacher-age-end">
				<option value = "0">선택</option>
				<option value = "20">20</option>
				<option value = "30">30</option>
				<option value = "40">40</option>
				<option value = "50">50</option>
			</select> 세
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
			<select name = "ohw-lesson-price-pre">
				<option value = "0">선택</option>
				<option value = "1">1</option>
				<option value = "10">10</option>
				<option value = "20">20</option>
				<option value = "30">30</option>
				<option value = "40">40</option>
				<option value = "50">50</option>
				<option value = "60">60</option>
				<option value = "70">70</option>
				<option value = "80">80</option>
				<option value = "90">90</option>
				<option value = "100">100</option>
				<option value = "110">110</option>
				<option value = "120">120</option>
				<option value = "130">130</option>
				<option value = "140">140</option>						
			</select> ~
			<select name = "ohw-lesson-price-end">
				<option value = "0">선택</option>
				<option value = "10">10</option>
				<option value = "20">20</option>
				<option value = "30">30</option>
				<option value = "40">40</option>
				<option value = "50">50</option>
				<option value = "60">60</option>
				<option value = "70">70</option>
				<option value = "80">80</option>
				<option value = "90">90</option>
				<option value = "100">100</option>
				<option value = "110">110</option>
				<option value = "120">120</option>
				<option value = "130">130</option>
				<option value = "140">140</option>
				<option value = "150">150</option>
			</select>
		</div>		
		<div>			
			<table>
				<tr>
					<td><label>수업레벨</label></td>
					<td>
						<select name = "ohw-lesson-level">
							<option value = "0">선택</option>
							<option value = "11130">초보과정</option>
							<option value = "11131">중급과정</option>
							<option value = "11132">고급과정</option>					
							<option value = "11133">취미</option>					
						</select>
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
			<button type = "submit" class="btn btn-default" onclick="searchView(); searchTeacher();">
				<span class="glyphicon glyphicon-search" aria-hidden="true"></span> 검색하기
			</button>
			<button type="reset" class="btn btn-default" onclick="window.location.reload();">
				<span class="glyphicon glyphicon-refresh" aria-hidden="true"></span> 초기화
			</button>					
		</div>
	</div>	
</section>
	
<hr>	
	
<script type="text/javascript">

	$(document).ready(function readyList() {	
		$.ajax({
			url:"<%= request.getContextPath() %>/lrlist",			
			dataType:"json",
			success:function(data) {			
				var jsonStr = JSON.stringify(data);
				var json = JSON.parse(jsonStr);		 
				console.log("LessonReadyList : ") + console.log(data);			
				for(var i in json.list) {				
					$('.ohw-ready-table').append(						
						 <% if(loginUser != null) { %>				 	
							"<tr class = 'ohw-ready-table-tr'><td class = 'ohw-ready-photo'><a href = '<%= request.getContextPath() %>/lessondetail?no=" + json.list[i].lessonNo + "&page=1'><img src = '/prototype/03.OHW/resources/images/rakoon.jpg' style = 'width:100px; height:100px;'></a></td>" + 
				
						 <% } else { %>					
							"<tr class = 'ohw-ready-table-tr'><td class = 'ohw-ready-photo'><img src = '/prototype/03.OHW/resources/images/rakoon.jpg' style = 'width:100px; height:100px;'></td>" + 
						 <% } %>						
						"<td class = 'ohw-ready-name'>" + json.list[i].userName2 + "</td>" +				
						"<td class = 'ohw-ready-category'>" + json.list[i].categoryBName + " / " + json.list[i].categorySName + "</td>" +				
						"<td class = 'ohw-ready-comment'>" + json.list[i].lessonConmid + "</td></tr>"				
					);				
				}			
			}		
		});	
	});

</script>	

<div align = "center">
	<div id="show_table" align = "center"> <!-- 평소에 펼쳐져 있는 테이블 -->	
		<div class = "ohw-table-header"><h3>새로 올라온 강의</h3></div>	
		<table class="table table-hover ohw-ready-table">
			<tr></tr>
		</table>
	</div>
		
<script type="text/javascript"> /* 키워드 검색용 스크립트 */

	$(function() {	
		<% String keyword = request.getParameter("ohw-keyword"); %>
		<% System.out.println("ReadyKeywordValue : " + keyword); %>		
		var keyword = "<%= keyword %>";
	 	/* alert("ReadyKeyword : " + keyword) */
		if(keyword != "null") {
			/* alert("KeywordView Run"); */
			keywordView(keyword);
		} else if(keyword == "null") {
			/* alert("ReadyView Run"); */
			readyView();
		}		
	});
	
	function searchKeyword(keyword) {			
		<% System.out.println("SearchKeywordValue : " + request.getParameter("ohw-keyword")); %>
		var lessonKeywordSearch = keyword;
		/* alert(lessonKeywordSearch); */	
		jQuery.ajaxSettings.traditional = true;		
		$.ajax({
   	 		url:"<%= request.getContextPath() %>/lsearch",
			data:{
				keywordValue : lessonKeywordSearch
			},
    		type:"post",
    		datatype:"json",
    		success:
    			function(data) {    			
    				var jsonStr = JSON.stringify(data);    			
    				var json = JSON.parse(jsonStr);	    			
    				console.log("LessonSearchList : ") + console.log(data);    			
    				$(".ohw-keyword-table-tr").empty();    			
    				for(var i in json.list) {    				
    					$('.ohw-keyword-table').append(    				
    					<% if(loginUser != null) { %>				 	
    						"<tr class = 'ohw-keyword-table-tr'><td class = 'ohw-keyword-photo'><a href = '<%= request.getContextPath() %>/lessondetail?no=" + json.list[i].lessonNo + "&page=1'><img src = '/prototype/03.OHW/resources/images/rakoon.jpg' style = 'width:100px; height:100px;'></a></td>" +     					
    					<% } else { %>					
    						"<tr class = 'ohw-keyword-table-tr'><td class = 'ohw-keyword-photo'><img src = '/prototype/03.OHW/resources/images/rakoon.jpg' style = 'width:100px; height:100px;'></td>" + 
    					<% } %>    				
    					"<td class = 'ohw-keyword-name'>" + json.list[i].userName2 + "</td>" +    				
    					"<td class = 'ohw-keyword-category'>" + json.list[i].categoryBName + " / " + json.list[i].categorySName + "</td>" +	    				
    					"<td class = 'ohw-keyword-comment'>" + json.list[i].lessonConmid + "</td></tr>"    				
    					);				
    				}			
    			}, 
    		error : function(a,b,c) {
				console.log(b+c);
			}
		});	
	}

</script>
	
	<div id="keyword_table" align = "center"> <!-- 키워드 검색 결과 표시 테이블 -->
		<div class = "ohw-table-header"><h3>키워드 검색 결과</h3></div>
		<table class="table table-hover ohw-keyword-table">      
			<tr></tr>
		</table>
	</div>
	
<script type="text/javascript">
	
	function searchTeacher() {
		
		var locationValue = $("input[type=radio][name=ohw-location]:checked").val();
		console.log(locationValue);
		
		var lessonValue = $("input[type=radio][name=tclass-radio]:checked").val();		
		console.log(lessonValue);
		
		var teacherGenderValue = $("input[type=radio][name=ohw-teacher-gender]:checked").val();
		console.log(teacherGenderValue);
		
		var teacherAgePreValue = $("select[name=ohw-teacher-age-pre]").val();
		console.log(teacherAgePreValue);
		
		var teacherAgeEndValue = $("select[name=ohw-teacher-age-end]").val();
		console.log(teacherAgeEndValue);		
		
		var lessonPricePreValue = $("select[name=ohw-lesson-price-pre]").val();
		console.log(lessonPricePreValue);
		
		var lessonPriceEndValue = $("select[name=ohw-lesson-price-end]").val();
		console.log(lessonPriceEndValue);
		
		var lessonLevelValue = $("select[name=ohw-lesson-level]").val();
		console.log(lessonLevelValue);
		
		jQuery.ajaxSettings.traditional = true;	
		
		$.ajax({
	    	url:"<%= request.getContextPath() %>/lslist",
	    	data:{
	    		location : locationValue, 
	    		lesson : lessonValue, 
	    		teacherGender : teacherGenderValue, 
	    		teacherAgePre : teacherAgePreValue, 
	    		teacherAgeEnd : teacherAgeEndValue,	    		
	    		lessonPricePre : lessonPricePreValue, 
				lessonPriceEnd : lessonPriceEndValue, 
				lessonLevel : lessonLevelValue
	    	},
	    	type:"get",
	    	datatype:"json",
	    	success:
	    		function(data) {	    			
	    			var jsonStr = JSON.stringify(data);	    			
	    			var json = JSON.parse(jsonStr);		    			
	    			console.log("LessonSearchList : ") + console.log(data);	    			
	    			$(".ohw-search-table-tr").empty();	    			
	    			for(var i in json.list) {	    				
	    				$('.ohw-search-table').append(	    				
	    					<% if(loginUser != null) { %>				 	
    							"<tr class = 'ohw-search-table-tr'><td class = 'ohw-search-photo'><a href = '<%= request.getContextPath() %>/lessondetail?no=" + json.list[i].lessonNo + "&page=1'><img src = '/prototype/03.OHW/resources/images/rakoon.jpg' style = 'width:100px; height:100px;'></a></td>" + 
    						<% } else { %>					
    							"<tr class = 'ohw-search-table-tr'><td class = 'ohw-search-photo'><img src = '/prototype/03.OHW/resources/images/rakoon.jpg' style = 'width:100px; height:100px;'></td>" + 
    						<% } %>    					
	    					"<td class = 'ohw-search-name'>" + json.list[i].userName2 + "</td>" +		    				
	    					"<td class = 'ohw-search-category'>" + json.list[i].categoryBName + " / " + json.list[i].categorySName + "</td>" +	    				
	    					"<td class = 'ohw-search-comment'>" + json.list[i].lessonConmid + "</td></tr>"	    				
	    				);				
	    			}			
	    		}, 
	    	error : function(a,b,c) {
				console.log(b+c);
			}
	    });		
	}
	
</script>
	
	<div id="search_table" align = "center"> <!-- 검색 결과 표시 테이블 -->
		<div class = "ohw-table-header"><h3>검색 결과</h3></div>
		<table class="table table-hover ohw-search-table">      
			<tr></tr>
		</table>
	</div>	
</div>
	
<div>
	<%@ include file = "../../common/footer.jsp" %>
</div>
	
</body>
</html>