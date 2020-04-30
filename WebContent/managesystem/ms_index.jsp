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
				<li class="current"><a href="#">首页</a></li>
				<li><a href="ms_adm.jsp">用户管理</a></li>
			</ul>
		</div>
		<div class="content2">
			<center style="margin: 20px; font-size: 30px">
				欢迎您登陆<b>Competition News</b>后台管理系统
			</center>
			<div style="margin: 40px; text-indent: 2em;">
				<h2>竞赛信息网</h2>
				<h3>一个致力于搜集赛事信息的网站</h3>
				<p>
					竞赛信息网是一家专门致力于国内外各领域赛事信息搜集与发布的综合性赛事信息讯息平台。网站正式成立于2014年8月，其前身为2013年8月创立的竞赛网，网站创立以来一直以服务于全国大学生、社会竞赛爱好者为己任，目前是全国最大、最全面、最权威的赛事信息和服务承办平台。
				</p>
				<p>
					竞赛信息网自创立以来，访问量、浏览量迅速攀升。本网站以最快速度及时更新政府、企业、社会组织发布的各个领域赛事活动，所发布的每一项赛事活动都经过严格审核，全面完整，极具权威性与真实性。截至目前，我们拥有全国多所合作高校资源且合作高校数量不断增加。与多家企业均有密切合作，在为期提供了一个强有力的宣传推广平台的同时，也给了我们一个提升网站品牌、社会影响力的机会。
				</p>
			</div>
		</div>
	</div>
</body>
</html>