<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.btn3d {
    position:relative;
    top: -6px;
    border:0;
     transition: all 40ms linear;
     margin-top:10px;
     margin-bottom:10px;
     margin-left:2px;
     margin-right:2px;
}
.btn3d:active:focus,
.btn3d:focus:hover,
.btn3d:focus {
    -moz-outline-style:none;
         outline:medium none;
}
.btn3d:active, .btn3d.active {
    top:2px;
}
.btn3d.btn-white {
    color: #666666;
    box-shadow:0 0 0 1px #ebebeb inset, 0 0 0 2px rgba(255,255,255,0.10) inset, 0 8px 0 0 #f5f5f5, 0 8px 8px 1px rgba(0,0,0,.2);
    background-color:#fff;
}
.btn3d.btn-white:active, .btn3d.btn-white.active {
    color: #666666;
    box-shadow:0 0 0 1px #ebebeb inset, 0 0 0 1px rgba(255,255,255,0.15) inset, 0 1px 3px 1px rgba(0,0,0,.1);
    background-color:#fff;
}
.btn3d.btn-default {
    color: #666666;
    box-shadow:0 0 0 1px #ebebeb inset, 0 0 0 2px rgba(255,255,255,0.10) inset, 0 8px 0 0 #BEBEBE, 0 8px 8px 1px rgba(0,0,0,.2);
    background-color:#f9f9f9;
}
.btn3d.btn-default:active, .btn3d.btn-default.active {
    color: #666666;
    box-shadow:0 0 0 1px #ebebeb inset, 0 0 0 1px rgba(255,255,255,0.15) inset, 0 1px 3px 1px rgba(0,0,0,.1);
    background-color:#f9f9f9;
}
.btn3d.btn-primary {
    box-shadow:0 0 0 1px #417fbd inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 8px 0 0 #4D5BBE, 0 8px 8px 1px rgba(0,0,0,0.5);
    background-color:#4274D7;
}
.btn3d.btn-primary:active, .btn3d.btn-primary.active {
    box-shadow:0 0 0 1px #417fbd inset, 0 0 0 1px rgba(255,255,255,0.15) inset, 0 1px 3px 1px rgba(0,0,0,0.3);
    background-color:#4274D7;
}
.btn3d.btn-success {
    box-shadow:0 0 0 1px #31c300 inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 8px 0 0 #5eb924, 0 8px 8px 1px rgba(0,0,0,0.5);
    background-color:#78d739;
}
.btn3d.btn-success:active, .btn3d.btn-success.active {
    box-shadow:0 0 0 1px #30cd00 inset, 0 0 0 1px rgba(255,255,255,0.15) inset, 0 1px 3px 1px rgba(0,0,0,0.3);
    background-color: #78d739;
}
.btn3d.btn-info {
    box-shadow:0 0 0 1px #00a5c3 inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 8px 0 0 #348FD2, 0 8px 8px 1px rgba(0,0,0,0.5);
    background-color:#39B3D7;
}
.btn3d.btn-info:active, .btn3d.btn-info.active {
    box-shadow:0 0 0 1px #00a5c3 inset, 0 0 0 1px rgba(255,255,255,0.15) inset, 0 1px 3px 1px rgba(0,0,0,0.3);
    background-color: #39B3D7;
}
.btn3d.btn-warning {
    box-shadow:0 0 0 1px #d79a47 inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 8px 0 0 #D79A34, 0 8px 8px 1px rgba(0,0,0,0.5);
    background-color:#FEAF20;
}
.btn3d.btn-warning:active, .btn3d.btn-warning.active {
    box-shadow:0 0 0 1px #d79a47 inset, 0 0 0 1px rgba(255,255,255,0.15) inset, 0 1px 3px 1px rgba(0,0,0,0.3);
    background-color: #FEAF20;
}
.btn3d.btn-danger {
    box-shadow:0 0 0 1px #b93802 inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 8px 0 0 #AA0000, 0 8px 8px 1px rgba(0,0,0,0.5);
    background-color:#D73814;
}
.btn3d.btn-danger:active, .btn3d.btn-danger.active {
    box-shadow:0 0 0 1px #b93802 inset, 0 0 0 1px rgba(255,255,255,0.15) inset, 0 1px 3px 1px rgba(0,0,0,0.3);
    background-color: #D73814;
}
.btn3d.btn-magick {
    color: #fff;
    box-shadow:0 0 0 1px #9a00cd inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 8px 0 0 #9823d5, 0 8px 8px 1px rgba(0,0,0,0.5);
    background-color:#bb39d7;
}
.btn3d.btn-magick:active, .btn3d.btn-magick.active {
    box-shadow:0 0 0 1px #9a00cd inset, 0 0 0 1px rgba(255,255,255,0.15) inset, 0 1px 3px 1px rgba(0,0,0,0.3);
    background-color: #bb39d7;
}</style>
</head>
<body>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<div class="container">
	<div class="row">
		<h2>CSS3 3D Button Effects</h2>
        
        Text
        
        <!-- Standard button -->
        <button type="button" class="btn3d btn btn-default btn-lg"><span class="glyphicon glyphicon-download-alt"></span> Default</button>
         
        <button type="button" class="btn3d btn btn-white btn-lg"><span class="glyphicon glyphicon-tag"></span> White</button>
        
        <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
        <button type="button" class="btn btn-primary btn-lg btn3d"><span class="glyphicon glyphicon-cloud"></span> Primary</button>
        
        <!-- Indicates a successful or positive action -->
        <button type="button" class="btn btn-success btn-lg btn3d"><span class="glyphicon glyphicon-ok"></span> Success</button>
        
        <!-- Contextual button for informational alert messages -->
        <button type="button" class="btn btn-info btn-lg btn3d"><span class="glyphicon glyphicon-question-sign"></span> Info</button>
        
        <!-- Indicates caution should be taken with this action -->
        <button type="button" class="btn btn-warning btn-lg btn3d"><span class="glyphicon glyphicon-warning-sign"></span> Warning</button>
        
        <!-- Indicates a dangerous or potentially negative action -->
        <button type="button" class="btn btn-danger btn-lg btn3d"><span class="glyphicon glyphicon-remove"></span> Danger</button>
        
        <button type="button" class="btn btn-magick btn-lg btn3d"><span class="glyphicon glyphicon-gift"></span> Magick</button>
        
        <!-- Deemphasize a button by making it look like a link while maintaining button behavior -->
        <a href="http://www.jquery2dotnet.com/" class="btn btn-link btn-lg btn3d" role="button"><span class="glyphicon glyphicon-globe"></span> Link</a>
        
        <p>
          Text
          <button type="button" class="btn btn-primary btn-lg btn3d"><span class="glyphicon glyphicon-thumbs-up"></span></button>
          <button type="button" class="btn btn-danger btn-lg btn3d"><span class="glyphicon glyphicon-off"></span></button>
        </p>
        <p>
          Text
          <button type="button" class="btn btn-primary btn-lg btn3d">Large button</button>
          <button type="button" class="btn btn-default btn-lg btn3d">Large button</button>
        </p>
        <p>
          Text
          <button type="button" class="btn btn-primary btn3d">Default button</button>
          <button type="button" class="btn btn-default btn3d">Default button</button>
        </p>
        <p>
          Text
          <button type="button" class="btn btn-primary btn-sm btn3d">Small button</button>
          <button type="button" class="btn btn-default btn-sm btn3d">Small button</button>
        </p>
        <p>
          Text
          <button type="button" class="btn btn-primary btn-xs btn3d">Extra small button</button>
          <button type="button" class="btn btn-default btn-xs btn3d">Extra small button</button>
        </p>
	</div>
</div>
</body>
</html>