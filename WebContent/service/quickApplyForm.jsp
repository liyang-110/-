<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="TreeTag" prefix="t" %>
<%@ page import="com.zhaopin.dao.factory.BaseCodeModel" %>
<%@ page import="com.zhaopin.dao.factory.StudentResumeModel"%>
<%@ page import="com.zhaopin.bean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title></title>
<link rel="stylesheet" href="/statics/bootstrap/2.3.2/css/bootstrap.min.css"/>
<link rel="stylesheet" href="/statics/bootstrap/2.3.2/css/bootstrap-theme.min.css"/>

<script src="/statics/jquery/1.11.3/jquery.min.js"></script>
<script src="/statics/bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script> 
<script src="/statics/jquery/jquery.form.js" type="text/javascript" charset="utf-8"></script>
<script src="/statics/jquery/jquery.validate.min.js" type="text/javascript" charset="utf-8"></script> 
<script src="/statics/artDialog/artDialog.js?skin=green" charset="utf-8"></script>
<script src="/statics/artDialog/plugins/iframeTools.js"></script>


<link rel="stylesheet" href="/statics/css/main4.css" />
<script type="text/javascript">
	var cur_path = "<%=request.getContextPath()%>";
	var job_fair_id = "<%=request.getParameter("id")%>";
</script>
<script type="text/javascript">
	function fileup(){
    	window.open('<%=request.getContextPath()%>/base/file/jUploadFile.jsp?text_new_name=in_file_id&text_old_name=file_name','附件上传','status=no,menubar=no,toolbar=no,dependent=yes,width=600,height=500,left=230,top=130');
    }
</script>
<script type="text/javascript" src="/js/select_data_js_array.js" charset="utf-8"></script>
<script type="text/javascript" src="/assets/scripts/front.js"></script>
<script type="text/javascript" src="/static/service/quickApplyForm.js" charset="utf-8"></script>
<script type="text/javascript">
	$(function(){
		linkSelectCode('area_id','in_area_id',true,{id:'',text:'--请选择--'});
		linkSelectCode('company_nature','in_company_nature',true,{id:'',text:'--请选择--'});
		linkSelectCode('industry','in_big',false,false,undefined,function( d ){
			$("#in_big").bind("change",function(){
				linkSelectCode( $(this).val() ,'in_small',true,{id:'',text:'--请选择--'},d,function(){
					$("#in_small").trigger("change");
				});
			});
			//$("#in_big").trigger("change");
		});
		$("#in_small").bind("change",function(){
			if( $(this).val()!='' ){
				$("#in_industry").val( $(this).val() );
			}else{
				$("#in_industry").val( $("#in_big").val() );
			}
		});
	});
</script>
<style type="text/css">
.f_login {background-color:#FFF; width: 590px;overflow:hidden; height:auto;margin:auto;text-align: center;}
.login4 #login4 .input-prepend {margin:auto;width:auto;}
.login4 #login4 .input-prepend input {
  width:220px;
  }
