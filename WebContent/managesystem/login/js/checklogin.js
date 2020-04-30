/**
 * 
 */

function checkCuser() {
	var adminname = decodeURIComponent(getCookie("adminname"));
	if (adminname != "null") {
		cadmin.textContent = ("欢迎您，管理员"+adminname);
	} else {
		cadmin.textContent = "您尚未登陆！"
		alert("您尚未登陆，将在三秒后跳转到登录界面！")
		setTimeout('window.location.href = "login/backlogin.jsp"', 3000 )
	}
}
function getCookie(name) {
	var arr = document.cookie
			.match(new RegExp("(^| )" + name + "=([^;]*)(;|$)"));
	if (arr != null) {
		var params = arr[2]
		params.replace(/\+/g, " ")
		return params
	}
	return null;
}

function zhuxiao() {
	if (confirm("确定要注销吗？")) {
		alert("已注销。");
		window.location.href = "login/backlogin.jsp";
	} else {
		alert("未注销。")
	}
}