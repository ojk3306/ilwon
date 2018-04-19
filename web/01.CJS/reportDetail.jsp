<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@
    page import="report.model.vo.Report, users.model.vo.Users"
    %>
    <%
    Report pro=(Report)request.getAttribute("list");
    Users user=(Users)request.getAttribute("user");
    Users use=(Users)session.getAttribute("loginUser");  

    %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신고 상세보기</title>
<script type="text/javascript" src="/prototype/common\resources\js\jquery-3.3.1.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
if(<%=use.getUserTypeNo()%> != 1003 )
	location.href="/prototype/index.jsp";
</script>
<style type="text/css">
.btn-label {position: relative;left: -12px;display: inline-block;padding: 6px 12px;background: rgba(0,0,0,0.15);border-radius: 3px 0 0 3px;}
.btn-labeled {padding-top: 0;padding-bottom: 0;}
.btn { margin-bottom:10px; }</style>
</head>

<body style="background:#f3f4f5 ">
<%@include file="/common/navbar.jsp" %>

 
<div class="container" style="margin-top: 100px; width: 800px; height: 800px;">
            <div class="col-sm-12">

                <div class="bs-calltoaction bs-calltoaction-default">
                    <div class="row">
                        <div class="col-md-9 cta-contents" border="1">
                            <h1 class="cta-title"><%=pro.getReportTitle() %></h1><BR>
							<center>
						    유저아이디: <%=user.getUserEmail()%><br>
							등록일 : <%=pro.getReportDate()%>
							
							</center>
							
	                        <hr>
                            <div class="cta-desc">
                            <textarea maxlength="3000" rows="20" style="width:100%; background:#f3f4f5; border: 0" readonly="readonly">
                          <%=pro.getReportContent() %>
                         
						 </textarea>
                          <%if(pro.getReportRenameFileName() == null){}else{%>
                          <img style="width:100%; background:#f3f4f5; border: 0" readonly="readonly" src="<%=request.getContextPath()%>/reportimg/<%=pro.getReportRenameFileName()%>">
                           <%} %>
                           
                           
                           </div>
                            <hr>
                      
                        	</div>
                        </div>
                </div>
			</div>
        </div>
<%@ include file="/common/footer.jsp"%>
</body>
</html>