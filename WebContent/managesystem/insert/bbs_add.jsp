<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加帖子</title>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>

<body>
<% 
String aa = request.getParameter("uaccount");
if(aa.isEmpty()||aa.equals("null")||aa.equals(null)) {
	aa="101";
	System.out.println("syso"+aa);
	}
System.out.println("syso"+aa);
%>

<form id="post_save" name="Form1" action="bbspostaddcheckaction.action">

&nbsp;
<table cellSpacing="1" cellPadding="5" width="100%" align="center" bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
<tr>
<td align="center" bgColor="#afd1f3" colSpan="4"
height="26">
<input type="hidden" name="uaccount" value="<%=aa %>">
<strong>添加帖子</strong>
</td>
</tr>

<tr>
<td width="18%" align="center" bgColor="#f5fafe">
题目：
</td>
<td bgColor="#ffffff" colspan="3">
<input type="text" name="p_ptheme" >
</td>
</tr>

<tr>
<td align="center" bgColor="#f5fafe" >
 内容：
</td>
<td bgColor="#ffffff">
<textarea name="p_ptext" cols="60" rows="20" id="ptext"></textarea>
</td>
</tr>

<tr>
<td style="WIDTH: 100%" align="center" bgColor="#f5fafe" colSpan="4">
<input type="submit" value="确定"/>

<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
<!-- <button type="reset" value="重置&#37325;&#32622;" class="button_cancel">&#37325;&#32622;</button>  -->
<input type="button" value="重置" onclick="window.location.href='bbs_add.jsp';"/>

<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
<input type="button" value="返回" onclick="window.location.href='../../bbs.jsp';"/>
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