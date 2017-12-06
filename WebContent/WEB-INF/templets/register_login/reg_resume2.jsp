<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.Station"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>

<html lang="en">
<head>
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<title>完善简历二</title>
    <link rel="stylesheet" href="/static/bootstrap/css/bootstrap.min.css">
    <link href="/static/css/validatebox.css" rel="stylesheet" type="text/css"></link>
    <link rel="stylesheet" href="/static/css/complete_resume.css">
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
					<p><span style="color:#02c084;">| </span>您正在创建个人简历  <span style="font-size:14px;color:#999;">填写您的最高学历... ...</span><span style="font-size:16px;float:right;color:#999">/4</span><span style="font-size:30px;float: right;">2</span></p>
				</div>
				<div class="left">
					<div id="register_form">
						<form class="resume-two" name="addform" id="addform" method="post" onsubmit="return false;">
							<input type="hidden" value="reg" name="method" />
						    <input type="hidden" value="student" name="users" />
         					
         					<span class="xinghao">*</span><label>就读时间：</label>
         						<input class="date-form easyui-validatebox" type="text" id="r_begin_date" name="r_begin_date" data-options="required:true,missingMessage:'请选择开始时间!'" onClick="WdatePicker()" readonly/>
         						<input class="date-form easyui-validatebox" type="text" id="r_end_date" name="r_end_date" data-options="required:true,missingMessage:'请选择结束时间!'" onClick="WdatePicker()" readonly/>
         						<div style="clear:both;"></div>
         					<span class="xinghao">*</span><label>学校名称：</label>
         						<input class="text-form easyui-validatebox" type="text" id="r_school_name" name="r_school_name" data-options="required:true,missingMessage:'请输入学校名称!'" />
         						<div style="clear:both;"></div>
         					<span class="xinghao">*</span><label> 学 历 ：</label>
         						<select class="text-form easyui-validatebox" name="r_education" id="r_education" data-options="required:true,missingMessage:'请选择学历!'">
									<option value="">--请选择--</option>
									<option value="level_07">大专</option>		
									<option value="level_03">高职</option>		
									<option value="level_02" selected="selected">本科</option>		
									<option value="level_01">研究生</option>		
     							</select>
     							<div style="clear:both;"></div>
     						<span class="xinghao">*</span><label>专业名称：</label>
         						<input class="text-form easyui-validatebox" type="text" id="r_profession" name="r_profession" data-options="required:true,missingMessage:'请输入专业名称!'"/>
       							<div style="clear:both;"></div>
       						
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
	<script type="text/javascript" src="/statics/js/reg_resume2.js" charset="utf-8"></script>
	
	<script type="text/javascript">
	$(function(){
		$(".denglu_button").click(function(){
			$('.resume-two').validate(options_stu);
		}); 
	});
	</script>
</html>