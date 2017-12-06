<%@ page language="java" pageEncoding="UTF-8"%>
<% com.zhaopin.zk.ZkTools.newRegister(request); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta name="Keywords" content="<%=com.zhaopin.Config.getSiteKeywords() %>" />
<meta name="Description" content="<%=com.zhaopin.Config.getSiteDescription() %>" />
<title>用户注册-- <%=com.zhaopin.Config.getSiteTitle() %></title>

<link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="assets/styles/global.css"/>

<script src="assets/jquery/jquery.min.js"></script>
<script src="media/js/jquery.validate.min.js" type="text/javascript"></script> 
<script type="text/javascript" src="assets/jquery/jquery.form.js"></script>
<script type="text/javascript" src="assets/scripts/register.js" charset="utf-8"></script>


<link rel="shortcut icon" href="media/image/favicon.ico" />
<style type="text/css">
	.select_user_type {
		height:80px;
	}
	.select_user_type li{
		float:left;
		margin:0 5px;
	}
</style>
    </head>
	<body>

    
    <div style="clear:both;height:10px;border-top:1px solid #94B4A0; border-bottom:3px solid #BDC3B9; background:#286A46;"></div>
    <div class="container" id="register-form">
    
            <ul class="tabs" id="reg_tab">
              <li class="active"><a href="#register_form">1、填写账户信息</a></li>
              <li class=""><a href="#register_success">2、注册成功</a></li>
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
    <div style="width:920px; margin:auto;">
		<ul class="select_user_type">
		<li><a><img src="assets/images/reg_stu.png" /></a></li>
		<li><a><img src="assets/images/reg_com.png" /></a></li>
		<li><a><img src="assets/images/reg_sch.png" /></a></li>
		</ul>
    </div>             
     <div style="clear:both;"></div>
            
              <div class="form-horizontal" id="register_form">
                  <form class="register-form" novalidate="novalidate" action="<%=request.getContextPath()%>/login.do" method="post" onsubmit="return false;">
                  <input type="hidden" value="register" name="method" />
				<input type="hidden" value="school" name="user_type" />
    <div class="control-group">
      <label class="control-label visible-ie8 visible-ie9">用户名：</label>
      <div class="controls">
        <div class="input-icon left">
          <input class="m-wrap placeholder-no-fix" type="text" id="user_id" placeholder="" name="user_id"/>
          <span class="help-inline">4-20位（字母、数字、下划线的组合）</span>
        </div>
      </div>
    </div>                  
                  <div class="control-group">
                 <label class="control-label">密码：</label>
                    <div class="controls">
                    <div class="input-icon left">
                        <input type="password" name="user_pass" placeholder="" id="register_password"/>
                         <span class="help-inline">4-20位之间，请使用字母与数字的组合，不要过于简单！</span>
					</div>
                    </div>
                  </div>
                  <div class="control-group">
                 <label class="control-label">确认密码：</label>
               
                    <div class="controls">
                    <div class="input-icon left">
                        <input type="password" id="rpassword" name="rpassword" placeholder=""/>
                        </div>
                    </div>
                  </div>
    <div class="control-group">
      <label class="control-label visible-ie8 visible-ie9">单位名称：</label>
      <div class="controls">
        <div class="input-icon left">
          <input class="m-wrap placeholder-no-fix" type="text" id="organization" placeholder="" name="organization"/>
          <span class="help-inline">请提交完整名称，不可修改。</span>
        </div>
      </div>
    </div>   
                  
                  <div class="control-group">
                 <label class="control-label">所在地区：</label>
                    <div class="controls">
                    <div class="input-icon left">
                    <select name="area_id" id="area_id">
<%
	com.zhaopin.dao.factory.AreaModel areaModel = new com.zhaopin.dao.factory.AreaModel();
%>
<%=areaModel.getProvionceOptions("28")%>
     </select>
                        <span class="help-inline">请选择企业或高校所在地</span>
                        </div>
                    </div>
                  </div>
                  <div class="control-group" id="industry_select" style="display:none;">
                 <label class="control-label">所属行业：</label>
                    <div class="controls">
                    <div class="input-icon left">
                    <select name="industry" id="industry">
<%
	com.zhaopin.dao.factory.BaseCodeModel baseModel = new com.zhaopin.dao.factory.BaseCodeModel();
%>
<%=baseModel.selectOptions("industry")%>
     </select>
                        <span class="help-inline"></span>
                        </div>
                    </div>
                  </div>
                  
      
    
    <div class="control-group">
      <label class="control-label visible-ie8 visible-ie9">联系人：</label>
      <div class="controls">
        <div class="input-icon left">
          <input class="m-wrap placeholder-no-fix" type="text" id="contact_person" placeholder="" name="contact_person"/>
          <span class="help-inline"></span>
        </div>
      </div>
    </div>
    
    <div class="control-group">
      <label class="control-label visible-ie8 visible-ie9">手机：</label>
      <div class="controls">
        <div class="input-icon left">
          <input class="m-wrap placeholder-no-fix" type="text" id="contact_tel" placeholder="" name="contact_tel"/>
          <span class="help-inline"></span>
        </div>
      </div>
    </div>         
    
                  <div class="control-group">
                 <label class="control-label">电子邮件：</label>
                    <div class="controls">
                    <div class="input-icon left">
                        <input type="text" name="user_email" id="user_email" placeholder=""/>
                        <span class="help-inline">请使用常用邮箱</span>
                        </div>
                    </div>
                  </div>
                  
                <div class="control-group">
                    <div class="controls">
                    	<div class="input-icon left">
						<input name="verfiy" type="checkbox" id="checkbox" checked="checked" class="checkbox" style="margin:0 5px;"/>同意《211校招网服务条款》。<a href="<%=request.getContextPath()%>/file/download.jsp?filename=register.docx" target="_blank">下载：211校招网用户协议</a>
						</div>
                    </div>
                  </div>
                  <div class="control-group">
                    <div class="controls">
                        <input type="submit" id="register_btn" value="同意以上条款并注册" class=" btn btn-warning"/>
                    </div>
                  </div>
                  </form>
              </div>
             
     </div>
     
    

<jsp:include  page="./include/footer.jsp" flush="true"/>

<script src="assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script> 
<script>
		jQuery(document).ready(function() {     
		  Register.init();
		});
</script> 
	</body>
</html>

