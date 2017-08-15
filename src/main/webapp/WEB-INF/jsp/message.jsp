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
	
	<!-- jquery-ui.min.css -->
	<link href="http://cdn.bootcss.com/jqueryui/1.12.1/jquery-ui.min.css" rel="stylesheet">
    <!-- bootstrap.min.css -->
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- freelancer.min.css -->
    <link href="http://cdn.bootcss.com/startbootstrap-freelancer/3.3.7/css/freelancer.min.css" rel="stylesheet">
    <link rel="stylesheet" href="frontstageresource/css/message.css" type="text/css">
    
    
    <!-- jquery.min.js -->
    <script type="text/javascript" src="http://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
    <!-- jquery-ui.min.js -->
    <script type="text/javascript" src="http://cdn.bootcss.com/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <!-- bootstrap.min.js -->
    <!-- <script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
    <!-- freelancer.min.js -->
    <script src="http://cdn.bootcss.com/startbootstrap-freelancer/3.3.7/js/freelancer.min.js"></script>
	<script type="text/javascript" src="frontstageresource/js/message.js"></script>
<title>信息中心</title>
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
	<section>
	<h4 class="text-center">我的消息</h4>
	<div class="container" id="main">
		<c:forEach var="item" items="${messages}" varStatus="status">
			<%-- <c:if test="${empty item}">
				<h4>为空：${request.getAttribute("messages")}</h4>
				<label>为空</label>showmes
			</c:if> --%>
			<div class="row" id="${item.mid}">
				<div class="col-xs-9 col-sm-9">
					<div class="container message">
						<div class="row">
							<div class="col-xs-4 col-sm-4">${item.messages.substring(0,3)} …</div>
							<div class="col-xs-8 col-sm-8 text-right times">${item.mtime }</div>
						</div>
					</div>
				</div>
				<div class="col-xs-3 col-sm-3">
					<button type="button" class="btn btn-info btn-sm del">删除</button>
				</div>
			</div>
		</c:forEach>
	</div>
	</section>
	
	<div id="dialog-confirm" title="删除提示：">
	  <p><span class="ui-icon ui-icon-alert"></span>确定删除此消息吗?</p>
	</div>
	
</body>
</html>