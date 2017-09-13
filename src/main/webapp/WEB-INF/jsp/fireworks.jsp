<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>fireworks</title>

<link rel="stylesheet" type="text/css" href="css/normalize.css">

<!--引入 jquery.js-->
<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript" src="js/fireworks.js"></script>
</head>
<body>
	<div class="demo"></div>
	<script type="text/javascript">
		$('.demo').fireworks({ 
		  sound: false, // sound effect
		  opacity: 0.9, 
		  width: '100%', 
		  height: '100%' 
		});
	</script>
</body>
</html>