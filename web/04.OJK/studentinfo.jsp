<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="/common/navbar.jsp" %>

<nav class="contents">

	<h1 align="center">학생 정보 보기</h1>
	<hr>

	<div id="wrapper">
		<div align="center">
			<div id="info"
				style="width: 1100px; height: 300px; border: 1px solid gray; margin-top: 50px;">
				<div style="width: 100%; height: 230px; background: #f2f2f2;">
					<div
						style="width: 250px; height: 230px; float: left; margin-top: 10px; padding: 5px;">
						<img src="/prototype/resources/img/testimonials-1.jpg"
							class="img-circle" alt="Cinque Terre" width="200px"
							height="200px">
					</div>
					<div style="float: left; margin-top: 20px;">
						<span style="font-weight: bold; font-size: 15pt;">userid 님</span>
					</div>


				</div>
				<div style="width: 100%; height: 70px; padding: 20px;">
					<button type="button" class="btn">개인정보 수정하기</button>
					&nbsp;
					<button type="button" class="btn">프로필 사진 수정</button>
					&nbsp;
					<button type="button" class="btn">메세지 보기</button>
					&nbsp;
					<button type="button" class="btn">게시판 이용내역 보기</button>


				</div>


			</div>
			<br> <br>
			<h1>진행중인 강의</h1>
			<hr>
			<div id="info"
				style="width: 1100px; height: 300px; border: 1px solid gray; margin-top: 50px;">
				<div style="width:100%;">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>강의명</th>
								<th>선생님</th>
								<th>과목</th>
								<th>후기작성</th>
								<th>상세보기</th>
								<th>상태보기</th>
								<th>취소하기</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>java강의</td>
								<td>Doe</td>
								<td>컴퓨터/IT</td>
								<td><button type="button" class="btn">Basic</button></td>
								<td><button type="button" class="btn">상세보기</button></td>
								<td><button type="button" class="btn btn-success">수강중</button></td>
								<td><button type="button" class="btn btn-danger">취소</button></td>
							</tr>
							<tr>
								<td>Mary</td>
								<td>Moe</td>
								<td>mary@example.com</td>
								<td><button type="button" class="btn">후기작성</button></td>
								<td><button type="button" class="btn">상세보기</button></td>
								<td><button type="button" class="btn btn-warning">신청중</button></td>
								<td><button type="button" class="btn btn-danger">취소</button></td>
							</tr>
							<tr>
								<td>July</td>
								<td>Dooley</td>
								<td>july@example.com</td>
								<td><button type="button" class="btn">후기작성</button></td>
								<td><button type="button" class="btn">상세보기</button></td>
								<td><button type="button" class="btn">상태</button></td>
								<td><button type="button" class="btn btn-danger">취소</button></td>
							</tr>
							<tr>
								<td>July</td>
								<td>Dooley</td>
								<td>july@example.com</td>
								<td><button type="button" class="btn">후기작성</button></td>
								<td><button type="button" class="btn">상세보기</button></td>
								<td><button type="button" class="btn">상태</button></td>
								<td><button type="button" class="btn btn-danger">취소</button></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<br> <br>
			<h1>수강내역</h1>
			<hr>

			<div id="info"
				style="width: 1100px; height: 300px; border: 1px solid gray; margin-top: 50px;">
				<div style="width:100%;">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>강의명</th>
								<th>선생님</th>
								<th>과목</th>
								<th>리뷰쓰기</th>
								<th>상세보기</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>java강의</td>
								<td>Doe</td>
								<td>컴퓨터/IT</td>
								<td><button type="button" class="btn">리뷰</button></td>
								<td><button type="button" class="btn">상세보기</button></td>
								<td><button type="button" class="btn btn-danger">거절됨</button></td>
								
							</tr>
							<tr>
								<td>Mary</td>
								<td>Moe</td>
								<td>mary@example.com</td>
								<td><button type="button" class="btn">취소</button></td>
								<td><button type="button" class="btn">상세보기</button></td>
								<td><button type="button" class="btn btn-primary">수업종료</button></td>
							</tr>
							<tr>
								<td>July</td>
								<td>Dooley</td>
								<td>july@example.com</td>
								<td><button type="button" class="btn">취소</button></td>
								<td><button type="button" class="btn">상세보기</button></td>
								<td><button type="button" class="btn btn-primary">수업종료</button></td>
							</tr>
							<tr>
								<td>July</td>
								<td>Dooley</td>
								<td>july@example.com</td>
								<td><button type="button" class="btn">취소</button></td>
								<td><button type="button" class="btn">상세보기</button></td>
								<td><button type="button" class="btn btn-primary">수업종료</button></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		
		
		<!-- 탭으로 변경해보자 -->
		
	<!-- 	<div class="container" >

    <div class="col-md-6" Style="margin-top: 15px;">
   
        <div class="panel with-nav-tabs panel-info" Style="width:1200px;">
            <div class="panel-heading">
                <ul class="nav nav-tabs">
                    <li class="active">
                    <a href="#tab1info" data-toggle="tab">위치와 반경</a></li>
                    <li><a href="#tab2info" data-toggle="tab">수업방식</a></li>
                    <li><a href="#tab3info" data-toggle="tab">포트폴리오</a></li>

            
        
                </ul>
            </div>
            
            
            <div class="panel-body">
            
            
            <div class="tab-content">
                    
                    <div class="tab-pane fade in active" id="tab1info">
                      <div style="padding: 10px">
          
          
         <h1>수강 신청 내역</h1>
			<hr>

			<div id="info"
				style="width: 1100px; height: 300px; border: 1px solid gray; margin-top: 50px;">
				<div style="width:100%;">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>강의명</th>
								<th>선생님</th>
								<th>과목</th>
								<th>취소하기</th>
								<th>상세보기</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>java강의</td>
								<td>Doe</td>
								<td>컴퓨터/IT</td>
								<td><button type="button" class="btn">취소</button></td>
								<td><button type="button" class="btn">상세보기</button></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
          
          
          
           
           </div>
                    
                   	</div>
                    </div>
                    </div>
                    </div>
                    </div>
                    </div> -->
		
		
	</div>




	</nav>

</body>
</html>