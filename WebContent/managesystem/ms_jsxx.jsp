<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CompetitionNews后台管理系统</title>
<link rel="stylesheet" href="css/msstyle.css" type="text/css" />
<script type="text/javascript" src="../layout/js/jquery.js"></script>
<script type="text/javascript" src="login/js/checklogin.js"></script>
<script type="text/javascript">
	function id2str(id){
		var str;
		switch(id){
		case 301:
			str= "计算机"
			break;
		case 302:
			str= "文学"
			break;
		case 303:
			str= "数学"
			break;
		case 304:
			str= "英语"
			break;
		}
		return str;
	}

	function queryall(){
		$.ajax({
			type : 'post',
			url : '../cinfoqueryallaction.action',
			success : function(data) {
				//alert("success")
				var n=data.reMap.resultlist.length
				//alert(n)
				for (i=0;i<n;i++){
					var name=data.reMap.resultlist[i].name
					var typeid=data.reMap.resultlist[i].type_id
					var type=id2str(typeid)
					var userid=data.reMap.resultlist[i].competition_id
					resultpostlist.innerHTML+=('<li>'+type+' - <a href="#">'+name+'</a><div class="btn2"><button onclick="updateuser('+userid+')">修改</button><button onclick="deleteuser('+userid+')">删除</button></div></li>');
					
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
			window.location.replace("../cinfodeleteaction.action?competition_id="+userid);
		} else {
			alert("已取消。")
		}
	}
	function updateuser(userid) {
		var storage = window.sessionStorage;  
		storage.setItem("competition_id",userid);
		window.location.href = "update/jsxx_update.jsp?competition_id=" + userid;
	}
	function querybyname(name) {
		$.ajax({
			type : 'post',
			url : 'cinfoquerybyentityaction.action',
			data : "name=" +name,
			success : function(data) {
				alert("success")
				var n = data.reMap.resultlist.length
				alert(n)
				resultpostlist.innerHTML="";
				for (i = 0; i < n; i++) {
					var str = data.reMap.resultlist[i].name
					var userid = data.reMap.resultlist[i].competition_id
					var typeid=data.reMap.resultlist[i].type_id
					var type=id2str(typeid)
					//alert(userid)
					resultpostlist.innerHTML += ('<li>'+type+' - <a href="#">'+name+'</a><div class="btn2"><button onclick="updateuser('+userid+')">修改</button><button onclick="deleteuser('+userid+')">删除</button></div></li>');
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
		    <li class="lt2"><a href="#">竞赛信息管理</a></li>
			<li><a href="ms_volunteer.jsp">志愿者信息管理</a></li>
			<li><a href="ms_docs.jsp">论坛管理</a></li>
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
		<hr>
		<div class="content2">
			<div style="margin-left: 30px">
				<h2>所有竞赛信息</h2>
				<form name="searchcinfo">
					<input type="button" value="添加" class="i1"
						style="background: #24b9c3; color: white; margin-right: 75px"
						onclick="window.location.href='insert/jsxx_add.jsp'">
					<input type="text" size="20" class="i1" name="searchname"> 
					<input type="button" value="搜索" class="i1"  onclick="querybyname(searchcinfo.searchname.value)">
				</form>
			</div>
			<div style="margin-top: 50px;">
				<ul class="content3" id="resultpostlist">
				</ul>
			</div>
		</div>
	</div>
</body>
</html>