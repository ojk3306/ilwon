<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="users.model.vo.*" %>
    <%
    Users user=(Users)request.getAttribute("user");
    %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/prototype/common/resources/js/jquery-3.3.1.min.js"></script>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel='stylesheet' type='text/css'>
<style>
body {
background:#eeeeee;
}
.container{

}
.TriSea-technologies-Switch > input[type="checkbox"] {
    display: none;   
}

.TriSea-technologies-Switch > label {
    cursor: pointer;
    height: 0px;
    position: relative; 
    width: 40px;  
}

.TriSea-technologies-Switch > label::before {
    background: rgb(0, 0, 0);
    box-shadow: inset 0px 0px 10px rgba(0, 0, 0, 0.5);
    border-radius: 8px;
    content: '';
    height: 16px;
    margin-top: -8px;
    position:absolute;
    opacity: 0.3;
    transition: all 0.4s ease-in-out;
    width: 40px;
}
.TriSea-technologies-Switch > label::after {
    background: rgb(255, 255, 255);
    border-radius: 16px;
    box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.3);
    content: '';
    height: 24px;
    left: -4px;
    margin-top: -8px;
    position: absolute;
    top: -4px;
    transition: all 0.3s ease-in-out;
    width: 24px;
}
.TriSea-technologies-Switch > input[type="checkbox"]:checked + label::before {
    background: inherit;
    opacity: 0.5;
}
.TriSea-technologies-Switch > input[type="checkbox"]:checked + label::after {
    background: inherit;
    left: 20px;
}
.col-md-7{
margin-top: 50px;
margin-left: 190px;
}

#profile-image1 {
    cursor: pointer;
     width: 100px;
    height: 100px;
	border:2px solid #03b1ce ;}
	.tital{ 
	font-size:16px; font-weight:500;
	}
	 .bot-border{ 
	 border-bottom:1px #f8f8f8 solid;  margin:5px 0  5px 0
	 }	
	 
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body style="background:#eeeeee;">
<%@include file="/common/navbar.jsp" %>

<div class="container" >
	<div class="row" >
       <div class="col-md-7">
<div class="panel panel-default">
  <div class="panel-heading" style="background:#00ffff;">  <h4 ><%=user.getUserName() %>의 프로필</h4></div>
   <div class="panel-body">
       
    <div class="box box-info">
        
            <div class="box-body">
                     <div class="col-sm-6">
                     <div  align="center"> <img alt="User Pic" src="https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg" id="profile-image1" class="img-circle img-responsive"> 
                
                <input id="profile-image-upload" class="hidden" type="file">
<div style="color:#999;" >click here to change profile image</div>
                <!--Upload Image Js And Css-->
   </div>
              
              <br>
    
              <!-- /input-group -->
</div>
 <div class="col-sm-6">
<h4 style="color:#00b1b1;">Prasad Shankar Huddedar </h4>
<span>Aspirant</span>            
            </div>
<div class="clearfix"></div>
<hr style="margin:5px 0 5px 0;">
 <form>
<div class="col-sm-5 col-xs-6 tital">
<strong>이름:</strong>&nbsp;<%=user.getUserName() %>
</div>
<div class="col-sm-7 col-xs-6" style="font-size:medium;">
<INPUT TYPE="TEXT" value="<%=user.getUserName()%>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="btn btn-primary loading" value="이름 수정" readonly="readonly">

