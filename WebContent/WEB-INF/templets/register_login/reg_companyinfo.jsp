<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.Station"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>

<html lang="en">
<head>
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<title>完善企业基本信息</title>
    <link rel="stylesheet" href="/static/bootstrap/css/bootstrap.min.css">
  	<link href="/static/css/validatebox.css" rel="stylesheet" type="text/css"></link>
    <link rel="stylesheet" href="/static/css/complete_resume.css">
    <link href="/static/css/font-awesome.min.css" rel="stylesheet" media="screen">
	<link rel="stylesheet" href="/statics/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" type="text/css"></link>

	<script type="text/javascript">
	var cur_path ="<%=request.getContextPath()%>";
	</script>
</head>
<body >
	<div class="top_bar header">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-4 col-xs-8 logo">
					<a href="/"><img src="/static/image/211logo_wechat2.png" width="50%" alt="图片" class=" img-responsive center-block " style="float:left; margin-top:14px; "></a>
						<span style="float:left;">完善企业基本信息</span>
						<div style="clear:both;"></div>
				</div>
				<jsp:include page="include_login/header.jsp" flush="true"></jsp:include>
			</div>
		</div>
	</div>

	<div class="content">
		<div class="contain">
			<div class="center">
				<div class="title">
					<p><span style="color:#02c084;">| </span>完善企业基本信息 </p>
				</div>
				<div class="left">
					<div id="register_form">
						<form class="company-one" name="addform" id="addform" method="post" onsubmit="return false;">
						    <input type="hidden" value="company" name="users" />
         				
         					<span class="xinghao">*</span><label>单位名称：</label>
         						<input class="text-form easyui-validatebox" type="text" id="r_company_name" name="r_company_name"  data-options="required:true,missingMessage:'请输入姓名!', placeholder:'输入姓名'"/>
         						<div style="clear:both;"></div>
         					<span class="xinghao">*</span><label>所在地区：</label>
         						<select  class="text-form easyui-validatebox" name="r_area_id" id="r_area_id" data-options="required:true,missingMessage:'请选择现居地!'">
									<c:forEach var="p" items="${provionceList}">
										<option value="${p[0]}" >
										<c:out value="${p[1]}"  />
										</option>		
									</c:forEach>
								</select>
							<div style="clear:both"></div>
							<span class="xinghao">*</span><label>所属行业：</label>
								<select  class="text-form easyui-validatebox" name="r_industry" id="r_industry" data-options="required:true,missingMessage:'请选择所属行业!'">
    <%
	com.zhaopin.dao.factory.BaseCodeModel baseModel = new com.zhaopin.dao.factory.BaseCodeModel();
	%>
							<%=baseModel.selectOptions("industry")%>
								</select>
								<div style="clear:both;"></div>
							<span class="xinghao">*</span><label> 联 系 人  ：</label>
         						<input class="text-form easyui-validatebox" type="text" id="r_contact_person" name="r_contact_person"  data-options="required:true,missingMessage:'请输入联系人姓名!',placeholder:'输入联系人姓名!'" />
         						<div style="clear:both;"></div>
         					<span class="xinghao">*</span><label>联系手机：</label>
         						<input class="text-form easyui-validatebox" type="text" id="r_contact_tel" name="r_contact_tel"  data-options="required:true,missingMessage:'请输入联系手机!',invalidMessage:'请输入正确手机号!',validType:'phoneNum'"/>
         						<div style="clear:both;"></div>
         					<span class="xinghao">*</span><label>企业邮箱：</label>
         						<input class="text-form easyui-validatebox" type="text" id="r_contact_email" name="r_contact_email" data-options="required:true,missingMessage:'请输入邮箱!',invalidMessage:'请输入正确邮箱',placeholder:'请输入邮箱!',validType:'email'" />
             					<div style="clear:both"></div>
       						
       						<input class="denglu_button" id="register_btn" type="submit" value="完成信息">
       						<div style="clear:both;"></div>
       					</form>
					</div>
				</div>
				<div style="clear:both;"></div>
			</div>
			<jsp:include page="include_login/footer.jsp" flush="true"></jsp:include>
		</div>  
	</div> 
</body>
	<script src="/static/jquery/1.11.3/jquery.min.js"></script>
	<script src="/static/js/jquery.easyui.min.js" rel="stylesheet"></script>
    <script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script>    
    <!-- <script src="/statics/jquery/jquery.form.js" type="text/javascript" charset="utf-8"></script>    -->
    <script src="/statics/jquery/jquery.validate.min.js" type="text/javascript" charset="utf-8"></script> 
	<script src="/static/artDialog/artDialog.js?skin=aero" charset="utf-8"></script>
	<script src="/static/artDialog/plugins/iframeTools.js"></script>
	<script type="text/javascript" src="/assets/My97DatePicker/WdatePicker.js"  charset="utf-8"></script>
	<script src="/static/bootstrap/js/bootstrap.min.js"></script>
	<script src="/js/layer/getprovince211.js" type="text/javascript" charset="utf-8"></script>
	<script src="/js/layer/jobjss.js" type="text/javascript" charset="utf-8"></script>
	
	<script type="text/javascript">
	$(function(){
		$.extend($.fn.validatebox.defaults.rules, {    
		    phoneNum: { //验证手机号   
		        validator: function(value, param){ 
		         return /^1[0-9]\d{9}$/.test(value);
		        },    
		        message: '请输入正确的手机号码。'   
		    },
		    
		    telNum:{ //既验证手机号，又验证座机号
		      validator: function(value, param){ 
		          return /(^(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$)|(^((\d3)|(\d{3}\-))?(1[358]\d{9})$)/.test(value);
		         },    
		         message: '请输入正确的电话号码。' 
		    }  
		});
		
		/* $(".denglu_button").click(function(){
			$('.company-one').validate(options_stu);
		});  */
		
		$('.company-one').form({
	        url:'/member/saveResume.do?flag=five',
	        data : function(){
	        	var params=$('.company-one').serialize();
	    		params = decodeURIComponent(params,true);
	    		return params;
	        },
			type : "post",
			dataType : "json",
	        onSubmit:function(){
	            return $(this).form('validate');
	        },
	        success:function(data){
	        	if (!data) return;
	            if(data =='88'){
	            	window.location.href="/member/home.do";
	            }else{
	            	$("#register_btn").attr("disabled",false);
	            	$("#register_btn").attr("value","完成信息");
	            	if(data =='-2'){
		            	alert("保存失败！");
		            }else if(data =='-3'){
		            	alert("保存失败，企业名已存在！");
		            }else{
		            	alert("系统更新中，请稍后再试！");
		            }
		            return;
	            } 
	        },
			complete : function(XMLHttpRequest, textStatus) {
			},
		contentType:"application/x-www-form-urlencoded; charset=utf-8"

	    });
	});
	</script>
</html>