<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.factory.BaseCodeModel" %>
<% com.zhaopin.zk.ZkTools.newRegister(request); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta name="Keywords" content="<%=com.zhaopin.Config.getSiteKeywords() %>" />
<meta name="Description" content="<%=com.zhaopin.Config.getSiteDescription() %>" />
<title>用户注册-- <%=com.zhaopin.Config.getSiteTitle() %></title>

<link rel="stylesheet" href="/statics/bootstrap/2.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/statics/bootstrap/2.3.2/css/bootstrap-theme.min.css">
<link href="<%=request.getContextPath()%>/statics/css/main.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="/statics/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" type="text/css"></link>
<link href="/static/css/common-element.css" rel="stylesheet" type="text/css">
<link href="js/layer/skins/default.css" rel="stylesheet" />
<link rel="stylesheet" href="/statics/css/register_stu1.css" type="text/css"></link>

<script type="text/javascript">
	var cur_path ="<%=request.getContextPath()%>";
</script>
<script src="assets/jquery/jquery.min.js"></script>
<script src="media/js/jquery.validate.min.js" type="text/javascript"></script> 
<script type="text/javascript" src="assets/jquery/jquery.form.js"></script>
<script src="js/layer/artDialog.min.js" type="text/javascript"></script>
<script src="/static/artDialog/artDialog.js?skin=aero" charset="utf-8"></script>
<script type="text/javascript" src="js/layer/getprovince211.js" charset="utf-8"></script>
<script type="text/javascript" src="js/layer/getposition.js" charset="utf-8"></script>
<script type="text/javascript" src="js/layer/jobjss.js" charset="utf-8"></script>
<script type="text/javascript" src="assets/My97DatePicker/WdatePicker.js"  charset="utf-8"></script>
<script type="text/javascript" src="js/school_data_js_array.js" charset="utf-8"></script>

<link rel="shortcut icon" href="media/image/favicon.ico" />  

<script type="text/javascript" src="/statics/js/register_stu1.js" charset="utf-8"></script>
</head>
	<body>
	<jsp:include  page="/static/include/header.jsp" flush="true"/>
	<script type="text/javascript">
	   	$("#site_select_btn").hide();
	</script>
    <div class="container">
    <div style="width:1024px; margin:auto;height:40px;">
		<ul class="select_next">
		<li class="next1"><a  href="javascript:;" target="_stu">第一步：个人信息</a><div class="next1_div active"></div></li>
		<li class="next2"><a  href="javascript:;" target="_com">第二步：创建简历</a><div class="next2_div"></div></li>
		<li class="next3"><a  href="javascript:;" target="_sch">第三步：创建完成</a><div class="next3_div"></div></li>
		</ul>
    </div>             
    <div style="clear:both;"></div>
	<div id="ajax-form1" class="ajax-form1">
		<div class="form-horizontal" id="register_form1">
			<form class="register-form1" name="addform1" id="addform1" novalidate="novalidate" action="<%=request.getContextPath()%>/register_edit.do" method="post" onsubmit="return false;">
				<input type="hidden" value="reg_edit_one" name="method" />
				<input type="hidden" value="student" name="user_type" />
				
	<div class="control-group">
		<label class="control-label visible-ie8 visible-ie9 stu1_label"><span class="xinghao">*</span>姓名：</label>
		<div class="controls">
        	<div class="input-icon left">
          		<input class="m-wrap placeholder-no-fix stu1_input" type="text" id="user_name" placeholder="" name="user_name"/>
          		<span class="help-inline"></span>
        	</div>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label visible-ie8 visible-ie9 stu1_label">性别：</label>
			<div class="controls">
				<div class="input-icon left">
					<label class="radio inline" style="margin-left:50px;">
						<input class="radio" type="radio" checked="checked" id="sex" name="sex" value="男" style="vertical-align:text-bottom;" />
                        	男
                    </label>
                    <label class="radio inline" style="margin-left:50px;">
						<input class="radio" type="radio" id="sex" name="sex" value="女" style="vertical-align:text-bottom;" />
                        	女
                    </label>
				</div>
			</div>
	</div>
    <div class="control-group">
		<label class="control-label visible-ie8 visible-ie9 stu1_label"><span class="xinghao">*</span>出生年月：</label>
			<div class="controls">
				<div class="input-icon left">
					<input  class="stu1_input" style="cursor:default;"  name="birthday" type="text" onclick="WdatePicker()" readonly="readonly" class="input" />
        		</div>
        	</div>
    </div>   
 	<div class="control-group">
		<label class="control-label visible-ie8 visible-ie9 stu1_label"><span class="xinghao">*</span>户籍地：</label>
			<div class="controls">
				<div class="input-icon left">
					<input  class="stu1_input" style="cursor:default;"  name="home_areas" id="home_areas" type="text" onclick="JumpSearchLayer(6,'addform1','home_area','home_areas',1);" readonly="readonly" class="input" />        			
        			<input type="hidden" name="home_area" id="home_area"/>
        		</div>
        	</div>
    </div> 
    <div class="control-group">
		<label class="control-label stu1_label">现居地：</label>
                    <div class="controls">
                    <div class="input-icon left">
                    <select class="drop_down" name="area_id" id="area_id">
	<% com.zhaopin.dao.factory.AreaModel areaModel = new com.zhaopin.dao.factory.AreaModel();%>
	<%=areaModel.getProvionceOptions("28")%>
     				</select>
                        <span class="help-inline"></span>
                        </div>
                    </div>
	</div>
	<div class="control-group">
		<div class="controls step">
			<input class="stu1_btn" type="submit" id="reg_one_submit" value="保存"/>
			<!-- <input class="stu1_btn" type="button" id="container_next" value="下一步"/> -->
		</div>
	</div>	
			</form>
		</div>
	</div><!-- ajaxForm -->
</div>
     
<jsp:include page="/static/include/footer.jsp" flush="true" />

	<script type="text/javascript" src="statics/bootstrap/2.3.2/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="statics/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript" src="statics/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
	</body>
</html>