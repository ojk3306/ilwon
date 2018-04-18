<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String message ="";
if(request.getAttribute("message")!=null)
message = (String)request.getAttribute("message");

%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">
<script type="text/javascript" src="/prototype/03.OHW\resources\js\jquery-3.3.1.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<title>로그인</title>

<script type="text/javascript">

	$(function () {
		'use strict';
	if(<%=message.length()%> > 7){
		$('#myModal').modal('show');
		}
	function emulatedIEMajorVersion() {
		var groups = /MSIE ([0-9.]+)/.exec(window.navigator.userAgent)
		if (groups === null) {
		return null
		}
		var ieVersionNum = parseInt(groups[1], 10)
		var ieMajorVersion = Math.floor(ieVersionNum)
		return ieMajorVersion
	}

	function actualNonEmulatedIEMajorVersion() {
		var jscriptVersion = new Function('/*@cc_on return @_jscript_version; @*/')() // jshint ignore:line
		if (jscriptVersion === undefined) {
		return 11 // IE11+ not in emulation mode
		}
		if (jscriptVersion < 9) {
		return 8 // IE8 (or lower; haven't tested on IE<8)
		}
		return jscriptVersion // IE9 or IE10 in any mode, or IE11 in non-IE11 mode
	}
		var ua = window.navigator.userAgent
		if (ua.indexOf('Opera') > -1 || ua.indexOf('Presto') > -1) {
		return // Opera, which might pretend to be IE
		}
		var emulated = emulatedIEMajorVersion()
		if (emulated === null) {
		return // Not IE
		}
		var nonEmulated = actualNonEmulatedIEMajorVersion()

		if (emulated !== nonEmulated) {
		window.alert('WARNING: You appear to be using IE' + nonEmulated + ' in IE' + emulated + ' emulation mode.\nIE emulation modes can behave significantly differently from ACTUAL older versions of IE.\nPLEASE DON\'T FILE BOOTSTRAP BUGS based on testing in IE emulation modes!')
		}
	})

	$(function () {
	  'use strict';
	  if (navigator.userAgent.match(/IEMobile\/10\.0/)) {
	    var msViewportStyle = document.createElement('style')
	    msViewportStyle.appendChild(
	      document.createTextNode(
	        '@-ms-viewport{width:auto!important}'
	      )
	    )
	    document.querySelector('head').appendChild(msViewportStyle)
	  }
	})
	
</script>
    
<style type="text/css">
    
	body {
		padding-top: 40px;
		padding-bottom: 40px;
	
	}

	.form-signin {
		max-width: 330px;
		padding: 15px;
		margin: 0 auto;
	}
	
	.form-signin .form-signin-heading, .form-signin .checkbox {
		margin-bottom: 10px;
	}
	
	.form-signin .checkbox {
		font-weight: normal;
	}
	
	.form-signin .form-control {
		position: relative;
		height: auto;
		-webkit-box-sizing: border-box;
		-moz-box-sizing: border-box;
		box-sizing: border-box;
		padding: 10px;
		font-size: 16px;
	}
	
	.form-signin .form-control:focus {
		z-index: 2;
	}
	
	.form-signin input[type="email"] {
		margin-bottom: -1px;
		border-bottom-right-radius: 0;
		border-bottom-left-radius: 0;
	}
	
	.form-signin input[type="password"] {
		margin-bottom: 10px;
		border-top-left-radius: 0;
		border-top-right-radius: 0;
	}	
    
</style>
   
</head>

<body style="background:#e9e9e9"> 

<div style="height:52px; margin-top:-40px; ">
<%@ include file = "../../common/navbar.jsp" %>
<%@ include file ="/01.CJS/sidebar.jsp" %>
</div>
    
<div class = "container" style="margin-top:100px; height: 680px;" >
	<form class = "form-signin" action = "<%= request.getContextPath() %>/login.sm">
		<center><h2 class="form-signin-heading">로그인</h2></center>
		
		<label for="inputEmail" class="sr-only">ID</label>
		<input type="email" id="inputEmail" name = "id" class="form-control" placeholder="e-mail" required autofocus>
		
		<label for="inputPassword" class="sr-only">Password</label>
		<input type="password" id="inputPassword" name = "pwd" class="form-control" placeholder="Password" required>
		
		<div class="checkbox">		
		
		<label>
	 
		</label>
				
		</div>		
		<button class="btn btn-lg btn-primary btn-block ohw-btn" type="submit">LogIn</button>
	</form>
	<div class = "form-signin ohw-btn">
	<a href = "/prototype/04.OJK/join_start.jsp">
		<input type = "button" class = "btn btn-lg btn-success btn-block " value = "아직 회원이 아니시라면?">
	</a>
</div>
</div>

<div style="margin-bottom: -200px; ">
	<%@ include file = "../../common/footer.jsp" %>
</div>


<div class="modal fade"  id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content" style="width:500px; height: 200px; margin-top: 200px;">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">로그인 실패</h4>
      </div>
      <div class="modal-body">
 이메일 및 패스워드가 잘못되었습니다!<br>
 확인후 다시 입력해주세요!
<br />
<br />
 
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>
</body>
</html>
