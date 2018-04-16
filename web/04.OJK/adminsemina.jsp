<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="login.jsp" %>
<%@ page  import="semina.model.vo.*"%>    
<%
	ArrayList<Semina> semina=(ArrayList<Semina>)request.getAttribute("semina");
 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/prototype/common\resources\js\jquery-3.3.1.min.js"></script>

<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel='stylesheet' type='text/css'>
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
<title>세미나관리</title>
</head>
<body>
<%@include file="/common\navbar.jsp"%>
<%if(loginUser.getUserTypeNo()==1003){ %>
<!-- 관리자가 아닐시에 팅기게하는 문장 만들기. -->

<div class="main" style="height: 600px">
<div class="container">
    <div class="row">
       <div class="col-md-10 col-md-offset-1">

            <div class="panel panel-default panel-table" style="margin-top: -100px;">
              <div class="panel-heading">
                <div class="row">
                	<div class="col col-xs-6 text-right" style="width: 100%;">
                	  <form action="/prototype/adminsearchlesson" method="post">
                  		<select style="height: 28px; margin-top:5px" name="option">
                  	
                  	 		<option value="1">모든설정으로검색(무관)</option>
                  	 		<option value="2">이름으로검색</option>
                  	 		<option value="3">이메일로검색</option>
                  	 		<option value="4">상태로 검색(1=강의중,2=숨김,3=삭제)</option>
                  	 		<option value="5">제목으로검색</option>
                  	 		<option value="6">카테고리로검색</option>
                  	 		<option value="7">키워드로검색</option>
                  	 
                  		</select>
                  	 
                  	<input type="text" placeholder="입력" style="height: 28px" name="search" required>
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
                        <th>세미나제목</th>
                        <th>이름</th>
                        <th>이메일</th>
                        <th>상태</th>
					</tr> 
                  </thead>
                  <tbody>
                	<%for(Semina s : semina) { %>
                		<tr>
                			<td align="center">
                         		<a class="btn btn-default" onclick="location.href='/prototype/auseminav?no=<%=s.getSeminaNo() %>'">
                            		<em class="fa fa-pencil" >
                            		</em>
                            	</a>
                  			</td>
                			<td><%=s.getSeminaTitle() %></td>
                			<td><%=s.getUser_name() %></td>
                			<td><%=s.getUser_email() %></td> <!--이메일 불러오는 겁니다-->
                			<td><%=s.getSEMINA_STATE() %></td>
                		</tr>
                	<%} %>
                		
                  </tbody>
                </table>
              </div>
             </div>
            </div>
           </div>	
          </div>
</div>

<%} %>

<%@ include file="/common/footer.jsp" %>
</body>
</html>