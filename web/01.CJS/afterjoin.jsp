<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

 <link href="./css/afterjoin.css" rel="stylesheet" type="text/css" >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<style type="text/css">
#alef{ 
margin-left: 230px;
}

.body{
padding:300px; auto;

}
</style>
</head>
<body>
<%@ include file="/common\navbar.jsp" %>
<div class="body" style="height:800px; background:#eeeeee; margin:-20px; background:#eeeeee;" 
onclick="location.href='/prototype/index.jsp'">

 <div class="col-sm-6 col-md-6" id="alef">
            <div class="alert alert-info">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">
                    </button>
                <span class="glyphicon glyphicon-info-sign"></span> <strong>Info Message</strong>
                <hr class="message-inner-separator">
                <p>
                가입하신 < > 으로 가입승인 메일을 보냈음 <Br> 화면 아무곳을 클릭하면 메인화면으로 이동됩니다.</p>
            </div>
        </div>
</div>



<%@ include file="/common\footer.jsp" %>
</body>
</html>