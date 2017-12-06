<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<title>找回密码</title>
<link rel="stylesheet" href="/statics/bootstrap/2.3.2/css/bootstrap.min.css"/>
<link rel="stylesheet" href="/statics/bootstrap/2.3.2/css/bootstrap-theme.min.css"/>
<link rel="stylesheet" href="/statics/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" type="text/css"></link>

<script src="/static/jquery/1.11.3/jquery.min.js"></script>
<script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script>    
<script src="/statics/jquery/jquery.form.js" type="text/javascript" charset="utf-8"></script>   
<script src="/statics/jquery/jquery.validate.min.js" type="text/javascript" charset="utf-8"></script> 

<link href="/static/css/common-element.css" rel="stylesheet" type="text/css">
<script src="/static/artDialog/artDialog.js?skin=aero" charset="utf-8"></script>
<script src="/static/artDialog/plugins/iframeTools.js"></script>

<script type="text/javascript" src="/static/js/forget.js" charset="utf-8"></script>

<style type="text/css">
#register-form {border:none; margin-top:28px; margin-bottom:36px; background:#FFFFFF; padding-bottom:30px;}
#register-form ul.tabs { height:50px; margin-bottom:36px;display:none;}
#register-form ul.tabs li{ height:50px; width:500px;line-height:44px; font-size:22px; float:left; text-align:center;}
#register-form ul.tabs li a{ background:#EDEDED; display:block; width:100%; height:44px; text-decoration:none; color:#929292;}
#register-form ul.tabs li.active{ background:url(img/reg_tab_bg.png);}
#register-form ul.tabs li.active a{ background:none;color:#FFFFFF;}

#register-form .form-horizontal{ margin-left:180px;}
#register-form .input-verify input { width:106px;}
#register-form .input-verify img{ width:102px; height:30px;}
#register-form  input[type=submit]{ background-image: linear-gradient(to bottom,#e03919,#e03919); color:#FFFFFD; height:35px; padding:0 25px 0 25px;border:none;border-radius:5px;}
#register-form  input[type=submit]:hover{ background-image: linear-gradient(to bottom,#d20000,#d20000); color:#FFFFFD; height:35px; padding:0 25px 0 25px;border:none;border-radius:5px;}

