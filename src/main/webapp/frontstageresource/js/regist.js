$(document).ready(function() {
	/**
	 * 屏蔽浏览器右键功能
	 */
	$(document).bind("contextmenu", function(e) {
		return false;
	});
	$("#username").trigger("easyform-ajax", false);
	$("#email").trigger("easyform-ajax", false);
	$("#reg-form").easyform();
});

/**
 * 检测用户名是否存在
 */
function checkUname(){
	var flag=false;
	$.ajax({
		async:false,
        type:"POST",
        url:"uname.html",
        dataType: "text",
        data:{
        	name:$.trim($("#username").val()),
        	},
        success:function(data){
        	if(data=="exist"){
        		var tip = $("#username").easytip({position : "top",class : "easy-red"});
    			tip.show("该用户名已被占用 ！");
    			flag=true;
        	}
        },  
        error:function(data){  
        	window.location.href="error.html";
        }
	});
	return flag;
}

/**
 * 检测邮箱是否存在
 */
function checkEmail(){
	var flag=false;
	$.ajax({
		async:false,
        type:"POST",
        url:"email.html",
        dataType: "text",
        data:{
        	email:$.trim($("#email").val()),
        	}, 
        success:function(data){
        	if(data=="exist"){
        		var tip = $("#email").easytip({position : "top",class : "easy-red"});
    			tip.show("该Email地址已经被注册过，请换一个吧！");
    			flag=true;
        	}
        	return true;
        },  
        error:function(data){  
        	window.location.href="error.html";
        }
	});
	return flag;
}



/**
 * 用户登录
 */
function checkUser() {
	var uname = $.trim($("#username").val());
	var upwd = $.trim($("#pwd").val());
	var pswagain = $.trim($("#pswagain").val());
	var email = $.trim($("#email").val());
	
	if (uname != "") {
		if(checkUname()) return false;
	}else{
		var tip = $("#username").easytip({position : "top",class : "easy-red"});
		tip.show("用户名不能为空！");
		return false;
	}
	
	if (upwd == "") {
		var tip = $("#pwd").easytip({position : "top",class : "easy-red"});
		tip.show("密码不能为空！");
		return false;
	}
	if(pswagain ==""){
		var tip = $("#pswagain").easytip({position : "top",class : "easy-red"});
		tip.show("确认密码不能为空！");
		return false;
	}
	if(email !=""){
		if(checkEmail()) return false;
	}else{
		var tip = $("#email").easytip({position : "top",class : "easy-red"});
		tip.show("邮箱不能为空！");
		return false;
	}
	if(upwd !=pswagain){
		$("#reg-tips").text("两次输入密码不一致！");
		return false;
	}
}