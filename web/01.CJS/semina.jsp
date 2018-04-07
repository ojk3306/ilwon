<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 




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
</head>
<body>

<!------ Include the above in your HEAD tag ---------->
<%@ include file="/common/navbar.jsp" %>
<section class="container">
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
                            <h2>Sed vel lectus<br>
                                <small>by Merovingio in Jun 22, 2017 at 
                                    21:59</small></h2>
                            <p>
                                Sed vel lectus. Donec odio urna, tempus molestie, porttitor ut, iaculis quis, sem. Phasellus rhoncus. 
                                Aenean id metus id velit ullamcorper pulvinar. Vestibulum fermentum tortor id mi. 
                                Pellentesque ipsum. Nulla non arcu lacinia neque faucibus...                            
                                Pellentesque ipsum. Nulla non arcu lacinia neque faucibus... 
                                Pellentesque ipsum. Nulla non arcu lacinia neque faucibus... 
                                Pellentesque ipsum. Nulla non arcu lacinia neque faucibus... 
                            </p>
                          <a class='btn btn-info pull-right'
                               href="/article/show/sed-vel-lectus/9">
                                <i class="fa fa-long-arrow-right"> </i></a>  
                        </div>
                    </div>
                    
                    
                    
                    
                    
                    
                    
                    <div class="item">                    
                        <div class="col-lg-8 pull-right">
                            <img src="http://lorempixel.com/g/750/350/nature">
                        </div>
                        <div class="col-lg-4">                            
                            <h2>Proin porta auctor nisi<br>
                                <small>by Merovingio in Jun 22, 2017 at 
                                    00:34</small></h2>
                            <p>
                                Proin porta auctor nisi in interdum. Praesent a accumsan neque. Quisque ut nulla ac libero egestas tristique. Nunc venenatis elit lorem, ut viverra neque rhoncus a. Proin erat risus, pharetra vitae elementum eget, accumsan ornare mauris.
                                Praesent...                            
                            </p>    
                           <a class='btn btn-info pull-right'
                               href="/article/show/sed-vel-lectus/9">
                                <i class="fa fa-long-arrow-right"> </i></a>  
                        </div>                    
                    </div> 
                    <div class="item">                    
                        <div class="col-lg-8 pull-right">
                            <img src="http://lorempixel.com/g/750/350/fashion">
                        </div>
                        <div class="col-lg-4">                            
                            <h2>Aenean sodales<br>
                                <small>by Merovingio in Jun 22, 2017 at 
                                    00:33</small></h2>
                            <p>
                                Aenean sodales, leo eu euismod tincidunt, felis odio aliquam velit, 
                                quis porta lorem erat eget erat. Aliquam porta libero erat, sed aliquet est 
                                sollicitudin a. Curabitur nec tellus in eros egestas venenatis ac sed nisl. In consectetur nisl eget...                            
                            </p>       
                            <a class='btn btn-info pull-right'
                               href="/article/show/sed-vel-lectus/9">
                                <i class="fa fa-long-arrow-right"> </i></a>                            
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
</section>

<br><hr style="clear: both;">

<div class="container">
<div class="col-sm-6 col-md-8 col-lg-8">
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
			<div class="panel panel-default">
				<div class="panel-body">
					<img src="https://images.pexels.com/photos/262508/pexels-photo-262508.jpeg?h=350&auto=compress&cs=tinysrgb" alt="" class="img-thumbnail img-responsive">
					<p class="text-muted">By <span class="glyphicon glyphicon-user" aria-hidden="true"></span> Lorem Ipsum | <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> Jan/21/2018</p>
					<h3>Images by pexels.com</h3>
				<p>Nulla vehicula semper tellus, eleifend convallis dolor accumsan vitae. Donec diam lorem, vulputate eget pharetra at, laoreet ac augue. Vestibulum tellus justo, faucibus quis hendrerit sit amet, rutrum non nulla[...]</p>
			<a href="javascript: void(0);" class="btn btn-default">Read more...</a>
		</div>
	</div>
