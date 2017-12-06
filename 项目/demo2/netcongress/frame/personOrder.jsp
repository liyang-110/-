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
		studentId = student.getStudentId();
		
		StudentResumeModel model = new StudentResumeModel( student );
		resume =model.getResumeInstance();
		StudentCenterService buss = StudentCenterService.create(request,response);
		resumeScore=buss.resumeScore();
	}else{
		resume = new StudentResumeModel.Resume();
	}
	String company_id= request.getParameter("company_id");
	String company_name =  cn.com.zhaopin.base.pub.cCharControl.ISOtoUTF8( request.getParameter("company_name") );
	
	String job_fair_id=request.getParameter("job_fair_id");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title></title>
<link href="<%=request.getContextPath()%>/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath()%>/assets/styles/global.css" rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath()%>/assets/jquery/jquery.min.js"></script>

<script type="text/javascript">
	var cur_path = "<%=request.getContextPath()%>";
	var job_fair_id= "<%=request.getParameter("job_fair_id")%>";
	var school_id= "<%=request.getParameter("school_id")%>";
	var company_id="<%=request.getParameter("company_id")%>";
	var job_id="<%=request.getParameter("job_id")==null?"":request.getParameter("job_id")%>";
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"></script>
<script src="<%=request.getContextPath()%>/assets/artDialog/artDialog.js?skin=green"></script>
<script src="<%=request.getContextPath()%>/assets/jquery/jquery.form.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/media/js/jquery.validate.min.js" type="text/javascript"></script> 
<script src="<%=request.getContextPath()%>/assets/artDialog/plugins/iframeTools.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-easyui/jquery.easyui.min.js"></script>

<script type="text/javascript" src="../js/flow.js" charset="utf-8"></script>

<script type="text/javascript">
    var studentId='<%=studentId%>';
    var resume='<%=resume.student_id%>';
    if(studentId==''){
    	//alert('登录学生帐号，才可以投简历！');
    	//window.parent.location.href='<%=request.getContextPath() %>/';
    }else if(resume==''){
    	alert('请先上传简历！');
    	window.parent.location.href='<%=request.getContextPath() %>/student/index.jsp?resume';
    }
</script>
<% if("".equals(studentId)){ %>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/scripts/front.js"></script>
<script type="text/javascript" src="login.js" charset="utf-8"></script>
<%} %>
<style>
.panel.combo-p { height:120px;}
#person-order-form {
	width:300px;font-size:14px;padding:10px 0 10px 20px;height:260px; overflow:hidden;
	background-color:#F7F7F7;
}
#person-order-form .control-label {display: inline;}
#person-order-form .controls{width:260px;display: inline;}
#person-order-form .form-error {border-color: #b94a48;box-shadow: inset 0 1px 1px rgba(0,0,0,0.075);background-color:#EAFDBE;}
.control-group {margin-bottom:0;}
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
	<p style="color:#e03919;font-size:20px;font-family:'微软雅黑';text-align:center;margin-top:30px;">您的简历完整度不足70%!</p>
	<p style="text-align:center;color:#999;">丰富的简历能跟好的吸引企业哦！</p>
	<div style="margin-top:40px;">
	<a style="display:block;width:70px;border-radius:4px;height:35px;background:#F57E0D;text-decoration: none;color: #fff; font-family: '微软雅黑';text-align: center;line-height: 35px;float:left;margin-left:50px;"
     href="/student/stuResume.do" target="_blank">完善简历</a>
	<a style="display:block;width:70px;border-radius:4px;height:35px;background:#F57E0D;text-decoration: none;color: #fff; font-family: '微软雅黑';text-align: center;line-height: 35px;float:right;margin-right:50px;"
     href="/" target="_blank">返回首页</a>
	</div>
</div>
<%}else{%>
<%
 List jobs= com.zhaopin.dao.factory.CompanyRecruitModel.getNewJobs( company_id,job_fair_id,10 );
 %>
<div id="person-order-form"> 
<form id="fm" method="post"  name="fm" class="">
  			<% if(jobs!=null && jobs.size()>0){ 
	               		%>
	               		<div style="font-size:14px;line-height:2em;overflow:scroll;height:280px;">
	               		<%
	                    for(Iterator jt=jobs.iterator();jt.hasNext();){
	                    	HashMap job=(HashMap)jt.next();
	                    %>
    <div class=" control-group">
    	<label class="control-label"></label>
        <div class="controls">
        <label style="display:inline-block;">
			<input type="radio" name="job_id" value="<%=job.get("job_id") %>"/>
			<a class="job" title="<%=job.get("job_name") %>" >
          							<%=job.get("job_name") %>
          						</a>&nbsp;&nbsp;
	                    	<span>[简历<%=job.get("resumecount") %>份]</span>
        	</label>
         <label style="display:inline-block;">&nbsp;&nbsp;&nbsp;<a href="/company/jobDetail.do?id=<%=job.get("job_id")%>" target="_blank" style="color:blue;">查看</a></label>
        </div>
	</div>
	                    	
	        <% 		} %>
	        			</div>
	        			<%
	                }else{%>
	                      <p> 好像没有发布职位哦！</p>
	        <%	}%>

</form>
</div>
<script>
(function () {
		var parent = art.dialog.parent,				// 父页面window对象
		api = art.dialog.open.api;	// 			art.dialog.open扩展方法

		if (!api) return;
		// parent.document.title = 'iframe中的javascirpt到此一游';
		// 操作对话框
		api.title('投递简历-<%=company_name%>')
			// 自定义按钮
			.button(
				{
					name: '确定',
					callback: function () {
						var job_id= $("input[name='job_id']:checked").val();
						if ( job_id )
						{
							saveOrder(function(){art.dialog.close();});
						}else{
							alert("请您选择一个应聘职位！");
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
			var job_id= $("input[name='job_id']:checked").val();
			var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=person_order_03&in_r=su&in_buss=send&in_company_id="+company_id+"&in_school_id="+school_id+"&in_job_fair_id="+job_fair_id+"&in_job_id="+job_id+"&date=" + new Date();
		   //处理数据 调用公用js保存数据函数 code:数据添加成功
			//saveData(ls_url, closePage, "简历投递成功！");
		    $('#fm').form('submit', {
		        url: ls_url ,
		        onSubmit: function() {
		        	if( $(this).form('validate') ){
		        		return true;
		        	}else{
		        		$("#btn_save") && $("#btn_save").linkbutton('enable');
		        		return false;
		        	}
		        },
		        success: function(data) {
		        	$("#btn_save") && $("#btn_save").linkbutton('enable');
		        	data = decodeURIComponent(data);
		            var re = eval("[" + data + "]");
		            if (re.length > 0 && re[0].returncode == 'ok') {
		            	var queryresult =re[0].queryresult;
		            	if( queryresult[0].ok=='ok' && queryresult[0].msg ){
		            	 	msg_alert("提示信息",queryresult[0].msg,"succeed",closePage );
		            	}else{
		            		msg_alert("提示信息",queryresult[0].msg,"face-sad");
		            	}
		            } else {
		                msg_alert("提示信息","未知错误，请稍后再试！","face-sad");
		            }
		        }
		    });
			
		};
})();
</script>
<%} %>
<%} %>
</body>
</html>
