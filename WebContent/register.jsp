<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.Station"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% 
if(request.getParameter("tid")==null && request.getParameter("tuid")==null 
	&&request.getSession().getAttribute("zk_tuid")==null && request.getSession().getAttribute("zk_tid")==null ){
	response.sendRedirect("/member/accountRegister.do");
}
com.zhaopin.zk.ZkTools.newRegister(request); 
%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta name="Keywords" content="<%=com.zhaopin.Config.getSiteKeywords() %>" />
<meta name="Description" content="<%=com.zhaopin.Config.getSiteDescription() %>" />
<title>用户注册-- <%=com.zhaopin.Config.getSiteTitle() %></title>

<link rel="stylesheet" href="/statics/bootstrap/2.3.2/css/bootstrap.min.css"/>
<link rel="stylesheet" href="/statics/bootstrap/2.3.2/css/bootstrap-theme.min.css"/>
<link rel="stylesheet" href="/statics/css/main.css" type="text/css" />
<link rel="stylesheet" href="/statics/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" type="text/css"></link>

<link rel="stylesheet" href="/statics/css/main4.css"/>
<link rel="stylesheet" href="/statics/css/site.css"/>
<link href="/statics/css/register_stu.css" rel="stylesheet" />

<script type="text/javascript">
	var cur_path ="<%=request.getContextPath()%>";
</script>
<script src="/statics/jquery/1.11.3/jquery.min.js"></script>
<script src="/statics/bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script> 
<script src="/statics/jquery/jquery.form.js" type="text/javascript" charset="utf-8"></script>
<script src="/statics/jquery/jquery.validate.min.js" type="text/javascript" charset="utf-8"></script> 

<script type="text/javascript" src="/statics/js/register.js" charset="utf-8"></script>

<link href="js/layer/skins/default.css" rel="stylesheet" />
<script src="js/layer/artDialog.min.js" type="text/javascript"></script>
<script type="text/javascript" src="js/layer/getprovince211.js" charset="utf-8"></script>
<script type="text/javascript" src="js/layer/getposition.js" charset="utf-8"></script>
<script type="text/javascript" src="static/layer/jobjss.js" charset="utf-8"></script>
<script type="text/javascript" src="assets/My97DatePicker/WdatePicker.js"  charset="utf-8"></script>
<script type="text/javascript" src="js/school_data_js_array.js" charset="utf-8"></script>

<style type="text/css">
	.select_user_type {	height:80px;	}
	.select_user_type li{float:left;margin:0 5px;box-shadow: 1px 1px 1px;}
	.select_user_type li a{	display:block;width:291px;height:38px;	color:#929292;font-size:20px;
		background:#EDEDED;line-height:38px;text-align:center;text-decoration:none;	font-weight:bolder;	}
	.select_user_type li a.stu:hover{background:#e03919;color:#FFF;}
	.select_user_type li a.com:hover{background:#e03919;color:#FFF;}
	.select_user_type li a.sch:hover{background:#e03919;color:#FFF;}
	.select_user_type li.active a.stu{background:#e03919;color:#FFF;}
	.select_user_type li.active a.com{background:#e03919;color:#FFF;}
	.select_user_type li.active a.sch{background:#e03919;color:#FFF;}
</style>
            <script>
			  $(function () {
				$('.select_user_type a').click(function (e) {
				  		e.preventDefault();
				  		var target=$(this).attr("target");
						$(this).parent("li").siblings().removeClass("active");
						$(this).parent("li").addClass("active");
						$.dialog({
						        id: 'Tips',
						        esc:false,
						        width:200,
						        height:100,
						        title: false,
						        content:'<div>正在加载数据……</div>',
						        cancel: false,
						        fixed: true,
						        lock: true,
						        modal: true,
						        close:false
						    });
						$("#ajax-form").load("register"+$(this).attr("target")+".jsp",function(){
								$.dialog({id: 'Tips'}).close();
								$('.register-form').validate( eval("options"+target ));
						});
				});
			  });
			function isIE() { //ie?  
				if (!!window.ActiveXObject || "ActiveXObject" in window)  
				  return true;  
				else  
				  return false;  
			}  
			</script>
	<!--新版头部引入  -->
    <link href="/static/css/common-element.css" rel="stylesheet" type="text/css">
    <script src="/static/artDialog/artDialog.js?skin=aero" charset="utf-8"></script>
    <script src="/static/artDialog/plugins/iframeTools.js"></script>
	<script src="/static/js/flow.js" type="text/javascript" charset="utf-8"></script>
    <!--新版头部引入 结束 -->
    </head>
	<body>
<jsp:include page="/static/include/header.jsp" flush="true"></jsp:include>
<script type="text/javascript">
	   	$("#site_select_btn").hide();
</script>
<div class="container" id="register-form">
	<% if(request.getParameter("tid")!=null){ %>
    <style type="text/css">
    	#zk_ad a.close-btn {font-size:16px;float:right;background:#000;color:#FFF;
    	display:block;height:20px;width:20px;text-align:center;position:absolute;top:0;right:0;}
    </style>
    <script type="text/javascript">
    	function close_ad()
    	{
    		$("#zk_ad").hide();
    	}
    </script>
    <div id="zk_ad" style="margin:-15px auto 15px auto;position:relative;">
    	<img src="/statics/images/zhaoke.jpg"/>
    	<a href="javascript:;" onclick="close_ad();" class="close-btn">&times;</a>
    </div>
	<% } %>
    <div style="width:920px; margin:auto;">
    <!--
		<ul class="select_user_type">
		<li class="active"><a class="stu" href="javascript:;" target="_stu">我是学生</a></li>
		<li><a class="com" href="javascript:;" target="_com">我是企业</a></li>
		<li><a class="sch" href="javascript:;" target="_sch">我是院校/机构</a></li>
		</ul>
	-->
    </div>             
     <div style="clear:both;"></div>
      <div id="ajax-form">
      </div> <!-- ajax-form -->
      	<script type="text/javascript">
      		$("#ajax-form").load("register_stu.jsp #register_form",function(){
      			$('.register-form').validate(options_stu);
      		});
      	</script>
</div>

<jsp:include page="/static/include/footer.jsp" flush="true"></jsp:include>


<script src="assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script> 
<script type="text/javascript" src="statics/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>

	</body>
</html>

