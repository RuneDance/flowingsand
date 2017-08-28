<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>个人设置</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<meta name="keywords" content="RSS,阅读,RSS订阅,流沙">
	<meta name="description" content="专注于内容订阅">
	<meta name="twitter:image" content="http://www.echopublish.com/img/paper-plane.png" />

    <!-- bootstrap.min.css -->
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- easyform.css -->
	<link rel="stylesheet" href="css/easyform.css">
    <!-- freelancer.min.css -->
    <link href="http://cdn.bootcss.com/startbootstrap-freelancer/3.3.7/css/freelancer.min.css" rel="stylesheet">
    <!-- fileinput.min.css -->
    <link href="css/fileinput.min.css" rel="stylesheet" type="text/css">
    <!-- font-awesome.min.css -->
    <!-- <link href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"> -->
    <link rel="stylesheet" href="frontstageresource/css/setting.css" type="text/css">
    
    <!-- jquery.min.js -->
    <script type="text/javascript" src="http://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
    <!-- bootstrap.min.js -->
    <script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!--引入 easyform.js-->
	<script type="text/javascript" src="js/easyform.js"></script>
    <!-- freelancer.min.js -->
    <script src="http://cdn.bootcss.com/startbootstrap-freelancer/3.3.7/js/freelancer.min.js"></script>
    <!-- fileinput.min.js -->
    <script src="js/fileinput.min.js"></script>
    <!-- zh.js -->
    <script src="js/zh.js"></script>
    <!-- easing.min.js -->
    <!-- <script src="http://cdn.bootcss.com/jquery-easing/1.4.1/jquery.easing.min.js"></script> -->
	<script type="text/javascript" src="frontstageresource/js/setting.js"></script>
	<% 
		String sname="";
		if(session.getAttribute("sname") != null){
			sname=request.getSession().getAttribute("sname").toString();
		}
	%>
</head>
<body>
	<input id="sessionId" type="hidden" value="<%=sname%>" />
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="index.html"> 
			<img id="fslogo" class="img-responsive" src="indexresource/img/flowingsand.gif" alt="">
			</a>
		</div>
	</div>
	</nav>


	<section>
	<div class="container">
		<div class="row">
			<ul class="nav nav-tabs">
				<li class="active"><a href="#profile_set" data-toggle="tab">资料设置</a></li>
				<li><a href="#pwd_set" data-toggle="tab">修改密码</a></li>
				<li><a href="#release" data-toggle="tab">写内容</a></li>
				<!-- <li><a href="#send-messages" data-toggle="tab">写消息</a></li> -->
			</ul>

			<div class="row tab-content">


				<!-- 修改个人资料 -->
				<div class="tab-pane fade in active" id="profile_set">
					<div class="container">
						<div class="row text-center">
							<form id="editpwdForm" role="form" method="post" action="" class="col-xs-12">
								<h4>修改个人资料</h4>
								<div class="form-group">
									<input name="signature" type="text" class="form-control" value="这个人很懒，什么也没留下～～～～" placeholder="个性签名">
								</div>
								<button type="submit" class="btn btn-primary">保存</button>
							</form>
						</div>
					</div>
				</div>
				<!-- /修改个人资料 -->
				<!-- 修改密码 -->
				<div class="tab-pane fade in" id="pwd_set">
					<div class="container">
						
						<div class="row text-center">
							<div class="col-xs-12 col-sm-12">
								<div id="validateEmail">
									<h6 class="send-tips">''</h6>
									<input id="email" name="email" type="text" placeholder="请输入校验邮箱" data-easyform="!null;real-time;" data-message="邮箱不能为空！" data-easytip="position:top;class:easy-red;">
									<button type="submit" id="send-button">发 送</button>
								</div>
							</div>
						</div>
						
						<div class="row text-center">
							<div class="col-xs-12 col-sm-12">
								<form id="modifypwd" method="post" action="modify.html" onsubmit="return modifyPwd();">
									<h6 class="modify-tips">''</h6>
									<input id="hid-email" name="email" type="hidden">
									<input id="newPwd" name="pwd" type="password" placeholder="新密码" data-easyform="length:6 16;char-normal;real-time;" data-message="新密码必须为6—16位" data-easytip="position:top;class:easy-red;"> 
									<input id="newApwd" name="newApwd" type="password" placeholder="确认新密码" data-easyform="equal:#newPwd;real-time;" data-message="两次输入的密码不一致" data-easytip="position:top;class:easy-red;"> 
									<input id="validatecode" name="" type="text" placeholder="验证码" data-easyform="length:6;real-time;ajax:checkCode();" data-message="验证码必须为6位纯数字" data-easytip="class:easy-red;position:top;">
									<button type="submit" id="modify-button">修 改</button>
								</form>
							</div>
						</div>
						
					</div>
				</div>
				<!-- /修改密码 -->
				<!-- 写内容 -->
				<div class="tab-pane fade in" id="release">
					<div class="container">
						<form id="releaseContents" method="post" action="upload.html" enctype="multipart/form-data" onsubmit = "return release();">
							<div class="row text-center">
								<input id="title" name="title" type="text" placeholder="标题"/>
							</div>
							
							<div class="container">
								<input id="file-imgs-input" class="file" type="file" name="imageFile">
							</div>
							
							<div class="row text-center">
								<textarea id="content" class="form-control" rows="7" placeholder="内容" name="acontents"></textarea>
							</div>
							
							<div class="row text-center">
								<button type="submit" class="btn btn-primary">发 布</button>
							</div>
						</form>
					</div>
				</div>
				<!-- /写内容 -->
				
				<div class="tab-pane fade in" id="send-messages">
					<div class="container">
						<form id="releaseMessage" method="post" action="sendmessages.html" onsubmit = "return rel_Message();">
							<div class="row text-center">
								<select id="users" name ="mname" class="form-control">
									<option value="opt">请选择用户</option>
								</select>
							</div>
							
							<div class="row text-center">
								<textarea id="messages-acontents" class="form-control" rows="7" placeholder="消息内容" name="messages"></textarea>
							</div>
							
							<div class="row text-center">
								<button type="submit" class="btn btn-primary">发 送</button>
							</div>
						</form>
					</div>
				</div>
				
				
				
			</div>
		</div>
	</div>
	</section>
	<script type="text/javascript">
	$("#file-imgs-input").fileinput({
		language: 'zh',
        //设置语言
        uploadUrl: 'upload.html',
        //上传的地址
        allowedFileExtensions: ['jpg', 'gif', 'png'],
        //接收的文件后缀
        showPreview: false,
        showUpload: false,
        //是否显示标题
        browseClass: "btn btn-primary",
        //按钮样式 
        maxFileCount: 1,
        //表示允许同时上传的最大文件个数
        validateInitialCount: true
	});
	</script>
</body>
</html>