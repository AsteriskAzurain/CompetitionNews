<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改会员信息</title>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../../layout/js/jquery.js"></script>
<script type="text/javascript">
	var storage = window.sessionStorage;
	var userid = storage.getItem("userid");
	//document.writeln(adminid);

	function loaduser() {
		//alert("start")
		$.ajax({
			type : 'post',
			url : 'userloadaction.action',
			data : "userid=" + userid,
			success : function(data) {
				//alert("success")
				var userid = data.reMap.currentUser.userid;
				var username = data.reMap.currentUser.username;
				var email = data.reMap.currentUser.email;
				var password=data.reMap.currentUser.password;
				var sex=data.reMap.currentUser.sex;
				var major=data.reMap.currentUser.major;
				//alert(userid)
				aid.value=userid
				aname.value=username
				aemail.value=email
				apassword.value=password
				asex.value=sex
				amajor.value=major
			},
			error : function() {
				alert("failed")
			}
		});
	}

	function exitUser() {
		var storage = window.sessionStorage;
		storage.clear()
	}
</script>
</head>

<body onload="loaduser()">
	<script type="text/javascript">
		//document.writeln(Userid);
	</script>
	<form id="User_update" name="Form2" action="userupdateaction.action">
		&nbsp;
		<table cellSpacing="1" cellPadding="5" width="100%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td align="center" bgColor="#afd1f3" colSpan="4" height="26"><strong>修改用户信息</strong>
				</td>
			</tr>

			<tr>
				<td width="18%" align="center" bgColor="#f5fafe">用户id：</td>
				<td bgColor="#ffffff" colspan="3"><input type="text" name="userid" id="aid" readonly="true" ></td>
			</tr>

			<tr>
				<td width="18%" align="center" bgColor="#f5fafe">登录名：</td>
				<td bgColor="#ffffff" colspan="3"><input type="text"
					name="username" id="aname"></td>
			</tr>
			
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe">电子邮箱：</td>
				<td bgColor="#ffffff" colspan="3"><input type="text"
					name="email" id="aemail"></td>
			</tr>
			
						<tr>
				<td align="center" bgColor="#f5fafe">密码：</td>
				<td bgColor="#ffffff"><input type="text" name="pswd"
					id="apassword"></td>
			</tr>
			
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe">性别：</td>
				<td bgColor="#ffffff" colspan="3"><input type="text"
					name="sex" id="asex"></td>
			</tr>
			
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe">专业：</td>
				<td bgColor="#ffffff" colspan="3"><input type="text"
					name="major" id="amajor"></td>
			</tr>



			<tr>
				<td style="WIDTH: 100%" align="center" bgColor="#f5fafe" colSpan="4">
					<!-- <button type="submit" id="userAction_save_do_submit" value="&#30830;&#23450;" class="button_ok">&#30830;&#23450;</button>  -->
					<input type="submit" value="确定" onclick="exitUser()" /> <FONT
					face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>  <!-- <button type="reset" value="重置&#37325;&#32622;" class="button_cancel">&#37325;&#32622;</button>  -->
					<input type="button" value="重置"
					onclick="window.location.href='../update/User_update.jsp';" /> <FONT
					face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT> 
					<input type="button" value="返回"
					onclick="exitUser();window.location.href='../ms_vip.jsp';" />
				</td>
			</tr>

			<tr>
				<td style="WIDTH: 100%" align="center" bgColor="#f5fafe" colSpan="4">
					<span id="Label1">${errorMessage }</span>
				</td>
			</tr>
		</table>
	</form>
	<!-- ${param.adminid }
		<%//request.getParameter("adminid")%> -->

</body>
</html>