</div>
			
			
			
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="panel panel-default">
					<div class="panel-body">
						<img src="https://images.pexels.com/photos/34601/pexels-photo.jpg?h=350&auto=compress&cs=tinysrgb" alt="" class="img-thumbnail img-responsive">
						<p class="text-muted">By <span class="glyphicon glyphicon-user" aria-hidden="true"></span> Lorem Ipsum | <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> Jan/21/2018</p>
						<h3>Images by pexels.com</h3>
						<p>Nulla vehicula semper tellus, eleifend convallis dolor accumsan vitae. Donec diam lorem, vulputate eget pharetra at, laoreet ac augue. Vestibulum tellus justo, faucibus quis hendrerit sit amet, rutrum non nulla[...]</p>
						<a href="javascript: void(0);" class="btn btn-default">Read more...</a>
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="panel panel-default">
					<article class="panel-body">
						<img src="https://images.pexels.com/photos/459688/pexels-photo-459688.jpeg?h=350&auto=compress&cs=tinysrgb" alt="" class="img-thumbnail img-responsive">
						<p class="text-muted">By <span class="glyphicon glyphicon-user" aria-hidden="true"></span> Lorem Ipsum | <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> Jan/21/2018</p>
						<h3>Images by pexels.com</h3>
						<p>Nulla vehicula semper tellus, eleifend convallis dolor accumsan vitae. Donec diam lorem, vulputate eget pharetra at, laoreet ac augue. Vestibulum tellus justo, faucibus quis hendrerit sit amet, rutrum non nulla[...]</p>
						<a href="javascript: void(0);" class="btn btn-default">Read more...</a>
					</article>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="panel panel-default">
					<article class="panel-body">
						<img src="https://images.pexels.com/photos/273222/pexels-photo-273222.jpeg?h=350&auto=compress&cs=tinysrgb" alt="" class="img-thumbnail img-responsive">
						<p class="text-muted">By <span class="glyphicon glyphicon-user" aria-hidden="true"></span> Lorem Ipsum | <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> Jan/21/2018</p>
						<h3>Images by pexels.com</h3>
						<p>Nulla vehicula semper tellus, eleifend convallis dolor accumsan vitae. Donec diam lorem, vulputate eget pharetra at, laoreet ac augue. Vestibulum tellus justo, faucibus quis hendrerit sit amet, rutrum non nulla[...]</p>
						<a href="javascript: void(0);" class="btn btn-default">Read more...</a>
					</article>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="panel panel-default">
					<article class="panel-body">
						<img src="https://images.pexels.com/photos/392018/pexels-photo-392018.jpeg?h=350&auto=compress&cs=tinysrgb" alt="" class="img-thumbnail img-responsive">
						<p class="text-muted">By <span class="glyphicon glyphicon-user" aria-hidden="true"></span> Lorem Ipsum | <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> Jan/21/2018</p>
						<h3>Images by pexels.com</h3>
						<p>Nulla vehicula semper tellus, eleifend convallis dolor accumsan vitae. Donec diam lorem, vulputate eget pharetra at, laoreet ac augue. Vestibulum tellus justo, faucibus quis hendrerit sit amet, rutrum non nulla[...]</p>
						<a href="javascript: void(0);" class="btn btn-default">Read more...</a>
					</article>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="panel panel-default">
					<article class="panel-body">
						<img src="https://images.pexels.com/photos/301930/pexels-photo-301930.jpeg?h=350&auto=compress&cs=tinysrgb" alt="" class="img-thumbnail img-responsive">
						<p class="text-muted">By <span class="glyphicon glyphicon-user" aria-hidden="true"></span> Lorem Ipsum | <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> Jan/21/2018</p>
						<h3>Images by pexels.com</h3>
						<p>Nulla vehicula semper tellus, eleifend convallis dolor accumsan vitae. Donec diam lorem, vulputate eget pharetra at, laoreet ac augue. Vestibulum tellus justo, faucibus quis hendrerit sit amet, rutrum non nulla[...]</p>
						<a href="javascript: void(0);" class="btn btn-default">Read more...</a>
					</article>
				</div>
			</div>
		</div>
		<hr>
		<div>
			<nav aria-label="...">
				<ul class="pager">
					<li class="previous"><a href="#"><span aria-hidden="true">←</span> Older Posts</a></li>
					<li class="next disabled"><a href="#">Newer Posts<span aria-hidden="true">→</span></a></li>
				</ul>
			</nav>
		</div>

	</div>

	<div class="col-sm-6 col-md-4 col-lg-4">
		<div class="panel panel-default">
			<div class="panel-body">

				<h4 class="text-center">Search for Posts!</h4>
				<form role="Form" method="GET" action="" accept-charset="UTF-8">
					<div class="form-group">
						<div class="input-group">
							<input class="form-control" type="text" name="search" placeholder="seach for semina" required/>
							<span class="input-group-btn">
								<button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
							</span>
						</div>
					</div>
				</form>

				<h4 class="text-center">About me!</h4>
				<img src="https://images.pexels.com/photos/35537/child-children-girl-happy.jpg?h=350&auto=compress&cs=tinysrgb" alt="" class="img-thumbnail img-responsive">
				<h5 class="text-center">John Doe</h5>
				<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>

				<h4 class="text-center">Popular Posts!</h4>
				<div class="row">
					<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
						<img src="https://images.pexels.com/photos/301930/pexels-photo-301930.jpeg?h=350&auto=compress&cs=tinysrgb" alt="" class="img-thumbnail img-responsive">
					</div>
					<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
						<h5>Images by pexels.com</h5>
						<p class="text-muted"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> Jan/21/2018</p>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
						<img src="https://images.pexels.com/photos/34601/pexels-photo.jpg?h=350&auto=compress&cs=tinysrgb" alt="" class="img-thumbnail img-responsive">
					</div>
					<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
						<h5>Images by pexels.com</h5>
						<p class="text-muted"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> Jan/21/2018</p>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
						<img src="https://images.pexels.com/photos/459688/pexels-photo-459688.jpeg?h=350&auto=compress&cs=tinysrgb" alt="" class="img-thumbnail img-responsive">
					</div>
					<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
						<h5>Images by pexels.com</h5>
						<p class="text-muted"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> Jan/21/2018</p>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
						<img src="https://images.pexels.com/photos/273222/pexels-photo-273222.jpeg?h=350&auto=compress&cs=tinysrgb" alt="" class="img-thumbnail img-responsive">
					</div>
					<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
						<h5>Images by pexels.com</h5>
						<p class="text-muted"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> Jan/21/2018</p>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
						<img src="https://images.pexels.com/photos/392018/pexels-photo-392018.jpeg?h=350&auto=compress&cs=tinysrgb" alt="" class="img-thumbnail img-responsive">
					</div>
					<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
						<h5>Images by pexels.com</h5>
						<p class="text-muted"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> Jan/21/2018</p>
					</div>
				</div>
				<hr>

			
			</div>
		</div>
	</div>
</div>
<%@ include file="/common/footer.jsp" %>
</body>
</html>