<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CompetitionNews后台管理系统 - 登录</title>
<link rel="stylesheet" type="text/css" href="css/styles.css">
<script type="text/javascript">
	function backloginCheck(name, password) {

		if(name==""){       //验证用户名是否为空
	        alert("请输入用户名！");backloginform.adminname.focus();
	    }
		else if(password==""){       //验证密码是否为空
	        alert("请输入密码！");backloginform.adminpassword.focus();
	    }   
	    else{
	    //var param="/AdminAction/backlogincheckaction.action&adminname="+name+"&adminpassword="+password;
	   
	    $.ajax({
 	    	url : 'backlogincheckaction.action',//此处的Action要与struts.xml中的action的name对应
			data : "aname=" + name + "&apassword=" + password,
	     //   url:param,
	        type:"GET",
	        dataType:"json",
	        contentType:'charset=UTF-8',
	        success:function(data){
	        	//alert("success")
	        	event.preventDefault();
	        	$('form').fadeOut(500);
	        	$('.wrapper').addClass('form-success');
	        	//alert(data.reMap.currentAdmin.adminname)
	        	setTimeout('window.location.href = "../ms_index.jsp"', 1000 )
	           //window.location.href = "../ms_index.html";
	        },
	    	error:function(){
	           alert("您输入的用户名或密码有错！");
	           backloginform.adminname.focus(); 
	    }
	    });
	    }
	};
</script>
</head>
<body>
	<div class="htmleaf-container">
		<div class="wrapper">
			<div class="container">
				<h1>Welcome</h1>

				<form class="form" action="backlogincheckaction.action"
					method="post" name="backloginform">
					<input type="text" placeholder="Admin Name" name="adminname">
					<input type="password" placeholder="Admin Password"
						name="adminpassword"> <input type="button" value="Login"
						id="login-button"
						onClick="backloginCheck(backloginform.adminname.value,backloginform.adminpassword.value)" />
				</form>
			</div>
			<ul class="bg-bubbles">
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
			</ul>
		</div>
	</div>

	<script src="js/jquery-2.1.1.min.js" type="text/javascript"></script>
	<script>
	/*
$('#login-button').click(function (event) {
	event.preventDefault();
	$('form').fadeOut(500);
	$('.wrapper').addClass('form-success');
});*/
</script>

	<div
		style="text-align: center; margin: 50px 0; font: normal 14px/24px 'MicroSoft YaHei'; color: #000000">
		<h1>后台管理系统</h1>
	</div>
</body>
</html>