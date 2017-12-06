<%@page import="com.zhaopin.bean.User"%>
<%@page import="com.zhaopin.bean.UserInterface"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%			String user_type="";
			    UserInterface currentUser=User.currentUser( request.getSession() );
			    if( currentUser!=null ) { 
			    	user_type=currentUser.getUserType();
			    }
			    String result=(String)request.getAttribute("result");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<title><%=com.zhaopin.Config.getSiteTitle() %></title>
<link rel="stylesheet" href="/statics/bootstrap/2.3.2/css/bootstrap.min.css"/>
<link rel="stylesheet" href="/statics/bootstrap/2.3.2/css/bootstrap-theme.min.css"/>
<link href="<%=request.getContextPath()%>/statics/css/main.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="/statics/css/main4.css"/>
<link rel="stylesheet" href="/statics/css/site.css"/>
<link href="/static/css/common-element.css" rel="stylesheet" type="text/css"/>

<script src="<%=request.getContextPath()%>/assets/jquery/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/media/js/jquery.validate.min.js" type="text/javascript"></script> 

<script type="text/javascript" src="<%=request.getContextPath()%>/assets/scripts/verify_email.js" charset="utf-8"></script>
<script src="<%=request.getContextPath()%>/assets2/artDialog/artDialog.js?skin=green"></script>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/media/image/favicon.ico" />
    <style>
    	.head_menu {display:none;}
    	.help-inline { color:red; }
    </style>    
    </head>
	<body>
	<jsp:include page="/static/include/header.jsp" flush="true"></jsp:include>

    <div class="container" >
    		   <div style="height:30px;">
    		   </div>
    		   			    <%
			    
			    if( "repeat".equals(result) ) { 
			    %>
               <div class="form-horizontal" id="register_success">
               		<div class="control-group">
                    	<label class="control-label">
                    	<img src="<%=request.getContextPath() %>/assets/styles/img/reg_success.png"/>
                        </label>
                        <div class="controls">
							<dl><dt> 已绑定成功，请不要重复绑定！</dt>
                            <dd style="padding-left:30px;">
                         		<a href="/member/home.do" class="btn btn-warning">进入会员中心</a>          
                            </dd>
                            </dl>          
                        </div>
                    </div>
               </div>
			    <%
				}else if( "success".equals(result) ) { 
			    %>
                   <!-- 注册成功 -->
               <div class="form-horizontal" id="register_success">
               		<div class="control-group">
                    	<label class="control-label">
                    	<img src="<%=request.getContextPath() %>/assets/styles/img/reg_success.png"/>
                        </label>
                        <div class="controls">
							<dl><dt> 绑定成功！</dt>
                            <dd style="padding-left:30px;">
								<a href="/member/home.do" class="btn btn-warning">进入会员中心</a>
                            </dd>
                            </dl>          
                        </div>
                    </div>
               </div>
               <!-- /注册成功 -->
			    <%
			    }else   if( "failure".equals(result) ) { 
			     %>
                   <!-- 注册成功 -->
               <div class="form-horizontal" id="register_success">
               		<div class="control-group">
                    	<label class="control-label">
                    	<!-- 
                    	<img src="<%=request.getContextPath() %>/assets/styles/img/reg_success.png"/>
                        -->
                        <img src="img/smile.jpeg" />
                        </label>
                        <div class="controls">
							<dl><dt> 绑定失败！</dt>
                            <dd style="padding-left:30px;">
                                <a href="/member/home.do" class="btn btn-warning">进入会员中心</a>
                            </dd>
                            </dl>          
                        </div>
                    </div>
               </div>
               <!-- /注册成功 -->
               <%
               }else{
                %>
                   <!-- 注册成功 -->
               <div class="form-horizontal" id="register_success">
               		<div class="control-group">
                    	<label class="control-label">
                    	<!-- 
                    	<img src="<%=request.getContextPath() %>/assets/styles/img/reg_success.png"/>
                        -->
                        <img src="img/smile.jpeg" />
                        </label>
                        <div class="controls">
							<dl><dt> 请重新登录！</dt>
                            <dd style="padding-left:30px;">
                            		<a href="/" class="btn btn-warning btn-medium">登录</a>
                            </dd>
                            </dl>          
                        </div>
                    </div>
               </div>
               <!-- /注册成功 -->
               <%
               }
                %>
     </div>
<jsp:include page="/static/include/footer.jsp" flush="true"></jsp:include>

<script src="<%=request.getContextPath()%>/assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script> 
<script>
		jQuery(document).ready(function() {     
		  Forget.init();
		});
</script> 
	</body>
</html>

