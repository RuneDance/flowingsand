$(document).ready(function() {
	/**
	 * 屏蔽浏览器右键功能
	 */
	$(document).bind("contextmenu",function(e){
	    return false;
	});
	/**
	 * 删除操作
	 */
	$(".del").click(function() {
		var mid = $(this).parent().parent().attr('id');
		$("#dialog-confirm").dialog({
			resizable : false,
			height : 170,
			modal : true,
			draggable : false,
			buttons : {
				"确 定" : function() {
					$.ajax({
						async : false,
						type : "POST",
						url : "deletemessages.html",
						dataType : "text",
						data : {
							id : $.trim(mid),
						},
						success : function(data) {
							if (data == "delSuc") {
								$("#dialog-confirm").dialog("close");
								window.location.href = "message.html";
							} else {
								window.location.href = "error.html";
							}
						},
						error : function(data) {
							window.location.href = "error.html";
						}
					});
				},
				"取 消" : function() {
					$(this).dialog("close");
				}
			}
		});

	});

	/**
	 * 查看消息操作
	 */
	$(".message").click(function() {
		var mid = $(this).parent().parent().attr('id');
		$.ajax({
			async : false,
			type : "POST",
			url : "messhow.html",
			dataType : "text",
			data : {
				id : $.trim(mid),
			},
			success : function(data) {
				if (data == "messhowok") {
					window.location.href = "messageshow.html";
				} else {
					window.location.href = "error.html";
				}
			},
			error : function(data) {
				window.location.href = "error.html";
			}
		});
	});

});