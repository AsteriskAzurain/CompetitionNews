<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改竞赛信息</title>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../../layout/js/jquery.js"></script>
<script type="text/javascript">
	var storage = window.sessionStorage;
	var competition_id = storage.getItem("competition_id");
	//document.writeln(adminid);

	function loadcinfo() {
		//alert(competition_id)
		$.ajax({
			type : 'post',
			url : 'cinfoloadaction.action?competition_id=' + competition_id,
			data : "competition_id=" + competition_id,
			success : function(data) {
				//alert("success")
				var competition_id=data.reMap.currentInfo.competition_id
				var name = data.reMap.currentInfo.name;
				var type_id = data.reMap.currentInfo.type_id;
				var title = data.reMap.currentInfo.title;
				var summary = data.reMap.currentInfo.summary;
				var img = data.reMap.currentInfo.img;
				var context = data.reMap.currentInfo.context;
				var tab = data.reMap.currentInfo.tab;
				//alert(competition_id)
				cid.value = competition_id
				cname.value = name
				ctype.value = type_id
				ctitle.value = title
				csummary.value = summary
				cimg.value = img
				ccontext.value = context
				ctab.value = tab
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

<body onload="loadcinfo()">
	<form id="cinfo_update" name="Form1" action="cinfoupdateaction.action">
		&nbsp;
		<table cellSpacing="1" cellPadding="5" width="100%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td align="center" bgColor="#afd1f3" colSpan="4" height="26"><strong>修改竞赛信息</strong>
				</td>
			</tr>
			
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe">竞赛id：</td>
				<td bgColor="#ffffff" colspan="3"><input type="text"
					name="competition_id" id="cid" readonly="true"></td>
			</tr>
			
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe">竞赛名：</td>
				<td bgColor="#ffffff" colspan="3"><input type="text"
					name="name" id="cname"></td>
			</tr>

			<tr>
				<td align="center" bgColor="#f5fafe">类别：</td>
				<td bgColor="#ffffff"><select type="text" name="type_id" id="ctype"
					style="width: 300px; height: 50px">
						<option value="301">计算机</option>
						<option value="302">文学</option>
						<option value="303">数学</option>
						<option value="304">英语</option>
				</select></td>
			</tr>

			<tr>
				<td align="center" bgColor="#f5fafe">标题：</td>
				<td bgColor="#ffffff"><input type="text" name="title" id="ctitle">
				</td>
			</tr>

			<tr>
				<td align="center" bgColor="#f5fafe">摘要：</td>
				<td bgColor="#ffffff"><input type="text" name="summary" id="csummary">
				</td>
			</tr>

			<tr>
				<td align="center" bgColor="#f5fafe">图片：</td>
				<td bgColor="#ffffff"><input type="varchar(255)" name="img" id="cimg">
				</td>
			</tr>

			<tr>
				<td align="center" bgColor="#f5fafe">文章：</td>
				<td class="ta_01" bgColor="#ffffff"><textarea cols="60" rows="20"
					name="context" id="ccontext"></textarea></td>
			</tr>

			<tr>
				<td align="center" bgColor="#f5fafe">标签：</td>
				<td bgColor="#ffffff"><input type="text" name="tab" id="ctab"></td>
			</tr>
			<tr>
			<tr>
				<td style="WIDTH: 100%" align="center" bgColor="#f5fafe" colSpan="4">
					<input type="submit" value="确定" onclick="exitadmin()" /> 
					<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
					<input type="button" value="重置" onclick="window.location.href='jsxx_update.jsp';" /> 
					<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT> 
					<input type="button" value="返回"
					onclick="exitadmin();window.location.href='../ms_jsxx.jsp';" />
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
