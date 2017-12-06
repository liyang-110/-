<%@ page language="java" pageEncoding="UTF-8"%>
<%
String user_id="";
String usercount="";
if(session.getAttribute("user_id")!=null && !"".equals( (String)session.getAttribute("user_id") ) )
{
	usercount=session.getAttribute("usercount")==null?"0":session.getAttribute("usercount").toString();
 	user_id=session.getAttribute("user_id").toString();
 }else{
 	response.sendRedirect( request.getContextPath()+"/register.jsp");
 }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta name="Keywords" content="<%=com.zhaopin.Config.getSiteKeywords() %>" />
<meta name="Description" content="<%=com.zhaopin.Config.getSiteDescription() %>" />
<title>注册成功-- <%=com.zhaopin.Config.getSiteTitle() %></title>

<link rel="stylesheet" href="/statics/bootstrap/2.3.2/css/bootstrap.min.css"/>
<link rel="stylesheet" href="/statics/bootstrap/2.3.2/css/bootstrap-theme.min.css"/>
<link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

<link href="/statics/css/main.css" rel="stylesheet" type="text/css" />
<link href="/static/css/common-element.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/statics/css/main4.css"/>
<link rel="stylesheet" href="/statics/css/site.css"/>

<script src="assets/jquery/jquery.min.js"></script>
<script src="media/js/jquery.validate.min.js" type="text/javascript"></script> 
<script src="/static/artDialog/artDialog.js?skin=aero" charset="utf-8"></script>
<script src="/static/artDialog/plugins/iframeTools.js"></script>
<script type="text/javascript" src="assets/jquery/jquery.form.js"></script>
<style>
	.head_menu,.station {display:none;}
</style>
<script type="text/javascript">
	   	$("#site_select_btn").hide();
</script>    
</head>
	<body>
	<jsp:include  page="/static/include/header.jsp" flush="true"/>
    
    <div class="container" id="register-form">
    
            <ul class="tabs" id="reg_tab">
              <li class=""><a href="#register_form">1、填写账户信息</a></li>
              <li class="active"><a href="#register_success">2、注册成功</a></li>
            </ul>
            <script>
			/*  本段代码，在发布时删除，后台传参数控制  class="active"  */
			  $(function () {
				$('#reg_tab a').click(function (e) {
				  e.preventDefault();
				//	$(this).parent("li").siblings().removeClass("active");
				//	$(this).parent("li").addClass("active");
					
				})
			  })
			</script>
            
              <!-- 注册成功 -->
               <div class="form-horizontal" id="register_success">
               		<div class="control-group">
                    	<label class="control-label"><img src="assets/styles/img/reg_success.png"/></label>
                        <div class="controls">
							<dl><dt> 	账户注册成功！</dt>
                            <dd>您的登陆账户是<strong><%=user_id %></strong>，成为211招聘网第<strong><%=usercount %></strong>位会员！</dd>
                            </dl>
                            <dl><dt>请注意</dt>
                            <dd>高校注册，需要下载《开通申请表》并加盖高校就业中心印章<a href="<%=request.getContextPath() %>/file/download.jsp?filename=apply.docx" class="btn btn-small btn-success" target="_blank">下载申请表格式</a></dd>
                            </dl>

                            <a href="<%=request.getContextPath() %>/member/home.do" class="btn btn-warning">进入会员中心</a>
							
                            
                        </div>
                    </div>
               </div>
               <!-- /注册成功 -->
     </div>
<jsp:include page="/static/include/footer.jsp" flush="true" />
<script src="assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script> 
	</body>
</html>

