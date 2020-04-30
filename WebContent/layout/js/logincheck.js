function zhuxiao() {
	if (confirm("确定要注销吗？")) {
		alert("已注销。")
		var username = decodeURIComponent(getCookie("username"));
		if (username != "null") {
			delCookie('username');
			cuser.textContent = "登陆"
			location.reload();
		}
	} else {
		alert("未注销。")
	}
}
function delCookie(name) {
	var exp = new Date();
	exp.setTime(exp.getTime() - 1);
	var cval = decodeURIComponent(getCookie(name));
	if (cval != null)
		document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString()
				+ ";path=/";
}
function loginCheck(username, password) {
	$.ajax({
		type : 'post',
		url : 'logincheckaction.action',//此处的Action要与struts.xml中的action的name对应
		data : "username=" + username + "&password=" + password,
		// dataType: "json",
		success : function(data) {
			console.log(data.reMap);
			//$('#login').hide();
			var target = $(this).attr('href');
			$('.block_popup').hide(500, function() {
				$('#overlay').hide();
			});
			//var obj=eval("("+result+")");
			//var currentUser=eval("("+obj+")");
			cuser.textContent = data.reMap.currentUser.username;

			//e.preventDefault();
			var result = JSON.stringify(data.reMap);
			//alert(data.reMap.currentUser.username);
		},
		error : function(data, e) {
			console.log(data);
			//var currentUser = <%=request.getSession().getAttribute("currentUser")%>
			var info = "用户名或密码错误" + username + password
			loginresult.innerHTML = info;
		}
	});
};

function checkCuser() {
	var username = decodeURIComponent(getCookie("username"));
	if (username != "null") {
		cuser.textContent = username;
	} else {
		cuser.textContent = "登陆"
	}
}
function getCookie(name) {
	var arr = document.cookie.match(new RegExp("(^| )" + name
			+ "=([^;]*)(;|$)"));
	if (arr != null) {
		var params = arr[2]
		params.replace(/\+/g, " ")
		return params
	}
	return null;
}