<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加竞赛信息</title>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<form id="jsxx_save" name="Form1" action="cinfosaveaction.action">
		&nbsp;
		<table cellSpacing="1" cellPadding="5" width="100%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td align="center" bgColor="#afd1f3" colSpan="4" height="26"><strong>添加竞赛信息</strong>
				</td>
			</tr>
			<tr>
			<td width="18%" align="center" bgColor="#f5fafe">竞赛名：</td>
			<td bgColor="#ffffff" colspan="3"><input type="text"
				name="name" ></td>
			</tr>

			<tr>
				<td align="center" bgColor="#f5fafe">类别：</td>
				<td bgColor="#ffffff"><select type="nvarchar(50)"
					name="type_id" style="width: 300px; height: 50px">
						<option value="301">计算机</option>
						<option value="302">文学</option>
						<option value="303">数学</option>
						<option value="304">英语</option>
				</select></td>
			</tr>

			<tr>
				<td align="center" bgColor="#f5fafe">标题：</td>
				<td bgColor="#ffffff"><input type="text" name="title">
				</td>
			</tr>

			<tr>
				<td align="center" bgColor="#f5fafe">摘要：</td>
				<td bgColor="#ffffff"><input type="text" name="summary">
				</td>
			</tr>

			<tr>
				<td align="center" bgColor="#f5fafe">图片：</td>
				<td bgColor="#ffffff"><input type="text" name="img">
				</td>
			</tr>

			<tr>
				<td align="center" bgColor="#f5fafe">文章：</td>
				<td bgColor="#ffffff"><textarea name="context" cols="60" rows="20"></textarea>
				</td>
			</tr>

			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">标签：</td>
				<td bgColor="#ffffff"> <input type="text" name="tab">
				</td>
			</tr>
			<tr>
				<td style="WIDTH: 100%" align="center" bgColor="#f5fafe" colSpan="4">
					<input type="submit" value="确定" /> 
					<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
					<input type="button" value="重置" onclick="window.location.href='jsxx_add.jsp';" /> 
					<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
					<input type="button" value="返回" onclick="window.location.href='../ms_jsxx.jsp';" /> 
					<!-- ${pageContext.request.contextPath}/managesystem/ms_vip.jsp -->
					<!--  在使用的时候可以使用${pageContext.request.contextPath}，也同时可以使用<百分号=request.getContextPath()%>达到同样的效果，同时，也可以将${pageContext.request.contextPath}，放入一个JSP文件中，将用C：set放入一个变量中，然后在用的时候用EL表达式取出来。 -->
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