<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.Station"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/static/inc/checkLogin.jsp" %>
<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="keywords" content="211校招网,网络视频招聘会，网络招聘会，宣讲会，校园招聘会，应届生招聘会，高校招聘会，毕业生招聘会。" />
<meta name="description" content=" 211校招网是一个为高校和企业开展校园招聘，提供校园招聘会，宣讲会，网络视频招聘会服务的网站。在全国30个省市设立了分站，服务用人单位和大学生。" />
<meta name="author" content="">
<title>账号管理</title>
 
	<link href="/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="/static/css/common-element.css" rel="stylesheet" type="text/css">
    <link href="/static/css/stu_center(commen).css" rel="stylesheet" type="text/css">
	<link href="/static/css/stu_center(02setting).css" rel="stylesheet" type="text/css">
    <link href="/static/css/font-awesome.min.css" rel="stylesheet" media="screen">
    <link href="/static/css/validatebox.css" rel="stylesheet" type="text/css"></link>
    
    <script src="/static/jquery/1.11.3/jquery.min.js"></script>
    <script src="/static/js/jquery.easyui.min.js" type="text/javascript"></script> 
    <script src="/static/jquery/jquery.cookie.js" type="text/javascript"></script>   
    <script src="/static/bootstrap/js/bootstrap.min.js"></script>
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
	$(function () { 
		setTimeout("setData()", 500);
		$(".submit_btn").bind("click",function(e){
			e.preventDefault();
			var form =$(this).parents("form");
			var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=login_update&in_r=su&in_id=" + id+"&date=" + new Date();
			form.form("submit",{
				url : ls_url,
				onSubmit:function(){
					return $(this).form("validate");
				},
				success :function(data){
					data = decodeURIComponent(data);
					var re = $.parseJSON( data );
					console.info(re);
					if( re && re.returncode=='ok'&& re.queryresult[0].msg ){
						alert( re.queryresult[0].msg );
					}else{
						alert("操作失败");
					}
				}
			});
		});
	});
	function setData() {	
		var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=login_04&in_r=su&in_id=" + id + "&date=" + new Date();
		$.ajax({
			url:ls_url, 
			type:"post", 
			dataType:"text", 
			success:function (data) {
			if (!data) {
				return false;
			}
			data = decodeURIComponent(data);
			var re = eval("[" + data + "]");
			if (re.length > 0 && re[0].returncode == "ok"  ) {
				initdata= re[0].queryresult;
				$("#fm").form("load", initdata[0]);
				
			}
		}});
	}
</script>
</head>

<body>
<!--头部架构开始-->
<jsp:include page="../include_stu/header.jsp" flush="true"></jsp:include>
<!--头部架构结束-->

<!--main区架构开始-->
<div class="main">
	<jsp:include page="../include_stu/main_latest_log.jsp" flush="true"></jsp:include>  
    
	<div class="main_l">
		<jsp:include page="../include_stu/menu.jsp" flush="true"></jsp:include>
	</div>    

	<div class="main_r">
    	<dl>
        	<dt>账号管理</dt>
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
        <dl>
        	<dt>第三方账号绑定&nbsp;:&nbsp;<img src="/static/images/qq_icon.png" width="22" height="22"><a href="http://www.211zph.com/auth/index.do" style="color:#e03919; font-size:14px">绑定QQ</a></dt>
        </dl>
	</div>
	<div style="clear:both"></div> 
</div>
<!--main区架构结束-->

<!--footer区架构开始-->
<jsp:include page="../include_stu/footer.jsp" flush="true"></jsp:include>
<!--footer区架构结束-->
</body>
</html>