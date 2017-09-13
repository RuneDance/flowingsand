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

<title>登陆</title>
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
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<!-- easyform.css -->
	<link rel="stylesheet" href="css/easyform.css">
	<link href="frontstageresource/css/user.css" rel="stylesheet" type="text/css">
	<!-- jquery.min.js -->
	<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
	<!--引入 easyform.js-->
	<script type="text/javascript" src="js/easyform.js"></script>
	<!-- bootstrap.min.js -->
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<!-- ProgressBar.js -->
	<script type="text/javascript" src="js/ProgressBar.js"></script>
	<script src="frontstageresource/js/user.js" type="text/javascript"></script>
<% 
	String smsg="";
	if(session.getAttribute("msg") != null){
		smsg=request.getSession().getAttribute("msg").toString();
	}
%>

</head>
<body>
	<div id="vader"></div>
	<div id="logo">
		<a href="index.html"> <img id="fslogo" src="indexresource/img/flowingsand.gif" alt=""></a>
	</div>
	<div class="wrapper">
		<canvas id="canvas"></canvas>
		<div class="container">
			<h4 id="log-tips"><%=smsg %></h4>
			<form id="log-form" method="post" action="login.html" onsubmit = "return checkUser();">
				<input id="username" name="uname" type="text" aria-label="手机号（仅支持中国大陆）" placeholder="用户名" data-easyform="length:4 16;char-normal;real-time;"  data-message="用户名必须为4—16位的英文字母或数字" data-easytip="class:easy-red;position:top;">
				<input id="pwd" name="pwd" type="password" aria-label="密码" placeholder="密码" data-easyform="length:6-16;real-time;" data-message="密码必须为6—16位" data-easytip="position:top;class:easy-red;">
				<button type="submit" id="btn-login">登 陆</button>
				<h5><a href="modify.html">忘记密码？</a></h5>
			</form>
		</div>
	</div>
<!-- 背景星空图 -->
<script type="text/javascript" src="frontstageresource/js/starscloud.js"></script>
</body>
</html>