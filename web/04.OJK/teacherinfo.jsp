<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>선생정보보기</title>
</head>
<body>
<%@include file="/common/navbar.jsp" %>

<nav class="contents">
 
	<h1 align="center">선생 정보 보기</h1>
	<hr>

	<div id="wrapper">
		<div align="center">
			<div id="info"
				style="width: 1100px; height: 300px; border: 1px solid gray; margin-top: 50px;">
				<div style="width: 100%; height: 230px; background: #f2f2f2;">
					<div
						style="width: 250px; height: 230px; float: left; margin-top: 10px; padding: 5px;">
						<img src="/prototype/common/resources/img/testimonials-1.jpg"
							class="img-circle" alt="Cinque Terre" width="200px"
							height="200px">
					</div>
					<div style="float: left; margin-top: 20px;">
						<span style="font-weight: bold; font-size: 25pt;"><%= loginUser.getUserName() %> 님</span>
					</div>


				</div>
				<div style="width: 100%; height: 70px; padding: 20px;">
					<button type="button" class="btn">개인정보 수정하기</button>
					&nbsp;
					<button type="button" class="btn">프로필 사진 수정</button>
					&nbsp;
					<button type="button" class="btn">메세지 보기</button>
					&nbsp;
					<button type="button" class="btn">건의/신고 내역</button>


				</div>


			</div>
			<br> <br>
			<h1>운영중인 강좌</h1>
			<hr>
			<div id="info"
				style="width: 1100px; height: 300px; border: 1px solid gray; margin-top: 50px;">
				<div style="width:100%;">
					<table class="table table-hover" >
						<thead>
							<tr>
								<th>강의명</th>
								<th>과목</th>
								<th>상세보기</th>
								<th>수정하기</th>
								<th>종료하기</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>java강의</td>
								<td>Doe</td>
								<td><button type="button" class="btn">Basic</button></td>
								<td><button type="button" class="btn">Basic</button></td>
								<td><button type="button" class="btn">상세보기</button></td>
							</tr>
							<tr>
								<td>Mary</td>
								<td>Moe</td>
								<td><button type="button" class="btn">Basic</button></td>
								<td><button type="button" class="btn">후기작성</button></td>
								<td><button type="button" class="btn">상세보기</button></td>
							</tr>
							<tr>
								<td>July</td>
								<td>Dooley</td>
								<td><button type="button" class="btn">Basic</button></td>
								<td><button type="button" class="btn">후기작성</button></td>
								<td><button type="button" class="btn">상세보기</button></td>
							</tr>
							<tr>
								<td>July</td>
								<td>Dooley</td>
								<td><button type="button" class="btn">Basic</button></td>	
								<td><button type="button" class="btn">후기작성</button></td>
								<td><button type="button" class="btn">상세보기</button></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div style="width: 1100px; height: 70px; padding: 10px; margin-left: 909px;">
				<button type="button" class="btn btn-info" onclick="location.href = 'insertclass2.jsp' ">강의 등록</button>
			</div>
			<br> <br>
			<h1>강의 내역</h1>
			<hr>
			<div id="info"
				style="width: 1100px; height: 300px; border: 1px solid gray; margin-top: 50px;">
				<div style="width:100%;">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>강의명</th>
								<th>과목</th>
								<th>상세보기</th>
								<th>리뷰보기</th>
								<th>삭제하기</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>java강의</td>
								<td>Doe</td>
								<td><button type="button" class="btn">Basic</button></td>
								<td><button type="button" class="btn">Basic</button></td>
								<td><button type="button" class="btn btn-danger">삭제</button></td>
							</tr>
							<tr>
								<td>Mary</td>
								<td>Moe</td>
								<td><button type="button" class="btn">후기작성</button></td>
								<td><button type="button" class="btn">Basic</button></td>
								<td><button type="button" class="btn btn-danger">삭제</button></td>
							</tr>
							<tr>
								<td>July</td>
								<td>Dooley</td>
								<td><button type="button" class="btn">Basic</button></td>
								<td><button type="button" class="btn">후기작성</button></td>
								<td><button type="button" class="btn btn-danger">삭제</button></td>
							</tr>
							<tr>
								<td>July</td>
								<td>Dooley</td>
								<td><button type="button" class="btn">Basic</button></td>
								<td><button type="button" class="btn">후기작성</button></td>
								<td><button type="button" class="btn btn-danger">삭제</button></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<br> <br> <br> <br><br>
			<h1>학생 신청 내역</h1>
			<hr>

			<div id="info"
				style="width: 1100px; height: 300px; border: 1px solid gray; margin-top: 50px;">
				<div style="width:100%;">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>강의명</th>
								<th>과목</th>
								<th>학생명</th>
								<th>상세보기</th>
								<th>수락</th>
								<th>거절</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>java강의</td>
								<td>컴퓨터/IT</td>
								<td>오주경</td>
								<td><button type="button" class="btn">취소</button></td>
								<td><button type="button" class="btn">상세보기</button></td>
								<td><button type="button" class="btn">상세보기</button></td>
							</tr>
							<tr>
								<td>Mary</td>
								<td>Moe</td>
								<td>mary@example.com</td>
								<td><button type="button" class="btn">취소</button></td>
								<td><button type="button" class="btn">상세보기</button></td>
								<td><button type="button" class="btn">상세보기</button></td>
							</tr>
							<tr>
								<td>July</td>
								<td>Dooley</td>
								<td>july@example.com</td>
								<td><button type="button" class="btn">취소</button></td>
								<td><button type="button" class="btn">상세보기</button></td>
								<td><button type="button" class="btn">상세보기</button></td>
							</tr>
							<tr>
								<td>July</td>
								<td>Dooley</td>
								<td>july@example.com</td>
								<td><button type="button" class="btn">취소</button></td>
								<td><button type="button" class="btn">상세보기</button></td>
								<td><button type="button" class="btn">상세보기</button></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>   




	</nav>

</body>
</html>