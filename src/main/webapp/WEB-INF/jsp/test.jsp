<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
<title>首 页</title>
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
<link rel="stylesheet" type="text/css" href="css/test.css">

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
<script type="text/javascript" src="frontstageresource/js/test.js"></script>

</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">


				<a id="logo" class="navbar-brand" href="index.html"> 
					<img src="indexresource/img/flowingsand.gif" alt="logo" />
				</a>

	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
				<div class="navbar-header page-scroll">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span> 
						<span class="icon-bar"></span> 
						<span class="icon-bar"></span> 
						<span class="icon-bar"></span>
					</button>
				</div>
			</div>
			
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
			
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul id="bs-dropdownmenu" class="nav navbar-nav">
						<li class="page-scroll" id="user_name"></li>
						<li class="page-scroll" id="per_set">
							<a href='#'> <span class='glyphicon glyphicon-cog btn-xs'> <strong>个人设置</strong></span></a>
						</li>
							<li class="page-scroll" id="mes_center"><a href='#'> <span class='glyphicon glyphicon-comment btn-xs'> <strong>消息中心</strong></span></a>
						</li>
						<li class="page-scroll exit_set">
							<a id='exit' href='#'> <span class='glyphicon glyphicon-off btn-xs'> <strong>退出</strong></span></a>
						</li>
					</ul>
					<div class="dropdown text-right" id="drop-down-menu">
						<a class="dropdown-toggle" data-toggle="dropdown" id="ddm"> 
							<i class="fa fa-align-justify fa-2x" id="DropdownMenu"></i>
						</a>
						<ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="ddm">
							<li role="presentation" class="dropdown-header text-center" id="u_name"></li>
							<li role="presentation" class="divider"></li>
							<li role="presentation" class="text-center" id="p_set">
								<a role="menuitem" tabindex="-1" href="#"><strong>个人设置</strong></a>
							</li>
							<li role="presentation" class="text-center" id="c_mes">
								<a role="menuitem" tabindex="-1" href="#"><strong>消息中心</strong></a>
							</li>
							<li role="presentation" class="text-center exit_set">
								<a id="exit" role="menuitem" tabindex="-1" href='#'> <strong>退出</strong></a>
							</li>
						</ul>
					</div>
					</div>
			</div>
		</div>
	</div>
	



	</nav>
</body>
</html>