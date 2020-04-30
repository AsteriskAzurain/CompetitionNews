<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改帖子信息</title>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../../layout/js/jquery.js"></script>
<script type="text/javascript">
	var storage = window.sessionStorage;
	var p_pid = storage.getItem("p_pid");
	//document.writeln(adminid);

	function loadadmin() {
		//alert("start")
		$.ajax({
			type : 'post',
			url : '../../bbspostloadaction.action?p_pid=' + p_pid,
			data : "p_pid" + p_pid,
			success : function(data) {
				//alert("success")
				var p_pid = data.reMap.currentPost.p_pid;
				var p_ptheme = data.reMap.currentPost.p_ptheme;
				var p_ptext = data.reMap.currentPost.p_ptext;
				var p_pnick = data.reMap.currentPost.p_pnick
				//alert(p_pid)
				pid.value = p_pid
				ptheme.value = p_ptheme
				ptext.value = p_ptext
				pnick.value=p_pnick
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
	<form id="bbspost_update" name="Form1"
		action="bbspostupdateaction.action">
		&nbsp;
		<table cellSpacing="1" cellPadding="5" width="100%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td align="center" bgColor="#afd1f3" colSpan="4" height="26"><strong>修改帖子信息</strong>
				</td>
			</tr>

			<tr>
				<td width="18%" align="center" bgColor="#f5fafe">帖子id：</td>
				<td bgColor="#ffffff" colspan="3"><input type="text"
					name="p_pid" id="pid" readonly="true"></td>
			</tr>

			<tr>
				<td align="center" bgColor="#f5fafe">标题：</td>
				<td bgColor="#ffffff"><input type="text" name="p_ptheme"
					id="ptheme"></td>
			</tr>
			
			<tr>
				<td align="center" bgColor="#f5fafe">发帖人：</td>
				<td bgColor="#ffffff"><input type="text" name="p_pnick"
					id="pnick" readonly="true"></td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe">内容：</td>
				<td bgColor="#ffffff"><textarea name="p_ptext" cols="60"
						rows="20" id="ptext"></textarea></td>
			</tr>

			<tr>
				<td style="WIDTH: 100%" align="center" bgColor="#f5fafe" colSpan="4">
					<!-- <button type="submit" id="userAction_save_do_submit" value="&#30830;&#23450;" class="button_ok">&#30830;&#23450;</button>  -->
					<input type="submit" value="确定" onclick="exitadmin()" /> <FONT
					face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT> <input
					type="button" value="重置"
					onclick="window.location.href='bbs_update.jsp';" /> <FONT
					face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT> <input
					type="button" value="返回"
					onclick="exitadmin();window.location.href='../ms_docs.jsp';" />
				</td>
			</tr>
			<tr>
				<td style="WIDTH: 100%" align="center" bgColor="#f5fafe" colSpan="4">
					<span id="Label1">${errorMessage }</span>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>