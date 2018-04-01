<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>은밀한 결과</title>
<script type="text/javascript">
	
	
	
</script>

<style type="text/css">	
	
	#left_bar {	
			
		background : rgba(50, 50, 50, 0);
		width : 100px;
		height : 1100px;
		float : left;	
	}
	
	#right_bar {
		background : rgba(50, 50, 50, 0);
		width : 100px;
		height : 1100px;
		float : right;		
	}
		
	 .header_text {		
		color : #4988ed;
	}
	
	/* .ohw_content_list {		
		margin-top:30px;
		margin-bottom:30px;
		width:600px;
	}
	
	.ohw_content_no, .ohw_content_sub, .ohw_content_writer, .ohw_content_date {
		text-align:center;
		border:1px solid black;
		padding-top:5px;
		padding-bottom:5px;
	}
	
	.ohw_content_no {
		width:150px;		
	}
	
	.ohw_content_sub {
		width:1000px;			
	}
	
	.ohw_content_writer {
		width:150px;			
	}
	
	.ohw_content_date {
		width:250px;			
	} */
	
</style>
</head>

<body style="min-width : 800px; overflow : auto; display : absolute;">
	<nav><%@ include file = "/common/navbar.jsp" %></nav>
	<div id = "left_bar">왼쪽 구역</div>
	<div id = "right_bar">오른쪽 구역</div>
	<header style="text-align : center;"><h3 class="header_text">배우고 싶어요</h3></header>
	
	<hr>
	
<!-- <div class = "ohw_content_table" align="center">
	<table class = "ohw_content_list">
		<tr>
			<th class = "ohw_content_no">글번호</th>
			<th class = "ohw_content_sub">제 목</th>
			<th class = "ohw_content_writer">작성자</th>
			<th class = "ohw_content_date">날 짜</th>
		</tr>
		
		<tr>
			<td class = "ohw_content_no">0001</td>
			<td class = "ohw_content_sub"><a>샘플 제목은 길어야 제맛이니까 길게 써본다.</a></td>
			<td class = "ohw_content_writer">샘플맨</td>
			<td class = "ohw_content_date">2018-03-30</td>
		</tr>		
		<tr>
			<td class = "ohw_content_no">0001</td>
			<td class = "ohw_content_sub"><a>샘플 제목은 길어야 제맛이니까 길게 써본다.</a></td>
			<td class = "ohw_content_writer">샘플맨</td>
			<td class = "ohw_content_date">2018-03-30</td>
		</tr>		
		<tr>
			<td class = "ohw_content_no">0001</td>
			<td class = "ohw_content_sub"><a>샘플 제목은 길어야 제맛이니까 길게 써본다.</a></td>
			<td class = "ohw_content_writer">샘플맨</td>
			<td class = "ohw_content_date">2018-03-30</td>
		</tr>		
		<tr>
			<td class = "ohw_content_no">0001</td>
			<td class = "ohw_content_sub"><a>샘플 제목은 길어야 제맛이니까 길게 써본다.</a></td>
			<td class = "ohw_content_writer">샘플맨</td>
			<td class = "ohw_content_date">2018-03-30</td>
		</tr>		
		<tr>
			<td class = "ohw_content_no">0001</td>
			<td class = "ohw_content_sub"><a>샘플 제목은 길어야 제맛이니까 길게 써본다.</a></td>
			<td class = "ohw_content_writer">샘플맨</td>
			<td class = "ohw_content_date">2018-03-30</td>
		</tr>		
		<tr>
			<td class = "ohw_content_no">0001</td>
			<td class = "ohw_content_sub"><a>샘플 제목은 길어야 제맛이니까 길게 써본다.</a></td>
			<td class = "ohw_content_writer">샘플맨</td>
			<td class = "ohw_content_date">2018-03-30</td>
		</tr>		
		<tr>
			<td class = "ohw_content_no">0001</td>
			<td class = "ohw_content_sub"><a>샘플 제목은 길어야 제맛이니까 길게 써본다.</a></td>
			<td class = "ohw_content_writer">샘플맨</td>
			<td class = "ohw_content_date">2018-03-30</td>
		</tr>		
		<tr>
			<td class = "ohw_content_no">0001</td>
			<td class = "ohw_content_sub"><a>샘플 제목은 길어야 제맛이니까 길게 써본다.</a></td>
			<td class = "ohw_content_writer">샘플맨</td>
			<td class = "ohw_content_date">2018-03-30</td>
		</tr>		
		<tr>
			<td class = "ohw_content_no">0001</td>
			<td class = "ohw_content_sub"><a>샘플 제목은 길어야 제맛이니까 길게 써본다.</a></td>
			<td class = "ohw_content_writer">샘플맨</td>
			<td class = "ohw_content_date">2018-03-30</td>
		</tr>				
	</table> -->
	
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
	
<div align="right">
	<a href="/prototype/03.OHW/views/find_learn.jsp"><input class = "btn btn-info" type = "button" value = "요청 등록"></a>
</div>
</div>

	<hr>
	
	<footer style = "margin-left:25%;"><%@ include file = "parts/footer.jsp" %></footer>
</body>
</html>