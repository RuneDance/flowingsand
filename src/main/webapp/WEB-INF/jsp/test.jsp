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


<title>首 页</title>

	<!-- bootstrap.min.css -->
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- freelancer.min.css -->
    <link href="http://cdn.bootcss.com/startbootstrap-freelancer/3.3.7/css/freelancer.min.css" rel="stylesheet">
    <!-- font-awesome.min.css -->
    <link href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="css/test.css" rel="stylesheet" type="text/css">

	<!-- jquery.min.js -->
    <script type="text/javascript" src="http://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
    <!-- bootstrap.min.js -->
    <script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!-- easing.min.js -->
    <script src="http://cdn.bootcss.com/jquery-easing/1.4.1/jquery.easing.min.js"></script>
    <!-- freelancer.min.js -->
    <script src="http://cdn.bootcss.com/startbootstrap-freelancer/3.3.7/js/freelancer.min.js"></script>
	<script src="js/test.js" type="text/javascript"></script>
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
                        <a id="home" href="home.html"><span class="glyphicon glyphicon-home btn-xs"> <strong>主页</strong></span></a>
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
    
    <section class='section' id="bgi">
    	<div class="container">
			<div class="row">
				<div class="col-lg-12">
			    	<date></date>
				</div>
			</div>
			<div class="row" id="welcome">
				<div class="col-lg-12 text-center">
				    <div id='master-container-scroller'>
	                
	                <div class='master-container-scroller_item'>
	                  <a class='cta-link' href='#'>Welcome to here</a>
	                </div>
	                <div class='master-container-scroller_item'>
	                  <a class='cta-link' href='#'>Maybe</a>
	                </div>
	                <div class='master-container-scroller_item'>
	                  <a class='cta-link' href='#'>You can find</a>
	                </div>
	                <div class='master-container-scroller_item'>
	                  <a class='cta-link' href='#'>What you want</a>
	                </div>
	                <div class='master-container-scroller_item'>
	                  <a class='cta-link' href='#'>Next</a>
	                </div>
	                <div class='master-container-scroller_item'>
	                  <a class='cta-link' href='#'>Flowing </a>
	                </div>
	                <div class='master-container-scroller_item'>
	                  <a class='cta-link' href='#'>The beautiful page</a>
	                </div>
	                <div class='master-container-scroller_item'>
	                  <a class='cta-link' href='#'>It</a>
	                </div>
	                <div class='master-container-scroller_item'>
	                  <a class='cta-link' href='#'>will be here</a>
	                </div>
	                <div class='master-container-scroller_item'>Thank You!</div>
              </div>
				</div>
			</div>
		</div>
	</section>
    
    
    
	<section>
		<h1 class="big-text-center">手机、PC一样的超炫体验</h1>
		<p class="small-text-center">支持手机端网页浏览(中英两种语言，随系统自动切换)</p>
		<img src="indexresource/img/pic.png" alt="simple" class="img-responsive center-block" id="fspic"/>	
	</section>

    <!-- More Section -->
    <section class="success" id="readmore">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>Tell Me More</h2>
                    <hr class="star-light">
                </div>
            </div>
            <div class="row">
                <div class="col-lg-2 col-lg-offset-2 text-right">
                </div>
                <div class="col-lg-4 text-left">
                    <h3>Documentation</h3>
                    <p>Learn how easy it is to use Echo Publish</p>
                    <p>Overview ... <a href ="http://playpen.echopublish.com/guide/" target="_blank" style="color:cornsilk;text-decoration:underline">Click here</a></p>
                    <p>Templates ... <a href ="http://playpen.echopublish.com/template-guide/" target="_blank" style="color:cornsilk;text-decoration:underline">Click here</a></p>
                    <p>API Guide ... <a href ="http://playpen.echopublish.com/api-guide/" target="_blank" style="color:cornsilk;text-decoration:underline">Click here</a></p>
                </div>
            </div>
        </div>
    </section>

	
   

    <!-- About Section -->
    <section class="success" id="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>Pricing</h2>
                    <hr class="star-light">
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-lg-offset-2 text-right">
                    <h3>Free</h3>
                    <p>Developers: apply for your free account</p>
                    <p>Use Echo Publish at no cost for as long as you like - only pay for production use</p>
                    <p>(Generated output may contain watermarks, and your access may be rate limited during busy periods)</p>
                </div>
                <div class="col-lg-4 text-left">
                    <h3>Paid</h3>
                    <p>Remove all watermarks and limits</p>
                    <h3>$50 per month</h3>
                    <p>(First 1,000 documents in a month included, +4c per document thereafter)</p>
                    <p>(If you'd like to host Echo Publish yourself, talk to us about custom pricing.)</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Contact Section -->
    <section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>Free Account</h2>
                    <hr class="star-primary">
                </div>
            </div>
            <div class="row">
                <p>Echo Publish is now registering Beta users. Contact us using the form below to request a trial account - we'll get right back to you. Registration does not imply any commitment.</p>
            </div>
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2">
					<form name="sentMessage" id="contactForm" action="https://formspree.io/publish@echo-central.com" method="post" novalidate>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Name</label>
                                <input type="text" class="form-control" placeholder="Name" id="name" name="name" required data-validation-required-message="Please enter your name.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Email Address</label>
                                <input type="email" class="form-control" placeholder="Email Address" id="email" name="email" required data-validation-required-message="Please enter your email address.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Phone Number</label>
                                <input type="tel" class="form-control" placeholder="Phone Number" id="phone" name="phone" required data-validation-required-message="Please enter your phone number.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Message</label>
                                <textarea rows="5" class="form-control" placeholder="Message" id="message" name="message" required data-validation-required-message="Please enter a message."></textarea>
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <br>
                        <div id="success"></div>
                        <div class="row">
                            <div class="form-group col-xs-12">
                                <button type="submit" class="btn btn-success btn-lg">Send</button>
                            </div>
                        </div>
                    </form>
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
	        <div class="row-content col-lg-3 col-sm-6 col-xs-3">
	            <h3>A</h3>
	            <ul>
	                <li><a href="#">Newsletter</a></li>
	                <li><a href="#">RSS feed</a></li>
	                <li><a href="#">RSS to Email</a></li>
	            </ul>
	        </div>
	        <div class="row-content col-lg-3 col-sm-6 col-xs-3">
	            <h3>B</h3>
	            <ul>
	                <li><a href="#">Home</a></li>
	                <li><a href="#">Gallery</a></li>
	                <li><a href="#">Templates</a></li>
	            </ul>
	        </div>
	        <div class="row-content col-lg-3 col-sm-6 col-xs-3">
	            <h3>C</h3>
	            <ul>
	                <li><a href="#">About</a></li>
	                <li><a href="#">Why One Page?</a></li>
	                <li><a href="#">OPL Blog</a></li>
	            </ul>
	        </div>
	
	        <div class="row-content col-lg-3 col-sm-6 col-xs-3">
	            <h3>D</h3>
	            <ul>
	                <li><a href="#">Browse All</a></li>
	                <li><a href="#">Design</a></li>
	                <li><a href="#">Development</a></li>
	            </ul>
	
	        </div>
	        <!-- <div class="row-content col-lg-2 col-sm-4 col-xs-6">
	            <h3>E</h3>
	            <ul>
	                <li><a href="#">Big Typography</a></li>
	                <li><a href="#">Free Templates</a></li>
	                <li><a href="#">Most Loved</a></li>
	            </ul>
	        </div>
	        <div class="row-content col-lg-2 col-sm-4 col-xs-6">
	            <h3>F</h3>
	            <ul>
	                <li><a href="#">Browse All</a></li>
	                <li><a href="#">East Java</a></li>
	                <li><a href="#">Clutterless</a></li>
	            </ul>
	        </div> -->
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