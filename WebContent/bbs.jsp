<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>比赛论坛</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="viewport" content="width=device-width" />

<!--[if lt IE 9]>
<script type="text/javascript" src="layout/plugins/html5.js"></script>
<![endif]-->

<link rel="stylesheet" href="layout/style.css" type="text/css" />
<script type="text/javascript" src="layout/js/jquery.js"></script>

<!-- PrettyPhoto start -->
<link rel="stylesheet"
	href="layout/plugins/prettyphoto/css/prettyPhoto.css" type="text/css" />
<script type="text/javascript"
	src="layout/plugins/prettyphoto/jquery.prettyPhoto.js"></script>
<!-- PrettyPhoto end -->

<!-- jQuery tools start -->
<script type="text/javascript"
	src="layout/plugins/tools/jquery.tools.min.js"></script>
<!-- jQuery tools end -->

<!-- Calendar start -->
<link rel="stylesheet" href="layout/plugins/calendar/calendar.css"
	type="text/css" />
<script type="text/javascript" src="layout/plugins/calendar/calendar.js"></script>
<!-- Calendar end -->

<!-- ScrollTo start -->
<script type="text/javascript"
	src="layout/plugins/scrollto/jquery.scroll.to.min.js"></script>
<!-- ScrollTo end -->

<!-- MediaElements start -->
<link rel="stylesheet"
	href="layout/plugins/video-audio/mediaelementplayer.css" />
<script src="layout/plugins/video-audio/mediaelement-and-player.js"></script>
<!-- MediaElements end -->

<!-- FlexSlider start -->
<link rel="stylesheet" href="layout/plugins/flexslider/flexslider.css"
	type="text/css" />
<script type="text/javascript"
	src="layout/plugins/flexslider/jquery.flexslider-min.js"></script>
<!-- FlexSlider end -->

<!-- iButtons start -->
<link rel="stylesheet"
	href="layout/plugins/ibuttons/css/jquery.ibutton.css" type="text/css" />
<script type="text/javascript"
	src="layout/plugins/ibuttons/lib/jquery.ibutton.min.js"></script>
<!-- iButtons end -->

<!-- jQuery Form Plugin start -->
<script type="text/javascript"
	src="layout/plugins/ajaxform/jquery.form.js"></script>
<!-- jQuery Form Plugin end -->

<script type="text/javascript" src="layout/js/main.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script type="text/javascript" src="layout/js/logincheck.js"></script>
<link rel="stylesheet" href="layout/bbs.css" type="text/css" />

<script type="text/javascript">
function loadcontent() {
	//bbspostqueryallaction
	$.ajax({
		type : 'post',
		url : 'bbspostqueryallaction.action',//此处的Action要与struts.xml中的action的name对应
		success : function(data) {
			//alert("success")
			var n = data.reMap.resultlist.length
			for (i = 0; i < n; i++) {
				var theme = data.reMap.resultlist[i].p_ptheme
				var time=data.reMap.resultlist[i].p_ptime
				var nickname=data.reMap.resultlist[i].p_pnick
				resultpostlist.innerHTML += ('<li><a href="#">'+theme+'<br><font size="2">'+time+'&emsp;&emsp;'+nickname+'</font></a></li>');
			}
			//alert(n)
			//alert(data.reMap.resultlist[0].p_ptheme)
		},
		error : function() {
			alert("failed")
		}
	});
}

function bbspost(){
	var uaccount = decodeURIComponent(getCookie("userid"));
	window.location.href='/CompetitionNews/managesystem/insert/bbs_add.jsp?uaccount='+uaccount
}
</script>

</head>
<body onload="loadcontent(),checkCuser()">

	<div class="wrapper sticky_footer">
		<!-- HEADER BEGIN -->
		<header>
			<div id="header">
				<script type="text/javascript" src="layout/js/head.js"></script>
				<section class="section_main_menu">
					<div class="inner">
						<nav class="main_menu">
							<ul>
								<li><a href="index.html">主页</a>
								<li class="big_dropdown" data-content="technology"><a
									href="volun.jsp">公益征集</a></li>
								</li>
								<li class="big_dropdown" data-content="business"><a
									href="competitioninfo.jsp">比赛信息</a></li>
								<li class="current_page_item"><a href="#">比赛论坛</a></li>
								<li><a href="typography.html">关于我们</a>
									<ul>
										<li><a href="accordion.html">更多信息</a></li>
										<li><a href="pricing_table.html">会员充值</a></li>
										<li><a href="testimonials.html">励志标语</a></li>
									</ul></li>
								<li><a href="contact.html">加入我们</a></li>
							</ul>
						</nav>
					</div>
				</section>
				<section class="section_big_dropdown">
					<script type="text/javascript"
						src="layout/js/section_big_dropdown.js"></script>
				</section>
			</div>
		</header>
		<!-- HEADER END -->

		<!-- CONTENT BEGIN -->
		<div class="inner" style="padding-top: 20px">
			<div
				style="float: left; width: 20%; height: 300px; background-color: rgba(253, 227, 227, 1.00); padding: 20px; border: white thick solid">
				<!--cce0eb -->
				<h2 style="margin-top: 20px;">板块导航</h2>
				<dl>
					<dt>
						<a href="#">文学</a>
					</dt>
					<dt>
						<a href="#">英语</a>
					</dt>
					<dt>
						<a href="#">计算机</a>
					</dt>
					<dt>
						<a href="#">数学</a>
					</dt>
				</dl>
			</div>
			<div style="float: right; width: 70%; margin: 10px;">
				<div style="text-align: right">
					<input type="button" value="发布" class="btn" onclick="bbspost()"/>
				</div>
				<div class="line_4" style="margin: 20px 0px;"></div>
				<div>
					<ul class="c1">
						<li><a href="#">全部</a></li>
						<li><a href="#">文学</a></li>
						<li><a href="#">英语</a></li>
						<li><a href="#">计算机</a></li>
						<li><a href="#">数学</a></li>
					</ul>
				</div>
				<div class="line_2" style="margin: 24px 0px 25px;"></div>
				<div style="margin-bottom:100px">
					<ul class="c2" id="resultpostlist">
					</ul>
				</div>
				<div class="block_pager">
					<a href="#" class="prev">Previous</a> <a href="#" class="next">Next</a>
					<div class="pages">
						<ul>
							<li class="current"><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#">6</a></li>
						</ul>
					</div>
					<div class="clearboth"></div>
				</div>
			</div>
		</div>
		<!-- CONTENT END -->

		<!-- FOOTER BEGIN -->
		<script type="text/javascript" src="layout/js/footer.js"></script>
		<!-- FOOTER END -->
	</div>

	<!-- POPUP BEGIN -->
	<script type="text/javascript" src="layout/js/logindiv.js"></script>
	<!-- POPUP END -->
</body>
</html>