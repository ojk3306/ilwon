<%@page import="users.model.vo.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 Users login = (Users)session.getAttribute("loginUser");
 %>
<!DOCTYPE html >
<html>
<head>
 
 <link rel="stylesheet" href="/prototype/common/resources/css/bootstrap.css">
 

 <script src="/prototype/common/resources/js/bootstrap.js"></script>
 
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<script type="text/javascript">

$(function(){
	
if('<%=login%>'== 'null'){ //비로그인인 경우
$.ajax({
		url:"/prototype/tsider",
		data:{},
		success:function(date){ 
			console.log(date+"비로그인")
			var value="";
			var jsonStr = JSON.stringify(date);
			var json = JSON.parse(jsonStr);
			console.log(json.list[0].username)
		/*
		username
		lesson_no
		CATEGORY_SMALL
		LESSON_RENAME_PHOTO
		*/
		$("#fi").html('<div class="active item"><img src="/prototype/01.CJS/img/bg-masthead.jpg"  class="img-responsive" data-target="#carousel-main" data-slide-to="0">이름:<a href="/prototype/lessondetail?no='+json.list[0].lesson_no+'">'+json.list[0].username+'</a><br>분야 :'+json.list[0].CATEGORY_SMALL+'</div><div class="item"><img src="/prototype/01.CJS/img/bg-masthead2.jpg"  class="img-responsive" data-target="#carousel-main" data-slide-to="1">이름:<a href="/prototype/lessondetail?no='+json.list[1].lesson_no+'">'+json.list[1].username+'</a><br>분야 :'+json.list[1].CATEGORY_SMALL+'</div><div class="item"> <img src="/prototype/01.CJS/img/bg-showcase-3.jpg" class="img-responsive" data-target="#carousel-main" data-slide-to="2">이름:<a href="/prototype/lessondetail?no='+json.list[2].lesson_no+'">'+json.list[2].username+'</a><br>분야 :'+json.list[2].CATEGORY_SMALL+'</div>')
		$("#se").html('<div class="active item"><img src="/prototype/01.CJS/img/bg-masthead.jpg"  class="img-responsive" data-target="#carousel-main" data-slide-to="0">이름:<a href="/prototype/lessondetail?no='+json.list[3].lesson_no+'">'+json.list[3].username+'</a><br>분야 :'+json.list[3].CATEGORY_SMALL+'</div><div class="item"><img src="/prototype/01.CJS/img/bg-masthead2.jpg"  class="img-responsive" data-target="#carousel-main" data-slide-to="1">이름:<a href="/prototype/lessondetail?no='+json.list[4].lesson_no+'">'+json.list[4].username+'</a><br>분야 :'+json.list[4].CATEGORY_SMALL+'</div><div class="item"> <img src="/prototype/01.CJS/img/bg-showcase-3.jpg" class="img-responsive" data-target="#carousel-main" data-slide-to="2">이름:<a href="/prototype/lessondetail?no='+json.list[5].lesson_no+'">'+json.list[5].username+'</a><br>분야 :'+json.list[5].CATEGORY_SMALL+'</div>')
		$("#th").html('<div class="active item"><img src="/prototype/01.CJS/img/bg-masthead.jpg"  class="img-responsive" data-target="#carousel-main" data-slide-to="0">이름:<a href="/prototype/lessondetail?no='+json.list[6].lesson_no+'">'+json.list[6].username+'</a><br>분야 :'+json.list[6].CATEGORY_SMALL+'</div><div class="item"><img src="/prototype/01.CJS/img/bg-masthead2.jpg"  class="img-responsive" data-target="#carousel-main" data-slide-to="1">이름:<a href="/prototype/lessondetail?no='+json.list[7].lesson_no+'">'+json.list[7].username+'</a><br>분야 :'+json.list[7].CATEGORY_SMALL+'</div><div class="item"> <img src="/prototype/01.CJS/img/bg-showcase-3.jpg" class="img-responsive" data-target="#carousel-main" data-slide-to="2">이름:<a href="/prototype/lessondetail?no='+json.list[8].lesson_no+'">'+json.list[8].username+'</a><br>분야 :'+json.list[8].CATEGORY_SMALL+'</div>')
	},
		error:function(a,b,c){
			console.log(b+c);
			
		}
	})
}else{	
$.ajax({
		url:"/prototype/tsider",
		data:{userno:$("#userno").val()},
		success:function(date){ 
			console.log(date+"로그인")
			var jsonStr = JSON.stringify(date);
			var json = JSON.parse(jsonStr);
			console.log(json.list[0].username)	
			$("#fi").html('<div class="active item"><img src="/prototype/01.CJS/img/bg-masthead.jpg"  class="img-responsive" data-target="#carousel-main" data-slide-to="0">이름:<a href="/prototype/lessondetail?no='+json.list[0].lesson_no+'">'+json.list[0].username+'</a><br>분야 :'+json.list[0].CATEGORY_SMALL+'</div><div class="item"><img src="/prototype/01.CJS/img/bg-masthead2.jpg"  class="img-responsive" data-target="#carousel-main" data-slide-to="1">이름:<a href="/prototype/lessondetail?no='+json.list[1].lesson_no+'">'+json.list[1].username+'</a><br>분야 :'+json.list[1].CATEGORY_SMALL+'</div><div class="item"> <img src="/prototype/01.CJS/img/bg-showcase-3.jpg" class="img-responsive" data-target="#carousel-main" data-slide-to="2">이름:<a href="/prototype/lessondetail?no='+json.list[2].lesson_no+'">'+json.list[2].username+'</a><br>분야 :'+json.list[2].CATEGORY_SMALL+'</div>')
			$("#se").html('<div class="active item"><img src="/prototype/01.CJS/img/bg-masthead.jpg"  class="img-responsive" data-target="#carousel-main" data-slide-to="0">이름:<a href="/prototype/lessondetail?no='+json.list[3].lesson_no+'">'+json.list[3].username+'</a><br>분야 :'+json.list[3].CATEGORY_SMALL+'</div><div class="item"><img src="/prototype/01.CJS/img/bg-masthead2.jpg"  class="img-responsive" data-target="#carousel-main" data-slide-to="1">이름:<a href="/prototype/lessondetail?no='+json.list[4].lesson_no+'">'+json.list[4].username+'</a><br>분야 :'+json.list[4].CATEGORY_SMALL+'</div><div class="item"> <img src="/prototype/01.CJS/img/bg-showcase-3.jpg" class="img-responsive" data-target="#carousel-main" data-slide-to="2">이름:<a href="/prototype/lessondetail?no='+json.list[5].lesson_no+'">'+json.list[5].username+'</a><br>분야 :'+json.list[5].CATEGORY_SMALL+'</div>')
			$("#th").html('<div class="active item"><img src="/prototype/01.CJS/img/bg-masthead.jpg"  class="img-responsive" data-target="#carousel-main" data-slide-to="0">이름:<a href="/prototype/lessondetail?no='+json.list[6].lesson_no+'">'+json.list[6].username+'</a><br>분야 :'+json.list[6].CATEGORY_SMALL+'</div><div class="item"><img src="/prototype/01.CJS/img/bg-masthead2.jpg"  class="img-responsive" data-target="#carousel-main" data-slide-to="1">이름:<a href="/prototype/lessondetail?no='+json.list[7].lesson_no+'">'+json.list[7].username+'</a><br>분야 :'+json.list[7].CATEGORY_SMALL+'</div><div class="item"> <img src="/prototype/01.CJS/img/bg-showcase-3.jpg" class="img-responsive" data-target="#carousel-main" data-slide-to="2">이름:<a href="/prototype/lessondetail?no='+json.list[8].lesson_no+'">'+json.list[8].username+'</a><br>분야 :'+json.list[8].CATEGORY_SMALL+'</div>')
},
		error:function(a,b,c){
			console.log(b+c);
		}
	})
}	



})





