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
<link rel="stylesheet" href="/statics/css/register_stu2.css" type="text/css"></link>

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

<script type="text/javascript" src="/statics/js/register_stu2.js" charset="utf-8"></script>
</head>
	<body>
	<jsp:include  page="/static/include/header.jsp" flush="true"/>
	<script type="text/javascript">
	   	$("#site_select_btn").hide();
	</script>
    <div class="container">
    <div style="width:1024px; margin:auto;height:40px;">
		<ul class="select_next">
		<li class="next1"><a  href="javascript:;" target="_stu">第一步：个人信息</a><div class="next1_div"></div></li>
		<li class="next2"><a  href="javascript:;" target="_com">第二步：创建简历</a><div class="next2_div active"></div></li>
		<li class="next3"><a  href="javascript:;" target="_sch">第三步：创建完成</a><div class="next3_div"></div></li>
		</ul>
    </div>             
    <div style="clear:both;"></div>
	<div id="ajax-form2" class="ajax-form2">
		<div class="form-horizontal" id="register_form1">
			<form class="register-form2" name="addform2" id="addform2" novalidate="novalidate" action="<%=request.getContextPath()%>/register_edit.do" method="post" onsubmit="return false;">
				<input type="hidden" value="reg_edit_two" name="method" />
				<input type="hidden" value="student" name="user_type" />

<!--求职意向  -->
    	<div style="margin: 4px 0px 42px -80px;">
    			<p style="font-size:16px;color:#333;">求职意向</p>
    			<div style="width:890px;border:2px solid #efefef;"></div>
    	</div>
    	<div class="control-group">
		<label class="control-label visible-ie8 visible-ie9 stu2_label"><span class="xinghao">*</span>工作性质：</label>
			<div class="controls">
				<div class="input-icon left">
					<label class="radio inline">
						<input class="radio" type="radio" checked="checked" id="hope_type" name="hope_type" value="全职" style="vertical-align:text-bottom;" />
                        	全职
                    </label>
                    <label class="radio inline" style="margin-left:50px;">
						<input class="radio" type="radio" id="hope_type" name="hope_type" value="兼职" style="vertical-align:text-bottom;" />
                        	兼职
                    </label>
                    <label class="radio inline" style="margin-left:50px;">
						<input class="radio" type="radio" id="hope_type" name="hope_type" value="实习" style="vertical-align:text-bottom;" />
                        	实习
                    </label>
				</div>
			</div>
		</div>
		<div class="control-group" id="industry_select">
			<label class="control-label stu2_label"><span class="xinghao">*</span>期望从事行业：</label>
			<div class="controls">
				<div class="input-icon left">
				<select class="drop_down" name="hope_industry" id="hope_industry">
	<%com.zhaopin.dao.factory.BaseCodeModel baseModel = new com.zhaopin.dao.factory.BaseCodeModel();%>
	<%=baseModel.selectOptions("industry")%>
     			</select>
				<span class="help-inline"></span>
				</div>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label visible-ie8 visible-ie9 stu2_label"><span class="xinghao">*</span>期望工作地点：</label>
      		<div class="controls">
        		<div class="input-icon left">
			 		<input class="stu1_input" style="cursor:default;" name="hope_areas" type="text" onclick="JumpSearchLayer(2,'addform2','hopeArea','hope_areas',3);" id="hope_areas" value="" size="30" readonly="readonly" class="input" />
					<input type="hidden" name="hopeArea" id="hopeArea" value="" />
					<span class="help-inline">（可选择3项）</span>
        		</div>
      		</div>
    	</div> 
    	<div class="control-group">
      		<label class="control-label visible-ie8 visible-ie9 stu2_label"><span class="xinghao">*</span>期望从事岗位：</label>
      		<div class="controls">
        		<div class="input-icon left">
		   			<input class="stu1_input" style="cursor:default;" name="hope_positions" type="text" onclick="JumpSearchLayer(1,'addform2','hopePosition','hope_positions',3);" id="hope_positions" value="" size="30" readonly="readonly" class="input" />
					<input type="hidden" name="hopePosition" id="hopePosition" value="" />
					<span class="help-inline">（可选择3项）</span>
        		</div>
      		</div>
    	</div>
    	<div class="control-group">
      		<label class="control-label visible-ie8 visible-ie9 stu2_label"><span class="xinghao">*</span>期望薪资：</label>
      		<div class="controls">
        		<div class="input-icon left">
          			<select class="drop_down" name="hopeSalary" id="hopeSalary">
								<option value="2000-3000">2000-3000</option>
								<option value="3000-5000" >3000-5000</option>
								<option value="5000-8000">5000-8000</option>
								<option value="8000-10000">8000-10000</option>
								<option value="10000以上">10000以上</option>
     				</select>
          			<span class="help-inline"></span>
        		</div>
      		</div>
    	</div>  	
    	<div class="control-group">
		<label class="control-label visible-ie8 visible-ie9 stu2_label"><span class="xinghao">*</span>到岗时间：</label>
                    <div class="controls">
                    <div class="input-icon left">
                    <select class="drop_down" name="work_status" id="work_status">
								<option value="可立即上岗">可立即上岗</option>
								<option value="一周内上岗" >一周内上岗</option>
								<option value="二周内上岗">二周内上岗</option>
								<option value="一月内上岗">一月内上岗</option>
								<option value="已入职">已入职</option>
     				</select>
     				</select>
                        <span class="help-inline"></span>
                        </div>
                    </div>
    	</div>				
