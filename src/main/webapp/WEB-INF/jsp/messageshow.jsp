<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<meta name="keywords" content="RSS,阅读,RSS订阅,流沙">
	<meta name="description" content="专注于内容订阅">
	<meta name="twitter:image" content="http://www.echopublish.com/img/paper-plane.png" />
    <!-- bootstrap.min.css -->
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<!-- easyform.css -->
	<link rel="stylesheet" href="css/easyform.css">
    <!-- freelancer.min.css -->
    <link href="https://cdn.bootcss.com/startbootstrap-freelancer/3.3.7/css/freelancer.min.css" rel="stylesheet">
    <!-- font-awesome.min.css -->
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="frontstageresource/css/messageshow.css" type="text/css">
    <!-- jquery.min.js -->
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
    <!-- bootstrap.min.js -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!--引入 easyform.js-->
	<script type="text/javascript" src="js/easyform.js"></script>
    <!-- easing.min.js -->
    <script src="https://cdn.bootcss.com/jquery-easing/1.4.1/jquery.easing.min.js"></script>
    <!-- freelancer.min.js -->
    <script src="https://cdn.bootcss.com/startbootstrap-freelancer/3.3.7/js/freelancer.min.js"></script>
	<script type="text/javascript" src="frontstageresource/js/messageshow.js"></script>
<title>显示消息</title>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="index.html"> <img id="fslogo"
				class="img-responsive" src="indexresource/img/flowingsand.gif"
				alt="">
			</a>
		</div>
	</div>
	</nav>
	
	<section class="content-wrap">
	<div class="container">
		<div class="row">
			<main class="main-content">
			<c:forEach var="item" items="${message}" >
			<article class="post">
				<div class="post-head">
				<h1 class="post-title">我的消息</h1>
					<div class="post-meta text-right">
						<time class="post-date" datetime='${item.mtime}' title='${item.mtime}'>${item.mtime}</time>
					</div>
				</div>
				<div class="post-content">
					<p>${item.messages}</p>
				</div>
				<footer class="post-footer clearfix"> </footer> 
			</article>
			</c:forEach>
			</main>
		</div>
	</div>
	</section>
	
</body>
</html>