<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="lesson.model.vo.LessonDetail" %>    
<%@ page import="review.model.vo.Review" %>    
<% 
	LessonDetail lessondetail =(LessonDetail)request.getAttribute("lessondetail");
	ArrayList<Review> review = (ArrayList<Review>)request.getAttribute("review");
	int user_no = ((Integer)request.getAttribute("user_no"));
	String userimg = (String)request.getAttribute("userimg");
	double avga =((Double)request.getAttribute("avga")).doubleValue();
	int avgd = ((Integer)request.getAttribute("avgd")).intValue();
	int avgs = ((Integer)request.getAttribute("avgs")).intValue();
	int avgp = ((Integer)request.getAttribute("avgp")).intValue();
	double avgs1 = 0;
	double avgd1 = 0;
	double avgp1 = 0;
	double a = 0;
	
	//리뷰 있을시 값 구해주는 부분
	if(avgd != 0 && avgs != 0 && avgp != 0 && avga != 0) {
	avgs1 = (double)avgs/5*100;
	avgd1 = (double)avgd/5*100;
	avgp1 = (double)avgp/5*100;
	a = Math.round(avga*10d) / 10d;
	}
	
%>	
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript" src="/prototype/common\resources\js\jquery-3.3.1.min.js"></script>

<script type="text/javascript">

function popupReview(){
	var popUrl = "/prototype/review?no=<%= lessondetail.getLesson_no() %>" + "&userno=<%= user_no%>"; 
	//팝업창에 출력될 페이지 URL
	
	var popOption = "width=1050, height=900, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

		window.open(popUrl,"a",popOption);

	}
	

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
margin:0px auto;
width:1100px;
height:50px;
text-align: center;
padding:12px;
border: 1px solid #00ffff;
}

