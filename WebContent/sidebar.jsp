<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sidebar</title>
<link rel="stylesheet" href="layout/style.css" type="text/css" />

<script type="text/javascript" src="layout/js/jquery.js"></script>
<!-- Calendar start -->
<link rel="stylesheet" href="layout/plugins/calendar/calendar.css"
	type="text/css" />
<script type="text/javascript" src="layout/plugins/calendar/calendar.js"></script>
<!-- Calendar end -->

</head>
<body style="width:300px">
	<div class="sidebar">
		<div class="block_popular_posts">
			<h4>近期竞赛</h4>
			<div class="article">
				<div class="pic">
					<a href="c_cp_wxj.html" class="w_hover"> <img
						src="images/c_cp_wxj_p1.jpg" alt="" height="46" width="46" /> <span></span>
					</a>
				</div>
				<div class="text">
					<p class="title">
						<a href="c_cp_wxj.html">互联网＋全国大学生创新创业大赛</a>
					</p>
					<div class="date">
						<p>01 July, 2019</p>
					</div>
					<div class="icons">
						<ul>
							<li><a href="#" class="views">99</a></li>
							<li><a href="#" class="comments">99</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="line_3"></div>
			<div class="article">
				<div class="pic">
					<a href="c_lt_fzy.html" class="w_hover"> <img
						src="images/c_lt_fzy_p1.jpg" alt="" height="46" width="46" /> <span></span>
					</a>
				</div>
				<div class="text">
					<p class="title">
						<a href="c_lt_fzy.html">大型电视节目《诗·中国》同题诗征集</a>
					</p>
					<div class="date">
						<p>01 July, 2019</p>
					</div>
					<div class="icons">
						<ul>
							<li><a href="#" class="views">77</a></li>
							<li><a href="#" class="comments">77</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="line_3"></div>
			<div class="article">
				<div class="pic">
					<a href="c_en_fzy_2.html" class="w_hover"> <img
						src="images/c_en_fzy_2_p1.jpg" alt="" height="46" width="46" /> <span></span>
					</a>
				</div>
				<div class="text">
					<p class="title">
						<a href="c_en_fzy_2.html">2019年第二届“普译奖”全国大学生英语写作大赛</a>
					</p>
					<div class="date">
						<p>01 July, 2012</p>
					</div>
					<div class="icons">
						<ul>
							<li><a href="#" class="views">55</a></li>
							<li><a href="#" class="comments">55</a></li>
						</ul>
					</div>
				</div>
				<div class="separator" style="height: 31px;"></div>
			</div>
			<div class="line_2"></div>
		</div>
		<div class="separator" style="height: 31px;"></div>
		<div class="block_popular_stuff">
			<h4>最受欢迎竞赛</h4>
			<div class="content">
				<a href="#" class="view_all">显示全部竞赛</a>
				<div class="media">
					<a href="images/c_lt_ch_p1.jpg"
						class="general_pic_hover zoom no_fx" data-rel="prettyPhoto"
						title="最受欢迎竞赛"><img src="images/c_lt_ch_p1.jpg" alt=""
						height="208" width="364" /></a>
				</div>
				<p>
					<a href="c_lt_ch.html">“清白泉”杯全国清廉诗歌散文大赛 </a> <img
						src="images/icon_photo.gif" alt="" />
				</p>
				<p class="date">01 July, 2019</p>
			</div>
			<div class="info">
				<ul>
					<li class="comments"><a href="#">22</a></li>
					<li class="views"><a href="#">33</a></li>
				</ul>
			</div>
			<div class="clearboth"></div>
			<div class="separator" style="height: 31px;"></div>
			<div class="line_2"></div>
		</div>
		<div class="separator" style="height: 31px;"></div>
		<div class="block_calendar">
			<h4>日历</h4>
			<div class="calendar" id="calendar_sidebar"></div>
			<div class="separator" style="height: 31px;"></div>
			<div class="line_2"></div>
			<script type="text/javascript">
				var today = new Date();
				var date = today.getFullYear() + '-' + (today.getMonth() + 1)
						+ '-' + today.getDate();
				$('#calendar_sidebar').DatePicker(
						{
							flat : true,
							date : date,
							calendars : 1,
							starts : 1,
							locale : {
								days : [ 'Sunday', 'Monday', 'Tuesday',
										'Wednesday', 'Thursday', 'Friday',
										'Saturday', 'Sunday' ],
								daysShort : [ 'Sun', 'Mon', 'Tue', 'Wed',
										'Thu', 'Fri', 'Sat', 'Sun' ],
								daysMin : [ 'S', 'M', 'T', 'W', 'T', 'F', 'S',
										'S' ],
								months : [ 'January', 'February', 'March',
										'April', 'May', 'June', 'July',
										'August', 'September', 'October',
										'November', 'December' ],
								monthsShort : [ 'Jan', 'Feb', 'Mar', 'Apr',
										'May', 'Jun', 'Jul', 'Aug', 'Sep',
										'Oct', 'Nov', 'Dec' ],
								weekMin : 'wk'
							}
						});
			</script>
		</div>
		<div class="separator" style="height: 31px;"></div>
		<div class="clearboth"></div>
	</div>
</body>
</html>