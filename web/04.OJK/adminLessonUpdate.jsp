<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page  import="lesson.model.vo.*"%>  
<% Lesson lesson = (Lesson)request.getAttribute("lesson"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="/prototype/common/resources/js/jquery-3.3.1.min.js"></script>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel='stylesheet' type='text/css'>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">

function updatelessonview(){

	if($("#TriSeaInfo").is(":checked")!=true ) {
		$.ajax({
			url:"<%=request.getContextPath()%>/aulesson",
		    data:{ lessonno:$("#lesson_no").val(),value:"1",type:"1"},
			type:"get",
		    success:function(data){
		    	console.log(data)
		    	$("#TriSeaInfo").attr("checked", false);
		    }
		});
	}else{
		$.ajax({
			url:"<%=request.getContextPath()%>/aulesson",
		    data:{ lessonno:$("#lesson_no").val(),value:"3",type:"1"},
			type:"get",
		    success:function(data){
		    	console.log(data)
		    	 $("#TriSeaInfo").attr("checked", true);
		    }
		});
	}
}

function updatekeyword(){
	$.ajax({
		url:"<%=request.getContextPath()%>/aulesson",
	    data:{lessonno:$("#lesson_no").val(),value:$("#rekeyword").val(),type:"2"},
		type:"get",
	    success:function(data){
	    	console.log(data)
	    	$("#keyword").text(data);
	    }
	});
}
</script>
<title>강의 관리</title>
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
</head>

<body style="background:#eeeeee;">

<%@include file="/common/navbar.jsp" %>



<div class="container" style="height: 900px" >
	<div class="row" >
  <div class="col-md-7" Style="overflow:hidden;">
<div class="panel panel-default">
  <div class="panel-heading" style="background:#00ffff;"> 
   <h4><%=lesson.getLesson_title() %></h4></div>
   <div class="panel-body" >
       
    <div class="box box-info" >
        
            <div class="box-body" >
                     <div class="col-sm-6">
                     <div align="center"> <img alt="User Pic" src="https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg" id="profile-image1" class="img-circle img-responsive"> 
                
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

<div class="clearfix" ></div>
<hr style="margin:5px 0 5px 0;">
 <form>
 <input type="hidden" id = "lesson_no" value = "<%= lesson.getLesson_no()%>" >
<div class="col-sm-5 col-xs-6 tital"  >
<strong>이름:</strong>&nbsp;
<label id="username"></label>
</div>
<div class="col-sm-7 col-xs-6" style="font-size:medium;">
<label><%=lesson.getUser_name2() %></label>
</div>
<div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital">
<strong>이메일:</strong>&nbsp;
<label id="usermail"></label>
</div>
<div class="col-sm-7 col-xs-6" style="font-size:medium;">
<label><%=lesson.getUser_name1() %></label><!-- 이메일임  -->
</div>
<div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital">
<strong>수강료:</strong>&nbsp;
<label id="userage"></label>
</div>
<div class="col-sm-7 col-xs-6" style="font-size:medium;">
<label><%=lesson.getLesson_price() %>&nbsp;만원</label>
</div>
<div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital">
<strong>횟수:</strong>&nbsp;
<label id="usergender"></label>
</div>
<div class="col-sm-7 col-xs-6" style="font-size:medium;">
<label><%=lesson.getLesson_count() %>&nbsp;회</label>
</div>
<div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital">
<strong>키워드:</strong>&nbsp;
<label id="userphone"></label>
</div>
<div class="col-sm-7 col-xs-6" style="font-size:medium;">
<INPUT TYPE="TEXT" id="rekeyword" value="<%=lesson.getLesson_keyword()%>" placeholder=" ' ,' 로 키워드 구분해 주세요">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="btn btn-primary loading" value="키워드 수정" onclick="updatekeyword();" id="4"  readonly="readonly">
</div>
<div class="clearfix"></div>
<div class="bot-border"></div>



<div class="col-sm-5 col-xs-6 tital">
<strong>강의등록일:</strong>&nbsp;<%=lesson.getLesson_startdate() %>
</div>







                <!-- Default panel contents -->
                <br>
                <h2 class="panel-heading" style="text-align:center;">강의 설정</h2>
      
                <ul class="list-group">
                 
                    <li class="list-group-item">
 						     강의 숨김
                       <div class="TriSea-technologies-Switch pull-right">
                            <input id="TriSeaInfo" name="TriSea1" type="checkbox" onclick="updatelessonview()" checked="checked">
                            <label for="TriSeaInfo" class="label-info"></label>
                        </div>
                    </li>
                   </ul>

<center>

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