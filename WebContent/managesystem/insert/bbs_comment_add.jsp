<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加评论</title>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>

<body>

<form id="comment_save" name="Form1" action="bbscommentaddcheckaction.action">
&nbsp;
<table cellSpacing="1" cellPadding="5" width="100%" align="center" bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
<tr>
<td align="center" bgColor="#afd1f3" colSpan="4" height="26">
<strong>添加评论</strong>
</td>
</tr>

<tr>
				<td width="18%" align="center" bgColor="#f5fafe">评论id：</td>
				<td bgColor="#ffffff" colspan="3"><input type="text"
					name="c_cid" id="cid" readonly="true"></td>
			</tr>

			<tr>
				<td align="center" bgColor="#f5fafe">评论用户账号：</td>
				<td bgColor="#ffffff"><input type="text" name="c_caccount"
					id="caccount"></td>
			</tr>
			
			<tr>
				<td align="center" bgColor="#f5fafe">被评论用户账号：</td>
				<td bgColor="#ffffff"><input type="text" name="c_uaccount"
					id="uaccount"></td>
			</tr>

			<tr>
				<td align="center" bgColor="#f5fafe">评论内容：</td>
				<td bgColor="#ffffff">
				<textarea name="c_ctext"
						cols="60" rows="20" id="ctext"></textarea></td>
			</tr>

<tr>
<td style="WIDTH: 100%" align="center" bgColor="#f5fafe" colSpan="4">
<!-- <button type="submit" id="userAction_save_do_submit" value="&#30830;&#23450;" class="button_ok">&#30830;&#23450;</button>  -->
<input type="submit" value="确定"/>

<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
<!-- <button type="reset" value="重置&#37325;&#32622;" class="button_cancel">&#37325;&#32622;</button>  -->
<input type="button" value="重置" onclick="window.location.href='bbs_comment_add.jsp';"/>

<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
<input type="button" value="返回" onclick="window.location.href='../ms_forum.jsp';"/>
<span id="Label1"></span>
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