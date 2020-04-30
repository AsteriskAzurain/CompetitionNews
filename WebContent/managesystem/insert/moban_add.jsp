<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加xx</title>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>

<body>

<form id="xx_save" name="Form1" action="xx的saveaction" >
&nbsp;
<table cellSpacing="1" cellPadding="5" width="100%" align="center" bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
<tr>
<td align="center" bgColor="#afd1f3" colSpan="4"
height="26">
<strong>添加xx</strong>
</td>
</tr>

<tr>
<td width="18%" align="center" bgColor="#f5fafe">
属性1：
</td>
<td bgColor="#ffffff" colspan="3">
<input type="text" name="属性名" >
</td>
</tr>

<tr>
<td align="center" bgColor="#f5fafe" >
属性2：
</td>
<td bgColor="#ffffff">
<input type="text" name="属性名" >
</td>
</tr>

<tr>
<td align="center" bgColor="#f5fafe">
属性3：
</td>
<td bgColor="#ffffff">
<input type="text" name="属性名" >
</td>
</tr>

<tr>
<td style="WIDTH: 100%" align="center" bgColor="#f5fafe" colSpan="4">
<input type="submit" value="确定" />

<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
<input type="button" value="重置" onclick="window.location.href='本页面';"/>

<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
<input type="button" value="返回" onclick="window.location.href='../xx页面.jsp';"/>
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