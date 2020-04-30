<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>竞赛信息</title>

<meta name="keywords" content="" />
<meta name="description" content="" />

<meta name="viewport" content="width=device-width" />

<!--[if lt IE 9]>
<script type="text/javascript" src="layout/plugins/html5.js"></script>
<![endif]-->

<link rel="stylesheet" href="layout/style.css" type="text/css" />
<link href="http://fonts.googleapis.com/css?family=PT+Sans:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="http://fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="http://fonts.googleapis.com/css?family=Droid+Serif:400,400italic"
	rel="stylesheet" type="text/css" />

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

<script type="text/javascript" src="layout/js/logincheck.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script type="text/javascript">
function loadcontent() {
	//bbspostqueryallaction
	$.ajax({
		type : 'post',
		url : 'volunqueryallaction.action',//此处的Action要与struts.xml中的action的name对应
		success : function(data) {
			//alert("success")
			var n = data.reMap.resultlist.length
			for (i = 0; i < n; i++) {
				//var theme = data.reMap.resultlist[i].p_ptheme
				//var time=data.reMap.resultlist[i].volunteer_id
				var theme = data.reMap.resultlist[i].name
				var time = data.reMap.resultlist[i].creatime
				var view = data.reMap.resultlist[i].view_count
				volunposts.innerHTML += ('<article class="blog_post"><div class="tail"></div><div class="f_pic"><a href="模板.html" class="general_pic_hover zoom"><img src="images/pic_blog_1_2.jpg" alt="" /></a></div><h4 class="title">	<a href="模板.html" target="_blank">'+theme+'</a></h4><div class="info">	<div class="date"><p>'+time+'</p></div><a href="#" class="views">'+view+'</a> </div></article>');
			}
			//alert(n)
			//alert(data.reMap.resultlist[0].p_ptheme)
		},
		error : function() {
			alert("failed")
		}
	});
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
								<li class="current_page_item"><a href="#">公益征集</a></li>
								</li>
								<li class="big_dropdown" data-content="business"><a
									href="competitioninfo.jsp">比赛信息</a></li>
								<li><a href="bbs.jsp">比赛论坛</a></li>
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
		<div id="content" class="right_sidebar">
			<div class="inner">
				<div class="general_content">
					<div class="main_content">

						<div class="separator" style="height: 30px;"></div>

						<h2>公益征集</h2>

						<p class="general_subtitle">
							加入我们吧！你将获得<br> 一次与国际专业平台的接触<br> 一次与著名业内人士的近距离交流<br>
							一次终生难忘的经历.
						</p>

						<div class="line_4" style="margin: 0px 0px 0px;"></div>

						<div class="block_blog_1" id="volunposts"></div>

						<div class="line_2" style="margin: 24px 0px 25px;"></div>

						<div class="block_pager">
							<a href="#" class="prev">Previous</a> <a href="#" class="next">Next</a>

							<div class="pages">
								<ul>
									<li><a href="#">1</a></li>
									<li class="current"><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li><a href="#">6</a></li>
								</ul>
							</div>

							<div class="clearboth"></div>
						</div>

					</div>
					<iframe src="sidebar.jsp" width=300px height=1000px
						style="float: right"></iframe>
					<div class="separator" style="height: 31px;"></div>
					<div class="clearboth"></div>
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