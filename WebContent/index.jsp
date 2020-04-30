<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>竞赛信息网</title>

<meta name="keywords" content="" />
<meta name="description" content="" />
<meta charset="utf-8" />
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
<script type="text/javascript">
	jQuery(function() {
	});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script type="text/javascript">
	function loginCheck(username, password) {
		var username = decodeURIComponent(getCookie("username"));
		if (username != "null") {
			alarm="您已登录。"
		}else{
		$.ajax({
			type : 'post',
			url : 'logincheckaction.action',//此处的Action要与struts.xml中的action的name对应
			data : "username=" + username + "&password=" + password,
			// dataType: "json",
			success : function(data) {
				console.log(data.reMap);
				//$('#login').hide();
				var target = $(this).attr('href');
				$('.block_popup').hide(500, function() {
					$('#overlay').hide();
				});
				//var obj=eval("("+result+")");
				//var currentUser=eval("("+obj+")");
				cuser.textContent = data.reMap.currentUser.username;

				//e.preventDefault();
				var result = JSON.stringify(data.reMap);
				//alert(data.reMap.currentUser.username);
			},
			error : function(data, e) {
				console.log(data);
				//var currentUser = <%=request.getSession().getAttribute("currentUser")%>
				var info = "用户名或密码错误" + username + password
				loginresult.innerHTML = info;
			}
		});
		}
	};
</script>
<script type="text/javascript">
	function checkCuser() {
		var username = decodeURIComponent(getCookie("username"));
		if (username != "null") {
			cuser.textContent = username;
		} else {
			cuser.textContent = "登陆"
		}
	}
	function getCookie(name) {
		var arr = document.cookie.match(new RegExp("(^| )" + name
				+ "=([^;]*)(;|$)"));
		if (arr != null) {
			var params = arr[2]
			params.replace(/\+/g, " ")
			return params
		}
		return null;
	}
</script>
</head>

