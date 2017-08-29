var emails ;
var EXPIREDTIME = 1000 * 60 * 5; 		// 5 min


/**
 * 清除session code
 */
function cleanCode(){
	$.ajax({
		async:false,
        type:"POST",
        url:"cleancode.html",
        success:function(data){
        	if(data=="ok"){
    			return true;
        	}
        },  
        error:function(data){  
        	window.location.href="error.html";
        }
	});
}

/**
 * 检测邮箱是否存在
 */
function checkEmail(){
	var flag=true;
	$.ajax({
		async:false,
        type:"POST",
        url:"email.html",
        dataType: "text",
        data:{
        	email:$.trim($("#email").val())
        	}, 
        success:function(data){
        	if(data=="unexist"){
        		$(".send-tips").css("visibility","visible");
    			$(".send-tips").text("你输入的邮箱地址不存在！");
    			flag=false;
        	}
        	emails=$.trim($("#email").val());
        	return true;
        },  
        error:function(data){  
        	window.location.href="error.html";
        }
	});
	return flag;
}

/**
 * 检验验证码是否失效
 */
function checkCode(){
	var getCode="";
	$.ajax({
		async:false,
        type:"POST",
        url:"checkcode.html",
        success:function(data){
        	if(data == "unexist"){
        		$(".modify-tips").css("visibility","visible");
        		$(".modify-tips").text("你输入的验证码已失效，请重新获取！");
        		getCode=data;
        	}
        	getCode=data;
        },  
        error:function(data){  
        	window.location.href="error.html";
        }
	});
	return getCode;
}


$(document).ready(function() {
	/**
	 * 屏蔽浏览器右键功能
	 */
	$(document).bind("contextmenu", function(e) {
		return false;
	});
	if($("#sessionId").val() == "admin"){
		var html ="<li><a href='#send-messages' data-toggle='tab'>写消息</a></li>";
		$("section .container .row .nav-tabs").children().eq(2).after(html);
		$("#send-messages").css("visibility","visible");
	}
	$("#validateEmail").easyform();
	$('#send-button').click(function (event) {
		var email=$.trim($("#email").val());
		$("#validateEmail").easyform();
		if(email ==""){
			$(".send-tips").css("visibility","visible");
			$(".send-tips").text("邮箱不能为空！");
			return false;
		}else{
			if(!email.match(/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/)){
				$(".send-tips").css("visibility","visible");
				$(".send-tips").text("邮箱格式不正确！");
				return false;
			}
			if(!checkEmail()) return false;
			$(".send-tips").css("visibility","hidden");
		}
		$.ajax({
			async:false,
	        type:"POST",
	        url:"send.html",
	        dataType: "text",
	        data:{
	        	email:$.trim($("#email").val())
	        	}, 
	        success:function(data){
	        	if(data=="successful"){
	        		setTimeout("cleanCode()", EXPIREDTIME);
	        		event.preventDefault();
	        		$('#validateEmail').fadeOut("slow");
	        		$('#validateEmail').css('display','none');
	        		$('#modifypwd').fadeIn(4000);
	        		$("#modifypwd").easyform();
	        		$("#validatecode").trigger("easyform-ajax", false);
	        	}
	        },  
	        error:function(data){  
	        	window.location.href="error.html";
	        }
		});
		
	});
    
	
	/*********************写消息*************************/
	
	function SelectChange() {
		$.ajax({
			url:"queryusers.html",
			cache: false,
	        type:"POST",
	        dataType: "json",
            contentType: "application/json",
	        success:function(data){
	        	$("select#users").empty();
	        	var optionStr = "";
	        	for (var i=0; i<data.length; i++) {
                    optionStr += "<option value='"+ data[i] +"'>" + data[i] + "</option>";  
                }
	        	/*"<option value='opt1'>请选择用户</option>"+*/
	        	$("select#users").append(optionStr);
	        },  
	        error:function(data){  
	        	window.location.href="error.html";
	        }
		});
	}
	
	$("select#users").focus(function(){
		SelectChange();
	});
	
});

/**
 * 修改密码
 */
function modifyPwd(){
	var newPwd = $.trim($("#newPwd").val());
	var newApwd = $.trim($("#newApwd").val());
	var code = $.trim($("#validatecode").val());
	if (newPwd == "") {
		var tip = $("#newPwd").easytip({position : "top",class : "easy-red"});
		tip.show("新密码不能为空！");
		return false;
	}else {
		if(newPwd.length <6 || newPwd.length >16){
			var tip = $("#newPwd").easytip({position : "top",class : "easy-red"});
			tip.show("新密码必须为6—16位");
			return false;
		}
	}
	if(newApwd ==""){
		var tip = $("#newApwd").easytip({position : "top",class : "easy-red"});
		tip.show("确认新密码不能为空！");
		return false;
	}else{
		if(newApwd.length <6 || newApwd.length >16){
			var tip = $("#newApwd").easytip({position : "top",class : "easy-red"});
			tip.show("确认密码必须为6—16位");
			return false;
		}
	}
	if(code ==""){
		var tip = $("#validatecode").easytip({position : "top",class : "easy-red"});
		tip.show("验证码不能为空！");
		return false;
	}else{
		if(code.length !=6){
			var tip = $("#validatecode").easytip({position : "top",class : "easy-red"});
			tip.show("验证码必须为6位纯数字！");
			return false;
		}
		if(checkCode() =="unexist"){
			alert("你输入的验证码已失效，请重新获取！");
			cleanCode();
    		$("#newPwd").val("");
    		$("#newApwd").val("");
    		$("#validatecode").val("");
    		$(".modify-tips").text("");
    		$(".send-tips").text("");
    		$('#validateEmail').fadeIn(2000);
    		$('#modifypwd').fadeOut(5000);
    		$('#modifypwd').css('display','none');
			return false;
		}
		if(code != checkCode()){
			$(".modify-tips").css("visibility","visible");
			$(".modify-tips").text("你输入的验证码有误，请重输入！");
			return false;
		}
	}
	if(newPwd !=newApwd){
		$(".modify-tips").css("visibility","visible");
		$(".modify-tips").text("两次输入新密码不一致！");
		return false;
	}
	//给hidden input 赋email值
	$("#hid-email").val(emails);
	$(".modify-tips").css("visibility","hidden");
}


/**
 * 发布
 */
function release(){
	var title=$.trim($("#title").val());
	var contents=$.trim($("#content").val());
	if(title ==""){
		var tip = $("#title").easytip({position : "top",class : "easy-red"});
		tip.show("标题不能为空！");
		return false;
	}
	if(title.length > 48){
		var tip = $("#title").easytip({position : "top",class : "easy-red"});
		tip.show("文章标题过长！");
		return false;
	}
	if(contents ==""){
		var tip = $("#content").easytip({position : "top",class : "easy-red"});
		tip.show("内容不能为空！");
		return false;
	}
	
}

/**
 * 发送消息
 * @returns {Boolean}
 */
function rel_Message(){
	var users=$.trim($("#users").val());
	var mess_acontents=$.trim($("#messages-acontents").val());
	if(users =="opt" || users ==""){
		var tip = $("#users").easytip({position : "top",class : "easy-red"});
		tip.show("请选择用户！");
		return false;
	}
	if(mess_acontents ==""){
		var tip = $("#messages-acontents").easytip({position : "top",class : "easy-red"});
		tip.show("内容不能为空！");
		return false;
	}
	
}
