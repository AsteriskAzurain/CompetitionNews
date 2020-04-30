<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改管理员信息</title>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../../layout/js/jquery.js"></script>
<script type="text/javascript">
	var storage = window.sessionStorage;
	var adminid = storage.getItem("adminid");
	//document.writeln(adminid);

	function loadadmin() {
		//alert("start")
		$.ajax({
			type : 'post',
			url : 'adminloadaction.action',
			data : "adminid=" + adminid,
			success : function(data) {
				//alert("success")
				var adminid = data.reMap.currentAdmin.adminid;
				var adminname = data.reMap.currentAdmin.adminname;
				var adminpassword = data.reMap.currentAdmin.adminpassword;
				//alert(adminid)
				aid.value=adminid
				aname.value=adminname
				apassword.value=adminpassword
			},
			error : function() {
				alert("failed")
			}
		});
	}

	function exitadmin() {
		var storage = window.sessionStorage;
		storage.clear()
	}
</script>
</head>

<body onload="loadadmin()">
	<script type="text/javascript">
		//document.writeln(adminid);
	</script>
	<form id="admin_update" name="Form2" action="adminupdateaction.action">
		&nbsp;
		<table cellSpacing="1" cellPadding="5" width="100%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td align="center" bgColor="#afd1f3" colSpan="4" height="26"><strong>修改管理员信息</strong>
				</td>
			</tr>

			<tr>
				<td width="18%" align="center" bgColor="#f5fafe">管理员id：</td>
				<td bgColor="#ffffff" colspan="3"><input type="text" name="adminid" id="aid" readonly="true" ></td>
			</tr>

			<tr>
				<td width="18%" align="center" bgColor="#f5fafe">登录名：</td>
				<td bgColor="#ffffff" colspan="3"><input type="text"
					name="adminname" id="aname"></td>
			</tr>

			<tr>
				<td align="center" bgColor="#f5fafe">密码：</td>
				<td bgColor="#ffffff"><input type="text" name="pswd"
					id="apassword"></td>
			</tr>

			<tr>
				<td style="WIDTH: 100%" align="center" bgColor="#f5fafe" colSpan="4">
					<!-- <button type="submit" id="userAction_save_do_submit" value="&#30830;&#23450;" class="button_ok">&#30830;&#23450;</button>  -->
					<input type="submit" value="确定" onclick="exitadmin()" /> <FONT
					face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT> <!-- <button type="reset" value="重置&#37325;&#32622;" class="button_cancel">&#37325;&#32622;</button>  -->
					<input type="button" value="重置"
					onclick="window.location.href='admin_update.jsp';" /> <FONT
					face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT> <input
					type="button" value="返回"
					onclick="exitadmin();window.location.href='../ms_adm.jsp';" />
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