<!--教育经历  -->
		<div style="margin: 40px 0px 42px -80px;">
    			<p style="font-size:16px;color:#333;">教育经历</p>
    			<div style="width:890px;border:2px solid #efefef;"></div>
    	</div>
		<div class="control-group">
		<label class="control-label visible-ie8 visible-ie9 stu2_label"><span class="xinghao">*</span>学历：</label>
                    <div class="controls">
                    <div class="input-icon left">
                    <select class="drop_down" name="education" id="education">
                    	<option value="level_06">技校</option>
                    	<option value="level_05">中专</option>
						<option value="level_07">大专</option>
						<option value="level_03">高职</option>
						<option value="level_02" selected="selected">本科</option>
						<option value="level_01">研究生（硕士、博士、博士后）</option>
     				</select>
     				</select>
                        <span class="help-inline"></span>
                        </div>
                    </div>
    	</div>
    	<div class="control-group">
		<label class="control-label visible-ie8 visible-ie9 stu2_label"><span class="xinghao">*</span>就读时间：</label>
			<div class="controls">
				<div class="input-icon left">
					<input  class="stu1_input select_date" style="cursor:default;"  name="edu_begin_date" id="edu_begin_date" type="text" onclick="WdatePicker()" readonly="readonly" class="input" />&nbsp;-
        			<input  class="stu1_input select_date" style="cursor:default;"  name="edu_end_date" id="edu_end_date" type="text" onclick="WdatePicker()" readonly="readonly" class="input" />
        		</div>
        	</div>
    	</div>
    	 <div class="control-group">
      <label class="control-label visible-ie8 visible-ie9 stu2_label"><span class="xinghao">*</span>毕业院校：</label>
      <div class="controls">
        <div class="input-icon left">
        	<input type="hidden" name="school_id" id="school_id" value="" />
			<input  class="stu1_input" style="cursor:default;" type="text" name="college" id="college" value="" onclick="pop()" onfocus="pop()" readonly="readonly"/>
			
			<div id="choose-box-wrapper">
			  <div id="choose-box">
				<div id="choose-box-title">
					<span>选择学校</span>
				</div>
				<div id="choose-a-province">
				</div>
				<div id="choose-a-school">
				</div>
				<div id="choose-box-bottom">
					<a class="input-school-name-btn" 
						 href="javascript:$('.input-school-name-btn').hide();$('.input-school-name').show();" 
						 style="text-decoration:underline;float:left;margin-top:10px;margin-left:20px;">
						找不到，点击这里输入
					</a>
					<input type="text"  placeholder="请输入学校名称" name="new_school_name" class="input-school-name" style="display:none;float:left;height:20px;padding:2px 3px;background:#FFF;color:#286A46;width:200px;line-height:20px;" />
					<input type="button" onclick="inputSchoolName()" class="input-school-name" style="display:none;float:left;" value="确定"/>
					<input type="botton" onclick="hide()" value="关闭" />
				</div>
			  </div>
			</div>
  <style type="text/css">
	#choose-box-wrapper{
		width: 652px;
		filter:alpha(opacity=50);
		/* background-color: rgba(42, 153, 59, 0.5); */
		padding:10px;
		border-radius:5px;
		display:none;
	}
	#choose-box{
		border: 1px solid #286A46;
		width:650px;
		background-color:white;
	}
	#choose-box-title{
		background:#286A46;
		color: white;
		padding: 4px 10px 5px;
		font-size: 14px;
		font-weight: 700;
		margin: 0;
	}
	#choose-box-title span{
		font-family: Tahoma, Verdana, STHeiTi, simsun, sans-serif;
	}

	#choose-a-province, #choose-a-school{
		margin:5px 8px 10px 8px;
		border: 1px solid #C3C3C3;
	}
	#choose-a-province a{
		display:inline-block;
		height: 18px;
		line-height: 18px;
		color:#307833;
		text-decoration: none;
		font-size: 9pt;
		font-family: Tahoma, Verdana, STHeiTi, simsun, sans-serif;
		margin:2px 5px;
		padding: 1px;
		text-align: center;
	}
	#choose-a-province a:hover{
		text-decoration:underline;
		cursor:pointer;
	}
	#choose-a-province .choosen{
		background-color: #307833;
		color:white;
	}
	
	#choose-a-school{
		overflow-x: hidden;
		overflow-y: auto;
		height: 200px;
	}
	#choose-a-school a{
		height: 18px;
		line-height: 18px;
		color:#307833;
		text-decoration: none;
		font-size: 9pt;
		font-family: Tahoma, Verdana, STHeiTi, simsun, sans-serif;
		float: left;
		width: 168px;
		margin: 4px 12px;
		padding-left:10px;
		overflow:hidden;
	}
	#choose-a-school a:hover{
		background-color:#307833;
		color:white;
		cursor:pointer;
		overflow:visible;
	}
	
	#choose-box-bottom{
		background: #F0F5F8;
		padding: 8px;
		text-align: right;
		border-top: 1px solid #CCC;
		height:40px;
	}
	#choose-box-bottom input{
		vertical-align: middle;
		text-align: center;
		background-color:#286A46;
		color:white;
		border-top: 1px solid #B8D4E8;
		border-left: 1px solid #B8D4E8;
		border-right: 1px solid #114680;
		border-bottom: 1px solid #114680;
		cursor: pointer;
		width: 60px;
		height: 25px;
		margin-top: 6px;
		margin-right: 6px;
	}
  </style>
        </div>  <!-- input  -->
      	</div> <!-- controls -->
    	</div>  
		<div class="control-group">
			<label class="control-label visible-ie8 visible-ie9 stu2_label"><span class="xinghao">*</span>专业名称：</label>
      		<div class="controls">
        		<div class="input-icon left">
				<input class="stu1_input" type="text" name="profession" id="profession" value="" />
        		</div>
      		</div>
    	</div>
		