.topdetail{
margin:0 auto;
width:1100px;
height:310px;
border: 1px solid gray;
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

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>선생이름 님의 ...?</title>
</head>
<body>
<!-- 헤더 시작-->
<%@ include file="/common\navbar.jsp" %>
<!-- 헤더 종료-->

<!--내용물-->
	   <br>
       <h1 align="center">상세보기</h1>
       <hr>
<nav class="contents">
	<nav class="topbend"> <!--최상단 띠.-->
	이사람은 이사람은이사람은 이사람은이사람은 이사람은
	</nav>
	<nav class="topdetail"><!--선생소개-->
	<ul>
	<li class="topdiv" name="img">
		<ul>
		<li>
		<%if(userimg != null) { %>
		<img src="/prototype/userTitleimg/<%= userimg%>">
		<%}else { %>
		<img src="/prototype/userTitleimg/rakoon.jpg">
		<%} %>
		</li>
		
		<li class="underpic">
		<li>
		</li>
	</ul>	
	</li>
	<li class="topdiv" name="title">
		<ul style="list-style: none;">
			<li class=""><h3><%=lessondetail.getUser_name() %></h3>선생님</li>
			<li class=""><h1><%=lessondetail.getLesson_title() %></h1></li>
			<li class=""><br></li>
			<li class=""><h3>키워드></h3><h4> <%=lessondetail.getLesson_keyword() %></h4></li>
			
		</ul>
		</li>
		
		<li class="topdiv" name="option">
		조회수?<br>
		등록일?<br>
	
		</li>
		
		
	</ul>
	</nav>
	<!-- 강의료 부분 -->
	<div align="center" style="margin-top:2px;">
		<nav style="width:1100px; height:150px; border: 1px solid gray;">
			<div style="width:500px; height: 140px; float:left;">
			<h2>수강료</h2><br>
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
    <nav class="review"><!-- 리뷰란 -->
	<table border="1" style="width:100%">
	
	<% if(review.size() > 3 || review.size() == 2) {%>
	
	<tr>
		<td rowspan="2" style="width:35%;">
			<h3 align="center">평점 : <%= a %>/5</h3>
			 <hr style="clear:both;">
			<div class="col-xs-12 col-md-6" style="width:95%">
                        <div class="row rating-desc">
    
                            <div class="col-xs-3 col-md-3 text-right">
                                <span class="glyphicon glyphicon-star"></span>
                                	성실성
                            </div>
                            <div class="col-xs-8 col-md-9" >
                                <div class="progress">
                                    <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20"
                                        aria-valuemin="0" aria-valuemax="100" style="width: <%= avgs1%>%">
                                        <span class="sr-only">2.5</span>
                                    </div>
                                </div>
                            </div>
                            <hr style="clear:both;">
                            <!-- end 3 -->
                            <div class="col-xs-3 col-md-3 text-right">
                                <span class="glyphicon glyphicon-star"></span>준비성
                            </div>
                            <div class="col-xs-8 col-md-9">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="20"
                                        aria-valuemin="0" aria-valuemax="100" style="width: <%= avgp1%>%">
                                        <span class="sr-only">20%</span>
                                    </div>
                                </div>
                            </div>
                             <hr style="clear:both;">
                            <!-- end 2 -->
                            <div class="col-xs-3 col-md-3 text-right">
                                <span class="glyphicon glyphicon-star"></span>지식전달력
                            </div>
                            <div class="col-xs-8 col-md-9">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80"
                                        aria-valuemin="0" aria-valuemax="100" style="width: <%= avgd1%>%">
                                        <span class="sr-only">15%</span>
                                    </div>
                                </div>
                            </div>
                            <!-- end 1 -->
                        </div>
                        <!-- end row -->
                    </div>
	</td>
	
	<td style="padding: 10px;">
	<div class="row">
						<div class="col-sm-3">
							<%if(review.get(0).getUserPhoto() == null) {%>
							<img src="http://dummyimage.com/60x60/666/ffffff&text=No+Image" class="img-rounded">
							<%}else { %>
							<img src="/prototype/userTitleimg/<%=review.get(0).getUserPhoto() %>" class="img-rounded" style="width:60px; height:60px;">
							<%} %>
							<div class="review-block-name"><a href="#"><%=review.get(0).getUserName() %></a></div>
							<div class="review-block-date"><%=review.get(0).getReviewDate() %></div>
						</div>
						<div class="col-sm-9">
							<div class="review-block-rate">
							
							<%if(1 == (review.get(0).getReviewDelivery()+review.get(0).getReviewPrepare()+review.get(0).getReviewSincerity())/3){ %>
								<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
							
							<% }else if(2==(review.get(0).getReviewDelivery()+review.get(0).getReviewPrepare()+review.get(0).getReviewSincerity())/3) {%>
							
								<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
							
							<% }else if(3==(review.get(0).getReviewDelivery()+review.get(0).getReviewPrepare()+review.get(0).getReviewSincerity())/3) {%>
								
								<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<% }else if(4==(review.get(0).getReviewDelivery()+review.get(0).getReviewPrepare()+review.get(0).getReviewSincerity())/3) {%>
								
									<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<%}else if(5 == (review.get(0).getReviewDelivery()+review.get(0).getReviewPrepare()+review.get(0).getReviewSincerity())/3) {%>
								
									<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<%} %>
								
							</div>
							<div class="review-block-title"><br></div>
							<div class="review-block-description">
							<%=review.get(0).getReviewContent() %>
							</div>
						</div>
					</div>
	
		</td>
	</tr>
	
	<tr>
	<td style="padding: 10px;">
	<div class="row">
						<div class="col-sm-3">
							<%if(review.get(1).getUserPhoto() == null) {%>
							<img src="http://dummyimage.com/60x60/666/ffffff&text=No+Image" class="img-rounded">
							<%}else { %>
							<img src="/prototype/userTitleimg/<%=review.get(1).getUserPhoto() %>" class="img-rounded" style="width:60px; height:60px;">
							<%} %>
							<div class="review-block-name"><a href="#"><%=review.get(1).getUserName() %></a></div>
							<div class="review-block-date"><%=review.get(1).getReviewDate() %></div>
						</div>
						<div class="col-sm-9">
							<div class="review-block-rate">
									<%if(1 == (review.get(1).getReviewDelivery()+review.get(1).getReviewPrepare()+review.get(1).getReviewSincerity())/3){ %>
								<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
							
							<% }else if(2==(review.get(1).getReviewDelivery()+review.get(1).getReviewPrepare()+review.get(1).getReviewSincerity())/3) {%>
							
								<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
							
							<% }else if(3==(review.get(1).getReviewDelivery()+review.get(1).getReviewPrepare()+review.get(1).getReviewSincerity())/3) {%>
								
								<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<% }else if(4==(review.get(1).getReviewDelivery()+review.get(1).getReviewPrepare()+review.get(1).getReviewSincerity())/3) {%>
								
									<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<%}else if(5 == (review.get(1).getReviewDelivery()+review.get(1).getReviewPrepare()+review.get(1).getReviewSincerity())/3) {%>
								
									<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<%} %>
							</div>
							<div class="review-block-title"><br></div>
							<div class="review-block-description">
							<%=review.get(1).getReviewContent() %>
							</div>
								<div class="review-block-title" style="text-align:right;"><br>
								<a href="javascript:popupReview();">리뷰 더 보기></a></div>
						</div>
					</div>
	
	</td>
	</tr>
	
	<%}else if(review.size() == 1){ %>
		<tr>
		<td rowspan="2" style="width:35%;">
			<h3 align="center">평점 : <%= a %>/5</h3>
			 <hr style="clear:both;">
			<div class="col-xs-12 col-md-6" style="width:95%">
                        <div class="row rating-desc">
    
                            <div class="col-xs-3 col-md-3 text-right">
                                <span class="glyphicon glyphicon-star"></span>
                                	성실성
                            </div>
                            <div class="col-xs-8 col-md-9" >
                                <div class="progress">
                                    <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20"
                                        aria-valuemin="0" aria-valuemax="100" style="width: <%= avgs1%>%">
                                        <span class="sr-only">2.5</span>
                                    </div>
                                </div>
                            </div>
                            <hr style="clear:both;">
                            <!-- end 3 -->
                            <div class="col-xs-3 col-md-3 text-right">
                                <span class="glyphicon glyphicon-star"></span>준비성
                            </div>
                            <div class="col-xs-8 col-md-9">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="20"
                                        aria-valuemin="0" aria-valuemax="100" style="width: <%= avgp1%>%">
                                        <span class="sr-only">20%</span>
                                    </div>
                                </div>
                            </div>
                             <hr style="clear:both;">
                            <!-- end 2 -->
                            <div class="col-xs-3 col-md-3 text-right">
                                <span class="glyphicon glyphicon-star"></span>지식전달력
                            </div>
                            <div class="col-xs-8 col-md-9">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80"
                                        aria-valuemin="0" aria-valuemax="100" style="width: <%= avgd1%>%">
                                        <span class="sr-only">15%</span>
                                    </div>
                                </div>
                            </div>
                            <!-- end 1 -->
                        </div>
                        <!-- end row -->
                    </div>
	</td>
	
	<td style="padding: 10px;">
	<div class="row">
						<div class="col-sm-3">
							<%if(review.get(0).getUserPhoto() == null) {%>
							<img src="http://dummyimage.com/60x60/666/ffffff&text=No+Image" class="img-rounded">
							<%}else { %>
							<img src="/prototype/userTitleimg/<%=review.get(0).getUserPhoto() %>" class="img-rounded" style="width:60px; height:60px;">
							<%} %>
							<div class="review-block-name"><a href="#"><%=review.get(0).getUserName() %></a></div>
							<div class="review-block-date"><%=review.get(0).getReviewDate() %></div>
						</div>
						<div class="col-sm-9">
							<div class="review-block-rate">
							
							<%if(1 == (review.get(0).getReviewDelivery()+review.get(0).getReviewPrepare()+review.get(0).getReviewSincerity())/3){ %>
								<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
							
							<% }else if(2==(review.get(0).getReviewDelivery()+review.get(0).getReviewPrepare()+review.get(0).getReviewSincerity())/3) {%>
							
								<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
							
							<% }else if(3==(review.get(0).getReviewDelivery()+review.get(0).getReviewPrepare()+review.get(0).getReviewSincerity())/3) {%>
								
								<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<% }else if(4==(review.get(0).getReviewDelivery()+review.get(0).getReviewPrepare()+review.get(0).getReviewSincerity())/3) {%>
								
									<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<%}else if(5 == (review.get(0).getReviewDelivery()+review.get(0).getReviewPrepare()+review.get(0).getReviewSincerity())/3) {%>
								
									<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<%} %>
								
							</div>
							<div class="review-block-title"><br></div>
							<div class="review-block-description">
							<%=review.get(0).getReviewContent() %>
							</div>
						</div>
					</div>
	
		</td>
	</tr>
		
		<tr>
	<td style="padding: 10px;">
	<div class="row">
						<div class="col-sm-3">
							<img src="http://dummyimage.com/60x60/666/ffffff&text=No+Image" class="img-rounded">
							<div class="review-block-name"><a href="#">작성자</a></div>
							<div class="review-block-date"></div>
						</div>
						<div class="col-sm-9">
							<div class="review-block-rate">
								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
							</div>
							<div class="review-block-title"><br></div>
							<div class="review-block-description">
							리뷰가 아직 없습니다
							</div>
							<div class="review-block-title" style="text-align:right;"><br>
								<a href="javascript:popupReview();">리뷰 더 보기></a></div>
						</div>
					</div>
	
	</td>
	</tr>
	
		<%}else {%>
		<td rowspan="2" style="width:35%;">
			<h3 align="center">평점 : 0/5</h3>
			 <hr style="clear:both;">
			<div class="col-xs-12 col-md-6" style="width:95%">
                        <div class="row rating-desc">
    
                            <div class="col-xs-3 col-md-3 text-right">
                                <span class="glyphicon glyphicon-star"></span>
                                	성실성
                            </div>
                            <div class="col-xs-8 col-md-9" >
                                <div class="progress">
                                    <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20"
                                        aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                                        <span class="sr-only">2.5</span>
                                    </div>
                                </div>
                            </div>
                            <hr style="clear:both;">
                            <!-- end 3 -->
                            <div class="col-xs-3 col-md-3 text-right">
                                <span class="glyphicon glyphicon-star"></span>준비성
                            </div>
                            <div class="col-xs-8 col-md-9">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="20"
                                        aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                                        <span class="sr-only">20%</span>
                                    </div>
                                </div>
                            </div>
                             <hr style="clear:both;">
                            <!-- end 2 -->
                            <div class="col-xs-3 col-md-3 text-right">
                                <span class="glyphicon glyphicon-star"></span>지식전달력
                            </div>
                            <div class="col-xs-8 col-md-9">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80"
                                        aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                                        <span class="sr-only">15%</span>
                                    </div>
                                </div>
                            </div>
                            <!-- end 1 -->
                        </div>
                        <!-- end row -->
                    </div>
	</td>
	
	<td style="padding: 10px;">
	<div class="row">
						<div class="col-sm-3">
							<img src="http://dummyimage.com/60x60/666/ffffff&text=No+Image" class="img-rounded">
							<div class="review-block-name"><a href="#">작성자</a></div>
							<div class="review-block-date"></div>
						</div>
						<div class="col-sm-9">
							<div class="review-block-rate">
							
							
							
							
							<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
							
							
							
							
							
							
							
							</div>
							<div class="review-block-title"><br></div>
							<div class="review-block-description">
							리뷰가 아직 없습니다
							</div>
						</div>
					</div>
	
		</td>
	</tr>
	
	<tr>
	<td style="padding: 10px;">
	<div class="row">
						<div class="col-sm-3">
							<img src="http://dummyimage.com/60x60/666/ffffff&text=No+Image" class="img-rounded">
							<div class="review-block-name"><a href="#">작성자</a></div>
							<div class="review-block-date"></div>
						</div>
						<div class="col-sm-9">
							<div class="review-block-rate">
								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								
								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
							</div>
							<div class="review-block-title"><br></div>
							<div class="review-block-description">
							리뷰가 아직 없습니다
							</div>
						</div>
					</div>
	
	</td>
	</tr>
	<% } %>
	</table>
	</nav><!-- 리뷰란 종료 -->

	<nav class="school"><!--학력란-->
	
	<ul class="schoolofdetail">
		<li class="schoolOfdetailIOfli"><%=lessondetail.getLesson_loc()%></li>	
		<li class="schoolOfdetailIOfli">공부 쫌 잘함.!</li>	
		<li class="schoolOfdetailIOfli">집은 님근처로 이사감</li>
		<li class="schoolOfdetailIOfli">월 30만원! 20회수업!</li>
	</ul>
	
	</nav>


	<nav class="howteach" style="padding-top:10px;"><!--커리큘럼란-->
	
<div class="container" >

    <div class="col-md-6" Style="margin-left:150px; margin-top: 15px;">
   
        <div class="panel with-nav-tabs panel-info" Style="width:800px;">
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
                      <div style="padding: 10px; width: 770px; height: 300px;" id="map">
          
          
           
           </div>
                    
          
                    </div>
                    
                    <div class="tab-pane fade" id="tab2info">
                   <nav class="in1">
			<nav class="info1Oftop">
			<!-- 간단한소개 -->
			<%= lessondetail.getLesson_contop() %>
			
			</nav>
			<nav class="info1Oftop" id="info10">
			<!--  진행방식-->
			<%= lessondetail.getLesson_conmid() %>
			
			</nav>
			<nav class="info1Oftop">
			<!-- 수업경력과 포부 -->
			<%= lessondetail.getLesson_conbot() %>
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
                                        <div class="active item" data-slide-number="0">
                                        <img src="/prototype/lesson_upload/<%= lessondetail.getLesson_rename() %>"
                                        style="width:500px; height:500px"></div>

                                        <div class="item" data-slide-number="1">
                                        <img src="/prototype/lesson_upload/<%= lessondetail.getLesson_rename2() %>"
                                         style="width:500px; height:500px"></div>

                                        <div class="item" data-slide-number="2">
                                        <img src="/prototype/lesson_upload/<%= lessondetail.getLesson_rename3() %>"
                                         style="width:500px; height:500px"></div>

                                  
                                    
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


	</nav>

	<!--커리큘럼란 종료-->
</nav>


<!--내용 끝-->
<div align="center">
<input type="submit" value="강좌신청">&nbsp;<input type="submit" value="나가기">
</div>

 <!-- 바닥 -->
<%@ include file="/common/footer.jsp" %>
<!--바닥종료-->


</body>
</html>