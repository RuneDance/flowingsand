<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
    <meta name="twitter:description" content="A web service for generating & publishing professional emails, PDFs, DOCXs, etc by merging templates & data. Manage your company's outgoing mail with ease." />
    <meta name="twitter:image" content="http://www.echopublish.com/img/paper-plane.png" />
<title>首 页</title>
<!-- bootstrap.min.css -->
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- freelancer.min.css -->
<link href="http://cdn.bootcss.com/startbootstrap-freelancer/3.3.7/css/freelancer.min.css" rel="stylesheet">
<!-- font-awesome.min.css -->
<link href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="frontstageresource/css/home.css">

<!-- jquery.min.js -->
<script type="text/javascript" src="http://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
<!-- bootstrap.min.js -->
<script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- easing.min.js -->
<script src="http://cdn.bootcss.com/jquery-easing/1.4.1/jquery.easing.min.js"></script>
<!-- freelancer.min.js -->
<script src="http://cdn.bootcss.com/startbootstrap-freelancer/3.3.7/js/freelancer.min.js"></script>
<script type="text/javascript" src="frontstageresource/js/home.js"></script>
<% 
	String sname="";
	if(session.getAttribute("sname") != null){
		sname=request.getSession().getAttribute("sname").toString();
	}
%>
</head>
<body>
	<input id="sessionId" type="hidden" value="<%=sname%>" />
	<!-- 导航条 -->
	<nav class="navbar navbar-inverse navbar-fixed-top">

	<div class="container">
		<div class="row nav_bar">
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-2">
				<a id="logo" class="navbar-brand" href="index.html"> 
					<img src="indexresource/img/flowingsand.gif" alt="logo" />
				</a>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-10">
				<div class="navbar-header page-scroll">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span> 
						<span class="icon-bar"></span> 
						<span class="icon-bar"></span> 
						<span class="icon-bar"></span>
					</button>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul id="bs-dropdownmenu" class="nav navbar-nav">
						<li class="page-scroll" id="user_name"></li>

						<li class="page-scroll" id="per_set">
							<a href='#'>
								<span class='glyphicon glyphicon-cog btn-xs'> <strong>个人设置</strong></span>
							</a>
						</li>
						<li class="page-scroll" id="mes_center">
							<a href='#'> 
								<span class='glyphicon glyphicon-comment btn-xs'> <strong>消息中心</strong></span>
							</a>
						</li>
						<li class="page-scroll exit_set">
							<a id='exit' href='#'> 
								<span class='glyphicon glyphicon-off btn-xs'> <strong>退出</strong></span>
							</a>
						</li>
					</ul>
					<div class="dropdown text-right" id="drop-down-menu">
						<a class="dropdown-toggle" data-toggle="dropdown" id="ddm"> 
							<i class="fa fa-list fa-1x" id="DropdownMenu"></i>
						</a>
						<ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="ddm">
							<li role="presentation" class="text-center" id="u_name"></li>
							<li role="presentation" class="divider"></li>
							<li role="presentation" class="text-center" id="p_set">
								<a role="menuitem" tabindex="-1" href="#"><span>个人设置</span></a>
							</li>
							<li role="presentation" class="text-center" id="c_mes">
								<a role="menuitem" tabindex="-1" href="#"><span>消息中心</span></a>
							</li>
							<li role="presentation" class="divider"></li>
							<li role="presentation" class="text-center exit_set">
								<a id="exit" role="menuitem" tabindex="-1" href='#'><span>退出</span></a>
							</li>
						</ul>
					</div>

				</div>
			</div>
		</div>

	</div>
	</nav>

	<!-- 内容 -->
	<section class="content-wrap">
	<div class="container">
		<div class="row">
			<main class="col-md-8 main-content"> 
			<c:forEach var="item" items="${articles}" >
			<article id="${item.aid}" class="post">
			<div class="post-head">
				<h1 class="post-title">
					${item.title}
				</h1>
				<div class="post-meta">
					<span class="author">作者：<a>${item.author}</a></span>• <time class="post-date" datetime='${item.atime}' title='${item.atime}'>${item.atime}</time>
				</div>
			</div>
			
			<%-- <div class="featured-media">
				<a href='${item.link}' class="thumbnail">
					<img src='${item.link}' alt="图片" />
				</a>
			</div> --%>
			<div class="post-content">
				<c:if test="${fn:length(item.acontents)>'121'}">
					<p>${item.acontents.substring(0,121)} ……</p>
				</c:if>
				<c:if test="${fn:length(item.acontents)<='121'}">
					<p>${item.acontents}</p>
				</c:if>
			</div>
			<div class="post-permalink">
				<span class="btn btn-default">阅读全文</span>
			</div>
			<footer class="post-footer clearfix">
			</footer>
			</article> 
			</c:forEach>
			
			<!-- 分页 -->
			<nav class="pagination" role="navigation">
				<c:choose>  
		            <c:when test="${page.pageNow - 1 > 0}">  
		                <a class="btn btn-default btn-sm" href="home.html?pageNow=${page.pageNow - 1}" role="button">
		                	<strong>&lsaquo;</strong>
		                </a>  
		            </c:when>  
		            <c:when test="${page.pageNow - 1 <= 0}">  
		                <a class="btn btn-default btn-sm disabled" href="home.html?pageNow=1" role="button">
							<strong>&lsaquo;</strong>
						</a> 
		            </c:when>  
		        </c:choose>
				<button class="btn btn-danger btn-sm">第 <c:out value="${page.pageNow}"/> 页 ⁄ 共 <c:out value="${page.totalPageCount}"/> 页</button>
				<c:choose>  
		            <c:when test="${page.totalPageCount==0}">  
		                <a class="btn btn-default btn-sm disabled" href="home.html?pageNow=${page.pageNow}" role="button">
		                	<strong>&rsaquo;</strong>
		                </a>  
		            </c:when>
		            <c:when test="${page.pageNow < page.totalPageCount}">  
		                <a class="btn btn-default btn-sm" href="home.html?pageNow=${page.pageNow + 1}" role="button">
		                	<strong>&rsaquo;</strong>
		                </a>  
		            </c:when>
		            <c:when test="${page.pageNow >= page.totalPageCount}">  
		                <a class="btn btn-default btn-sm disabled" href="home.html?pageNow=${page.totalPageCount}" role="button">
		                	<strong>&rsaquo;</strong>
		                </a>  
		            </c:when>
		        </c:choose>
			</nav> 
			</main>
			
			<aside class="col-md-4 sidebar">
                
	<!-- start tag cloud widget -->
	<div class="widget">
		<h4 class="title text-center">社区</h4>
		<hr/>
		<div class="content community">
			<p class="communion">与我们交流</p>
			<p><a href="#" title="Ghost中文网问答社区" target="_blank" onclick="_hmt.push(['_trackEvent', 'big-button', 'click', '问答社区'])"><i class="fa fa-comments"></i> 问答社区</a></p>
			<p><a href="#" title="Ghost中文网官方微博" target="_blank" onclick="_hmt.push(['_trackEvent', 'big-button', 'click', '官方微博'])"><i class="fa fa-weibo"></i> 官方微博</a></p>
			<p><a href="#" title="Ghost中文网官方qq" target="_blank" onclick="_hmt.push(['_trackEvent', 'big-button', 'click', '官方qq群'])"><i class="fa fa-qq"></i> 官方qq群</a></p>
		</div>
	</div>
	<!-- end tag cloud widget -->	

	</aside>
			
		</div>
	</div>
	</section>
	
	
	<!-- Footer -->
    <footer class="text-center">
        <div class="footer-above">
            <div class="container">
                <div class="row">
                    <h4>联系我们</h4>
                </div>
                <div class="row">
                    
                    <div class="footer-col col-md-12">
                        <ul class="list-inline">
                            <li>
                                <a href="#"><i class="fa fa-facebook-square fa-3x"></i></a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-twitter-square fa-3x"></i></a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-tumblr-square fa-3x"></i></a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-youtube-square fa-3x"></i></a>
                            </li>
                        </ul>
                    </div>
                    
                </div>
            </div>
        </div>
        
        
        <div class="container-fluid foot-wrap">
	    <div class="row">
	        <div class="row-content col-lg-2 col-sm-4 col-xs-6">
	            <h3>友情链接</h3>
	            <ul>
	                <li><a href="#">Newsletter</a></li>
	                <li><a href="#">RSS feed</a></li>
	                <li><a href="#">RSS to Email</a></li>
	            </ul>
	        </div>
	        <div class="row-content col-lg-2 col-sm-4 col-xs-6">
	            <h3>相关信息</h3>
	            <ul>
	                <li><a href="#">帮助中心</a></li>
	                <li><a href="#">用户协议</a></li>
	                <li><a href="#">版权声明</a></li>
	            </ul>
	        </div>
	        <div class="row-content col-lg-2 col-sm-4 col-xs-6">
	            <h3>最新消息</h3>
	            <ul>
	                <li><a href="#">About</a></li>
	                <li><a href="#">Why One Page?</a></li>
	                <li><a href="#">OPL Blog</a></li>
	            </ul>
	        </div>
	
	        <div class="row-content col-lg-2 col-sm-4 col-xs-6">
	            <h3>站点信息</h3>
	            <ul>
	                <li><a href="#">意见反馈</a></li>
	                <li><a href="#">联系客服</a></li>
	                <li><a href="#">公司运营</a></li>
	            </ul>
	
	        </div>
	        <div class="row-content col-lg-2 col-sm-4 col-xs-6">
	            <h3>联系我们</h3>
	            <ul>
	                <li><a href="#">商务合作</a></li>
	                <li><a href="#">广告刊例</a></li>
	                <li><a href="#">投稿</a></li>
	            </ul>
	        </div>
	        <div class="row-content col-lg-2 col-sm-4 col-xs-6">
	            <h3>关于</h3>
	            <ul>
	                <li><a href="about.html">关于我们</a></li>
	                <li><a href="#">合作伙伴</a></li>
	                <li><a href="#">加入我们</a></li>
	            </ul>
	        </div>
	    </div>
	</div>
        
        
        
        <div class="foot">
        	<div class="end">All Rights Reserved.备案号：闽ICP备00000000号-1</div>
        </div>
    </footer>
	
	

</body>
</html>