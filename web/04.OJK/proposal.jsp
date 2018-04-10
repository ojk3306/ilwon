<%@page import="proposal.model.vo.Proposal"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
    ArrayList<Proposal> pro=(ArrayList<Proposal>)request.getAttribute("list");

    int listCount = ((Integer)request.getAttribute("listCount")).intValue();
	int startPage = ((Integer)request.getAttribute("startPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer)request.getAttribute("maxPage")).intValue();			
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
	
	
	int seachOption =((Integer)request.getAttribute("seachoption")).intValue();
	
	String search = (String)request.getAttribute("search");
	
	
	String message=null;
	if((String)request.getAttribute("message")!=null)	
		 message=(String)request.getAttribute("message");	

	String message1=null;
	if((String)request.getAttribute("message1")!=null)	
	message=(String)request.getAttribute("message1");	

	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건의게시판</title>
<script type="text/javascript" src="/prototype/common\resources\js\jquery-3.3.1.min.js"></script>
<script type="text/javascript">
function retu(){
	return false;
}

$(function(){
	if(<%=message1%>!=null)
		alert(<%=message1%>);
	
	
	$("#select_id").val(<%=seachOption%>).prop("selected", true);
})


</script>
</head>
<body> 
<%@ include file="/common/navbar.jsp" %>
<%@ include file="/01.CJS\sidebar.jsp" %>
<nav class="contents" style="margin-top: -600px;">
	<br>
	<h1 align="center">건의게시판</h1>
	<hr>
	<section>
	<div align="center" width="500">
	<div style="width: 900px; height: 800px;">
		 	<div style="padding: 10px; padding-right: 0px; float:right;">
		 		<button type="button" class="btn" onclick="location.href='/prototype/04.OJK/proposalForm.jsp'">글쓰기</button>
		 		
		 	</div>
		 	 <!-- 게시판 몸통 -->	
		 	 
		 	<div style="margin-top: 30px;">
		 	<table class="table table-hover">
		 		
		 		<tr>
		 			<th>제목</th>
		 			<th>작성일</th>
		 			<th>조회수</th>
		 		</tr>
				<%if(pro.size()!=0){ %>
		 		<% for(Proposal pr : pro) { %>
		 		<tr>
		 		
		 			<td><a href="/prototype/prodetail?pno=<%=pr.getProposalNo() %>"><%=pr.getProposalTitle() %></a></td>
		 			<td><%=pr.getProposalDate() %></td>
		 			<td><%=pr.getProposalhit() %></td>
		 			
		 		</tr>
		 		<%}}else{ %>
		 		<th><h3><%=message%></h3></th>
		 		
		 		<%} %>
		 	</table>
		 	
		 	</div>
		 	
		 	
		 	
		 	<!-- 게시판 몸통끝 -->
	 		<div>
	 		
	 		
	 		    <form action="/prototype/plist" method="post">
	 			<select name="serchoption" id="select_id" style="height: 25px; margin-top:70px; ">
				  <option value="1">제목</option>
				  <option value="2">내용</option>
				  <option value="3">작성자</option>
				</select>
				<%if(search!=null) {%>
	 			<input type="text" name="search" value="<%=search%>">	 
	 			<% }else{ %>
	 			<input type="text" name="search" placeholder="검색을해주세요">	 
	 			<%} %>
	 			<input type="submit" class="btn" value="검색">
	 			</form>	
	 		</div>
	 		<div id="board_page">
	 		<ul class="pagination">
	 		
	 		
	 		
	 		<% if((currentPage - 10) < startPage && (currentPage - 10) > 1){ %>
			<li class="page-item"><a class="page-link" href="/prototype/plist?page=<%= startPage - 10 %>">Previous</a></li>
			<% }else{ %>	  
			<li class="page-item"><a class="page-link" onclick="retu()">Previous</a></li>
			<% } %> 
			
			
			<% for(int p = startPage; p <= endPage; p++){%>
			<%if(p == currentPage){%>
			<li class="page-item"><a class="page-link" href="#"><strong><%= p %></strong></a></li>
			<%}else{ %>	 
			<li class="page-item"><a class="page-link" href="/prototype/plist?page=<%= p %>&seach=<%=search%>&option=<%=seachOption%>"><strong><%= p %></strong></a></li>
			<% }} %> 
		
			<% if((currentPage + 10) > endPage && (currentPage + 10) < maxPage){ %>
	 		<li class="page-item"><a class="page-link" href="/prototype/plist?page=<%= endPage + 10 %>">Next</a></li>
			<% }else{ %>
		<li class="page-item"><a class="page-link" onclick="retu()">Next</a></li>
	<% } %> 


					
			</ul>	 
					
					
					
					
					
					
							
	 		</div> 	
	 	</div>	 
	</div>
	
	
	</section>	


</nav>


<%@ include file="/common\footer.jsp" %>
</body>
</html>