$(function(){ 
	 var $win = $(window);
	 var top = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다. 
	 /*사용자 설정 값 시작*/ 
	 
	 var speed = 900; 
	 
	 // 따라다닐 속도 : "slow", "normal", or "fast" or numeric(단위:msec) 
	 var easing = 'swing'; // 따라다니는 방법 기본 두가지 linear, swing 
	 var $layer = $('.float_sidebar'); // 레이어 셀렉팅 
	 var layerTopOffset = 10; // 레이어 높이 상한선, 단위:px 
	 $layer.css('position', 'relative').css('z-index', '1'); 
	 /*사용자 설정 값 끝*/ 
	 
	 // 스크롤 바를 내린 상태에서 리프레시 했을 경우를 위해 
	 if (top > 0 ) 
		 $win.scrollTop(layerTopOffset+top);
	 else $win.scrollTop(0); 
	 //스크롤이벤트가 발생하면 
	 $(window).scroll(function()
			 { 
		 yPosition = $win.scrollTop() + 150; 
			 
			 //이부분을 조정해서 화면에 보이도록 맞추세요 
	if (yPosition < 0) 
	{ 
		yPosition = 150; 
	} 
     $layer.animate({"top":yPosition }, 
    		 {duration:speed, easing:easing, queue:false}); });
	 }); 
 $('.carousel .vertical .item').each(function(){
	  var next = $(this).next();
	  if (!next.length) {
	    next = $(this).siblings(':first');
	  }
	  next.children(':first-child').clone().appendTo($(this));
	  
	  for (var i=1;i<2;i++) {
	    next=next.next();
	    if (!next.length) {
	    	next = $(this).siblings(':first');
	  	}
	    
	    next.children(':first-child').clone().appendTo($(this));
	  }
	});
