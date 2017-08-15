var emails ;
var EXPIREDTIME = 1000 * 60 * 5;

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
});

/**
 * 修改密码
 */
function modifyPwd(){
	var newPwd = $.trim($("#newPwd").val());
	var newApwd = $.trim($("#newApwd").val());
	var code = $.trim($("#validatecode").val());
	if (newPwd == "") {
		var tip = $("#newPwd").easytip({position : "right",class : "easy-red"});
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