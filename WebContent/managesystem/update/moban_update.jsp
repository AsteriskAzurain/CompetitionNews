<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改xx信息</title>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>

<body>

	<form id="userAction_save_do" name="Form1" action="/StudentWeb/zhuce"
		enctype="multipart/form-data">
		&nbsp;
		<table cellSpacing="1" cellPadding="5" width="100%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td align="center" bgColor="#afd1f3" colSpan="4" height="26"><strong>添加管理员</strong>
				</td>
			</tr>

			<tr>
				<td width="18%" align="center" bgColor="#f5fafe">登录名：</td>
				<td bgColor="#ffffff" colspan="3"><input type="text"
					name="USERNAME" id="userAction_save_do_logonName"></td>
			</tr>

			<tr>
				<td align="center" bgColor="#f5fafe">密码：</td>
				<td bgColor="#ffffff"><input type="password" name="PASSWORD"
					id="logonPwd"></td>
			</tr>

			<tr>
				<td align="center" bgColor="#f5fafe">确认密码：</td>
				<td bgColor="#ffffff"><input type="password" name="PASSWORD1"
					id="logonPwd"></td>
			</tr>

			<tr>
				<td style="WIDTH: 100%" align="center" bgColor="#f5fafe" colSpan="4">
					<!-- <button type="submit" id="userAction_save_do_submit" value="&#30830;&#23450;" class="button_ok">&#30830;&#23450;</button>  -->
					<input type="button" value="确定"
					onclick="window.location.href='login/ms_vip.jsp';" /> <FONT
					face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT> <!-- <button type="reset" value="重置&#37325;&#32622;" class="button_cancel">&#37325;&#32622;</button>  -->
					<input type="button" value="重置"
					onclick="window.location.href='moban_add.jsp';" /> <FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
					<input type="button" value="返回"
					onclick="window.location.href='login/ms_vip.jsp';" /> <span
					id="Label1"></span>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>