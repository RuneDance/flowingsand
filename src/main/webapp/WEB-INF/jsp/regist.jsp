<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="twitter:card" content="summary" />
    <meta name="twitter:site" content="@echocen_andrew" />
    <meta name="twitter:title" content="Simple, Economical Client Documents" />
    <meta name="twitter:description" content="A web service for generating & publishing professional emails, PDFs, DOCXs, etc by merging templates & data. Manage your company's outgoing mail with ease." />
    <meta name="twitter:image" content="http://www.echopublish.com/img/paper-plane.png" />

<!-- bootstrap.min.css -->
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- easyform.css -->
<link rel="stylesheet" href="css/easyform.css">
<link href="frontstageresource/css/regist.css" rel="stylesheet" type="text/css">

<!-- jquery.min.js -->
<script type="text/javascript" src="http://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
<!--引入 easyform.js-->
<script type="text/javascript" src="js/easyform.js"></script>
<!-- bootstrap.min.js -->
<script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- ProgressBar.js -->
<script type="text/javascript" src="js/ProgressBar.js"></script>
<script src="frontstageresource/js/regist.js" type="text/javascript"></script>
</head>
<body>
	<div id="vader"></div>
	<div id="logo"> 
		<a href="index.html"> <img id="fslogo" src="indexresource/img/flowingsand.gif" alt=""></a>
	</div>
	<div class="wrapper">
		<canvas id="canvas"></canvas>
		<div class="container">
			<h4 id="reg-tips"></h4>
			<form id="reg-form" method="post" action="register.html" onsubmit = "return checkUser();">
				<input id="nickname" name="nname" type="text" aria-label="请输入昵称" placeholder="昵称" data-easyform="length:0 16;char-normal;real-time;"  data-message="请输入昵称" data-easytip="class:easy-red;position:top;">
				<input id="username" name="uname" type="text" aria-label="手机号（仅支持中国大陆）" placeholder="用户名" data-easyform="length:4 16;char-normal;real-time;ajax:checkUname();"  data-message="用户名必须为4—16位的英文字母或数字" data-easytip="class:easy-red;position:top;">
				<input id="pwd" name="pwd" type="password" aria-label="密码" placeholder="密码" data-easyform="length:6 16;char-normal;real-time;" data-message="密码必须为6—16位" data-easytip="position:top;class:easy-red;">
				<input id="pswagain" name="apwd" type="password" aria-label="请确保输入的确认密码与密码相同" placeholder="确认密码" data-easyform="equal:#pwd;real-time;" data-message="两次输入的密码不一致" data-easytip="position:top;class:easy-red;">
				<input id="email" name="email" type="text" aria-label="请输入正确的Email邮箱" placeholder="邮箱" data-easyform="email;real-time;ajax:checkEmail();" data-message="Email格式不正确" data-easytip="position:top;class:easy-red;">
				<button type="submit" id="btn-regist">注 册</button>
			</form>
		</div>
	</div>
<!-- 背景星空图 -->
<script type="text/javascript" src="frontstageresource/js/starscloud.js"></script>
</body>
</html>