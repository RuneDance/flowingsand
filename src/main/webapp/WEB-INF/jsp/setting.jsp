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
	
	<link rel="stylesheet" type="text/css" href="css/bootstrap-combined.no-icons.min.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.min.css">
    <link href="https://netdna.bootstrapcdn.com/font-awesome/3.0.2/css/font-awesome.css" rel="stylesheet">
    <!-- bootstrap.min.css -->
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- easyform.css -->
	<link rel="stylesheet" href="css/easyform.css">
    <!-- freelancer.min.css -->
    <link href="https://cdn.bootcss.com/startbootstrap-freelancer/3.3.7/css/freelancer.min.css" rel="stylesheet">
    <link rel="stylesheet" href="frontstageresource/css/setting.css" type="text/css">
    <!-- jquery.min.js -->
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
    <!-- bootstrap.min.js -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/bootstrap-wysiwyg.js"></script>
    <script type="text/javascript" src="js/jquery.hotkeys.js"></script>
    <!--引入 easyform.js-->
	<script type="text/javascript" src="js/easyform.js"></script>
    <!-- freelancer.min.js -->
    <script src="https://cdn.bootcss.com/startbootstrap-freelancer/3.3.7/js/freelancer.min.js"></script>
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
					<li class="active"><a href="#release" data-toggle="tab">内容发布</a></li>
					<li><a href="#profile_set" data-toggle="tab">资料设置</a></li>
					<li><a href="#pwd_set" data-toggle="tab">密码修改</a></li>
				</ul>
	
				<div class="row tab-content">
	
					<!-- 内容发布 -->
					<div class="tab-pane fade in active" id="release">
						<div class="container">
							<div class="row text-center">
								<input id="titles" name="title" type="text" placeholder="请输入标题" data-easyform="!null;real-time;" data-message="标题不能为空！" data-easytip="position:top;class:easy-red;">
							</div>
							<div class="row">
								<div class="hero-unit">
								<div id="alerts"></div>
							    <div class="btn-toolbar" data-role="editor-toolbar" data-target="#editor">
							    
							      <div class="btn-group">
							      	<a class="btn dropdown-toggle" data-toggle="dropdown" title="Font" data-original-title="Font">
							        	<i class="icon-font"></i><b class="caret"></b>
							        </a>
							        <ul class="dropdown-menu"></ul>
							      </div>
							      
							      <div class="btn-group">
							      	<a class="btn dropdown-toggle" data-toggle="dropdown" title="Font Size" data-original-title="Font Size">
							        	<i class="icon-text-height"></i><b class="caret"></b>
							        </a>
							        <ul class="dropdown-menu">
							        	<li><a data-edit="fontSize 5"><font size="5">Huge</font></a></li>
							          	<li><a data-edit="fontSize 3"><font size="3">Normal</font></a></li>
							          	<li><a data-edit="fontSize 1"><font size="1">Small</font></a></li>
							        </ul>
							      </div>
							      
							      <div class="btn-group">
							        <a class="btn" data-edit="bold" title="Bold (Ctrl/Cmd+B)" data-original-title="Bold (Ctrl/Cmd+B)"><i class="icon-bold"></i></a>
							        <a class="btn" data-edit="italic" title="Italic (Ctrl/Cmd+I)"><i class="icon-italic"></i></a>
							        <a class="btn" data-edit="strikethrough" title="Strikethrough"><i class="icon-strikethrough"></i></a>
							        <a class="btn" data-edit="underline" title="Underline (Ctrl/Cmd+U)"><i class="icon-underline"></i></a>
							      </div>
							      <div class="btn-group">
							        <a class="btn" data-edit="insertunorderedlist" title="Bullet list"><i class="icon-list-ul"></i></a>
							        <a class="btn" data-edit="insertorderedlist" title="Number list"><i class="icon-list-ol"></i></a>
							        <a class="btn" data-edit="outdent" title="Reduce indent (Shift+Tab)"><i class="icon-indent-left"></i></a>
							        <a class="btn" data-edit="indent" title="Indent (Tab)"><i class="icon-indent-right"></i></a>
							      </div>
							      <div class="btn-group">
							        <a class="btn" data-edit="justifyleft" title="Align Left (Ctrl/Cmd+L)"><i class="icon-align-left"></i></a>
							        <a class="btn" data-edit="justifycenter" title="Center (Ctrl/Cmd+E)"><i class="icon-align-center"></i></a>
							        <a class="btn" data-edit="justifyright" title="Align Right (Ctrl/Cmd+R)"><i class="icon-align-right"></i></a>
							        <a class="btn" data-edit="justifyfull" title="Justify (Ctrl/Cmd+J)"><i class="icon-align-justify"></i></a>
							      </div>
							      <div class="btn-group">
							      	<a class="btn dropdown-toggle" data-toggle="dropdown" title="Hyperlink"><i class="icon-link"></i></a>
							      		<div class="dropdown-menu input-append">
							      			<input class="span2" placeholder="URL" type="text" data-edit="createLink"/>
										    <button class="btn" type="button">Add</button>
							        	</div>
							        <a class="btn" data-edit="unlink" title="Remove Hyperlink"><i class="icon-cut"></i></a>
							      </div>
							      
							      <div class="btn-group">
							        <a class="btn" title="Insert picture (or just drag & drop)" id="pictureBtn">
							        	<i class="icon-picture"></i>
							        </a>
							        <input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" />
							      </div>
							      <div class="btn-group">
							        <a class="btn" data-edit="undo" title="Undo (Ctrl/Cmd+Z)"><i class="icon-undo"></i></a>
							        <a class="btn" data-edit="redo" title="Redo (Ctrl/Cmd+Y)"><i class="icon-repeat"></i></a>
							      </div>
							      <input type="text" data-edit="inserttext" id="voiceBtn" x-webkit-speech="">
							      <div class="btn-group" id="releaseBtn">
								      <button class="btn btn-primary">发 布</button>
							      </div>
							    </div>
								<form id="form-editor">
								    <div id="editor"></div>
								</form>
							  </div>
							</div>
						</div>
					</div>
					<!-- /内容发布 -->
	
					<!-- 修改个人资料 -->
					<div class="tab-pane fade in" id="profile_set">
						<div class="container">
							<div class="row text-center">
								<form id="editpwdForm" role="form" method="post" action="" class="col-xs-12">
									<h4>修改签名</h4>
									<div class="form-group">
										<input id="signature" name="signature" type="text" class="form-control" value="这个人很懒，什么也没留下～～～～" placeholder="个性签名">
									</div>
									<button type="submit" class="btn btn-primary">保 存</button>
								</form>
							</div>
						</div>
					</div>
					<!-- /修改个人资料 -->
					
					<!-- 密码修改 -->
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
					<!-- /密码修改 -->
					
					<!-- 消息发布 -->
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
					<!-- /消息发布 -->
					
				</div>
			</div>
		</div>
	</section>
	
	<script>
	  $(function(){
	    function initToolbarBootstrapBindings() {
	      var fonts = ['Serif', 'Sans', 'Arial', 'Arial Black', 'Courier', 
	            'Courier New', 'Comic Sans MS', 'Helvetica', 'Impact', 'Lucida Grande', 'Lucida Sans', 'Tahoma', 'Times',
	            'Times New Roman', 'Verdana'],
	            fontTarget = $('[title=Font]').siblings('.dropdown-menu');
	      $.each(fonts, function (idx, fontName) {
	          fontTarget.append($('<li><a data-edit="fontName ' + fontName +'" style="font-family:\''+ fontName +'\'">'+fontName + '</a></li>'));
	      });
	      $('a[title]').tooltip({container:'body'});
	    	$('.dropdown-menu input').click(function() {return false;})
			    .change(function () {$(this).parent('.dropdown-menu').siblings('.dropdown-toggle').dropdown('toggle');})
	        .keydown('esc', function () {this.value='';$(this).change();});
	
	      $('[data-role=magic-overlay]').each(function () { 
	        var overlay = $(this), target = $(overlay.data('target')); 
	        overlay.css('opacity', 0).css('position', 'absolute').offset(target.offset()).width(target.outerWidth()).height(target.outerHeight());
	      });
	      if ("onwebkitspeechchange"  in document.createElement("input")) {
	        var editorOffset = $('#editor').offset();
	        $('#voiceBtn').css('position','absolute').offset({top: editorOffset.top, left: editorOffset.left+$('#editor').innerWidth()-35});
	      } else {
	        $('#voiceBtn').hide();
	      }
		};
		function showErrorAlert (reason, detail) {
			var msg='';
			if (reason==='unsupported-file-type') { msg = "Unsupported format " +detail; }
			else {
				console.log("error uploading file", reason, detail);
			}
			$('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>'+ 
			 '<strong>File upload error</strong> '+msg+' </div>').prependTo('#alerts');
		};
	    initToolbarBootstrapBindings(); 
		$('#editor').wysiwyg({ fileUploadError: showErrorAlert} );
	  });
	</script>
</body>
</html>