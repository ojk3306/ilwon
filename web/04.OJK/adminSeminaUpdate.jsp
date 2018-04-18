<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page  import="semina.model.vo.*"%>  
<%@ page  import="seminaDetail.model.vo.*"%>  
<%@ page  import="users.model.vo.*"%> 
<% ArrayList<SeminaDetailAdmin> seminad = null;
	Semina semina = (Semina)request.getAttribute("semina"); 
    seminad = (ArrayList<SeminaDetailAdmin>)request.getAttribute("seminad");
    Users user = (Users)request.getAttribute("user");

%>
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
			url:"<%=request.getContextPath()%>/ausemina",
		    data:{ seminano:$("#semina_no").val(),value:"1",type:"1"},
			type:"get",
		    success:function(data){
		    	console.log(data)
		    	$("#TriSeaInfo").attr("checked", false);
		    }
		});
	}else{
		$.ajax({
			url:"<%=request.getContextPath()%>/ausemina",
		    data:{ seminano:$("#semina_no").val(),value:"3",type:"1"},
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
	    data:{lessonno:$("#semina_no").val(),value:$("#rekeyword").val(),type:"2"},
		type:"get",
	    success:function(data){
	    	console.log(data)
	    	$("#keyword").text(data);
	    }
	});
}

$(function(){
	
	
	if('<%=semina.getSEMINA_STATE()%>'== '3'){
	    $("#TriSeaInfo").attr("checked", true);     
	}else{
		$("#TriSeaInfo").attr("checked", false);
	}
})
</script>
<title>세미나 관리</title>
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
   <h4><%=semina.getSeminaTitle() %></h4></div>
   <div class="panel-body" >
       
    <div class="box box-info" >
        
            <div class="box-body" >
                     <div class="col-sm-6">
                     <div align="center"> 
                     
                     <%if(user.getUserRenamePhoto() != null) { %>
						<img alt="User Pic" style="width:200px; height: 180px; " src="/prototype/userTitleimg/<%=user.getUserRenamePhoto()%>" class="img-circle img-responsive"> 
					<% }else {%>
							<img src="/prototype/userTitleimg/rakoon.jpg"
							class="img-circle" alt="Cinque Terre" width="200px"
							height="200px">
					<%} %> 
                
              
   </div>
              
              <br>
    
              <!-- /input-group -->
</div>

 

<div class="clearfix" ></div>
<hr style="margin:5px 0 5px 0;">
 <form>
 <input type="hidden" id = "semina_no" value = "<%= semina.getSeminaNo()%>" >
<div class="col-sm-5 col-xs-6 tital"  >
<strong>이름:</strong>&nbsp;
<label id="username"></label>
</div>
<div class="col-sm-7 col-xs-6" style="font-size:medium;">
<label><%=semina.getUser_name() %></label>
</div>
<div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital">
<strong>이메일:</strong>&nbsp;
<label id="usermail"></label>
</div>
<div class="col-sm-7 col-xs-6" style="font-size:medium;">
<label><%=semina.getUser_email()%></label><!-- 이메일임  -->
</div>
<div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital">
<strong>수강료:</strong>&nbsp;
<label id="userage"></label>
</div>
<div class="col-sm-7 col-xs-6" style="font-size:medium;">
<label><%=semina.getSeminaPrice() %>&nbsp;만원</label>
</div>
<div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital">
<strong>최소인원:</strong>&nbsp;
<label id="usergender"></label>
</div>
<div class="col-sm-7 col-xs-6" style="font-size:medium;">
<label><%=semina.getSeminaMin() %>&nbsp;명</label>
</div>
<div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital">
<strong>최대인원:</strong>&nbsp;
<label id="userphone"></label>
</div>
<div class="col-sm-7 col-xs-6" style="font-size:medium;">
<label><%=semina.getSeminaMax() %>&nbsp;명</label>
</div>
<div class="clearfix"></div>
<div class="bot-border"></div>



<div class="col-sm-5 col-xs-6 tital">
<strong>세미나등록일:</strong>&nbsp;<%=semina.getSeminaStartDate() %>
</div>







                <!-- Default panel contents -->
                <br>
                <hr>
                <h3 class="panel-heading" style="text-align:center;">신청 학생</h3>
                <hr>
                <div style="width:100%; height: 200px; overflow:auto;" align="center">
                <table class="table table-hover" id="student_table" > 
						
							<tr>
								<th>이름</th>
								<th>이메일</th>
								<th>성별</th>
								<th>신청날짜</th>
							</tr>
							<% for (SeminaDetailAdmin s : seminad) {%>
							<tr>
								<td><%= s.getUser_name() %></td>
								<td><%= s.getUser_email() %></td>
								<td><%= s.getUser_gender() %></td>
								<td><%= s.getSeminaDetailDate() %></td>
							</tr>
							<%} %>
						
					</table>
					</div>
                <br>
                <h3 class="panel-heading" style="text-align:center;">세미나 설정</h3>
      
                <ul class="list-group">
                 
                    <li class="list-group-item">
 						     세미나 숨김
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