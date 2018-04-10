<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@
    page import="proposal.model.vo.Proposal, users.model.vo.Users"
    %>
    <%
    Proposal pro=(Proposal)request.getAttribute("pro");
    Users user=(Users)request.getAttribute("user");
    %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>건의사항 상세보기</title>
<script type="text/javascript" src="/prototype/common\resources\js\jquery-3.3.1.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>
<%@include file="/common/navbar.jsp" %>
<%@include file="/01.CJS/sidebar.jsp" %>

<div class="container" style="margin-top: -500px; width: 800px; height: 800px;">
            <div class="col-sm-12">

                <div class="bs-calltoaction bs-calltoaction-default">
                    <div class="row">
                        <div class="col-md-9 cta-contents" border="1">
                            <h1 class="cta-title"><%=pro.getProposalTitle() %></h1><BR>
							<center>
						    유저아이디: <%=user.getUserEmail()%>
							등록일 : <%=pro.getProposalDate()%>
							조회수 : <%=pro.getProposalhit() %> 
							</center>
							
	                        <hr>
                            <div class="cta-desc">
                          <%=pro.getProposalContent() %>
                            </div>
                            <hr>
                            <%if(loginUser==null){}else{ if(loginUser.getUserNo()==user.getUserNo()){%>
                            <input type="button" value="수정하기">
                            <input type="button" value="삭제하기">
                            <%} }%>
                        	</div>
                        </div>
                </div>
			</div>
        </div>
<%@ include file="/common/footer.jsp"%>
</body>
</html>