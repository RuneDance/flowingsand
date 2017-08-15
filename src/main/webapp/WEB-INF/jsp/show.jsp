<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<meta name="twitter:card" content="summary" />
<meta name="twitter:site" content="@echocen_andrew" />
<meta name="twitter:title" content="Simple, Economical Client Documents" />
<meta name="twitter:description"
	content="A web service for generating & publishing professional emails, PDFs, DOCXs, etc by merging templates & data. Manage your company's outgoing mail with ease." />
<meta name="twitter:image"
	content="http://www.echopublish.com/img/paper-plane.png" />


<title>阅 读</title>

<!-- bootstrap.min.css -->
<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- freelancer.min.css -->
<link
	href="http://cdn.bootcss.com/startbootstrap-freelancer/3.3.7/css/freelancer.min.css"
	rel="stylesheet">
<!-- font-awesome.min.css -->
<link
	href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="frontstageresource/css/show.css" rel="stylesheet" type="text/css">

<!-- jquery.min.js -->
<script type="text/javascript"
	src="http://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
<!-- bootstrap.min.js -->
<script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- easing.min.js -->
<script
	src="http://cdn.bootcss.com/jquery-easing/1.4.1/jquery.easing.min.js"></script>
<!-- freelancer.min.js -->
<script
	src="http://cdn.bootcss.com/startbootstrap-freelancer/3.3.7/js/freelancer.min.js"></script>
<!-- ProgressBar.js -->
<script type="text/javascript" src="js/ProgressBar.js"></script>
<script src="frontstageresource/js/show.js" type="text/javascript"></script>

</head>
<body>
	<!-- 导航条 -->
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="index.html"> 
			<img id="fslogo" class="img-responsive" src="indexresource/img/flowingsand.gif" alt="">
			</a>
		</div>
	</div>
	</nav>

	<!-- 内容 -->
	<section class="content-wrap">
	<div class="container">
		<div class="row">
			<main class="main-content">
			<c:forEach var="item" items="${adetails}" >
			<article class="post">
				<div class="post-head">
					<h1 class="post-title">${item.title}</h1>
					<div class="post-meta">
						<span class="author">作者：<a href="#">${item.author}</a></span> •
						<time class="post-date" datetime='${item.atime}' title='${item.atime}'>${item.atime}</time>
					</div>
				</div>
	
				<div class="featured-media">
					<a href='${item.link}' class="thumbnail"> <img src='${item.link}' alt="图片" />
					</a>
				</div>
				<div class="post-content">
					<p>${item.acontents}</p>
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