#register_success dt{ color:#FE8F00; margin-left:10px; margin-bottom:18px;}
#register_success dd strong{ color:#FE8F00;}
#register_success a.btn-warning{ background-image: linear-gradient(to bottom,#FFBF63,#FEA235); color:#FFFFFD; height:35px; padding:0 25px 0 25px; font-size:14px; line-height:37px; vertical-align:middle; display: inline-block; margin:15px auto 10px auto;}
</style> 

    </head>
	<body>
	<jsp:include  page="inc_header.jsp" flush="true"/>

    <div class="container" id="register-form">
            <ul class="tabs" id="reg_tab">
			  <%
			    if( "success".equals( (String)request.getAttribute("result") ) ) { 
			  %>
              <li class=""><a href="#register_form">1、填写账户信息</a></li>
              <li class="active"><a href="#register_success">2、密码找回成功</a></li>
              <%
              }else{
               %>
              <li class="active"><a href="#register_form">1、填写账户信息</a></li>
              <li class=""><a href="#register_success">2、密码找回成功</a></li>
               <%
               }
               %>
            </ul>
			<%
			    if( "success".equals( (String)request.getAttribute("result") ) ) { 
			%>
               <div class="form-horizontal" id="register_success">
               		<div class="control-group">
                    	<label class="control-label"><img src="assets/styles/img/reg_success.png"/></label>
                        <div class="controls">
							<dl><dt>密码找回成功！</dt>
                            <dd>请使用新密码登录！</dd>
                            </dl>
                            <a href="/member/accountLogin.do" class="btn btn-warning">点击这里登录</a>
                        </div>
                    </div>
               </div>
			<%
			    }else{
			%>
              <div class="form-horizontal" id="register_form">
              <form class="register-form" novalidate="novalidate" method="post" action="">
                <input type="hidden" name="action" value="forget"/>
  				<%if("mobile".equals(request.getParameter("type")) ){ %>
  				<input type="hidden" name="type" value="mobile"/>
			    <div class="control-group ${empty error_msg.user_id?'':'error'} }">
			      <label class="control-label visible-ie8 visible-ie9">用户名：</label>
			      <div class="controls">
			        <div class="input-icon left">
			          <input value="${form.user_id[0] }" class="m-wrap placeholder-no-fix" type="text" id="user_id" placeholder="请输入用户名" name="user_id"/>
			        </div>
			        <c:if test="${error_msg.user_id  != null }">
			        <label for="user_id" class="help-inline help-small no-left-padding">
			        	${error_msg.user_id }
			        </label>
			        </c:if>
			      </div>
			    </div>
                <div class="control-group ${empty error_msg.contact_tel?'':'error'}">
                 <label class="control-label">手机号：</label>
                    <div class="controls">
                    	<div class="input-icon left">
                        	<input value="${form.contact_tel[0] }" type="text" name="contact_tel" id="contact_tel" placeholder="请输入手机号"/>
                        </div>
                        <c:if test="${error_msg.contact_tel  != null }">
				        <label for="contact_tel" class="help-inline help-small no-left-padding">
				        	${error_msg.contact_tel }
				        </label>
				        </c:if>
                    </div>
                  </div>
  				<% }else if("email".equals(request.getParameter("type")) ){ %>
  				<input type="hidden" name="type" value="email"/>
			    <div class="control-group ${empty error_msg.user_id?'':'error'}">
			      <label class="control-label visible-ie8 visible-ie9">用户名：</label>
			      <div class="controls">
			        <div class="input-icon left">
			          <input value="${form.user_id[0] }" class="m-wrap placeholder-no-fix" type="text" id="user_id" placeholder="请输入用户名" name="user_id"/>
			        </div>
			        <c:if test="${error_msg.user_id  != null }">
			        <label for="user_id" class="help-inline help-small no-left-padding">
			        	${error_msg.user_id }
			        </label>
			        </c:if>
			      </div>
			    </div> 
                  <div class="control-group ${empty error_msg.user_email?'':'error'}">
                 <label class="control-label">电子邮件：</label>
                    <div class="controls">
                    	<div class="input-icon left">
                        	<input value="${form.user_email[0] }" type="text" name="user_email" id="user_email" placeholder="请输入电子邮箱"/>
                        
                        </div>
                        <c:if test="${ not empty error_msg.user_email}">
				        <label for="user_email" class="help-inline help-small no-left-padding">
				        	${error_msg.user_email }
				        </label>
				        </c:if>
                    </div>
                  </div>
  				<% }else{ %>
                <div class="control-group ${empty error_msg.user_tel?'':'error'}">
                 <label class="control-label">登录手机号：</label>
                    <div class="controls">
                    	<div class="input-icon left">
                        	<input  tabindex="1" value="${form.user_tel[0] }" type="text" name="user_tel" id="user_tel" placeholder="请输入手机号"/>
                        </div>
                        <c:if test="${error_msg.user_tel  != null }">
				        <label for="user_tel" class="help-inline help-small no-left-padding">
				        	${error_msg.user_tel }
				        </label>
				        </c:if>
                    </div>
                  </div>
               <div class="control-group ${empty error_msg.verify_code?'':'error'}">
                 <label class="control-label">验证码：</label>
                    <div class="controls">
	                    <div class="input-icon left">
	                        <input  tabindex="2" value="${form.verify_code[0] }" type="text" name="verify_code" id="verify_code" placeholder="请输入验证码"/>
	                        <button id="verify_btn" class="btn" type="button" onclick="sendVerifyCode();">获取验证码<span></span></button>
	                    </div>
	                    <c:if test="${error_msg.verify_code != null  }">
				        <label for="verify_code" class="help-inline help-small no-left-padding">
				        	${error_msg.verify_code }
				        </label>
				        </c:if>
                    </div>
               </div>
               <div class="control-group ${empty error_msg.user_pass?'':'error'}">
                 <label class="control-label">输入密码：</label>
                    <div class="controls">
                    	<div class="input-icon left">
                        	<input  tabindex="3" value="${form.user_pass[0] }" type="password" name="user_pass" id="user_pass" placeholder="请输入新密码"/>
                        </div>
                        <c:if test="${error_msg.user_pass  != null }">
				        <label for="user_pass" class="help-inline help-small no-left-padding">
				        	${error_msg.user_pass }
				        </label>
				        </c:if>
                    </div>
                  </div>
	              <div class="control-group ${empty error_msg.ruser_pass?'':'error'}">
	                 <label class="control-label">确认密码：</label>
	                    <div class="controls">
	                    	<div class="input-icon left">
	                        	<input  tabindex="4" value="${form.ruser_pass[0] }" type="password" name="ruser_pass" id="ruser_pass" placeholder="请确认新密码"/>
	                        </div>
	                        <c:if test="${error_msg.ruser_pass  != null }">
					        <label for="ruser_pass" class="help-inline help-small no-left-padding">
					        	${error_msg.ruser_pass }
					        </label>
					        </c:if>
	                    </div>
	              </div>
                 <% } %> 
                  <div class="control-group">
                    <div class="controls">
                        <input type="submit" value="确定"/>
                    </div>
                  </div>
                  
                  <div class="control-group ${param.type eq 'email'?'hide':'' }">
                    <div class="controls">
						<a href="?type=email">使用账号和邮箱找回密码</a>
                    </div>
                  </div>
                  <div class="control-group ${param.type eq 'mobile'?'hide':'' }">
                    <div class="controls">
						<a href="?type=mobile">使用账号和手机找回密码</a>
                    </div>
                  </div>
                  <div class="control-group ${empty param.type?'hide':'' }">
                    <div class="controls">
						<a href="?type=">使用登录手机号找回密码</a>
                    </div>
                  </div>
               </form>
              </div>
          <%
            }
          %>
     </div>
<jsp:include page="../include/footer.jsp" flush="true" />

<script src="/statics/bootstrap/2.3.2/js/bootstrap.min.js" type="text/javascript"></script> 
<script>
		jQuery(document).ready(function() {     
		  Forget.init();
		});
</script> 
	</body>
</html>