<body onload="checkCuser()">
	<div class="wrapper sticky_footer">
		<!-- HEADER BEGIN -->
		<header>
			<div id="header">
				<section class="top">
					<div class="inner">
						<div class="fr">
							<div class="block_top_menu">
								<ul>
									<li class="current">
										<div align="right">
											<a href="#login" class="open_popup" id="cuser">登陆</a>
									</li>
									<script language="javascript">
										function zhuxiao() {
											if (confirm("确定要注销吗？")) {
												alert("已注销。")
												var username = decodeURIComponent(getCookie("username"));
												if (username != "null") {
													delCookie('username');
													cuser.textContent = "登陆"
													location.reload();
												}
											} else {
												alert("未注销。")
											}
										}
										function delCookie(name) {
											var exp = new Date();
											exp.setTime(exp.getTime() - 1);
											var cval = decodeURIComponent(getCookie(name));
											if (cval != null)
												document.cookie = name + "="
														+ cval + ";expires="
														+ exp.toGMTString()
														+ ";path=/";
										}
									</script>
									<li>
										<div align="right">
											<a href="#" onClick="zhuxiao()">注销</a>
										</div>
									</li>
								</ul>
							</div>
						</div>
						<div class="clearboth"></div>
					</div>
				</section>
				<section class="bottom">
					<div class="inner">
						<div id="logo_top">
							<a href="index.html"><img src="images/logo_top.png"
								alt="BusinessNews" title="竞赛信息网" /></a>
						</div>
						<div class="block_today_date">
							<div class="num">
								<p id="num_top" />
							</div>
							<div class="other">
								<p class="month_year">
									<span id="month_top"></span>, <span id="year_top"></span>
								</p>
								<p id="day_top" class="day" />
							</div>
						</div>
						<div class="fr">
							<div class="block_languages">
								<div class="clearboth"></div>
							</div>
							<div class="block_search_top">
								<form action="#">
									<div class="field">
										<input type="text" class="w_def_text" title="输入你想搜索的内容" />
									</div>
									<input type="submit" class="button" value="Search" />
									<div class="clearboth"></div>
								</form>
							</div>
						</div>
						<div class="clearboth"></div>
					</div>
				</section>
				<section class="section_main_menu">
					<div class="inner">
						<nav class="main_menu">
							<ul>
								<li class="current_page_item"><a href="index.html">主页</a></li>
								<li class="big_dropdown" data-content="technology"><a
									href="volun.html">公益征集</a></li>
								<li class="big_dropdown" data-content="business"><a
									href="c_computer.html">比赛信息</a></li>
								<li><a href="blog.html">比赛论坛</a></li>
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
					<div class="inner">
						<div class="block_big_dropdown" data-menu="business">
							<div class="content">
								<div class="image">
									<a href="#" class="pic"><img
										src="images/pic_big_drop_3.jpg" alt="" /></a>
									<p>
										<a href="#">这里是火热报名中的竞赛活动。</a>
									</p>
								</div>
								<div class="line"></div>
								<div class="image">
									<a href="#" class="pic"><img
										src="images/pic_big_drop_4.jpg" alt="" /></a>
									<p>
										<a href="#">这里是快速提升学科素养的通道。</a>
									</p>
								</div>
								<div class="line"></div>
								<div class="popular_posts">
									<div class="title">
										<p>商业创业</p>
									</div>
									<ul>
										<li><a href="#"><span>01 July, 2019</span>2019第八届金程杯全国微课大赛报名中！</a></li>
										<li><a href="#"><span>01 July, 2019</span>“长沙银行杯”2019年湖南省创新创业大赛和创新挑战赛报名中！</a></li>
										<li><a href="#"><span>01 July, 2019</span>2019年第十三届iCAN国际创新创业大赛报名中！</a></li>
										<li><a href="#"><span>01 July, 2019</span>2019年第十三届iCAN国际创新创业大赛报名中！</a></li>
									</ul>
								</div>
								<div class="clearboth"></div>
							</div>
						</div>
						<div class="block_big_dropdown" data-menu="technology">
							<div class="content">
								<div class="image">
									<a href="#" class="pic"><img
										src="images/pic_big_drop_5.jpg" alt="" /></a>
									<p>
										<a href="#">这里有正在报名的志愿活动。</a>
									</p>
								</div>
								<div class="line"></div>
								<div class="image">
									<a href="#" class="pic"><img
										src="images/pic_big_drop_6.jpg" alt="" /></a>
									<p>
										<a href="#">这里有完美闭幕的活动集锦。</a>
									</p>
								</div>
								<div class="line"></div>
								<div class="popular_posts">
									<div class="title">
										<p>志愿者招募令</p>
									</div>
									<ul>
										<li><a href="#"><span>01 July, 2019</span>金熊猫全球创新创业大赛志愿者招募！</a></li>
										<li><a href="#"><span>01 July, 2019</span>澳大利亚华人总工会招募线上英文志愿者招募！</a></li>
										<li><a href="#"><span>01 July, 2019</span>2019第七届#乌镇戏剧节#志愿者招募！</a></li>
										<li><a href="#"><span>01 July, 2019</span>2019大学生志愿服务西部计划正式招募！</a></li>
									</ul>
								</div>
								<div class="clearboth"></div>
							</div>
						</div>
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
						<div class="block_special_topic">
							<div class="type">
								<p>专题</p>
							</div>
							<div class="title">
								<p>近期举办的国家级竞赛</p>
							</div>
						</div>
						<div class="separator" style="height: 17px;"></div>
						<div class="block_home_slider">
							<div id="home_slider" class="flexslider">
								<ul class="slides">
									<li>
										<div class="slide">
											<a href="c_en_fzy.html"><img src="images/c_en_fzy_p1.jpg"
												alt="" width="610" height="292" />
												<div class="caption">
													<p class="title">2019年全国高校创新英语挑战赛</p>
													<p>报名截止日期：2019年11月20日 ||
														初赛：在线知识竞赛形式，答题及格有优秀奖证书，现在报名有一次模拟答题机会 || 决赛：官网考察听、说、写比赛 ||
														主办单位：《海外英语》杂志</p></a>
										</div>
							</div>
							</li>
							<li>
								<div class="slide">
									<a href="c_en_ch.html"><img src="images/c_en_ch_p1.jpg"
										alt="" width="610" height="292" />
										<div class="caption">
											<p class="title">2019“外研社•国才杯”全国英语演讲大赛</p>
											<p>“随着中国特色社会主义进入新时代，国家和社会的发展对高等教育的需要比以往任何时候都更加迫切，对科学知识和卓越人才的渴求比以往任何时候都更加强烈。”新时代赋予新使命，新格局呼唤新举措...</p></a>
								</div>
						</div>
						</li>
						<li>
							<div class="slide">
								<a href="c_cp_lhb.html"><img src="images/c_cp_lhb_p1.jpg"
									alt="" width="610" height="292" />
									<div class="caption">
										<p class="title">2019年全国高校计算机能力挑战赛</p>
										<p>主办单位：全国高等学校计算机教育研究会 || 报名截止日期：2019年11月15日 ||
											分设大数据算法赛，人工智能算法赛，Office高级应用赛，程序设计赛4大赛项 ||
											大赛通知：各有关高校教务处：为贯彻落实习近平主席在十 ...</p></a>
							</div>
					</div>
					</li>
					<li>
						<div class="slide">
							<a href="c_mt_lhb.html"><img src="images/c_mt_lhb_p1.jpg"
								alt="" width="610" height="292" />
								<div class="caption">
									<p class="title">2019年第二届华教杯全国大学生数学竞赛</p>
									<p>报名时间：即日起至11月16日||大赛背景为落实教育部、科技部、中科院、自然科学基金会联合制定的《关于加强数学科学研究工作方案》，全面测试大学生的数学知识、修养与能力...</p></a>
						</div>
				</div>
				</li>
				</ul>
			</div>
			<script type="text/javascript">
				$(function() {
					$('#home_slider').flexslider({
						animation : 'slide',
						controlNav : true,
						directionNav : true,
						animationLoop : true,
						slideshow : false,
						useCSS : false
					});

				});
			</script>
		</div>
		<div class="line_2" style="margin: 34px 0px 28px;"></div>
		<div class="block_home_col_2"></div>
		<div class="clearboth"></div>
		<h3 style="font-size: 16px;">主要赛事</h3>
		<div class="line_4" style="margin: -4px 0px 18px;"></div>
		<div class="block_topic_news">
			<article class="block_topic_post">
				<p class="title">
					<a href="news_post.html">第三届全国大学生化工实验大赛</a>
				</p>
				<div class="f_pic">
					<a href="news_post.html" class="general_pic_hover scale"><img
						src="images/pic_home_main_news_1.jpg" alt="" /></a>
				</div>
				<p class="text">经教育部化学委员会决定，2019年联合举办第三届全国大学生化工实验大赛。大赛主题为“启航—化学工程师”。</p>
				<div class="info">
					<div class="date">
						<p>01 July, 2019</p>
					</div>
					<div class="r_part">
						<div class="category">
							<p>
								<a href="#">化学</a>
							</p>
						</div>
						<a href="#" class="views">200</a>
					</div>
				</div>
			</article>
			<article class="block_topic_post">
				<p class="title">
					<a href="news_post2.html">第九届全国大学生机械创新大赛 
				</p>
				<div class="f_pic">
					<a href="news_post2.html" class="general_pic_hover scale"><img
						src="images/pic_home_main_news_2.jpg" alt="" /></a>
				</div>
				<p class="text">经教育部机械基础课程教学委员会研究。决定自2019年3月启动第九届全国大学生机械创新设计大赛工作。</p>
				<div class="info">
					<div class="date">
						<p>01 July, 2019</p>
					</div>
					<div class="r_part">
						<div class="category">
							<p>信息技术</p>
						</div>
						<a href="#" class="views">199</a>
					</div>
				</div>
			</article>
			<article class="block_topic_post">
				<p class="title">
					<a href="news_post3.html">第七届全国大学生光电设计大赛</a>
				</p>
				<div class="f_pic">
					<a href="news_post3.html" class="general_pic_hover scale"><img
						src="images/pic_home_main_news_3.jpg" alt="" /></a>
				</div>
				<p class="text">经教育部光电信息科学与工程委员会决定，2019年8月18日在青岛大学举办第七届全国大学光电设计竞赛。</p>
				<div class="info">
					<div class="date">
						<p>01 July, 2019</p>
					</div>
					<div class="r_part">
						<div class="category">
							<p>信息技术</p>
						</div>
						<a href="#" class="views">150</a>
					</div>
				</div>
			</article>
			<article class="block_topic_post">
				<p class="title">
					<a href="news_post4.html">2019年美国大学生数学建模竞赛</a>
				</p>
				<div class="f_pic">
					<a href="news_post4.html" class="general_pic_hover scale"><img
						src="images/pic_home_main_news_4.jpg" alt="" /></a>
				</div>
				<p class="text">比赛时间为美国东部时间：2019年1月24日下午5点-1月28日下午8点，北京时间比美国东部时间早13个小时。</p>
				<div class="info">
					<div class="date">
						<p>01 July, 2019</p>
					</div>
					<div class="r_part">
						<div class="category">
							<p>数学</p>
						</div>
						<a href="#" class="views">81</a>
					</div>
				</div>
			</article>
		</div>
		<a href="#" class="lnk_all_news fl">全部竞赛</a>
	</div>
	</div>
