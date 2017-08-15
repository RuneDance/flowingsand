$(document).ready(function() {
	
	var sessionId = $("#sessionId").val();
	if(sessionId ==""){
		var html="<li class='page-scroll'><a id='log' href='user.html'><span class='glyphicon glyphicon-log-in btn-xs'> <strong>登陆</strong></span></a></li>"
		$("#bs-example-navbar-collapse-1 ul").children().eq(0).after(html);
	}
	if(sessionId=="admin"){
		var html="<li class='page-scroll'><a id='reg' href='regist.html'><span class='glyphicon glyphicon-user btn-xs'> <strong>注册</strong></span></a></li>"
		$("#bs-example-navbar-collapse-1 ul").children().eq(0).after(html);
	}
});