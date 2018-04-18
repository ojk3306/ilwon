<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page  import="semina.model.vo.*"%>
<!DOCTYPE html>
<%  
    ArrayList<Semina> list=(ArrayList<Semina>)request.getAttribute("list");
    ArrayList<Semina> toplist=(ArrayList<Semina>)request.getAttribute("toplist");
    ArrayList<Semina> Popularlist=(ArrayList<Semina>)request.getAttribute("Popularlist");
	int listCount = ((Integer)request.getAttribute("listCount")).intValue();
	int startPage = ((Integer)request.getAttribute("startPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer)request.getAttribute("maxPage")).intValue();			
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
	
	String search = "";
	if((String)request.getAttribute("search")!=null)
		 search =(String)request.getAttribute("search");
	String message = (String)request.getAttribute("message");
%>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>세미나 찾기</title>
<script type="text/javascript" src="/prototype/common\resources\js\jquery-3.3.1.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">

<style type="text/css">
	
</style>

</head>

<body style="background:#e9e9e9; overflow:auto; position:absolute; width:100%;">

<!------ Include the above in your HEAD tag ---------->
<%@ include file="/common/navbar.jsp" %>

<% if(loginUser!=null) { %>
	<input type="hidden" id="usernono" value="<%=loginUser.getUserNo()%>">
<% } %>
<div class='container carousel'>
	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
			<li data-target="#carousel-example-generic" data-slide-to="2"></li>
		</ol>
		<!-- Wrapper for slides -->
		<div class="carousel-inner text-center" role="listbox">
			<div class="item active">
				<div class="col-lg-8 pull-right">
					<img src="http://lorempixel.com/g/750/350/transport">
				</div>
				<div class="col-lg-4">                            
					<h2><%=toplist.get(0).getSeminaTitle()%><br>
					<small> in <%=toplist.get(0).getSeminaEndDate()%></small></h2>
					<p>
						<%=toplist.get(0).getSeminaContent1()%>
					</p>
					<% if(loginUser==null) { %>
						<a class='btn btn-info pull-right' href="/prototype/sdetail?userno=<%=toplist.get(0).getSeminaNo()%>">
						<i class="fa fa-long-arrow-right"> </i></a> 
					<% } else { %>   
						<a class='btn btn-info pull-right' href="/prototype/sdetail?userno=<%=toplist.get(0).getSeminaNo()%>&usernono=<%=loginUser.getUserNo()%>">
						<i class="fa fa-long-arrow-right"> </i></a> 
					<%}%>
				</div>
			</div>
			<div class="item">                    
				<div class="col-lg-8 pull-right">
					<img src="http://lorempixel.com/g/750/350/nature">
				</div>
				<div class="col-lg-4">                            
					<h2><%=toplist.get(1).getSeminaTitle()%><br>
					<small>in <%=toplist.get(1).getSeminaEndDate()%></small></h2>
					<p>
						<%=toplist.get(1).getSeminaContent1()%>                          
					</p>    
					<% if(loginUser==null){ %>
						<a class='btn btn-info pull-right' href="/prototype/sdetail?userno=<%=toplist.get(1).getSeminaNo()%>">
						<i class="fa fa-long-arrow-right"> </i></a>  
					<% } else { %>
						<a class='btn btn-info pull-right' href="/prototype/sdetail?userno=<%=toplist.get(1).getSeminaNo()%>&usernono=<%=loginUser.getUserNo()%>">
						<i class="fa fa-long-arrow-right"> </i></a>  
					 <% } %>
				</div>                    
			</div> 
			<div class="item">                    
				<div class="col-lg-8 pull-right">
					<img src="http://lorempixel.com/g/750/350/fashion">
				</div>
				<div class="col-lg-4">                            
					<h2><%=toplist.get(2).getSeminaTitle()%><br>
					<small>in <%=toplist.get(2).getSeminaEndDate()%></small></h2>
					<p><%=toplist.get(2).getSeminaContent1()%></p>       
					<% if(loginUser==null){ %>
						<a class='btn btn-info pull-right' href="/prototype/sdetail?userno=<%=toplist.get(2).getSeminaNo()%>">
						<i class="fa fa-long-arrow-right"> </i></a>                            
					<% } else { %>
						<a class='btn btn-info pull-right' href="/prototype/sdetail?userno=<%=toplist.get(2).getSeminaNo()%>&usernono=<%=loginUser.getUserNo()%>">
						<i class="fa fa-long-arrow-right"> </i></a>  
					<% } %>
				</div>                    
			</div> 
		</div>
		<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a>
		<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
</div>

<br>

<hr style="clear: both;">

<div align="center" style="width:100%">
	<div class="container" align="center">
		<div class="col-sm-6" style="margin-left:8%">
			<div class="ohw-semina-row">
				<% if( message == null) { %>
					<% for(Semina i: list) { %>
						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" style=" width:50%; max-height:400px;">
							<div class="panel panel-default" >
								<div class="panel-body" >		
									<% if(i.getSeminaRenameFileName()!=null) { %>
										<img src="<%=request.getContextPath()%>/seminaTitleimg/<%=i.getSeminaRenameFileName()%>" style="width:303px; height:205px;">
									<% } else { //지정된 이미지가 없으면 디폴트 랜덤사진을 넣는다.
										String[] img = new String[11];
										img[0]="https://images.pexels.com/photos/262508/pexels-photo-262508.jpeg?h=350&auto=compress&cs=tinysrgb";
										img[1]="https://images.pexels.com/photos/34601/pexels-photo.jpg?h=350&auto=compress&cs=tinysrgb";
										img[2]="https://images.pexels.com/photos/459688/pexels-photo-459688.jpeg?h=350&auto=compress&cs=tinysrgb";
										img[3]="https://images.pexels.com/photos/273222/pexels-photo-273222.jpeg?h=350&auto=compress&cs=tinysrgb";
										img[4]="https://images.pexels.com/photos/301930/pexels-photo-301930.jpeg?h=350&auto=compress&cs=tinysrgb";
										img[5]="https://images.pexels.com/photos/392018/pexels-photo-392018.jpeg?h=350&auto=compress&cs=tinysrgb";
										//img[6]=https://images.pexels.com/photos/35537/child-children-girl-happy.jpg?h=350&auto=compress&cs=tinysrgb; 어린이사진
										img[6]="https://images.pexels.com/photos/301930/pexels-photo-301930.jpeg?h=350&auto=compress&cs=tinysrgb";
										img[7]="https://images.pexels.com/photos/34601/pexels-photo.jpg?h=350&auto=compress&cs=tinysrgb.";
										img[8]="https://images.pexels.com/photos/459688/pexels-photo-459688.jpeg?h=350&auto=compress&cs=tinysrgb";
										img[9]="https://images.pexels.com/photos/273222/pexels-photo-273222.jpeg?h=350&auto=compress&cs=tinysrgb";
										img[10]="https://images.pexels.com/photos/392018/pexels-photo-392018.jpeg?h=350&auto=compress&cs=tinysrgb";
										Integer result = 333;
										result=(int)(Math.random()*10)+0;
    								%>
										<img src="<%=img[result]%>" alt="" class="img-thumbnail img-responsive">
									<% } %>
									<p class="text-muted"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span><%=i.getSeminaEndDate()%> 까지 모집</p>
									<div style = "max-height:18px; overflow:hidden;">
										<h4 style = "margin:0"><%=i.getSeminaTitle() %></h4>
									</div>
									<p><%=i.getSeminaContent1()%></p>
									<% if(loginUser==null) { %>
										<a href="/prototype/sdetail?userno=<%=i.getSeminaNo()%> " class="btn btn-default">자세히보기...</a>
									<% } else { %>
										<a href="/prototype/sdetail?userno=<%=i.getSeminaNo()%>&usernono=<%=loginUser.getUserNo()%>" class="btn btn-default">자세히보기...</a>	
									<% } %>
								</div>
							</div>
						</div>
	    			<% } %>
				<% }else{ %>			
					<h1><%=message %></h1>			
				<% } %>			
			</div>
		</div>
		<div class="col-sm-6 col-md-4 col-lg-4">
			<div class="panel panel-default">
				<div class="panel-body">
					<!-- 검색 -->
					<h4 class="text-center">Search for Semina!</h4>
					<form role="Form" method="post" action="/prototype/semilist" accept-charset="UTF-8">
						<div class="form-group">
							<div class="input-group">
								<% if(search!=null) { %>
									<input class="form-control" type="text" value="<%=search%>" name="search" placeholder="search for semina" required/>
								<% } else { %>
									<input class="form-control" type="text"  name="search" placeholder="search for semina" required/>
								<% } %>
								<span class="input-group-btn">
									<button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
								</span>
							</div>
						</div>
					</form>
					<br>
					<hr>			
					<h4 class="text-center">Popular Semina!</h4>
					<% for(Semina i: Popularlist) {	
						String[] img = new String[11];
						img[0]="https://images.pexels.com/photos/262508/pexels-photo-262508.jpeg?h=350&auto=compress&cs=tinysrgb";
						img[1]="https://images.pexels.com/photos/34601/pexels-photo.jpg?h=350&auto=compress&cs=tinysrgb";
						img[2]="https://images.pexels.com/photos/459688/pexels-photo-459688.jpeg?h=350&auto=compress&cs=tinysrgb";
						img[3]="https://images.pexels.com/photos/273222/pexels-photo-273222.jpeg?h=350&auto=compress&cs=tinysrgb";
						img[4]="https://images.pexels.com/photos/301930/pexels-photo-301930.jpeg?h=350&auto=compress&cs=tinysrgb";
						img[5]="https://images.pexels.com/photos/392018/pexels-photo-392018.jpeg?h=350&auto=compress&cs=tinysrgb";
						//img[6]=https://images.pexels.com/photos/35537/child-children-girl-happy.jpg?h=350&auto=compress&cs=tinysrgb; 어린이사진
						img[6]="https://images.pexels.com/photos/301930/pexels-photo-301930.jpeg?h=350&auto=compress&cs=tinysrgb";
						img[7]="https://images.pexels.com/photos/34601/pexels-photo.jpg?h=350&auto=compress&cs=tinysrgb.";
						img[8]="https://images.pexels.com/photos/459688/pexels-photo-459688.jpeg?h=350&auto=compress&cs=tinysrgb";
						img[9]="https://images.pexels.com/photos/273222/pexels-photo-273222.jpeg?h=350&auto=compress&cs=tinysrgb";
						img[10]="https://images.pexels.com/photos/392018/pexels-photo-392018.jpeg?h=350&auto=compress&cs=tinysrgb";
						Integer result = 333;
						result=(int)(Math.random()*10)+0;
					%>				
					
					<table style = "width:100%;">
						<tr>
							<td rowspan = "2" style = "width:110px; height:75px;"><img src="<%=img[result] %>" alt="" class="img-thumbnail img-responsive" style = "width:110px; height:75px;"></td>
							<td style = "text-align:center;"><% if(loginUser==null) { %>
								<a href="/prototype/sdetail?userno=<%=i.getSeminaNo()%>"><h5><%=i.getSeminaTitle() %></h5></a>
							<% } else { %>						
								<a href="/prototype/sdetail?userno=<%=i.getSeminaNo()%>&usernono=<%= loginUser.getUserNo()%>"><h5><%=i.getSeminaTitle() %></h5></a>
							<% } %></td>
						</tr>
						<tr>
							<td style = "text-align:center;"><p class="text-muted"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span><%=i.getSeminaEndDate() %></p></td>
						</tr>
					</table>
					<hr>
					<% } %>
				</div>		
			</div>
		</div>
	</div>
</div>
<div align="center">
	<ul class="pager" style = "width:50%;">
		<% if(currentPage <= 1) { %>	
			<li class="previous"><span aria-hidden="true">←Newer Posts</span></li>
		<% } else { %>
			<li class="previous"><a href="/prototype/semilist?page=1"><span aria-hidden="true">←</span> Newer Posts</a></li>
		<% } %>
		<% if((currentPage - 10) < startPage && (currentPage - 10) > 1) { %>
			<a href="/prototype/semilist?page=<%= startPage - 10 %>"></a>	
		<% } else { %>	
		
		<% } %>
		<!-- 현재 페이지가 포함된 그룹의 페이지 숫자 출력 -->
		<% for(int p = startPage; p <= endPage; p++) { 
			if(p == currentPage) {
		%>
				<font color="red" size="4"><b>[ <%= p %> ]</b></font>
			<% } else { %>
				<a href="/prototype/semilist?page=<%= p %>&search=<%=search%>"><%= p %></a>
			<% }
		} %>
		<% if((currentPage + 10) > endPage && (currentPage + 10) < maxPage) { %>
			<a href="/prototype/semilist?page=<%= endPage + 10 %>&seach=<%=search%>"></a>	
		<% } else { %>

		<% } %>
		<% if(currentPage >= maxPage) { %>
			<li class="next disabled"><span aria-hidden="true">older Posts→</span></li>	
		<% } else { %>
			<li class="next disabled"><a href="/prototype/semilist?page=<%= maxPage %>"><span aria-hidden="true">older Posts→</span></a></li>
		<% } %>
	</ul>
</div>

<div>
<%@ include file="/common/footer.jsp" %>
</div>

</body>
</html>