<iframe src="sidebar.jsp" width=300px height=1000px style="float:right"></iframe>
	<div class="clearboth"></div>
	</div>
	</div>
	</div>
	<!-- CONTENT END -->

	<!-- FOOTER BEGIN -->
	<footer>
		<div id="footer">
			<div class="inner">
				<div id="logo_bottom">
					<a href="index.html"><img src="images/logo_bottom.png" alt="" /></a>
				</div>
				<div class="block_to_top">
					<a href="#">返回顶部</a>
				</div>
			</div>
		</div>
	</footer>
	<!-- FOOTER END -->
	</div>

	<!-- POPUP BEGIN -->
	<div id="overlay"></div>
	<div id="login" class="block_popup">
		<div class="popup">
			<a href="#" class="close">Close</a>
			<div class="content">
				<div class="title">
					<p>登陆网站</p>
				</div>
				<div class="form">
					<form action="logincheckaction.action" name="loginform">
						<div class="column">
							<p class="label">用户名</p>
							<div class="field">
								<input type="text" name="username" />
							</div>
						</div>
						<div class="column">
							<p class="label">密码</p>
							<div class="field">
								<input type="password" name="password" />
							</div>
						</div>
						<div class="column_2">
							<div class="remember">
								<div class="checkbox">
									<input type="checkbox" />
								</div>
								<div class="remember_label">
									<p>记住密码</p>
								</div>
							</div>
						</div>
						<div class="column_2">
							<p class="forgot_pass">
								<a href="#">忘记密码?</a>
							</p>
						</div>
						<div class="column button">
							<a href="#" class="enter"
								onclick="loginCheck(loginform.username.value,loginform.password.value)"><span>登陆</span></a>
						</div>
						<div class="clearboth"></div>
					</form>

					<a href="registration.html" target="_self">
						<p style="padding-top: 25px;">注册成为新用户</p>
					</a>
					<div style="padding-top: 25px;" id="loginresult"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- POPUP END -->
</body>
</html>