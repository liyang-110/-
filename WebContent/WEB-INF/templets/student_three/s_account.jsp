<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.Station"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/static/inc/checkLogin.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>修改密码</title>
		<link href="/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    	<link href="/static/css/font-awesome.min.css" rel="stylesheet" media="screen">
    	<link href="/static/css/common-element.css" rel="stylesheet" type="text/css">
    	<link href="/static/css/s_message.css" rel="stylesheet" type="text/css" />
		<link href="/static/css/font-awesome.min.css" rel="stylesheet" media="screen">
    	<link href="/static/css/validatebox.css" rel="stylesheet" type="text/css"></link>
   
		<script src="/static/jquery/1.11.3/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    	<script src="/static/bootstrap/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    	<script src="/static/js/jquery.easyui.min.js" type="text/javascript"></script> 
   	 	<script src="/static/jquery/jquery.cookie.js" type="text/javascript"></script>   
    	<script src="/static/artDialog/artDialog.js?skin=aero" charset="utf-8"></script>
		<script src="/static/artDialog/plugins/iframeTools.js"></script>

<script type="text/javascript">
	$.extend($.fn.validatebox.defaults.rules, {  
	    /*必须和某个字段相等*/
	    equalTo: {
	    	validator:function(value,param){
	    		return $(param[0]).val() == value;
	    	},
	    	message:'确认密码不一致'
	    }
	          
	});
	var cur_path ="<%=request.getContextPath()%>";
	var id = '<%=user.getUserCode()%>';
	$(function() {
		setTimeout("setData()", 500);
		$(".submit_btn")
				.bind(
						"click",
						function(e) {
							e.preventDefault();
							var form = $(this).parents("form");
							var ls_url = cur_path
									+ "/esbServer.do?method=execProc&methodId=login_update&in_r=su&in_id="
									+ id + "&date=" + new Date();
							form.form("submit", {
								url : ls_url,
								onSubmit : function() {
									return $(this).form("validate");
								},
								success : function(data) {
									data = decodeURIComponent(data);
									var re = $.parseJSON(data);
									console.info(re);
									if (re && re.returncode == 'ok'
											&& re.queryresult[0].msg) {
										alert(re.queryresult[0].msg);
									} else {
										alert("操作失败");
									}
								}
							});
						});
	});
	function setData() {
		var ls_url = cur_path
				+ "/esbServer.do?method=execProc&methodId=login_04&in_r=su&in_id="
				+ id + "&date=" + new Date();
		$.ajax({
			url : ls_url,
			type : "post",
			dataType : "text",
			success : function(data) {
				if (!data) {
					return false;
				}
				data = decodeURIComponent(data);
				var re = eval("[" + data + "]");
				if (re.length > 0 && re[0].returncode == "ok") {
					initdata = re[0].queryresult;
					$("#fm").form("load", initdata[0]);

				}
			}
		});
	}
</script>
<style>
.container-fluid{
	background:#fff;
	padding-top: 20px;
}
.container-fluid input {
	background: #fefef2;
	border: 1px solid #efefef;
	padding-left: 20px;
	width: 400px;
	float: left;
	height: 46px;
	font-size: 14px;
	border-radius: 8px;
}

.container-fluid p {
	float: left;
	width: 200px;
	text-align: right;
	margin-right: 20px;
	color: #999;
}

.container-fluid dd {
	line-height: 46px;
	margin-top: 10px;
	margin-left: 40px;
}
</style>
</head>
<body>
	<jsp:include page="../include/s_header.jsp" flush="true"></jsp:include>

	<div style="clear:both"></div>
	<!-- Nav tabs -->
	<div class="main">
		<div style="margin:10px 0;">
			<div style="width:100px;float:left;">修改密码</div>
			<div
				style="width:924px;height:2px;background:#fff;float:left;margin-top: 10px;"></div>
			<div style="clear:both"></div>
		</div>
		<div class="container-fluid">
			<dl>
            	<form id="fm" name="fm" method="post" action="">
              		<dd><p>账号&nbsp;：&nbsp;</p><input type="text" readonly="readonly" name="in_user_id" value="" class="text"><div style="clear:both"></div></dd>
               		<dd><p>邮箱&nbsp;：&nbsp;</p><input type="text" readonly="readonly" name="in_user_email" value="" class="text"><div style="clear:both"></div></dd>
                	<dd><p>新密码&nbsp;：&nbsp;</p><input id="in_user_pass" name="in_user_pass" type="password" value="" class="text easyui-validatebox" data-options="required:true,missingMessage:'请输入密码' "><div style="clear:both"></div></dd>
                 	<dd><p>再次输入密码&nbsp;：&nbsp;</p><input name="eq_user_pass" type="password" value="" class="text easyui-validatebox" 
                        	data-options="validType:'equalTo[\'#in_user_pass\']',required:true,missingMessage:'请输入确认密码' "><div style="clear:both"></div></dd>
                    <dd><input type="submit" class="submit_btn" value="确定" style="margin-left:339px;width:120px;height:30px;padding-left:0px;background-color: #e03919;color: #fff;font-size: 14px;outline:none;line-height:normal;"/><div style="clear:both;"></div>
                    	
                    </dd>
                </form>
        	</dl>
		</div>

	</div>
	<div style="clear:both"></div>
	<jsp:include page="../include/s_footer.jsp" flush="true"></jsp:include>
</body>
</html>
