<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList, java.sql.Date" %> 
<%
ArrayList<Users> list=null;
	if((ArrayList<Users>)request.getAttribute("list")!=null){
	list = (ArrayList<Users>)request.getAttribute("list");
	int listCount = ((Integer)request.getAttribute("listCount")).intValue();
	int startPage = ((Integer)request.getAttribute("startPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer)request.getAttribute("maxPage")).intValue();			
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
    }

%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/prototype/common\resources\js\jquery-3.3.1.min.js"></script>


<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel='stylesheet' type='text/css'>

<title>관리자의 검색창</title>
<style type="text/css">
.panel-table .panel-body{
  padding:0;
}

.panel-table .panel-body .table-bordered{
  border-style: none;
  margin:0;
}

.panel-table .panel-body .table-bordered > thead > tr > th:first-of-type {
    text-align:center;
    width: 100px;
}

.panel-table .panel-body .table-bordered > thead > tr > th:last-of-type,
.panel-table .panel-body .table-bordered > tbody > tr > td:last-of-type {
  border-right: 0px;
}

.panel-table .panel-body .table-bordered > thead > tr > th:first-of-type,
.panel-table .panel-body .table-bordered > tbody > tr > td:first-of-type {
  border-left: 0px;
}

.panel-table .panel-body .table-bordered > tbody > tr:first-of-type > td{
  border-bottom: 0px;
}

.panel-table .panel-body .table-bordered > thead > tr:first-of-type > th{
  border-top: 0px;
}

.panel-table .panel-footer .pagination{
  margin:0; 
}

/*
used to vertically center elements, may need modification if you're not using default sizes.
*/
.panel-table .panel-footer .col{
 line-height: 34px;
 height: 34px;
}

.panel-table .panel-heading .col h3{
 line-height: 30px;
 height: 30px;
}

.panel-table .panel-body .table-bordered > tbody > tr > td{
  line-height: 34px;
}
.main{
margin-top:150px; 
min-height: 440px;
}
</style>
</head>
<body>
<%@include file="/common\navbar.jsp"%>

<%if(loginUser.getUserTypeNo()==1003){ %>
<!-- 관리자가 아닐시에 팅기게하는 문장 만들기. -->

<div class="main">
<div class="container">
    <div class="row">
       <div class="col-md-10 col-md-offset-1">

            <div class="panel panel-default panel-table">
              <div class="panel-heading">
                
                <div class="row">
                <div class="col col-xs-6 text-right" style="width: 100%;">
                  <form action="/prototype/adminseachuser" method="post">
                    <select style="height: 28px; margin-top:5px; bottom: 0;" name="type">
                 	 <option value="100">학생+선생+관리자(무관)</option>	
                  	 <option value="1001">학생</option>
                  	 <option value="1002">선생</option>
                  	 <option value="1003">관리자</option>
                  	 </select>
                  	 
                  	<select style="height: 28px; margin-top:5px" name="option">
                  	 <option value="1">모든설정으로검색(무관)</option>
                  	 <option value="2">이름으로검색</option>
                  	 <option value="3">이메일로검색</option>
                  	 <option value="4">현상태로검색</option>
                  	 <option value="5">나이로 검색 (오차한계 2살) </option>
                  	 <option value="6">성별로검색</option>
                  	 <option value="7">주소로검색</option>
                  	 <option value="8">전화번호로검색</option>
                  	 
                  	 </select>
                  	<input type="text" placeholder="입력" style="height: 28px" name="seach">
                  	
                    <button type="submit" class="btn btn-sm btn-primary btn-create">검색!</button>
                    </form>
                  </div>
                </div>
                
                
                
              </div>
              <div class="panel-body">
                <table class="table table-striped table-bordered table-list">
                  <thead>
                    <tr>
                  <th><em class="fa fa-cog">수정</em></th>
                        <th class="hidden-xs">유저 분류</th>
                        <th>이름</th>
                        <th>메일</th>
                        <th>전화번호</th>
                        <th>성별</th>
                        <th>제한 상태</th>
					 </tr> 
                  </thead>
                  <tbody>
                  	<% if(list!=null){for(Users i: list){ %>
                  
                  <tr>
                            <td align="center">
                            <a class="btn btn-default" onclick="location.href="><em class="fa fa-pencil"></em></a>
                  			</td>
                            <td class="hidden-xs">선생인지, 학생인지</td>
                            <td>John Doe</td>
                            <td>johndoe@example.com</td>
                            <td>정상인지,차단인지</td>
                          
                          
                   </tr>
                        
                        
                        
                        <%}%> 
                  	<%}else{%> 
                  		
                  	
                  	 <tr><th colspan="7" align="center">값을입력하세요</th></tr>
                  	
                  	
                  	
                  <%}%>
                   
                   
                   
                   
                   
                   
                    </tbody>
                </table>
            
              </div>
              <div class="panel-footer">
                <div class="row">
                  <div class="col col-xs-8">
                    <ul class="pagination hidden-xs pull-right">
                       <li><a href="#">«</a></li>
                        <li><a href="#"><</a></li>
                      <li><a href="#">1</a></li>
                      <li><a href="#">2</a></li>
                      <li><a href="#">3</a></li>
                      <li><a href="#">4</a></li>
                      <li><a href="#">5</a></li>
                      
                     <li><a href="#">></a></li>
                     <li><a href="#">»</a></li>
                    </ul>
                    <ul class="pagination visible-xs pull-right">
                        <li><a href="#">«</a></li>
                        <li><a href="#">»</a></li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>

</div></div></div>

</div>
<%} %>
<%@ include file="/common/footer.jsp" %>
</body>
</html>