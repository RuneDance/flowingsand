<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>修改密码</title>
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
<link href="frontstageresource/css/modify.css" rel="stylesheet" type="text/css">

<!-- jquery.min.js -->
<script type="text/javascript" src="http://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
<!--引入 easyform.js-->
<script type="text/javascript" src="js/easyform.js"></script>
<!-- bootstrap.min.js -->
<script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- ProgressBar.js -->
<script type="text/javascript" src="js/ProgressBar.js"></script>
<script src="frontstageresource/js/modify.js" type="text/javascript"></script>

</head>
<body>
	<div id="vader"></div>
	<div id="logo">
		<a href="index.html"> <img id="fslogo" src="indexresource/img/flowingsand.gif" alt="流沙"></a>
	</div>
	<div class="wrapper">
		<canvas id="canvas"></canvas>
		<div class="container">
		
			<div class="row text-center">
				<div class="col-xs-12 col-sm-12">
					<div id="validateEmail">
						<h6 class="send-tips">''</h6>
						<input id="email" name="email" type="text" placeholder="请输入校验邮箱" data-easyform="!null;real-time;" data-message="邮箱不能为空！" data-easytip="position:top;class:easy-red;">
						<button type="submit" id="send-button">发 送</button>
					</div>
				</div>
			</div>
			
			<div class="row text-center">
				<div class="col-xs-12 col-sm-12">
					<form id="modifypwd" method="post" action="modify.html" onsubmit="return modifyPwd();">
						<h6 class="modify-tips">''</h6>
						<input id="hid-email" name="email" type="hidden">
						<input id="newPwd" name="pwd" type="password" placeholder="新密码" data-easyform="length:6 16;char-normal;real-time;" data-message="新密码必须为6—16位" data-easytip="position:top;class:easy-red;"> 
						<input id="newApwd" name="newApwd" type="password" placeholder="确认新密码" data-easyform="equal:#newPwd;real-time;" data-message="两次输入的密码不一致" data-easytip="position:top;class:easy-red;"> 
						<input id="validatecode" name="" type="text" placeholder="验证码" data-easyform="length:6;real-time;ajax:checkCode();" data-message="验证码必须为6位纯数字" data-easytip="class:easy-red;position:top;">
						<button type="submit" id="modify-button">修 改</button>
					</form>
				</div>
			</div>

		</div>

	</div>
	<!-- 背景星空图 -->
	<script type="text/javascript" src="frontstageresource/js/starscloud.js"></script>
</body>
</html>