<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>我的消息</title>
		<link href="/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    	<link href="/static/css/font-awesome.min.css" rel="stylesheet" media="screen">
    	<link href="/static/css/s_message.css" rel="stylesheet" type="text/css" />
		
		<script src="/static/jquery/1.11.3/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    	<script src="/static/bootstrap/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
	<jsp:include page="../include/s_header.jsp" flush="true"></jsp:include>

	<div style="clear:both"></div>
	<!-- Nav tabs -->
	<div class="main">
		<div style="margin:10px 0;">
			<div style="width:100px;float:left;">我的消息</div>
			<div
				style="width:924px;height:2px;background:#fff;float:left;margin-top: 10px;"></div>
			<div style="clear:both"></div>
		</div>
		<div class="container-fluid" style="height: 1000px;">
			<div class="row">
				<div class="col-md-8 c_left">
					<div class="l_header">
						<ul>
							<li><span class="active">全部</span><span>|</span></li>
							<li>投递简历成功<span class="l_span">|</span></li>
							<li>简历被查看<span class="l_span">|</span></li>
							<li>面试通知<span class="l_span">|</span></li>
							<li>不合格<span class="l_span">|</span></li>
							<li>系统消息</li>
						</ul>
					</div>
					<div class="l_bottom">
						<div>
							<ul class="l_b_ul">
								<li>UI设计师 <span class="l_b_salary">6k-8k</span><span
									class="l_b_time">2017-10-10</span></li>
								<li>陕西 西安 | 五险一金 | 周末双休 | 年底分红</li>
								<li>陕西新才网络科技有限公司<span class="l_b_status">HR已收到你的简历</span></li>
							</ul>
						</div>
						<div>
							<ul class="l_b_ul">
								<li>陕西新才网络科技有限公司给你发来面试通知：</li>
								<li><textarea class="form-control" rows="5">
          								11111111
          								22222
          								3333
          							</textarea></li>
								<li>面试岗位：UI设计师</li>
								<li>时间：2017-06-16</li>
								<li>地点：陕西</li>
								<li>联系人：王先生</li>
							</ul>
						</div>
						<div>
							<ul class="l_b_ul">
								<li>UI设计师 <span class="l_b_salary">6k-8k</span><span
									class="l_b_time">2017-10-10</span></li>
								<li>陕西 西安 | 五险一金 | 周末双休 | 年底分红</li>
								<li>陕西新才网络科技有限公司<span class="l_b_status">HR认为你不太符合岗位要求</span></li>
							</ul>
						</div>
						<div>
							<ul class="l_b_ul">
								<li>系统消息</li>
								<li><textarea class="form-control" rows="5">
          								11111111
          								22222
          								3333
          							</textarea></li>
								<li></li>
								<li style="height: 40px;"><a class="l_b_a" href="#">进入会场</a></li>
							</ul>
						</div>
						<div>111</div>

					</div>
				</div>

				<div class="col-md-4 c_right">
					<div class="r_bottom">
						<div class="r_b_favorite">
							<img src="images/message1.png" alt="..." class="img-rounded">
						</div>
						<div class="r_b_favorite">
							<img src="images/message2.png" alt="..." class="img-rounded">
						</div>
						<div class="r_b_favorite">
							<img src="images/message3.png" alt="..." class="img-rounded">
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>
