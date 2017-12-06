<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="TreeTag" prefix="t" %>
<%@ page import="com.zhaopin.dao.factory.BaseCodeModel" %>
<%@ page import="com.zhaopin.dao.factory.StudentResumeModel"%>
<%@ page import="com.zhaopin.bean.*" %>
<%@page import="cn.zhaopin.student.service.StudentCenterService"%>
<%
	StudentSessionBean student=(StudentSessionBean)User.getUser("student",session);
	StudentResumeModel.Resume resume=null;
	String studentId="";
	int resumeScore=0;
	if(student !=null ){
		StudentResumeModel model = new StudentResumeModel( student );
		studentId = student.getStudentId();
		resume =model.getResumeInstance();
		StudentCenterService buss = StudentCenterService.create(request,response);
		resumeScore=buss.resumeScore();
	}else{
		resume = new StudentResumeModel.Resume();
	}
%>
<%BaseCodeModel basecodeM = new BaseCodeModel();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title></title>
<link href="<%=request.getContextPath()%>/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath()%>/assets/styles/global.css" rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath()%>/assets/jquery/jquery.min.js"></script>

<script type="text/javascript">
	var resume_score="<%=resumeScore%>";
	var cur_path = "<%=request.getContextPath()%>";
	var job_fair_id= "<%=request.getParameter("job_fair_id")%>";
	var school_id= "<%=request.getParameter("school_id")%>";
	var company_id="<%=request.getParameter("company_id")%>";
	var job_id="<%=request.getParameter("job_id")==null?"":request.getParameter("job_id")%>";
	</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"></script>
<script src="<%=request.getContextPath()%>/assets/artDialog/artDialog.js?skin=aero"></script>
<script src="<%=request.getContextPath()%>/assets/jquery/jquery.form.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/media/js/jquery.validate.min.js" type="text/javascript"></script> 
<script src="<%=request.getContextPath()%>/assets/artDialog/plugins/iframeTools.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-easyui/jquery.easyui.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/bootstrap/messager.css" type="text/css"/>
<script type="text/javascript">
	function fileup(){
    	window.open('<%=request.getContextPath()%>/base/file/jUploadFile.jsp?text_new_name=in_file_id&text_old_name=file_name','附件上传','status=no,menubar=no,toolbar=no,dependent=yes,width=600,height=500,left=230,top=130')
    }
    var studentId='<%=studentId%>';
    var resume='<%=resume.student_id%>';
    if(studentId==''){
    	//alert('登录学生帐号，才可以投简历！');
    	//window.parent.location.href='<%=request.getContextPath() %>/';
    }else if(resume==''){
    	//alert('请先上传简历！');
    	//window.parent.location.href='<%=request.getContextPath() %>/student/index.jsp?resume';
    }
