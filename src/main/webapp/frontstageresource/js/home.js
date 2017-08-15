$(document).ready(function() {
    var EXPIREDTIME = 1000 * 60 * 15; 		// 15 min
    var logoutTimer = setTimeout(loginOut, EXPIREDTIME);
    //从前台获取session
    var sessionId = $("#sessionId").val();
    
    /**
	 * 屏蔽浏览器右键功能
	 */
	$(document).bind("contextmenu",function(e){
	    return false;
	});
    
    /**
     * 清除session值
     */
    function checkSession() {
        $.ajax({
        	async:false,
            type:"POST",
            url:"session.html", 
            success:function(data){
            	if(data=="expired"){
            		return false;
            	}else{
            		return true;
            	}
            },  
            error:function(data){  
            	window.location.href="error.html";
            }
        });
    }
    
    /**
     * 判断用户是否登陆
     */
    if(sessionId !=""){
    	$("#u_name").html("<strong style='color:#0000FF;font-size: 15.5px;'>"+sessionId+"</strong>");
    	if(sessionId=="admin"){
    		var html1="<li class='page-scroll'><a href='regist.html'><span class='glyphicon glyphicon-edit btn-xs'> <strong>注册</strong></span></a></li>";
    		var html2="<li role='presentation' class='text-center'><a role='menuitem' tabindex='-1' href='regist.html'><strong>注册</strong></a></li>";
    		$("#bs-dropdownmenu").children().eq(0).after(html1);
    		$("#drop-down-menu ul").children().eq(1).after(html2);
    	}
    }else{
    	$("#u_name").html("<a href='user.html'><span><strong style='color:#FF0000'>请登录！</strong></span></a>");
    	var centerVal=$("#c_mes").eq(0).attr('class');
    	var setVal=$("#p_set").eq(0).attr('class');
    	if((centerVal.substring(centerVal.length)) =="" ||(setVal.substring(setVal.length)) ==""){
    		$("#c_mes").attr('class',centerVal+" "+"disabled");
    		$("#p_set").attr('class',setVal+" "+"disabled");
    	}
    }
    
    /*============================动态添加导航条=====================================*/
    $("button").click(function(){
    	$("#bs-dropdownmenu").css("visibility", "visible");
    	$("#drop-down-menu").remove();
    	if(sessionId !=""){
		   $("#user_name").html("<a href='#'><span class='glyphicon glyphicon-user btn-xs'> <strong style='color:#0000FF;font-size: 15.5px;'>"+sessionId+"</strong></span></a>");
		}else{
		   $("#user_name").html("<a href='user.html'><span class='glyphicon glyphicon-user btn-xs'> <strong style='color:red'>请登录！</strong></span></a>");
		   var centerVal=$("#mes_center").eq(0).attr('class');
	       var setVal=$("#per_set").eq(0).attr('class');
	       if((centerVal.substring(centerVal.length)) =="" ||(setVal.substring(setVal.length)) ==""){
	    	   $("#mes_center").attr('class',centerVal+" "+"disabled");
	    	   $("#per_set").attr('class',setVal+" "+"disabled");
	       }
		}
	});
    
    /**
     * 点击退出按钮
     */
    $(".exit_set").click(function(){
    	checkSession();
		window.location.href="index.html";
	});
    
    function userActionHandler() {
        clearTimeout(logoutTimer);
    }
    
    function loginOut() {
        checkSession();
    }
    
    if (sessionId != "") {

    }
    /**
     * 阅读全文
     */
    $(".post-permalink").click(function(){
    	$.ajax({
    		async:false,
            type:"POST",
            url:"showdetails.html",
            dataType: "text",
            data:{
            	aid:$.trim($(this).parent().attr('id')),
            	},
            success:function(data){
            	if(data=="showok"){
            		window.location.href="show.html";
            	}
            },
            error:function(data){  
            	window.location.href="error.html";
            }
    	});
    });
    
   /* $(".messages").click(function(){
    	$.ajax({
    		async:false,
            type:"POST",
            url:"showdetails.html",
            dataType: "text",
            data:{
            	aid:$.trim($(this).parent().attr('id')),
            	},
            success:function(data){
            	if(data=="showok"){
            		window.location.href="show.html";
            	}
            },
            error:function(data){  
            	window.location.href="error.html";
            }
    	});
    });*/
    
});