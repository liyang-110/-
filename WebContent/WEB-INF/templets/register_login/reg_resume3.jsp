<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.Station"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>

<html lang="en">
<head>
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<title>完善简历三</title>
    <link rel="stylesheet" href="/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/complete_resume.css">
    <link href="/static/css/validatebox.css" rel="stylesheet" type="text/css"></link>
    <link href="/static/css/font-awesome.min.css" rel="stylesheet" media="screen">
	<link rel="stylesheet" href="/statics/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" type="text/css"></link>
	<script type="text/javascript">
	var cur_path ="<%=request.getContextPath()%>";
	</script>
</head>
<body >
	<div class="top_bar header">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-4 col-xs-8 logo">
					<a href="/"><img src="/static/image/211logo_wechat2.png" width="50%" alt="图片" class=" img-responsive center-block " style="float:left; margin-top:14px; "></a>
						<span style="float:left;">求职者注册</span>
						<div style="clear:both;"></div>
				</div>
				<jsp:include page="include_login/header.jsp" flush="true"></jsp:include>
			</div>
		</div>
	</div>

	<div class="content">
		<div class="contain">
			<div class="center">
				<div class="title">
					<p><span style="color:#02c084;">| </span>您正在创建个人简历  <span style="font-size:14px;color:#999;">告诉我们您的期望工作... ...</span><span style="font-size:16px;float:right;color:#999">/4</span><span style="font-size:30px;float: right;">3</span></p>
				</div>
				<div class="left">
					<div id="register_form">
						<form class="resume-three" name="addform" id="addform" action="/login.do" method="post" onsubmit="return false;">
							<input type="hidden" value="reg" name="method" />
						    <input type="hidden" value="student" name="users" />
         					
         					<span class="xinghao">*</span><label>工作性质：</label>
         						<input class="radio-form" type="radio" name="r_hope_type" value="全职" checked placeholder="输入性别" errorcontent="请输入性别！"/><span style="margin-right:10px">全职</span>
         						<input class="radio-form" type="radio" name="r_hope_type" value="兼职" placeholder="输入性别" errorcontent="请输入性别！"/><span style="margin-right:10px">兼职</span>
         						<input class="radio-form" type="radio" name="r_hope_type" value="实习生" placeholder="输入性别" errorcontent="请输入性别！"/><span>实习生</span>
         						<div style="clear:both;"></div>
         					<span class="xinghao">*</span><label>求职状态：</label>
         						<select class="text-form" name="r_work_status" id="r_work_status">
         							<option value="可立即上岗" selected="selected">可立即上岗</option>
									<option value="一周内上岗">一周内上岗</option>
									<option value="二周内上岗" >二周内上岗</option>
									<option value="一月内上岗" >一月内上岗</option>
									<option value="已入职" >已入职</option>
         						</select>
         						<div style="clear:both;"></div>
         					<span class="xinghao">*</span><label>期望地点：</label>
         						<input class="text-form easyui-validatebox" type="text" id="hope_areas"  name="hope_areas"  onclick="JumpSearchLayer(2,'addform','r_hope_area','hope_areas',3);" data-options="required:true,missingMessage:'请选择期望地点!'" readonly/>
								<input type="hidden" name="r_hope_area" id="r_hope_area"/>            
            					<div style="clear:both"></div>	
            				<span class="xinghao">*</span><label>期望职位：</label>
         						<input class="text-form easyui-validatebox" type="text" id="hope_positions" name="hope_positions" readonly onclick="JumpSearchLayer(1,'addform','r_hope_position','hope_positions',3);" data-options="required:true,missingMessage:'请选择期望职位!'"  />
 								<input type="hidden" name="r_hope_position" id="r_hope_position" />          
								<div style="clear:both"></div>
							<span class="xinghao">*</span><label>期望月薪：</label>
         						<select  class="text-form easyui-validatebox" name="r_hope_salary" id="r_hope_salary" data-options="required:true,missingMessage:'请选择期望薪资!'">
									<option value="">--请选择--</option>
									<option value="2000-3000">2000-3000</option>
									<option value="3000-5000">3000-5000</option>
									<option value="5000-8000">5000-8000</option>
									<option value="8000-10000">8000-10000</option>
									<option value="10000以上">10000以上</option>
				    			</select>
        						<div style="clear:both"></div>
       						
       						<input class="denglu_button" id="register_btn" type="submit" value="下一步">
       						<div style="clear:both;"></div>
       					</form>
					</div>
				</div>
				<div style="clear:both;"></div>
			</div>
			<jsp:include page="include_login/footer.jsp" flush="true"></jsp:include>
		</div>  
	</div> 
</body>
	<script src="/static/jquery/1.11.3/jquery.min.js"></script>
	<script src="/static/js/jquery.easyui.min.js" rel="stylesheet"></script>
    <script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script>    
    <script src="/statics/jquery/jquery.form.js" type="text/javascript" charset="utf-8"></script>   
    <script src="/statics/jquery/jquery.validate.min.js" type="text/javascript" charset="utf-8"></script> 
	<script src="/static/artDialog/artDialog.js?skin=aero" charset="utf-8"></script>
	<script src="/static/artDialog/plugins/iframeTools.js"></script>
	<script type="text/javascript" src="/assets/My97DatePicker/WdatePicker.js"  charset="utf-8"></script>
	<script src="/static/bootstrap/js/bootstrap.min.js"></script>
	<script src="/js/layer/getprovince211.js" type="text/javascript" charset="utf-8"></script>
	<script src="/js/layer/getposition.js" type="text/javascript" charset="utf-8"></script>
	<script src="/js/layer/jobjss.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript" src="/statics/js/reg_resume3.js" charset="utf-8"></script>
	<script type="text/javascript">
	$(function(){
		$(".denglu_button").click(function(){
			$('.resume-three').validate(options_stu);
		}); 
	});
</script>
</html>