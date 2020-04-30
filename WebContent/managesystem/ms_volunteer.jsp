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
<link rel="stylesheet" href="css/msstyle.css" type="text/css" />
<script type="text/javascript">
	function queryall(){
		$.ajax({
			type : 'post',
			url : '../volunqueryallaction.action',//此处的Action要与struts.xml中的action的name对应
			success : function(data) {
				//alert("success")
				var n = data.reMap.resultlist.length
				//alert(n)
				for (i = 0; i < n; i++) {
					var str = data.reMap.resultlist[i].name
					var volunteer_id = data.reMap.resultlist[i].volunteer_id
					resultvolunteerlist.innerHTML += ('<li><a href="#">'
							+ str
							+ '</a><div class="btn2"><button onclick="updatevolunteer('
							+ volunteer_id
							+ ')">修改</button><button onclick="deletevolunteer('
							+ volunteer_id + ')">删除</button></div></li>');
				}
			},
			error : function() {
				alert("failed")
			}
		});
	}
	

	function deletevolunteer(volunteer_id) {
		if (confirm("确定要删除吗？")) {
			alert("已删除。")
			window.location.replace("../volundeleteaction.action?volunteer_id="+volunteer_id);
		} else {
			alert("已取消。")
		}
	}
	function updatevolunteer(volunteer_id) {
		var storage = window.sessionStorage;  
		storage.setItem("volunteer_id",volunteer_id);
		window.location.href = "update/volunteer_update.jsp";
	}
	
	function querybyid(name) {
		$.ajax({
			type : 'post',
			url : 'volunquerybyentityaction.action',
			data : "name=" +name,
			success : function(data) {
				//alert("success")
				var n = data.reMap.resultlist.length
				//alert(n)
				resultvolunteerlist.innerHTML="";
				for (i = 0; i < n; i++) {
					var str = data.reMap.resultlist[i].name
					var volunteer_id = data.reMap.resultlist[i].volunteer_id
					resultvolunteerlist.innerHTML += ('<li><a href="#">'
							+ str
							+ '</a><div class="btn2"><button onclick="updatevolunteer('
							+ volunteer_id
							+ ')">修改</button><button onclick="deletevolunteer('
							+ volunteer_id + ')">删除</button></div></li>');}
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
			<li class="lt2"><a href="#">志愿者信息管理</a></li>
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
				<h2>所有志愿者信息</h2>
				<form name="searchvolunteer">
					<input type="button" value="添加" class="i1"
						style="background: #24b9c3; color: white; margin-right: 75px"
						onclick="window.location.href='insert/volunteer_add.jsp';">
					<input type="text" size="20" class="i1" name="name"> 
					<input type="button" value="搜索" class="i1" onclick="querybyid(searchvolunteer.name.value)">
				</form>
			</div>
			<div style="margin-top: 50px;">
				<ul class="content3" id="resultvolunteerlist"></ul>
			</div>
		</div>
	</div>
</body>
</html>