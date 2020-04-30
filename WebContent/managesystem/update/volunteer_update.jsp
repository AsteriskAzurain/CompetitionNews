<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改志愿者信息</title>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../../layout/js/jquery.js"></script>
<script type="text/javascript">
	var storage = window.sessionStorage;
	var volunteer_id = storage.getItem("volunteer_id");
	//document.writeln(volunteer_id);

	function loadvolunteer() {
		//alert("start")
		$.ajax({
			type : 'post',
			url : '../../volunteerloadaction.action?volunteer_id=' + volunteer_id,
			data : "volunteer_id=" + volunteer_id,
			success : function(data) {
				//alert("success")
				var volunteer_id = data.reMap.currentvolunteer.volunteer_id;
				var name = data.reMap.currentvolunteer.name;
				var title = data.reMap.currentvolunteer.title;
				var summary = data.reMap.currentvolunteer.summary;
				var img = data.reMap.currentvolunteer.img;
				var context = data.reMap.currentvolunteer.context;
				var tab = data.reMap.currentvolunteer.tab;
				//alert(volunteer_id)
				vid.value=volunteer_id
				vname.value=name
				vtitle.value=title
				vsummary.value=summary
				vimg.value=img
				vcontext.value=context
				vtab.value=tab
			},
			error : function() {
				alert("failed")
			}
		});
	}

	function exitvolunteer() {
		var storage = window.sessionStorage;
		storage.clear()
	}
</script>

</head>

<body onload="loadvolunteer()">

	<form id="volunteer_update" name="Form1" action="volunupdateaction.action">
		&nbsp;
		<table cellSpacing="1" cellPadding="5" width="100%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td align="center" bgColor="#afd1f3" colSpan="4" height="26"><strong>修改志愿者信息</strong>
				</td>
			</tr>
			
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe">竞赛信息id：</td>
				<td bgColor="#ffffff" colspan="3"><input type="text" name="vid" id="vid" readonly="true" ></td>
			</tr>
			
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">简称：</td>
				<td class="ta_01" bgColor="#ffffff" colspan="3"><input
					type="nvarchar(50)" name="vname" class="bg" id="vname"></td>
			</tr>

			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">标题：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="nvarchar(50)"
					name="vtitle" class="bg" id="vtitle"></td>
			</tr>

			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">摘要：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="vsummary" class="bg" id="vsummary"></td>
			</tr>

			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">图片：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="varchar(255)"
					name="vimg" class="bg" id="vimg"></td>
			</tr>

			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">内容：</td>
				<td class="ta_01" bgColor="#ffffff"><textarea name="vcontext"
						cols="60" rows="20" id="vcontext"></textarea></td>
			</tr>

			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">标签：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="nvarchar(50)"
					name="vtab" class="bg" id="vtab"></td>
			</tr>
			<tr>
				<td style="WIDTH: 100%" align="center" bgColor="#f5fafe" colSpan="4">
					<input type="submit" value="确定" onclick="exitvolunteer()" /> <FONT
					face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT> <input
					type="button" value="重置"
					onclick="window.location.href='volunteer_update.jsp';" /> <FONT
					face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT> <input
					type="button" value="返回"
					onclick="exitvolunteer();window.location.href='../ms_volunteer.jsp';" />
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
