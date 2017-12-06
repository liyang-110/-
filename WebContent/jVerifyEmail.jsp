<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
HashMap errorsMsg = (HashMap)request.getAttribute("error_msg");
if(errorsMsg==null)errorsMsg=new HashMap();
String verify_code_msg= ( errorsMsg.get("verify_code_msg")==null )?"": (String)errorsMsg.get("verify_code_msg");
String user_email_msg= ( errorsMsg.get("user_email_msg")==null )?"": (String)errorsMsg.get("user_email_msg");
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<title>邮箱地址验证</title>

<link rel="stylesheet" href="/statics/bootstrap/2.3.2/css/bootstrap.min.css"/>
<link rel="stylesheet" href="/statics/bootstrap/2.3.2/css/bootstrap-theme.min.css"/>
<link href="<%=request.getContextPath()%>/statics/css/main.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="/statics/css/main4.css"/>
<link rel="stylesheet" href="/statics/css/site.css"/>
<link href="/static/css/common-element.css" rel="stylesheet" type="text/css">
<script src="/static/artDialog/artDialog.js?skin=aero" charset="utf-8"></script>
<script src="assets/jquery/jquery.min.js"></script>
<script src="media/js/jquery.validate.min.js" type="text/javascript"></script> 

<script type="text/javascript" src="assets/scripts/verify_email.js" charset="utf-8"></script>



<link rel="shortcut icon" href="media/image/favicon.ico" />
    <style>
    	.head_menu {display:none;}
    	.help-inline { color:red; }
    </style>    
    </head>
	<body>
	<jsp:include  page="/static/include/header.jsp" flush="true"/>
    
    <div class="container" >
    		   <div style="height:30px;">
    		   </div>
			    <%
			    if( "success".equals( (String)request.getAttribute("result") ) ) { 
			    %>
                   <!-- 注册成功 -->
               <div class="form-horizontal" id="register_success">
               		<div class="control-group">
                    	<label class="control-label"><img src="assets/styles/img/reg_success.png"/></label>
                        <div class="controls">
							<dl><dt>邮箱验证成功！</dt>
                            <dd></dd>
                            </dl>

                         <a href="<%=request.getContextPath() %>/member/home.do" class="btn btn-warning">进入会员中心</a>
                            
                        </div>
                    </div>
               </div>
               <!-- /注册成功 -->
			    <%
			    }else{
			     %>
              <div class="form-horizontal"  id="register_form" style="width:600px; margin:auto;">
					<div class="alert" >
						  <button type="button" class="close" data-dismiss="alert">&times;</button>
						  <strong>注意：</strong>
						  为了正确收到211校招网通知邮件，系统要求您对预留邮箱进行验证！
					</div>
                  <form id="verify-form" novalidate="novalidate" method="post" action="<%=request.getContextPath()%>/verifyEmail.do">
			          <input  type="hidden"   value="<%=request.getAttribute("t") %>"  name="t" />
			    <div class="control-group">
			      <label class="control-label visible-ie8 visible-ie9">邮箱：</label>
			      <div class="controls">
			        <div class="input-icon left">
			          <input class="m-wrap placeholder-no-fix" type="text" id="user_email"  value="<%=request.getAttribute("user_email") %>"  readonly="readonly" placeholder="请输入电子邮箱" name="user_email"/>
			          <span id="email_msg" class="help-inline"><a href="javascript:;" onclick="edit_email();">修改</a></span>
			        </div>
			        <script type="text/javascript">
			        function edit_email()
			        {
			        	$("#user_email").attr("readonly",false);
			        	$("#user_email").next().hide();
			        	//$("#user_email").focus();
			        	$("#user_email").select();
			        }
			        </script>
			      </div>
			    </div>                  
  
                  <div class="control-group">
                 <label class="control-label">验证码：</label>
                    <div class="controls">
                    <div class="input-icon left">
                        <input type="text" name="verify_code" id="verify_code" placeholder="请输入邮箱验证码"/>
                        <span id="send_msg" class="help-inline"><%= verify_code_msg %></span>
                        </div>
                    </div>
                  </div>
<script type="text/javascript">
var wait=60;//时间 
function time(o,p) {//o为按钮的对象，p为可选，这里是60秒过后，提示文字的改变 
	if (wait == 0) { 
		o.removeAttr("disabled"); 
		o.val("点击发送验证码");//改变按钮中value的值 
		p.html("如果您在1分钟内没有收到验证码，请检查您填写邮箱地址是否正确或重新发送"); 
		wait = 60; 
	} else { 
		o.attr("disabled", true);//倒计时过程中禁止点击按钮 
		o.val(wait + "秒后重新获取验证码");//改变按钮中value的值 
		wait--; 
		setTimeout(function() { 
			time(o,p);//循环调用 
		}, 
		1000) ;
	} 
} 
</script>
<script type="text/javascript">
function sendVerifyCode()
{
	var o=$("#send_btn");
	var p=$("#send_msg");
	var email=$("#user_email").val();
	var action ='/verifyEmail.do?t=<%=request.getAttribute("t") %>&s=send';
	$.ajax({
		url :action,
		data : {user_email:email },
		type : "post",
		dataType : "text",
		beforeSend : function(){
			var reg = /\w+[@]{1}\w+[.]\w+/;
    		if(reg.test(email)){
				return true;
			}else{
				$("#email_msg").text("邮箱地址错误！");
	        	$("#user_email").next().hide();
	        	$("#user_email").select();
				return false;
			}
		},
		success : function(data) {
			time(o,p);
		},
		error : function(XMLHttpRequest, textStatus, errorThrown){
           wait=0;
       }
	});
}
</script>
                  <div class="control-group">
                    <div class="controls">
                        <input id="send_btn" type="button"  href="javascript:;"  onclick="sendVerifyCode();" class="btn btn-success btn-medium"  value="发送验证码" />
                        &nbsp;&nbsp;
                        <input type="submit" value="确定" class=" btn btn-warning btn-medium"/>
                        &nbsp;&nbsp;
 <%--
						 
						 if("company".equals( request.getAttribute("user_type") )){
							 %>
                            <a href="<%=request.getContextPath() %>/member/home.do?skip_email_verify=skip" >进入会员中心</a>
							 <%
						 }else  if("school".equals( request.getAttribute("user_type") )){
							 %>
                            <a href="<%=request.getContextPath() %>/school/main.jsp?skip_email_verify=skip" >进入会员中心</a>
							 <%
						 }else if("student".equals( request.getAttribute("user_type") )){
						 	%>
                            <a href="<%=request.getContextPath() %>/student/index.jsp?skip_email_verify=skip" >进入会员中心</a>
							 <%
						 }
						 --%>         
                    </div>
                  </div>
                  </form>
              </div>
               <%
               }
                %>
     </div>
     


<jsp:include page="include3/bottom.jsp" flush="true" />

<script src="assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script> 
<script>
		jQuery(document).ready(function() {     
		  Forget.init();
		});
</script> 
	</body>
</html>

