<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String message=(String)request.getAttribute("message");
%>
<html>
<head>
<script type="text/javascript" src="/prototype/common\resources\js\jquery-3.3.1.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="/prototype/common\resources\css\bootstrap.min.css" rel="stylesheet">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>신고 폼</title>
<script type="text/javascript">
$(document).on('click', '#close-preview', function(){ 
    $('.image-preview').popover('hide');
    // Hover befor close the preview
    $('.image-preview').hover(
        function () {
           $('.image-preview').popover('show');
        }, 
         function () {
           $('.image-preview').popover('hide');
        }
    );    
});

$(function() {
	if(<%=message%> != null)
		alert('<%=message%>');
    // Create the close button
    var closebtn = $('<button/>', {
        type:"button",
        text: 'x',
        id: 'close-preview',
        style: 'font-size: initial;',
    });
    closebtn.attr("class","close pull-right");
    // Set the popover default content
    $('.image-preview').popover({
        trigger:'manual',
        html:true,
        title: "<strong>Preview</strong>"+$(closebtn)[0].outerHTML,
        content: "There's no image",
        placement:'bottom'
    });
    // Clear event
    $('.image-preview-clear').click(function(){
        $('.image-preview').attr("data-content","").popover('hide');
        $('.image-preview-filename').val("");
        $('.image-preview-clear').hide();
        $('.image-preview-input input:file').val("");
        $(".image-preview-input-title").text("Browse"); 
    });  
    // Create the preview image
    $(".image-preview-input input:file").change(function (){     
        var img = $('<img/>', {
            id: 'dynamic',
            width:250,
            height:200
        });      
        var file = this.files[0];
        var reader = new FileReader();
        // Set preview image into the popover data-content
        reader.onload = function (e) {
            $(".image-preview-input-title").text("Change");
            $(".image-preview-clear").show();
            $(".image-preview-filename").val(file.name);            
            img.attr('src', e.target.result);
            $(".image-preview").attr("data-content",$(img)[0].outerHTML).popover("show");
        }        
        reader.readAsDataURL(file);
    });  
});

//delayed execution

//module inputLengthLabel
//Carlos C Soto <eclipxe13@gmail.com>
(function ($) {
 "use strict";
 // module definition
 $.fn.inputLengthLabel = function (options) {
     // setup options
     if (options === undefined || 'Object' !== typeof options) {
         options = $.fn.inputLengthLabel.defaults;
     }
     if (this.attr('maxlength')) {
         options.maxlength = this.attr('maxlength');
     }
     if (this.attr('data-lengthlabel-threshold')) {
         options.threshold = this.attr('data-lengthlabel-threshold');
     }
     options = $.extend({}, $.fn.inputLengthLabel.defaults, options);
     options.classcontainer = options.classprefix + 'container';
     options.classlabel = options.classprefix + 'label';
     options.classinfo = options.classprefix + 'info';
     options.classwarn = options.classprefix + 'warn';
     options.classdanger = options.classprefix + 'danger';
     // create container
     var container, element, fnkeypress;
     container = $(document.createElement('div')).addClass(options.classcontainer).insertBefore(this);
     element = $(document.createElement('span')).addClass(options.classlabel).appendTo(container);
     this.appendTo(container);
     // define trigger function
     fnkeypress = function () {
         var ml, tp, ts, cl;
         ml = this.attr('maxlength');
         if (isNaN(ml) || ml < 0) {
             ml = options.maxlength;
             if (ml > 0) {
                 this.attr('maxlength', ml);
             }
         }
         tp = this.attr('data-lengthlabel-threshold');
         if (isNaN(tp) || tp < 0 || tp > 1) {
             tp = options.threshold;
             this.attr('data-lengthlabel-threshold', tp);
         }
         ts = Math.round(ml * tp);
         cl = $(this).val().length;
         element.text((ml > 0) ? cl + '/' + ml : cl);
         if (0 === ml || cl < ts) {
             if (!element.hasClass(options.classinfo)) {
                 element.removeClass(options.classdanger + ' ' + options.classwarn).addClass(options.classinfo);
             }
         } else if (cl < ml) {
             if (!element.hasClass(options.classwarn)) {
                 element.removeClass(options.classdanger + ' ' + options.classinfo).addClass(options.classwarn);
             }
         } else {
             if (!element.hasClass(options.classdanger)) {
                 element.removeClass(options.classwarn + ' ' + options.classinfo).addClass(options.classdanger);
             }
         }
     }.bind(this);
     this.keyup(fnkeypress);
     fnkeypress();
 };
 // module default options
 $.fn.inputLengthLabel.defaults = {
     threshold: 0.7,
     maxlength: 255,
     classprefix: 'inputlengthlabel-'
 };
 
}(jQuery));
</script>


