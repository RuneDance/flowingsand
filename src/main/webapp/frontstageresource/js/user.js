$(document).ready(function() {
	/**
	 * 屏蔽浏览器右键功能
	 */
	$(document).bind("contextmenu", function(e) {
		return false;
	});
	$("#log-form").easyform();
});

/**
 * 用户登录
 */

function checkUser() {
	var uname = $.trim($("#username").val());
	var upwd = $.trim($("#pwd").val());
	if (uname != "" && upwd != "") {
		$("#vader").ProgressBarWars({
			porcentaje : 100,
			color : "#F9F5F0",
			tiempo : 1000,
			alto : "0.7px"
		});
	} else {
		if (uname == "") {
			var tip = $("#username").easytip({position : "top",class : "easy-red"});
			tip.show("用户名不能为空！");
		}
		if (upwd == "") {
			var tip = $("#pwd").easytip({position : "top",class : "easy-red"});
			tip.show("密码不能为空！");
		}
		return false;
	}
}