<!--实习/工作经历  -->
    	<div style="margin: 40px 0px 42px -80px;">
    			<p style="font-size:15px;color:#e03919;"><span class="work_span">实习/实训/工作经历</span><input type="checkbox" name="add_work" value="0" class="add_work">暂无工作经历</input></p>
    			<div style="width:890px;border:2px solid #efefef;"></div>
    	</div>
    	
    	<div class="control-group">
		<label class="control-label visible-ie8 visible-ie9 stu2_label">公司名称：</label>
		<div class="controls">
        	<div class="input-icon left">
          		<input class="m-wrap placeholder-no-fix stu1_input work" type="text" name="company_name" id="company_name" placeholder="" name="user_name"/>
          		<span class="help-inline"></span>
        	</div>
		</div>
		</div>
		<div class="control-group" id="industry_select">
			<label class="control-label stu2_label">所属行业：</label>
			<div class="controls">
				<div class="input-icon left">
				<select class="drop_down work" name="industry" id="industry">
	<%=baseModel.selectOptions("industry")%>
     			</select>
				<span class="help-inline"></span>
				</div>
			</div>
		</div>
		<div class="control-group">
		<label class="control-label visible-ie8 visible-ie9 stu2_label">岗位名称：</label>
		<div class="controls">
        	<div class="input-icon left">
          		<input class="m-wrap placeholder-no-fix stu1_input work" type="text" name="position" id="position" placeholder="" name="user_name"/>
          		<span class="help-inline"></span>
        	</div>
		</div>
		</div>
		<div class="control-group">
		<label class="control-label visible-ie8 visible-ie9 stu2_label">工作时间：</label>
			<div class="controls">
				<div class="input-icon left">
					<input  class="stu1_input select_date work" style="cursor:default;"  name="work_begin_date" id="work_begin_date" type="text" onclick="WdatePicker()" readonly="readonly" class="input" />&nbsp;-
        			<input  class="stu1_input select_date work" style="cursor:default;"  name="work_end_date" id="work_end_date" type="text" onclick="WdatePicker()" readonly="readonly" class="input" />
        		</div>
        	</div>
    	</div>
    	<div class="control-group">
			<label class="control-label visible-ie8 visible-ie9 stu2_label">工作描述：</label>
			<div class="controls">
        		<div class="input-icon left">
					<textarea class="work" name="introduce" id="introduce" cols="50" rows="8" style="width: 286px;"></textarea>
          			<span class="help-inline"></span>
        		</div>
			</div>
		</div>

    	<div class="control-group">
		<div class="controls">
			<input class="stu1_btn" type="submit" id="reg_two_sumbit" value="保存"/>
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