<%@ page language="java" pageEncoding="UTF-8"%>
<div class="container" id="register-form">
	<div class="form-horizontal" id="register_form">
		<form class="register-form" novalidate="novalidate"
			action="<%=request.getContextPath()%>/login.do" method="post"
			onsubmit="return false;">
			<input type="hidden" value="register" name="method" /> <input
				type="hidden" value="company" name="user_type" />
			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">用户名：</label>
				<div class="controls">
					<div class="input-icon left">
						<input class="m-wrap placeholder-no-fix" type="text" id="user_id"
							placeholder="" name="user_id" /> <span class="help-inline">6~18个字符，可使用字母、数字、下划线，需以字母开头</span>
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">密码：</label>
				<div class="controls">
					<div class="input-icon left">
						<input type="password" name="user_pass" placeholder=""
							id="register_password" /> <span class="help-inline">6-18位之间，请使用字母与数字的组合，不要过于简单！</span>
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">确认密码：</label>

				<div class="controls">
					<div class="input-icon left">
						<input type="password" id="rpassword" name="rpassword"
							placeholder="" />
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">单位名称：</label>
				<div class="controls">
					<div class="input-icon left">
						<input class="m-wrap placeholder-no-fix" type="text"
							id="organization" placeholder="" name="organization" /> <span
							class="help-inline">请提交完整名称，不可修改。</span>
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
						</select> <span class="help-inline">请选择企业或高校所在地</span>
					</div>
				</div>
			</div>
			<div class="control-group" id="industry_select">
				<label class="control-label">所属行业：</label>
				<div class="controls">
					<div class="input-icon left">
						<select name="industry" id="industry">
							<%
	com.zhaopin.dao.factory.BaseCodeModel baseModel = new com.zhaopin.dao.factory.BaseCodeModel();
%>
							<%=baseModel.selectOptions("industry")%>
						</select> <span class="help-inline"></span>
					</div>
				</div>
			</div>

			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">联系人：</label>
				<div class="controls">
					<div class="input-icon left">
						<input class="m-wrap placeholder-no-fix" type="text"
							id="contact_person" placeholder="" name="contact_person" /> <span
							class="help-inline"></span>
					</div>
				</div>
			</div>

			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">手机：</label>
				<div class="controls">
					<div class="input-icon left">
						<input class="m-wrap placeholder-no-fix" type="text"
							id="contact_tel" placeholder="" name="contact_tel" /> <span
							class="help-inline"></span>
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">QQ：</label>
				<div class="controls">
					<div class="input-icon left">
						<input class="m-wrap placeholder-no-fix" type="text" id="qq"
							placeholder="" name="qq" /> <span class="help-inline"></span>
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">电子邮件：</label>
				<div class="controls">
					<div class="input-icon left">
						<input type="text" name="user_email" id="user_email"
							placeholder="" /> <span class="help-inline">请使用常用邮箱</span>
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">验证码：</label>
				<div class="controls">
					<input type="text" name="jcaptcha" value="" /> <br /> <img
						src="jcaptcha.jpg" class="jcaptcha"
						onclick="this.src='jcaptcha.jpg?d='+Math.random();" /> <a
						href="javascript:void(0)" onclick="refreshCaptcha();">刷新</a>
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<div class="input-icon left">
						<input name="verfiy" type="checkbox" id="checkbox"
							checked="checked" class="checkbox" style="margin:0 5px;" />同意《211校招网服务条款》。<a
							href="<%=request.getContextPath()%>/file/download.jsp?filename=register.docx"
							target="_blank">下载：211校招网用户协议</a>
					</div>
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<input type="submit" id="register_btn" value="同意以上条款并注册" />
				</div>
			</div>
		</form>
	</div>

</div>