</script>
<% if("".equals(studentId)){ %>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/scripts/front.js"></script>
<script type="text/javascript" src="login.js" charset="utf-8"></script>
<%} %>
<style type="text/css">
.f_login .control-group input[type=submit]{background:url(/static/img/hong.png);}
.f_login .control-group a.register{background:url(/static/img/lan.png);}
.panel.combo-p { height:120px;}
#person-order-form {
	width:300px;font-size:14px;padding:10px 0 10px 20px;height:340px; overflow:hidden;
	background-color:#F7F7F7;
}
#person-order-form .control-label {display: inline;}
#person-order-form .controls{width:260px;display: inline;}
#person-order-form .form-error {border-color: #b94a48;box-shadow: inset 0 1px 1px rgba(0,0,0,0.075);background-color:#EAFDBE;}
.control-group {margin:6px auto;}
</style>
</head>
<body style="background-color:#F7F7F7;padding:0">
<%if("".equals(studentId) ){ %>
		<style type="text/css">
		.f_login {width: 316px; height:auto;text-align: center;}
		</style>
    	<div class="f_login pull-left">
            <div id="loginTab2" style="height:30px;">
				<div class="alert" style="line-height:25px;width:220px;height:25px;padding:0;margin:5px auto;">
				  <button type="button" class="close" data-dismiss="alert">&times;</button>
					请登录学生帐号！
				</div>
            </div>
            <div class="tab-content">            
              <div class="tab-pane active form" id="login1">
              	<form class="company_login" novalidate="novalidate" action="<%=request.getContextPath()%>/login.do" method="post" onsubmit="return false;">
                  <input type="hidden" name="user_type" value="company" />
                  <div class="control-group">
                    <div class="controls">
                        <div class="input-icon right"> 
                        <input type="text" name="user_id" placeholder="账号" errorcontent="请输入用户名！"/><i class="icon-user"></i>
                        </div>
                    </div>
                  </div>
                  <div class="control-group">
                    <div class="controls">
                        <div class="input-icon right">
                        <input type="password" name="user_pass" placeholder="密码" errorcontent="请输入密码！"/><i class="icon-lock"></i>
                        </div>
                    </div>
                  </div>
                <div class="control-group">
                    <div class="controls">
						<label class="inline"><input class="checkbox" name="remember" type="checkbox" />保存密码
                        </label>
                        <a target="_blank" href="<%=request.getContextPath() %>/forget.do">忘记密码</a>
                    </div>
                  </div>
                  <div class="control-group">
                    <div class="controls">
                        <input id="btnComLogin" type="submit" value="登&nbsp;&nbsp;&nbsp;录" class="btn-primary" />
                    </div>
                  </div>
                  <div class="control-group">
                    <div class="controls">
                        <a target="_blank" href="<%=request.getContextPath()%>/register.jsp" class="btn btn-primary register">注&nbsp;&nbsp;&nbsp;册</a>
                    </div>
                  </div>
                  </form>
              </div><!-- form -->
       </div><!--  tabcontent -->
 		</div><!-- login -->
        <script type="text/javascript">
			jQuery(document).ready(function() {     
					Login.init();
			  });
		</script>
		<script src="<%=request.getContextPath()%>/assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script> 
<%}else{ %>
<%if(resumeScore<75){ %>
	<div style="margin-top:30px;">
	<img src="/static/img/gantanhao.png" width="70" height="70" style="margin-left:125px;">
	<p style="color:#e03919;font-size:20px;font-family:'微软雅黑';text-align:center;margin-top:30px;">您的简历完整度不足75%!</p>
	<p style="text-align:center;color:#999;">丰富的简历能跟好的吸引企业哦！</p>
	<div style="margin-top:40px;">
	<a style="display:block;width:70px;border-radius:4px;height:35px;background:#F57E0D;text-decoration: none;color: #fff; font-family: '微软雅黑';text-align: center;line-height: 35px;float:left;margin-left:50px;"
     href="/student/stuResume.do" target="_blank">完善简历</a>
	<a style="display:block;width:70px;border-radius:4px;height:35px;background:#F57E0D;text-decoration: none;color: #fff; font-family: '微软雅黑';text-align: center;line-height: 35px;float:right;margin-right:50px;"
     href="/" target="_blank">返回首页</a>
	</div>
</div>
<%}else{%>
<style>
.company_info p{
	font-size:14px;
}

</style>
<div id="person-order-form">
<div class="company_info">
<p>企业名称：<%=new String( request.getParameter("company_name").getBytes("ISO-8859-1"),"UTF-8")%></p>
<p>投递职位：<%=new String( request.getParameter("job_name").getBytes("ISO-8859-1"),"UTF-8")%></p>
<p>企业电话：<%=new String( request.getParameter("contact_tel").getBytes("ISO-8859-1"),"UTF-8")%></p>
</div>
<form id="fm" method="post"  name="fm" class="">
	<input type="hidden" name="in_student_id" id="in_student_id" value="<%=studentId %>" />
    	<div class=" control-group">
    		<label class="control-label">姓名：</label>
        		<div class="controls">
					<input id="in_name" name="in_name"  type="text" value="<%=resume.name %>"/>
        		</div>
		</div>
		<div class=" control-group">
    		<label class="control-label">学历：</label>
        		<div class="controls">
        			<select name="in_education" id="in_education">
        				<option value="">请选择</option>
			 			<%=basecodeM.selectOptions("job_fair_level",resume.education ) %>
					</select>
        		</div>
		</div>
	    <div class=" control-group">
    	<label class="control-label">学校：</label>
        <div class="controls">
			<input id="in_school_name" name="in_school_name"   type="text" value="<%=resume.school_name %>" />
        </div>
	</div>
		    
		<div class=" control-group"><!--  
    	<label class="control-label">简历：</label>
    	-->
        <div class="controls">
			<% if("".equals( resume.resume_path )) {%>        
			<input name="uploadusername" type="hidden"   id="uploadusername" value="loader"/>
					<input type="hidden" name="in_file_id" id="in_file_id"/>
					<input type="hidden" name="uploadmethod" id="uploadmethod" value="false"/>
					<!--  
					<input name="file_name" type="text" readonly id="file_name" style="width: 150px;"/>
					<input name="Submit43" type="button" class="btn btn-success" style="margin-bottom:10px;" value=" 上传 " onClick="fileup()" />
					<input name="uploadfileid" type="hidden"   id="uploadfileid" style="width: 200px;"/>
        			-->
        	<%}else{ %>
        			<!--
        			<input name="file_name" type="text" readonly id="file_name" value="<%=resume.resume_name %>"/>
        			-->
        			<input type="hidden" name="in_resume_id" id="in_resume_id" value="<%=resume.resume_id %>" />
        			<input type="hidden" name="in_resume_path" id="in_resume_path" value="<%=resume.resume_path %>" />
        	<% }%>
        </div>
	</div>
	<div class=" control-group">
    	<label class="control-label">专业：</label>
        <div class="controls">
			<input id="in_profession" name="in_profession" type="text" value="<%=resume.profession %>" />
		</div>
	</div>
	<div class=" control-group">
    	<label class="control-label">邮箱：</label>
        <div class="controls">
			<input id="in_email" name="in_email"   type="text" value="<%=resume.email %>" />
        </div>
   </div>
	<div class=" control-group">
    	<label class="control-label">手机：</label>
        <div class="controls">
			<input id="in_tel" name="in_tel"  type="text" value="<%=resume.tel %>" />
		</div>
    </div>
</form>
</div>
<script>
(function () {
		var parent = art.dialog.parent,				// 父页面window对象
			api = art.dialog.open.api,	// 			art.dialog.open扩展方法
			$ = function (id) {return document.getElementById(id)},
			form = $('login-form'),
			in_name = $('in_name'),
			in_school_name = $('in_school_name');
			in_education = $("in_education");
			professional_name =$('in_profession');
			in_email =$('in_email');
			in_tel =$('in_tel');
			file_name = $("file_name");
		if (!api) return;
		// parent.document.title = 'iframe中的javascirpt到此一游';
		// 操作对话框
		api.title('投递简历')
			// 自定义按钮
			.button(
				{
					name: '确定',
					callback: function () {
						if (check(in_name) && check(in_school_name) && check(in_education) // && check(file_name) 
								&& check(professional_name) && check(in_email) && check(in_tel) )
							{
								saveOrder(function(){art.dialog.close();});
							}
						return false;
					},
					focus: true
				},
				{
					name: '取消'
				}
			);
		// 表单验证
		var check = function (input) {
			if (input.value === '') {
				inputError(input);
				input.focus();
				return false;
			} else {
				return true;
			};
		};
		
		// 输入错误提示
		var inputError = function (input) {
			clearTimeout(inputError.timer);
			var num = 0;
			var fn = function () {
				inputError.timer = setTimeout(function () {
					input.className = input.className === '' ? 'form-error' : '';
					if (num === 5) {
						input.className === '';
					} else {
						fn(num ++);
					};
				}, 150);
			};
			fn();
		};
		var saveOrder =function(closePage) {
			var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=person_order_03&in_r=su&in_company_id="+company_id+"&in_school_id="+school_id+"&in_job_fair_id="+job_fair_id+"&in_job_id="+job_id+"&date=" + new Date();
		   //处理数据 调用公用js保存数据函数 code:数据添加成功
			saveData(ls_url, closePage, "简历投递成功！");
		}
		window.onload = function () {
				setTimeout(function () {	in_name.focus();	}, 240);};
})();
</script>
<%} %>
<%} %>
</body>
</html>
