<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.factory.BaseCodeModel"%>
<div class="form-horizontal" id="register_form">

	<form class="register-form" name="addform" id="addform"
		novalidate="novalidate" action="/login.do" method="post" onsubmit="return false;">
		<input type="hidden" value="register" name="method" /> <input
			type="hidden" value="student" name="user_type" />

		<div class="control-group group">
			<label class="control-label visible-ie8 visible-ie9 stu_label"><span
				class="xinghao">*</span>用户名：</label>
			<div class="controls">
				<div class="input-icon left">
					<input class="m-wrap placeholder-no-fix stu_input" type="text"
						id="user_id" placeholder="" name="user_id" /> <span
						class="help-inline" style="color:#333;font-size:12px;">6~18个字符，可使用字母、数字、下划线，需以字母开头</span>
				</div>
			</div>
		</div>
		<div class="control-group group">
			<label class="control-label stu_label"><span class="xinghao">*</span>密码：</label>
			<div class="controls">
				<div class="input-icon left">
					<input class="stu_input" type="password" name="user_pass"
						placeholder="" id="register_password" /> <span class="help-inline"
						style="color:#333;font-size:12px;">6-18位之间，请使用字母与数字的组合，不要过于简单！</span>
				</div>
			</div>
		</div>
		<div class="control-group group">
			<label class="control-label stu_label"><span class="xinghao">*</span>确认密码：</label>
			<div class="controls">
				<div class="input-icon left">
					<input class="m-wrap placeholder-no-fix stu_input" type="password"
						id="rpassword" name="rpassword" placeholder="" />
				</div>
			</div>
		</div>
		<div class="control-group group">
			<label class="control-label visible-ie8 visible-ie9 stu_label"><span
				class="xinghao">*</span>QQ：</label>
			<div class="controls">
				<div class="input-icon left">
					<input class="m-wrap placeholder-no-fix stu_input" type="text"
						id="qq" placeholder="" name="qq" /> <span class="help-inline"></span>
				</div>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label visible-ie8 visible-ie9 stu_label"><span
				class="xinghao">*</span>手机号码：</label>
			<div class="controls">
				<div class="input-icon left">
					<input class="m-wrap placeholder-no-fix stu_input" type="text"
						id="contact_tel" placeholder="" name="contact_tel" /> <span
						class="help-inline"></span>
				</div>
			</div>
		</div>
		<div class="control-group group">
			<label class="control-label stu_label"><span class="xinghao">*</span>电子邮件：</label>
			<div class="controls">
				<div class="input-icon left">
					<input class="stu_input" type="text" name="user_email"
						id="user_email" placeholder="" />
				</div>
			</div>
		</div>
		<div class="control-group group">
			<label class="control-label stu_label"><span class="xinghao">*</span>验证码：</label>
			<div class="controls">
				<input class="stu_input" type="text" name="jcaptcha" id="jcaptcha"
					value="" /><span class="help-inline"
					style="color:#333;font-size:12px;">请输入验证码，不清晰请刷新！</span><br /> <img
					src="jcaptcha.jpg" class="jcaptcha"
					onclick="this.src='jcaptcha.jpg?d='+Math.random();" /> <a
					href="javascript:void(0)" onclick="refreshCaptcha();">刷新</a>
			</div>
		</div>
		<div class="control-group tiankuan">
			<div class="controls">
				<div class="input-icon left">
					<input class="stu_input" name="verfiy" type="checkbox"
						id="checkbox" checked="checked" class="checkbox"
						style="margin:0 5px;" />同意《211校招网服务条款》。<a
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