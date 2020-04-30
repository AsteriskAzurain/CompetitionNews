<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加志愿者</title>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body>

	<form id="volunteer_save" name="Form2"
		action="voluninsertaction.action">
		&nbsp;
		<table cellSpacing="1" cellPadding="5" width="100%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td align="center" bgColor="#afd1f3" colSpan="4" height="26"><strong>添加志愿者信息</strong>
				</td>
			</tr>
			<tr>
			<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
				简称：</td>
			<td class="ta_01" bgColor="#ffffff" colspan="3">
			<input type="text" name="name" ></td>
			</tr>

			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">标题：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="title" class="bg"></td>
			</tr>

			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">摘要：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="summary" class="bg"></td>
			</tr>

			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">图片：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="img" class="bg"></td>
			</tr>

			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">内容：</td>
				<td class="ta_01" bgColor="#ffffff">
				<textarea type="file" name="context"
						cols="60" rows="20">
						</textarea></td>
			</tr>

			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">标签：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="tab" class="bg"></td>
			</tr>
			<tr>
<td style="WIDTH: 100%" align="center" bgColor="#f5fafe" colSpan="4">
<input type="submit" value="确定" />

<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
<input type="button" value="重置" onclick="window.location.href='volunteer_add.jsp';"/>

<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
<input type="button" value="返回" onclick="window.location.href='../ms_volunteer.jsp';"/>
</td>
</tr>
<tr>
<td style="WIDTH: 100%" align="center" bgColor="#f5fafe" colSpan="4">
<span id="Label1">${errorMessage }</span></td>
</tr>
		</table>
	</form>
</body>
</html>