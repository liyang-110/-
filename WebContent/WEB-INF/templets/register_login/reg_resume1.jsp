<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.Station"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>

<html lang="en">
<head>
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<title>完善简历一</title>
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
					<p><span style="color:#02c084;">| </span>您正在创建个人简历  <span style="font-size:14px;color:#999;">填写基本信息... ...</span><span style="font-size:16px;float:right;color:#999">/4</span><span style="font-size:30px;float: right;">1</span></p>
				</div>
				<div class="left">
					<div id="register_form">
						<form class="resume-one" name="addform" id="addform" method="post" onsubmit="return false;">
							<input type="hidden" value="reg" name="method" />
						    <input type="hidden" value="student" name="users" />
         				
         					<span class="xinghao">*</span><label>姓 名  ：</label>
         						<input class="text-form easyui-validatebox" type="text" id="r_name" name="r_name"  data-options="required:true,missingMessage:'请输入姓名!'" placeholder="输入姓名"/>
         						<div style="clear:both;"></div>
         					<span class="xinghao">*</span><label>性 别  ：</label>
         						<input class="radio-form easyui-validatebox" type="radio" id="r_sex" name="r_sex" value="男" checked/><span style="margin-right:10px">男</span>
         						<input class="radio-form easyui-validatebox" type="radio" id="r_sex" name="r_sex" value="女" /><span>女</span>
         						<div style="clear:both;"></div>
         					<span class="xinghao">*</span><label>出生年月：</label>
         						<select id="r_year" name="r_year" class="year-form easyui-validatebox" data-options="required:true,missingMessage:'请选择年份!'">
									<option value="">年</option>
         							<c:forEach begin="1970" end="2020" step="1" var="i">
									<option value="${i}"><c:out value="${i}"/></option>		
									 </c:forEach>
								</select>
								
         						<select id="r_month" name="r_month" class="month-form easyui-validatebox" data-options="required:true,missingMessage:'请选择月份!'">
         							<option value="">月</option>
         							<c:forEach begin="1" end="12" step="1" var="i">
									<option value="${i}"><c:out value="${i}"/></option>		
									 </c:forEach>
         						</select>
         						<div style="clear:both;"></div>
         					<span class="xinghao">*</span><label>现居地址：</label>
         						<select  class="text-form easyui-validatebox" name="r_area_id" id="r_area_id" data-options="required:true,missingMessage:'请选择现居地!'">
                                <option value="">--请选择--</option>
									<c:forEach var="p" items="${provionceList}">
										<option value="${p[0]}" >
										<c:out value="${p[1]}"  />
										</option>		
									</c:forEach>
								</select>
							<div style="clear:both"></div>
							<span class="xinghao">*</span><label>户籍地址：</label>
         						<input class="text-form easyui-validatebox" type="text" id="home_ids" name="home_ids" onclick="JumpSearchLayer(6,'addform','r_home_id','home_ids',1);" data-options="required:true,missingMessage:'请选择户籍地!'" />
								<input type="hidden" name="r_home_id" id="r_home_id" " />
             					<div style="clear:both"></div></dd>
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
    <!-- <script src="/statics/jquery/jquery.form.js" type="text/javascript" charset="utf-8"></script>    -->
    <script src="/statics/jquery/jquery.validate.min.js" type="text/javascript" charset="utf-8"></script> 
	<script src="/static/artDialog/artDialog.js?skin=aero" charset="utf-8"></script>
	<script src="/static/artDialog/plugins/iframeTools.js"></script>
	<script type="text/javascript" src="/assets/My97DatePicker/WdatePicker.js"  charset="utf-8"></script>
	<script src="/static/bootstrap/js/bootstrap.min.js"></script>
	<script src="/js/layer/getprovince211.js" type="text/javascript" charset="utf-8"></script>
	<script src="/js/layer/jobjss.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript" src="/statics/js/reg_resume1.js" charset="utf-8"></script>
	
	<script type="text/javascript">
	$(function(){
		$(".denglu_button").click(function(){
			$('.resume-one').validate(options_stu);
		}); 
	});
	</script>
</html>