<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
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

    <title>关于</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- bootstrap.min.css -->
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- freelancer.min.css -->
    <link href="http://cdn.bootcss.com/startbootstrap-freelancer/3.3.7/css/freelancer.min.css" rel="stylesheet">
    <!-- font-awesome.min.css -->
    <link href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="frontstageresource/css/about.css">
    <!-- jquery.min.js -->
    <script type="text/javascript" src="http://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
    <!-- bootstrap.min.js -->
    <script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!-- easing.min.js -->
    <script src="http://cdn.bootcss.com/jquery-easing/1.4.1/jquery.easing.min.js"></script>
    <!-- freelancer.min.js -->
    <script src="http://cdn.bootcss.com/startbootstrap-freelancer/3.3.7/js/freelancer.min.js"></script>
    <script type="text/javascript" src="frontstageresource/js/about.js"></script>
</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="index.html"> 
			<img id="fslogo" class="img-responsive" src="indexresource/img/flowingsand.gif" alt="">
			</a>
		</div>
	</div>
</nav>


<img id="teach" class="pull-right" src="frontstageresource/img/teach.gif" alt="道" style="height: 83.6%; width: auto;"/>
<h1>有利则聚，无利则散</h1>
<p class="lead">每一把有故事的剑都如一首歌</p>
<p class="lead">随着时间的流逝&nbsp;&nbsp;曲终人散</p>
<p class="lead">归于尘土 …………</p>
<button id="swords">剑</button>
<p id="says"><span>声明：</span>本站暂时只是作为Demo演示，<br>
    不会用做商业用途，<br>
    如有涉及侵犯他人资源，<br>
    敬请联系本站管理员，谢谢！<br>Email：smallbadoncelaugh@gmail.com</p>
<!-- <img id="sword" src="frontstageresource/img/sword.gif" alt="剑" /> -->
<!-- Footer -->
    <footer class="text-center">
        <div class="footer-above">
            <div class="container">
                <div class="row">
                    <h3>联系我们</h3>
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
        
        <!-- footer -->
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
	                <li><a href="#">关于我们</a></li>
	                <li><a href="#">合作伙伴</a></li>
	                <li><a href="#">加入我们</a></li>
	            </ul>
	        </div>
	    </div>
	</div>
        
        
        
        <div class="footer-below">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        All Rights Reserved.备案号：闽ICP备00000000号-1
                    </div>
                </div>
            </div>
        </div>
    </footer>

</body>
</html>