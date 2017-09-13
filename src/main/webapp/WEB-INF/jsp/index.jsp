<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>流沙</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<meta name="keywords" content="RSS,阅读,RSS订阅,流沙">
	<meta name="description" content="专注于内容订阅">
	<meta name="twitter:image" content="http://www.echopublish.com/img/paper-plane.png" />
    <!-- bootstrap.min.css -->
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- freelancer.min.css -->
    <link href="https://cdn.bootcss.com/startbootstrap-freelancer/3.3.7/css/freelancer.min.css" rel="stylesheet">
    <!-- font-awesome.min.css -->
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="indexresource/css/style.css" type="text/css">
    <!-- jquery.min.js -->
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
    <!-- bootstrap.min.js -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!-- easing.min.js -->
    <script src="https://cdn.bootcss.com/jquery-easing/1.4.1/jquery.easing.min.js"></script>
    <!-- freelancer.min.js -->
    <script src="https://cdn.bootcss.com/startbootstrap-freelancer/3.3.7/js/freelancer.min.js"></script>
	<script type="text/javascript" src="indexresource/js/index.js"></script>
<% 
	String sname="";
	if(session.getAttribute("sname") != null){
		sname=request.getSession().getAttribute("sname").toString();
	}
%>
</head>
<body id="page-top" class="index">
	<input id="sessionId" type="hidden" value="<%=sname%>" />
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#page-top"> <img id="fslogo" class="img-responsive" src="indexresource/img/flowingsand.gif" alt=""> </a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                	<li class="page-scroll">
                        <a id="home" href="home.html">
                        	<span class="glyphicon glyphicon-home btn-xs"> <strong> 主页</strong></span>
                        </a>
                    </li>
                    <li class="page-scroll">
                        <a id="abo" href="about.html">
                        	<span class="glyphicon glyphicon-hand-right btn-xs"> <strong> 关于</strong></span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Header -->
    <header>
	    <div class="embed-responsive embed-responsive-16by9">
		    <!--autoplay="autoplay" loop="loop"-->
		  	<video controls="controls" volume="volume">
		        <source src="indexresource/video/flowingsand.mp4" type="video/mp4">
		        <source src="indexresource/video/flowingsand.webm" type="video/webm">
		        <source src="indexresource/video/flowingsand.ogg" type="video/ogg">
		        您的浏览器不支持视频的播放。
		    </video>
		</div>
    </header>
    
	<section id="experiences">
		<h1 class="big-text-center">手机、PC一样的超炫体验</h1>
		<p class="small-text-center">支持手机端网页浏览(中英两种语言，随系统自动切换)</p>
		<img src="indexresource/img/pic.png" alt="simple" class="img-responsive center-block" id="fspic"/>	
	</section>

	<section id="explain">
		<div class="container">
			<div class="row text-center">
                <div class="col-lg-4">
                    <div class="explains-field-title">
                    	<span>返璞归真</span>
                    	<hr/>
                    	<p>身处在前端社区的繁荣之下，我们都在有意或无意地追逐。而Layui偏偏回望当初，奔赴在返璞归真的漫漫征途，自信并勇敢着，追寻于原生态的书写指令，试图以最简单的方式诠释高效。</p>
                    </div>
                </div>
                <div class="col-lg-4" id="test">
                    <div class="explains-field-title">
                    	<span>双面体验</span>
                    	<hr/>
                    	<p>拥有双面的不仅是人生，还有Layui。一面极简，一面丰盈。极简是视觉所见的外在，是开发所念的简易。丰盈是倾情雕琢的内在，是信手拈来的承诺。一切本应如此，简而全，双重体验。</p>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="explains-field-title">
                    	<span>星辰大海</span>
                    	<hr/>
                    	<p>如果眼下还是一团零星之火，那运筹帷幄之后，迎面东风，就是一场烈焰燎原吧，那必定会是一番尽情的燃烧。待，秋风萧瑟时，散作满天星辰，你看那四季轮回，正是Layui不灭的执念。</p>
                    </div>
                </div>
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