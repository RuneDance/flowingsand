function toggle() {
	window.location.href ="home.html"; 
};
 
$(document).ready(function() {
	/**
	 * 屏蔽浏览器右键功能
	 */
	$(document).bind("contextmenu", function(e) {
		return false;
	});
	var secs=9;
	var res;
	res=window.setInterval(update, 1000); 
	function update() { 
		secs--;
		this.secs=secs;
		$("#times").text("（"+secs+"s）");
		if(secs=='0'){
			window.clearInterval(res);
		}
	}
	$("#vader").ProgressBarWars({
		porcentaje : 100,
		color : "#66FF66",
		tiempo:9000,
		alto:"1px"
	});
	window.setTimeout('toggle()',9000);
});