</div>
<div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital">
<strong>이메일:</strong>&nbsp;<%=user.getUserEmail()%>
</div>
<div class="col-sm-7 col-xs-6" style="font-size:medium;">
<INPUT TYPE="TEXT" value="<%=user.getUserEmail()%>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="btn btn-primary loading" value="메일 수정" readonly="readonly">
</div>
<div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital">
<strong>나이:</strong>&nbsp;<%=user.getUserAge()%>
</div>
<div class="col-sm-7 col-xs-6" style="font-size:medium;">
<INPUT TYPE="number" value="<%= user.getUserAge()%>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="btn btn-primary loading" value="나이 수정" readonly="readonly">
</div>
<div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital">
<strong>성별:</strong>&nbsp;<%=user.getUserGender()%>
</div>
<div class="col-sm-7 col-xs-6" style="font-size:medium;">
<INPUT TYPE="TEXT" placeholder="여기에 수정값">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="btn btn-primary loading" value="성별 수정" readonly="readonly">
</div>
<div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital">
<strong>전화번호:</strong>&nbsp;<%=user.getUserPhone()%>
</div>
<div class="col-sm-7 col-xs-6" style="font-size:medium;">
<INPUT TYPE="TEXT" placeholder="여기에 수정값">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="btn btn-primary loading" value="전번 수정" readonly="readonly">
</div>
<div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital">
<strong>최대 키워드수:</strong>&nbsp;<%=user.getUserKeywordCount() %>
</div>
<div class="col-sm-7 col-xs-6" style="font-size:medium;">
<INPUT TYPE="TEXT" placeholder="여기에 수정값">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="btn btn-primary loading" value="키워드 수정" readonly="readonly">
</div>
<div class="clearfix"></div>
<div class="bot-border"></div>
<div class="col-sm-5 col-xs-6 tital">

<strong>최대 강의수 :</strong>&nbsp;<%=user.getUserLessonmax() %>
</div>
<div class="col-sm-7 col-xs-6" style="font-size:medium;">
<INPUT TYPE="TEXT" placeholder="여기에 수정값">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="btn btn-primary loading" value="강의수 수정" readonly="readonly">
</div>
<div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital">
<strong>회원가입일:</strong>&nbsp;<%=user.getUserEnrollDate() %>
</div>







                <!-- Default panel contents -->
                <h2 class="panel-heading" style="text-align:center;">권한 설정</h2>
      
                <ul class="list-group">
                    <li class="list-group-item">
                        Bootstrap Switch Default
                        <div class="TriSea-technologies-Switch pull-right">
                            <input id="TriSeaDefault" name="TriSea1" type="checkbox"/>
                            <label for="TriSeaDefault" class="label-default"></label>
                        </div>
                    </li>
                    <li class="list-group-item">
                        Bootstrap Switch Primary
                        <div class="TriSea-technologies-Switch pull-right">
                            <input id="TriSeaPrimary" name="TriSea1" type="checkbox"/>
                            <label for="TriSeaPrimary" class="label-primary"></label>
                        </div>
                    </li>
                    <li class="list-group-item">
                        Bootstrap Switch Success
                        <div class="TriSea-technologies-Switch pull-right">
                            <input id="TriSeaSuccess" name="TriSea1" type="checkbox"/>
                            <label for="TriSeaSuccess" class="label-success"></label>
                        </div>
                    </li>
                    <li class="list-group-item">
                        Bootstrap Switch Info
                        <div class="TriSea-technologies-Switch pull-right">
                            <input id="TriSeaInfo" name="TriSea1" type="checkbox"/>
                            <label for="TriSeaInfo" class="label-info"></label>
                        </div>
                    </li>
                    <li class="list-group-item">
                        Bootstrap Switch Warning
                        <div class="TriSea-technologies-Switch pull-right">
                            <input id="TriSeaWarning" name="TriSea1" type="checkbox"/>
                            <label for="TriSeaWarning" class="label-warning"></label>
                        </div>
                    </li>
                    <li class="list-group-item">
                        Bootstrap Switch Danger
                        <div class="TriSea-technologies-Switch pull-right">
                            <input id="TriSeaDanger" name="TriSea1" type="checkbox"/>
                            <label for="TriSeaDanger" class="label-danger"></label>
                        </div>
                    </li>
                </ul>

<center>
<input type="submit" class="btn btn-primary loading" value="수정하기(수정은신중히)" readonly="readonly">
<input type="reset" class="btn btn-primary loading" value="초기화하기" readonly="readonly" >
<input type="button" class="btn btn-primary loading" value="뒤로가기" onclick="history.back(-1)" readonly="readonly">
</center>
</form>










            <!-- /.box-body -->
          </div>
          <!-- /.box -->

        </div>
       
            
    </div> 
    </div>
</div>  
    <script>
              $(function() {
    $('#profile-image1').on('click', function() {
        $('#profile-image-upload').click();
    });
});       
              </script>
   </div>
</div>


         

<%@include file="/common/footer.jsp" %>

</body>
</html>