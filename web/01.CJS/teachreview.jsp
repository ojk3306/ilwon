<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/prototype/common/resources/js/jquery-3.3.1.min.js"></script>

<script type="text/javascript" src="/prototype/common/resources/js/jquery-3.3.1.min.js"></script>

<script type="text/javascript">

</script>
	
<style type="text/css">
/* 스타 별점 */

/*스타별점 */

body {
margin: 0;
height: 90%; 
background:#eeeeee;
}
.contents{

margin-top:-20px;
padding-top:90px;

background:#eeeeee;
}
.container{
margin-top:-10px;
overflow: hidden;
position: absolute;
} 


.topbend{
background:#00ffff;
margin:0px auto;
width:900px;
height:50px;
text-align: center;
padding:12px;
border: 1px solid #00ffff;
border-radius:5px 5px 0px 0px;
}

.topdetail{
margin:0 auto;
width:900px;
height:280px;
border: 1px solid #ffffff;
background:#ffffff;
border-radius: 0 0 5px 5px;
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
width:400px;
height:300px;
}

.topdiv[name=option]{
width:90px;
height:300px;

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
width:900px;
min-height:250px;
background:#ffffff;
border-radius: 5px;
padding:15px;
}

.reviewtop{/*리뷰의 상위*/
list-style:none;
padding-top:5px;
}
.reviewdetail{/*리뷰의 내용이 들어감. (li)*/
padding-top:30px;
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
       
<nav class="contents">
	<nav class="topbend"> <!--최상단 띠.-->
	이사람은 이사람은이사람은 이사람은이사람은 이사람은
	</nav>
	<nav class="topdetail"><!--선생소개-->
	<ul>
	<li class="topdiv" name="img">
		<ul>
		<li>
		
		<img src="./img/tech.jpg">
		</li>
		
		<li class="underpic">
		나이 이름
		<br>
		완료함.!
		</li>
	</ul>	
	</li>
		<li class="topdiv" name="title">
		<ul style="list-style: none;">
			<li class="">타이틀넣기</li>
			<li class=""> 태그넣기</li>
			<li class=""> 점수내용</li>
			<li class=""> 점수넣기</li>
		</ul>
		</li>
		
		
		<li class="topdiv" name="option">
		조회수?<br>
		등록일?<br>
		<div class="imticon">
		<%@ include file="/01.CJS\imticon.jsp" %>
		</div>>
		</li>
		
		
	</ul>
	</nav>
    <nav class="review"><!-- 리뷰란 -->
	<table style="width:100%">
	
	<tr>
	<td rowspan="3" style="width:35%; border-right: 1px solid #eeeeee;">
	 
			<h3 align="center">평점 :3/5</h3>
			 <hr style="clear:both; border: 0;">
			<div class="col-xs-12 col-md-6" style="width:95%">
                        <div class="row rating-desc">

                            <div class="col-xs-3 col-md-3 text-right">
                            <span class="glyphicon glyphicon-star"></span>성실
                            </div>
                            <div class="col-xs-8 col-md-9" >
                                <div class="progress">
                                    <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20"
                                        aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                        <span class="sr-only">2.5</span>
                                    </div>
                                </div>
                            </div>
                            <hr style="clear:both; border: 0;">
                            <!-- end 3 -->
                            <div class="col-xs-3 col-md-3 text-right">
                                <span class="glyphicon glyphicon-star"></span>준비
                            </div>
                            <div class="col-xs-8 col-md-9">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="20"
                                        aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                        <span class="sr-only">20%</span>
                                    </div>
                                </div>
                            </div>
                             <hr style="clear:both; border: 0;">
                            <!-- end 2 -->
                            <div class="col-xs-3 col-md-3 text-right">
                                <span class="glyphicon glyphicon-star"></span>지식전달력
                            </div>
                            <div class="col-xs-8 col-md-9">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80"
                                        aria-valuemin="0" aria-valuemax="100" style="width: 15%">
                                        <span class="sr-only">15%</span>
                                    </div>
                                </div>
                            </div>
                            <!-- end 1 -->
                        </div>
                        <!-- end row -->
                    </div>
	

	</td>
	
	<td style="padding: 10px; height: 45%;">
	<div class="row">
						<div class="col-sm-3">
							<img src="http://dummyimage.com/60x60/666/ffffff&text=No+Image" class="img-rounded">
							<div class="review-block-name"><a href="#">리뷰남긴사람 이름.</a></div>
							<div class="review-block-date">년도, 월<br/>시각</div>
						</div>
						<div class="col-sm-9">
							<div class="review-block-rate">
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
							</div>
							<div class="review-block-title">제목</div>
							<div class="review-block-description">
							여기에 리뷰 를 넣는다. 
							일단,버튼의 클래스로 점수를 나눌수있다.
							</div>
						</div>
					</div>
	
	</td>
	
	</tr>
	
	<tr>
	<td style="padding: 10px; height: 45%;">
	<div class="row">
						<div class="col-sm-3">
							<img src="http://dummyimage.com/60x60/666/ffffff&text=No+Image" class="img-rounded">
							<div class="review-block-name"><a href="#">리뷰남긴사람 이름.</a></div>
							<div class="review-block-date">년도, 월<br/>시각</div>
						</div>
						<div class="col-sm-9">
							<div class="review-block-rate">
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
							</div>
							<div class="review-block-title">제목</div>
							<div class="review-block-description">
							여기에 리뷰 를 넣는다. 
							일단,버튼의 클래스로 점수를 나눌수있다.
							</div>
						</div>
					</div>
	
	</td>
	
	</tr>
	
	<TR>
	
	<TD  align="right"  style=" height:5%;"> 
	</TD>
	
	</TR>
	</table>
	</nav><!-- 리뷰란 종료 -->


 <div style="margin-top: -60px;"><%@ include file="/common/footer.jsp" %></div>

<!--바닥종료-->


</body>
</html>