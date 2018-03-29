<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>jQuery StepProgressBar Plugin Example</title>
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/css/bootstrap.min.css" integrity="sha384-y3tfxAZXuh4HwSYylfB+J125MxIs6mR5FOHamPBG064zB+AFeWH94NdvaCBm8qnd" crossorigin="anonymous">
<link href="/prototype/01.CJS\js\jquery.stepProgressBar.css" rel="stylesheet" type="text/css">
<style>
#myGoal{
width: 600px;
height: 0px;
}

</style>
</head>

<body>


<div id="myGoal"></div>

<script src="http://code.jquery.com/jquery-1.12.2.min.js"></script>
<script src="/prototype/01.CJS\js\jquery.stepProgressBar.js"></script>
<script>
$('#myGoal').stepProgressBar({
  currentValue: 200,
  steps: [
    { value: 100 },
    {
    	 topLabel: '최소',
         value: 800,
         bottomLabel: '800'
    },
    {  
    	 topLabel: '최대',
         value: 1000,
         bottomLabel: '1000'
    }
  ],
  unit: '$'
});

        
</script>

<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
</body>
</html>