<style type="text/css">
.inputlengthlabel-container {
    position: relative;
}

.inputlengthlabel-container .inputlengthlabel-label {
    position: absolute;
    bottom: 0;
    left: 0;
    padding: 0.5em 1em;
    border-radius: 0.25em;
    font-weight: bold;
    font-size: 80%;
    color: #fff;
}

.inputlengthlabel-container .inputlengthlabel-info {
    background-color: #5bc0de;
}

.inputlengthlabel-container .inputlengthlabel-warn {
    background-color: #f0Ad4e;
}

.inputlengthlabel-container .inputlengthlabel-danger {
    background-color: #d9534f;
}
.container{
    margin-top:120px;

}
.image-preview-input {
    position: relative;
    overflow: hidden;
	margin: 0px;    
    color: #333;
    background-color: #fff;
    border-color: #ccc;    
}
.image-preview-input input[type=file] {
	position: absolute;
	top: 0;
	right: 0;
	margin: 0;
	padding: 0;
	font-size: 20px;
	cursor: pointer;
	opacity: 0;
	filter: alpha(opacity=0);
}
.image-preview-input-title {
    margin-left:2px;
}
</style>
</head>
<body style="background:#e9e9e9">
<%@ include file="/common/navbar.jsp" %>
<%@include file="/01.CJS\sidebar.jsp" %>
<div class="container" >
<div class="row">
<div class="col-md-6 col-md-offset-3" style="margin-top: -650px;">
    
    <form method="post" action="/prototype/inreport" enctype="multipart/form-data">
   	<%if(loginUser!=null){ %>
   	<input type="hidden" name="userno" value="<%=loginUser.getUserNo()%>">
   	<% }%>
        <fieldset>
            <div class="form-group">
              <br>
                <label for="exampleInputEmail1">제목</label>
                <input type="text" class="form-control" name="title">
            </div>
            <div class="form-group">
<label>내용</label>
<textarea class="form-control" id="comment" maxlength="3000" rows="20" name="contents" placeholder="신고는 신중히" >
 신고 유형: 
	ex)욕설, 사기, 선정성 ...
	
신고 내용:

사건 발생일: 
    ex)18/01/25




보다 빠른 사건 처리를 위해 첨부파일이 필수적으로 필요합니다.
이점 유의해 주세요.
</textarea>
            </div>
            <div class="col-xs-12 col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">  
            <!-- image-preview-filename input [CUT FROM HERE]-->
            <div class="input-group image-preview">
                <input type="text" class="form-control image-preview-filename" disabled="disabled"> <!-- don't give a name === doesn't send on POST/GET -->
                <span class="input-group-btn">
                    <!-- image-preview-clear button -->
                    <button type="button" class="btn btn-default image-preview-clear" style="display:none;">
                        <span class="glyphicon glyphicon-remove"></span> Clear
                    </button>
                    <!-- image-preview-input -->
                    <div class="btn btn-default image-preview-input">
                        <span class="glyphicon glyphicon-folder-open"></span>
                        <span class="image-preview-input-title">Browse</span>
<input type="file" accept="image/png, image/jpeg, image/gif" name="titleimg"/> <!-- rename it -->
                    </div>
                </span>
            </div>
            
            <!-- /input-group image-preview [TO HERE]--> 
        </div>
           
           
           <br>
           <br>
           <br>
           <center>
            <button type="submit" class="btn btn-primary">Submit</button>
            <button type="reset" class="btn btn-primary">Reset</button>
            </center>
        </fieldset>
    </form>
    
</div>
<!-- 파일  -->
  
    

</div>
</div>

<div style="margin-top: 50px;">
<%@include file="/common/footer.jsp" %>
   </div>
   
</body>
</html>