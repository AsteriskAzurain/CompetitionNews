<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>竞赛信息网</title>

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

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script type="text/javascript" src="layout/js/logincheck.js"></script>

<script type="text/javascript">
function isEmpty(obj) {
	  if (typeof obj === 'undefined' || obj == null || obj === '') {
	    return true;
	  } else {
	    return false;
	  }
	}

function existKey() {
	 var pathSearch = window.location.search.substr(1);
	 if(isEmpty(pathSearch)){
		 //alert("计算机")
		 window.location.replace("competitioninfo.jsp?type_id=301")
	 }else{
		 var paramKey = pathSearch.split("=")[0];
         var paramValue = pathSearch.split("=")[1];
         return paramValue
	 }
}
function queryByType(){
	paramValue=existKey()
	//alert("value"+paramValue)
	$.ajax({
		type : 'post',
		url : 'cinfoquerybytypeaction.action?type_id='+paramValue,
		success : function(data) {
			//alert("success")
			var n=data.reMap.resultlist.length
			//alert(n)
			var id=data.reMap.resultlist[0].competition_id
			var t=data.reMap.resultlist[0].title
			var c=data.reMap.resultlist[0].creatime
			var v=data.reMap.resultlist[0].view_count
			//alert(t)
			block_main_news.innerHTML=('<article class="block_news_post_feature"><div class="f_pic"><a href="c_cp_lhb.html" class="general_pic_hover scale"><img src="images/pic_main_news_big.jpg" alt="" /></a></div><h4 class="title"><a href="c_cp_lhb.html">'+t+'</a></h4><div class="info"><div class="date"><p>'+c+'</p></div><div class="r_part"><div class="category"><p>&nbsp;</p></div><a href="#" class="views">'+v+'</a></div><div class="clearboth"></div></div></article>')
			for (i=1;i<n;i++){
				var competition_id=data.reMap.resultlist[i].competition_id
				var title=data.reMap.resultlist[i].title
				var creatime=data.reMap.resultlist[i].creatime
				var view_count=data.reMap.resultlist[i].view_count
				block_main_news.innerHTML+=('<article class="block_news_post"><div class="f_pic"><a href="c_cp_wxj.html" class="general_pic_hover scale_small"><img src="images/pic_main_news_1.jpg" alt="" /></a></div><p class="category">&nbsp;</p><p class="title"><a href="c_cp_wxj.html"> '+title+'</a></p><div class="info"><div class="date"><p>'+creatime+'</p></div><a href="#" class="views">'+view_count+'</a><div class="clearboth"></div></div></article>');
			}
		},
		error : function() {
			//alert("failed")
		}
	});
}
</script>
</head>

<body onload="checkCuser(),queryByType()">


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
								<li class="current_page_item"><a href="c_computer.html">比赛信息</a></li>
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

				<section class="section_secondary_menu">
					<div class="inner">
						<nav class="secondary_menu">
							<ul>
								<li><a href="competitioninfo.jsp?type_id=301">计算机</a></li>
								<li><a href="competitioninfo.jsp?type_id=302">文学</a></li>
								<li><a href="competitioninfo.jsp?type_id=303">数学</a></li>
								<li><a href="competitioninfo.jsp?type_id=304">英语</a></li>
							</ul>
						</nav>

					</div>
				</section>
			</div>
		</header>
		<!-- HEADER END -->

		<!-- CONTENT BEGIN -->


		<div id="content" class="right_sidebar">
			<div class="inner">
				<div class="general_content">
					<div class="main_content">


						<h2>计算机竞赛</h2>
						<p class="general_subtitle">
							对于当代大学生来说，在大学当中积累一定的专业竞赛经验，提高自己的专业素养是一件很重要的事。</p>
						<div class="line_4" style="margin: 0px 0px 22px;"></div>
						<!-- 按照类别查找竞赛信息 -->
						<div class="block_main_news" id="block_main_news"></div>

						<div class="line_2" style="margin: 8px 0px 25px;"></div>

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