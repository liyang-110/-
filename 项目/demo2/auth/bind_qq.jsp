<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="com.zhaopin.bean.User"%>
<%@page import="com.zhaopin.bean.UserInterface"%>
<%@page import="com.qq.connect.javabeans.qzone.UserInfoBean"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<title><%=com.zhaopin.Config.getSiteTitle() %></title>
<link rel="stylesheet" href="/statics/bootstrap/2.3.2/css/bootstrap.min.css"/>
<link rel="stylesheet" href="/statics/bootstrap/2.3.2/css/bootstrap-theme.min.css"/>
<link href="/statics/css/main.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="/statics/css/main4.css"/>
<link rel="stylesheet" href="/statics/css/site.css"/>
<link href="/static/css/common-element.css" rel="stylesheet" type="text/css"/>

<script src="/statics/jquery/1.11.3/jquery.min.js" type="text/javascript" ></script>
<script src="/statics/jquery/jquery.form.js" charset="utf-8"></script>
<script src="/statics/jquery/jquery.validate.min.js" type="text/javascript" charset="utf-8"></script> 
<script src="/statics/artDialog/artDialog.js?skin=green" charset="utf-8"></script>

<script type="text/javascript">
	var cur_path="<%=request.getContextPath()%>";
</script>
<script type="text/javascript" src="js/bind.js" charset="utf-8"></script>
    <style>
    	.head_menu {display:none;}
    	.help-inline { color:red; }
    	.form-horizontal  {
    		border:solid 2px #FF9300;
    		border-radius:8px 8px 8px 8px;
    		padding-bottom:30px;
    		margin-bottom:50px;
    	}
    </style>    
    </head>
	<body>
	<jsp:include page="/static/include/header.jsp" flush="true"></jsp:include>

    <div class="container" >
    		   <div style="height:10px;">
    		   </div>
			<%
            	UserInfoBean qquserInfo = (UserInfoBean)session.getAttribute("qq_userInfo");
            	if( qquserInfo!= null ){
             %>
			<div style="width:500px; margin:30px auto;">
			 	<p>
            	<img style="width:20px;height:20px;" src=" <%= qquserInfo.getAvatar().getAvatarURL100() %>" />
            	来自<img src="/auth/img/logo_1.png" />QQ登录的<span style="color:#666600;padding:0 10px;"><%=qquserInfo.getNickname()%></span>，您好！现在可以连接211校招网了
			 	</p>
			</div>
			<%} %>
			    <%
			    UserInterface currentUser=User.currentUser( request.getSession() );
			    if( currentUser!=null ) { 
			    	String user_type=currentUser.getUserType();
			    %>
                   <!-- 注册成功 -->
               <div class="form-horizontal" id="register_success" style="width: 500px;
  margin: auto;
  padding-top: 30px;">
               		<div class="control-group">
                    	<label class="control-label">
                    	<!-- 
                    	<img src="<%=request.getContextPath() %>/assets/styles/img/reg_success.png"/>
                        -->
                        <img src="img/smile.jpeg" />
                        </label>
                        <div class="controls">
							<dl><dt> 	您已登录211校招网帐号<%=currentUser.getUserId() %>，是否绑定？</dt>
                            <dd style="padding-left:30px;">
                            	<a href="<%=request.getContextPath() %>/auth/bind.do"  class="btn btn-warning btn-medium">绑定</a>&nbsp;&nbsp;&nbsp;
                            	
                            	<!--
                            	<a href="<%=request.getContextPath() %>/register.jsp?create=true" >创建新帐号</a>
                           		-->
                           		
                            <a href="/member/home.do" class="btn btn-warning" >进入会员中心</a>
                            </dd>
                            </dl>
						                 
                        </div>
                    </div>
               </div>
               <!-- /注册成功 -->
			    <%
			    }else{
			     %>
              <div class="form-horizontal"  id="bind_form" style="width:600px; margin:auto;">
				 	<ul class="nav nav-tabs"  style="margin:auto;width:420px;">
					  <li class="active" style="width:50%;"><a href="#home" >绑定211校招网帐号</a></li>
					  <li style="width:50%;">
			    	  <a style="color:#faa732;" href="<%=request.getContextPath()%>/register.jsp">免费注册211校招网帐号</a>
					  </li>
					</ul>
                  <form id="bind-form"  method="post" action="<%=request.getContextPath() %>/auth/bind.do">
			    <div class="control-group">

			    </div>        
			    <div class="control-group">
			      <label class="control-label visible-ie8 visible-ie9">帐号：</label>
			      <div class="controls">
			        <div class="input-icon left">
			          <input class="m-wrap placeholder-no-fix" type="text" id="user_id"  value=""   name="user_id"/>
			          <span class="help-inline"></span>
			        </div>
			      </div>
			    </div>                  
  
                  <div class="control-group">
                 <label class="control-label">密码：</label>
                    <div class="controls">
                    <div class="input-icon left">
                        <input type="password" name="user_pass" id="user_pass" />
                        <span  class="help-inline"></span>
                        </div>
                    </div>
                  </div>
                  <div class="control-group">
                    <div class="controls">
                        <input style="width:150px;text-align:center;" id="send_btn" type="submit"  href="javascript:;"  class="btn btn-warning btn-medium"  value="绑&nbsp;&nbsp;&nbsp;&nbsp;定" />

                        &nbsp;&nbsp;
						<a href="/forget.do" target="_blank">忘记密码？</a>
                    </div>
                  </div>
                  </form>
                  <script type="text/javascript">
									jQuery(document).ready(function() {     
											BindFrom.init();
									  });
				</script>
              </div>
               <%
               }
                %>
    		   <div style="height:30px;">
    		   </div>
     </div>
     


<jsp:include page="/static/include/footer.jsp" flush="true"></jsp:include>

<script src="/statics/bootstrap/2.3.2/js/bootstrap.min.js" type="text/javascript"></script> 
</body>
</html>