</script>
<style type="text/css">
.carousel-inner.vertical {
  height: 100%; /*Note: set specific height here if not, there will be some issues with IE browser*/
}
.carousel-inner.vertical > .item {
  -webkit-transition: .6s ease-in-out top;
  -o-transition: .6s ease-in-out top;
  transition: .6s ease-in-out top;
}

@media all and (transform-3d),
(-webkit-transform-3d) {
  .carousel-inner.vertical > .item {
    -webkit-transition: -webkit-transform .6s ease-in-out;
    -o-transition: -o-transform .6s ease-in-out;
    transition: transform .6s ease-in-out;
    -webkit-backface-visibility: hidden;
    backface-visibility: hidden;
    -webkit-perspective: 1000;
    perspective: 1000;
  }
  .carousel-inner.vertical > .item.next,
  .carousel-inner.vertical > .item.active.right {
    -webkit-transform: translate3d(0, 33.33%, 0);
    transform: translate3d(0, 33.33%, 0);
    top: 0;
  }
  .carousel-inner.vertical > .item.prev,
  .carousel-inner.vertical > .item.active.left {
    -webkit-transform: translate3d(0, -33.33%, 0);
    transform: translate3d(0, -33.33%, 0);
    top: 0;
  }
  .carousel-inner.vertical > .item.next.left,
  .carousel-inner.vertical > .item.prev.right,
  .carousel-inner.vertical > .item.active {
    -webkit-transform: translate3d(0, 0, 0);
    transform: translate3d(0, 0, 0);
    top: 0;
  }
}

.carousel-inner.vertical > .active {
  top: 0;
}
.carousel-inner.vertical > .next,
.carousel-inner.vertical > .prev {
  top: 0;
  height: 100%;
  width: auto;
}
.carousel-inner.vertical > .next {
  left: 0;
  top: 33.33%;
  right:0;
}
.carousel-inner.vertical > .prev {
  left: 0;
  top: -33.33%;
  right:0;
}
.carousel-inner.vertical > .next.left,
.carousel-inner.vertical > .prev.right {
  top: 0;
}
.carousel-inner.vertical > .active.left {
  left: 0;
  top: -33.33%;
  right:0;
}
.carousel-inner.vertical > .active.right {
  left: 0;
  top: 33.33%;
  right:0;
}

#carousel-pager .carousel-control.left {
    bottom: initial;
    width: 100%;
}
#carousel-pager .carousel-control.right {
    top: initial;
    width: 100%;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
<div style="min-height: 600px; max-height: 600px; min-width:200px; max-width:200px; ">
<div class="float_sidebar" style=" width:200px; overflow:hidden; height:auto; left:20px; border: 1px solid #00ffff; border-radius:7px; padding:10px;">
 <p align="center">이 선생은 어떄요?	</p>
<hr style="clear: both;">
<div class="col-md-3" style="width: 100%; height: 80%;">
            <div id="carousel-pager" class="carousel slide " data-ride="carousel" data-interval="3000">
                <!-- Carousel items -->
         	  <div class="carousel-inner vertical" style="height:30%; "  id="fi">
                
                </div>
 			</div>
 			
 			
              <div id="carousel-pager" class="carousel slide " data-ride="carousel" data-interval="3000" >
                <!-- Carousel items -->
                <div class="carousel-inner vertical" id="se">
                   
                </div>
 			</div>
 			
              <div id="carousel-pager" class="carousel slide " data-ride="carousel" data-interval="3000" >
                <!-- Carousel items -->
                <div class="carousel-inner vertical" id="th">
                  
                </div>
 			</div>
        
        
        
        
        </div>
<%if(login==null){}else{ %>
<input type="hidden" value="<%=login.getUserNo() %>" id="userno">
<%} %>
</div>
</div>
</body>
</html>