<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>CompetitionNews后台管理系统</title>
<script type="text/javascript" src="../layout/js/jquery.js"></script>
<script type="text/javascript" src="login/js/checklogin.js"></script>
<link rel="stylesheet" href="css/msstyle.css" type="text/css" />
<script type="text/javascript">
	function queryall() {
		$
				.ajax({
					type : 'post',
					url : 'bbspostqueryallaction.action',//此处的Action要与struts.xml中的action的name对应
					success : function(data) {
						//alert("success")
						var n = data.reMap.resultlist.length
						for (i = 0; i < n; i++) {
							var str = data.reMap.resultlist[i].p_ptheme
							var userid = data.reMap.resultlist[i].p_pid
							resultuserlist.innerHTML += ('<li><a href="#">'
									+ str
									+ '</a><div class="btn2"><button onclick="updateuser('
									+ userid
									+ ')">修改</button><button onclick="deleteuser('
									+ userid + ')">删除</button></div></li>');
						}
					},
					error : function() {
						alert("failed")
					}
				});
	}

	function deleteuser(userid) {
		if (confirm("确定要删除吗？")) {
			alert("已删除。")
			window.location.replace("../bbspostdeleteaction.action?p_pid="
					+ userid);
		} else {
			alert("已取消。")
		}
	}
	function updateuser(userid) {
		var storage = window.sessionStorage;
		storage.setItem("p_pid", userid);
		window.location.href = "update/bbs_update.jsp?p_pid=" + userid;
	}

	function querybyid(p_ptheme) {
		$
				.ajax({
					type : 'post',
					url : '../bbspostquerybyeneityaction.action?p_ptheme'
							+ p_ptheme,
					data : "p_ptheme=" + p_ptheme,
					success : function(data) {
						//alert("success")
						var n = data.reMap.PostList.length
						//alert(n)
						resultuserlist.innerHTML = "";
						for (i = 0; i < n; i++) {
							var str = data.reMap.PostList[i].p_ptheme
							var userid = data.reMap.PostList[i].p_pid
							//alert(userid)
							resultuserlist.innerHTML += ('<li><a href="#">'
									+ str
									+ '</a><div class="btn2"><button onclick="updateuser('
									+ userid
									+ ')">修改</button><button onclick="deleteuser('
									+ userid + ')">删除</button></div></li>');
						}
					},
					error : function() {
						alert("failed")
					}
				});
	}
</script>

</head>
<body bgcolor="#DDF5FA" onload="queryall(),checkCuser()">
	<div style="float: right">
		<span id="cadmin"></span> <a href="#" class="btn1" onClick="zhuxiao()">注销</a>
	</div>
	<header
		style="margin-top: 40px; margin-left: 20px; margin-bottom: 50px;">
		<img src="../images/ms_logo.png" alt="" style="height: 40px" /> <span
			style="font-size: 30px; vertical-align: top">后台管理系统</span>
	</header>
	<div class="nav">
		<ul class="lt1">
			<li><a href="ms_jsxx.jsp">竞赛信息管理</a></li>
			<li><a href="ms_volunteer.jsp">志愿者信息管理</a></li>
			<li class="lt2"><a href="#">论坛管理</a></li>
			<li><a href="ms_vip.jsp">会员管理</a></li>
		</ul>
	</div>
	<div class="content1">
		<div class="snav">
			<ul>
				<li><a href="ms_index.jsp">首页</a></li>
				<li><a href="ms_adm.jsp">用户管理</a></li>
			</ul>
		</div>
		<hr style="margin: 10px">

		<div class="content2">
			<div class="luntan">
				<ul>
					<li class="docs"><a href="ms_docs.jsp" style="background: #8A8A8A; color:white">论坛内容</a></li>
					<li class="docs"><a href="ms_forum.jsp">论坛评论</a></li>
				</ul>
			</div>
			<br>
			<hr style="margin-top: 30px">
			<div style="margin-left: 30px">
				<h2>所有帖子</h2>
				<form name="searchpost">
					<input type="button" value="添加" class="i1"
						style="background: #999; color: white; margin-right: 75px; border: 0px"
						disabled="disabled"> <input type="text" size="20"
						class="i1" name="search"> <input type="button" value="搜索"
						class="i1" onclick="querybyid(searchpost.search.value)">
				</form>
			</div>
			<div style="margin-top: 50px;">
				<ul class="content3" id="resultuserlist"></ul>
			</div>
		</div>
	</div>
</body>
</html>