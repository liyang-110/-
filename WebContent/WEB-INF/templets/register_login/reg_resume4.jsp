<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.Station"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>

<html lang="en">
<head>
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<title>完善简历四</title>
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
					<p><span style="color:#02c084;">| </span>您正在创建个人简历  <span style="font-size:14px;color:#999;">填写您的实习、工作经历... ...</span><span style="font-size:16px;float:right;color:#999">/4</span><span style="font-size:30px;float: right;">4</span></p>
				</div>
				<div class="left">
					<div id="register_form">
						<form class="resume-four" name="addform" id="addform" action="/login.do" method="post" onsubmit="return false;">
							<input type="hidden" value="reg" name="method" />
						    <input type="hidden" value="student" name="users" />
         					
         					<label style="margin-left:-42px;width:140px;font-size: 16px;font-weight: bold;">工作实习经验：</label>
         						<input class="radio-form" type="radio" name="radio" value="1" checked/><span style="margin-right:10px">有</span>
         						<input class="radio-form" type="radio" name="radio" value="0"/><span>没有</span>
         						<span style="font-size:12px;color:red;">（如果选择没有，工作经验可不填！）</span>
         						<div style="clear:both;"></div>
         					<span class="xinghao">*</span><label>公司名称：</label>
         						<input class="text-form easyui-validatebox work" type="text" id="r_company_name" name="r_company_name" placeholder="输入公司名称" data-options="required:true,missingMessage:'请输入公司名称!'"/>
         						<div style="clear:both"></div>
         					<span class="xinghao">*</span><label>职位名称：</label>
         						<input class="text-form easyui-validatebox work" type="text" id="r_jobname" name="r_jobname" placeholder="输入职位名称" data-options="required:true,missingMessage:'请输入职位名称!'"/>
         						<div style="clear:both"></div>
         					<span class="xinghao">*</span><label>工作时间：</label>
         						<input class="date-form easyui-validatebox work" type="text" id="r_begin_date" name="r_begin_date" data-options="required:true,missingMessage:'请选择开始时间!'" placeholder="输入开始时间" onClick="WdatePicker()" readonly/>
         						<input class="date-form easyui-validatebox work" type="text" id="r_end_date" name="r_end_date" data-options="required:true,missingMessage:'请选择结束时间!'" placeholder="输入结束时间" onClick="WdatePicker()" readonly/>
         						<div style="clear:both;"></div>
         					<span class="xinghao">*</span><label style="position:absolute;">工作内容：</label>
         						<textarea class="auto-height easyui-validatebox work" id="r_introduce"  name="r_introduce" data-options="required:true,missingMessage:'请填写工作经历!'" cols="74" rows="6" style="border-radius:5px; border:1px  solid #eee;margin-left:90px"></textarea>	
       							<div style="clear:both"></div>
       				
       						<input class="denglu_button" id="register_btn" type="submit" value="完成">
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
	<script src="/assets/My97DatePicker/WdatePicker.js"  type="text/javascript" charset="utf-8"></script>
	<script src="/static/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/statics/js/reg_resume4.js" charset="utf-8"></script>
	<script type="text/javascript">
$(function(){
	$("input[type='radio']").change(function(){
		this.value=(this.value==0)?1:0; 
		var x=$("input[type='radio']").val();
		if(x==0){
			$(".work").attr("disabled",false);
		}else{
			$(".work").attr("disabled","disabled");
		}
	});
	$(".denglu_button").click(function(){
		$('.resume-four').validate(options_stu);
	}); 
});
</script>
</html>