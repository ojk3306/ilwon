<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/prototype/resources/js/jquery-3.3.1.min.js"></script>
<script src="/prototype/resources/vendor/jquery/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel='stylesheet' type='text/css'>
<link href="./button.css" rel='stylesheet' type='text/css'>

<style>
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
margin-top: 150px;
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
<body>
<%@include file="/header.jsp" %>

<div class="container" >
	<div class="row" >

       <div class="col-md-7">

<div class="panel panel-default">
  <div class="panel-heading">  <h4 >~~의 프로필</h4></div>
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

<h4 style="color:#00b1b1;">Prasad Shankar Huddedar </h4></span>
<span><p>Aspirant</p></span>            
            </div>
<div class="clearfix"></div>
<hr style="margin:5px 0 5px 0;">
 <form>
<div class="col-sm-5 col-xs-6 tital">
<strong>이름:</strong>&nbsp;여기에 값21323213122
</div>
<div class="col-sm-7 col-xs-6" style="font-size:medium;">
<INPUT TYPE="TEXT" placeholder="여기에 수정값">&nbsp;&nbsp;&nbsp;
</div>
<div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital">
<strong>이름:</strong>&nbsp;여기에 값21323213122
</div>
<div class="col-sm-7 col-xs-6" style="font-size:medium;">
<INPUT TYPE="TEXT" placeholder="여기에 수정값">&nbsp;&nbsp;&nbsp;
</div>
<div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital">
<strong>이름:</strong>&nbsp;여기에 값21323213122
</div>
<div class="col-sm-7 col-xs-6" style="font-size:medium;">
<INPUT TYPE="TEXT" placeholder="여기에 수정값">&nbsp;&nbsp;&nbsp;
</div>
<div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital">
<strong>이름:</strong>&nbsp;여기에 값21323213122
</div>
<div class="col-sm-7 col-xs-6" style="font-size:medium;">
<INPUT TYPE="TEXT" placeholder="여기에 수정값">&nbsp;&nbsp;&nbsp;
</div>
<div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital">
<strong>이름:</strong>&nbsp;여기에 값21323213122
</div>
<div class="col-sm-7 col-xs-6" style="font-size:medium;">
<INPUT TYPE="TEXT" placeholder="여기에 수정값">&nbsp;&nbsp;&nbsp;
</div>
<div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital">
<strong>이름:</strong>&nbsp;여기에 값21323213122
</div>
<div class="col-sm-7 col-xs-6" style="font-size:medium;">
<INPUT TYPE="TEXT" placeholder="여기에 수정값">&nbsp;&nbsp;&nbsp;
</div>
<div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital">
<strong>이름:</strong>&nbsp;여기에 값21323213122
</div>
<div class="col-sm-7 col-xs-6" style="font-size:medium;">
<INPUT TYPE="TEXT" placeholder="여기에 수정값">&nbsp;&nbsp;&nbsp;
</div>
<div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital">
<strong>이름:</strong>&nbsp;여기에 값21323213122
</div>
<div class="col-sm-7 col-xs-6" style="font-size:medium;">
<INPUT TYPE="TEXT" placeholder="여기에 수정값">&nbsp;&nbsp;&nbsp;
</div>
<div class="clearfix"></div>
<div class="bot-border"></div>



    <div class="row" >
        <div class="col-xs-12 col-sm-6 col-md-4 col-sm-offset-3 col-md-offset-4" Style="margin-left:30px;">
            <div class="panel panel-default" Style="width:300px; overflow: visible;">
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
            </div>            
        </div>
    </div>

<center><input type="reset"></center>
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


         


<%@include file="/footer.jsp" %>
</body>
</html>