.f_login .controls {margin-left:auto;margin-right:auto;}
a.aui_close_btn {
	font-size:26px;font-weight:bolder;color:#C7CBC3;
}
a.aui_close_btn:hover {text-decoration:none;color:#EF4B4B;}
body {
	font-family: 'Microsoft YaHei', 微软雅黑, SimSun, 宋体;
}
.f_login .control-group {
	width: auto;
}
.login4 #login4 {
  width: auto;
  height: auto;
  background-color:transparent;
  border-radius: none;
  padding:0;
  box-shadow:none;
}
.form-horizontal .control-group {
    margin-bottom: 6px;
    width:295px;
    float:left;
}
.form-horizontal .control-label {
    float: left;
    width: 65px;
    padding-top: 5px;
    text-align: right;
}
.form-horizontal .control-label i.star{
    color:red;
    line-height:20px;
}
.form-horizontal .controls select{
	height:30px;
    width:220px;
}
.controls.industry select {
	float:left;
	margin-left:5px;
}
span.validatebox-tip-content {display:none!important;}
.form-horizontal  label.hidden {display:none;}
</style>
</head>
<body style="padding:0;margin:0;">
		<div style="background-color:#67A849;padding:5px 10px 5px 10px;">
		<span style="color:#fff;font-size:16px;font-weight:bold;">快速预定招聘会</span>
		<a href="javascript:;"  class="pull-right aui_close_btn" style="">&times;</a>
			<div style="clear:both;"></div>
		</div>
		<div style="height:10px;"></div>
    	<div class="f_login login4">
            <div class="tab-content">            
              <div class="tab-pane active form" id="login4">
				<form id="quickApplyForm" class="form-horizontal" novalidate="novalidate" action="/esbServer.do?method=execProc&methodId=job_fair_apply&in_URLEncoding=UTF-8" method="post" onsubmit="return false;">
                  <input type="hidden" name="in_action" value="add" />
                  
                  <input type="hidden" name="in_job_fair_id" value="<%=request.getParameter("id")%>" />
                  <div class="control-group">
                   	<label class="control-label"><i class="star">*</i>公司名称:</label>
                       <div class="controls">
                       		<input type="text" name="in_company_name" placeholder="" 
                       		/>
                       </div>
                  </div>

                  <div class="control-group">
                   	<label class="control-label"><i class="star">*</i>公司性质</label>
                       <div class="controls">
                       		<select id="in_company_nature" name="in_company_nature">
									<option value="-1">--性质--</option>
									
							</select>
                       </div>
                  </div>
                  <div class="control-group" style="width:580px;">
                   	<label class="control-label"><i class="star">*</i>所属行业:</label>
                       <div class="controls industry">
                       
                       		<select id="in_big" name="in_big" >
								<option value="">--行业--</option>
							</select>
							<select id="in_small" name="in_small" >
								<option value="">--行业--</option>
							</select>
							<input type="hidden" name="in_industry" id="in_industry" />

                       </div>
                  </div>
                  <div class="control-group">
                   	<label class="control-label"><i class="star">*</i>所在地区</label>
                       <div class="controls">
                       		<select id="in_area_id" name="in_area_id" >
								<option value="">--地区--</option>
							</select>
                       </div>
                  </div>
                 <div class="control-group">
                   	<label class="control-label"><i class="star">*</i>电子邮箱</label>
                       <div class="controls">
                       		<input type="text" name="in_email" placeholder="" 
                       		/>
                       </div>
                  </div>
                  <div class="control-group">
                   	<label class="control-label"><i class="star">*</i>联系人</label>
                       <div class="controls">
                       		<input type="text" name="in_contact_person" placeholder="" 
                       		/>
                       </div>
                  </div>
                  <div class="control-group">
                   	<label class="control-label"><i class="star">*</i>手机</label>
                       <div class="controls">
                       		<input type="text" name="in_contact_tel" placeholder="" 
                       		/>
                       </div>
                  </div>
 
                  <div style="clear:both;"></div>
                  <div class="control-group" style="width:580px;">
                   	<label class="control-label"><i class="star">*</i>单位简介</label>
                       <div class="controls">
                        <textarea style="width:500px;" cols="60" rows="3" name="in_introduce" 
                        ></textarea>
                       </div>
                  </div>
                    <div style="clear:both;"></div>
                  <div class="control-group" style="width:580px;">
                   	<label class="control-label"><i class="star">*</i>招聘计划</label>
                       <div class="controls">
						<textarea style="width:500px;" cols="60" rows="3" name="in_recruit"
						></textarea>
                       </div>
                  </div>
                  
                  <div class="control-group" style="width:580px;">
                    <div class="controls">
                        <input class="btn  btn-medium btn-success" type="submit" value="确定"  />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input class="aui_close_btn btn btn-medium" type="button" value="取消"  />
                    </div>
                  </div>
                  </form>
              </div><!-- form -->
       </div><!--  tabcontent -->

 </div><!-- login -->

<script type="text/javascript">
  $(function(){
		var parent = art.dialog.parent				// 父页面window对象
		api = art.dialog.open.api ;// 			art.dialog.open扩展方法
		
		$(".aui_main",parent.document ).css({"padding-top":0});  
		//$(".aui_inner",parent.document ).css({"border":"none"});  
		
		$(".aui_close_btn").click(function(){
			api.close();
		});
		Login.init(function(){
			// parent.location.reload();
			api.close();
		});
  });
</script>
<script src="<%=request.getContextPath()%>/assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script> 
</body>
</html>
