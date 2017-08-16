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

<title>关于</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
<link rel="stylesheet" type="text/css"
	href="frontstageresource/css/about.css">
<!-- jquery.min.js -->
<script type="text/javascript"
	src="http://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
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
				<img id="fslogo" class="img-responsive" src="indexresource/img/flowingsand.gif" alt="logo">
			</a>
		</div>
	</div>
	</nav>
	<div>
		<canvas id="c"></canvas>
		<p><span id="statement">声明：</span>本站暂时只是作为Demo演示<br>
		不会用做商业用途<br>
		如有涉及侵犯他人资源<br>
		敬请联系本站管理员，谢谢！<br>
		<span id="email">Email：smallbadoncelaugh@gmail.com</span></p>
		<footer class="text-center">
			<div class="footer-below">
				<div class="container">
					<div class="row">
						<div class="col-lg-12">All Rights
							Reserved.备案号：闽ICP备00000000号-1</div>
					</div>
				</div>
			</div>
		</footer>
	</div>
	<script id="shader-fs" type="x-shader/x-fragment">
				#ifdef GL_ES
				  precision highp float;
				  #endif
    		void main(void) {
    		 gl_FragColor = vec4(0.2, 0.3, 0.4, 1.0);
    		}
		</script>

	<script id="shader-vs" type="x-shader/x-vertex">
    	attribute vec3 vertexPosition;
  		uniform mat4 modelViewMatrix;
  		uniform mat4 perspectiveMatrix;
   		void main(void) {
  			gl_Position = perspectiveMatrix * modelViewMatrix * vec4(  vertexPosition, 1.0);
  		}
  	</script>
	<script type="text/javascript" src="frontstageresource/js/bc_about.js"></script>
</body>
</html>