<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CompetitionNews后台管理系统</title>

<link rel="stylesheet" href="css/msstyle.css" type="text/css" />
<script type="text/javascript" src="login/js/checklogin.js"></script>
</head>

<body onload="checkCuser()" bgcolor="#DDF5FA">

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
			<li><a href="ms_docs.jsp">论坛管理</a></li>
			<li><a href="ms_vip.jsp">会员管理</a></li>
		</ul>
	</div>
	<div class="content1">
		<div class="snav">
			<ul>
				<li class="current"><a href="#">论坛内容</a></li>
				<li><a href="ms_forum.jsp">论坛评论</a></li>
			</ul>
		</div>
		<div class="content2">
			<div style="margin-left: 30px">
      <h2>论坛内容</h2>
      <form>
        <input type="button" value="添加" class="i1" 
			 style="background: #24b9c3; 
					color: white;
					margin-right: 75px">
        <input type="text" size="20" class="i1" >
        <input type="button" value="搜索" class="i1">
      </form>
    </div>
    <div style="margin-top: 50px;">
      <ul class="content3">
        <li><a href="#">内容1</a></li>
        <li><a href="#">内容2</a></li>
        <li><a href="#">内容3</a></li>
        <li><a href="#">内容4</a></li>
        <li><a href="#">内容5</a></li>
        <li><a href="#">内容6</a></li>
        <li><a href="#">内容7</a></li>
        <li><a href="#">内容8</a></li>
      </ul>
    </div>
		</div>
	</div>
</body>
</html>