<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">.bar {
  height: 9px;
  margin: 8px 0;
  overflow: hidden;
  background-color: #f5f5f5;
  -o-border-radius: 4px;
  -ms-border-radius: 4px;
  -moz-border-radius: 4px;
  -webkit-border-radius: 4px;
  border-radius: 4px;
  -webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  -o-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  -ms-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  -moz-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  -webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  -webkit-background-clip: padding-box;
}
.progress-bar {
  float: left;
  width: 0;
  height: 100%;
  font-size: 12px;
  line-height: 20px;
  color: #fff;
  text-align: center;
  background-color: #428bca;
  -webkit-box-shadow: inset 0 -1px 0 rgba(0,0,0,0.15);
  -o-box-shadow: inset 0 -1px 0 rgba(0,0,0,0.15);
  -ms-box-shadow: inset 0 -1px 0 rgba(0,0,0,0.15);
  -moz-box-shadow: inset 0 -1px 0 rgba(0,0,0,0.15);
  -webkit-box-shadow: inset 0 -1px 0 rgba(0,0,0,0.15);
  box-shadow: inset 0 -1px 0 rgba(0,0,0,0.15);
  -webkit-background-clip: padding-box;
  -webkit-transition: width 0.6s ease;
  -o-transition: width 0.6s ease;
  -o-transition: width 0.6s ease;
  -ms-transition: width 0.6s ease;
  -moz-transition: width 0.6s ease;
  -webkit-transition: width 0.6s ease;
  transition: width 0.6s ease;
}
.block-text {
  width: 83px;
  line-height: 1;
}
.block-bar {
  width: 233px;
}
.block-star {
  margin: 0 4px 0;
  padding: 4px 2px 0 3px !important;
}
.fs30 {
  font-size: 30px;
}
.fs40 {
  font-size: 40px;
}
.fs20 {
  font-size: 20px;
}
.fs16 {
  font-size: 16px;
}
.pl2-5 {
  padding-left: 2.5rem;
}
</style>
</head>
<body>
<link href="//cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/css/materialize.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/js/materialize.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<div class="container">
    <div class="row">
        <div class="col s4">
        	<div class="rating-block center-align"><h4 class="fs30">Calificación</h4><h2 class="fs40">4.3 <small>/ 5</small></h2>
        		<div class="row pl2-5">
        		<div class="col s2 amber white-text center-align block-star"><i class="material-icons">star</i></div>
        	<div class="col s2 amber white-text center-align block-star"><i class="material-icons">star</i></div>
        	<div class="col s2 amber white-text center-align block-star"><i class="material-icons">star</i></div>
        	<div class="col s2 amber white-text center-align block-star"><i class="material-icons">star</i></div>
        	<div class="col s2 blue-grey lighten-4 blue-grey-text text-lighten-3 center-align block-star"><i class="material-icons">star</i></div></div></div><h4 class="fs20 center-align">Estadísticas</h4>
        	<div class="left">
        		<div class="left block-text">
        			<div class="fs16">Eficiencia</div>
        		</div>
        		<div class="left block-bar">
        		<div class="bar">
        		<div style="width: 1000%" class="progress-bar cyan accent-4"></div></div></div>
        	</div>
        	<div class="left">
        		<div class="left block-text">
        		<div class="fs16">Calidad</div></div>
        	<div class="left block-bar">
        		<div class="bar">
        		<div style="width: 80%" class="progress-bar green darken-3"></div></div></div></div>
        	<div class="left">
        		<div class="left block-text">
        		<div class="fs16">Costo</div></div>
        	<div class="left block-bar">
        		<div class="bar">
        		<div style="width: 60%" class="progress-bar orange accent-4"></div></div>
        	</div>
        	</div>
        </div>
    </div>
</div>
</body>
</html>