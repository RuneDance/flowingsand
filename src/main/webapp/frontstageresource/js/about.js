$(document).ready(function(){
	//获取系统当前时间
	var myDate = new Date();
	var years=myDate.getFullYear();
	/**
	 * 屏蔽浏览器右键功能
	 */
	$(document).bind("contextmenu",function(e){
	    return false;
	});
	$("#end_nav_top").text("Copyright © 2000-"+years+" 流沙 flowingsand.com");
    $(".about .explanation button#swords").click(function () {
        $(".about .explanation p#says").css("visibility", "visible");
    });
});
