<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../include/checkLogin.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page"/>
	<script type="text/javascript">
		var cur_path = "<%=request.getContextPath()%>";
		var querystr="&in_role_id=<%=role_id%>";
	</script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"  charset="UTF-8"></script>
	<script type="text/javascript" src="StudentSearch.js"  charset="UTF-8"></script>
  </head>
  
  <body>
  
		<div class="easyui-layout" style="width: 100%; height: 330px;" data-options="fit:true,border : false">
			<div data-options="region:'north',border : false" style="background:#F4F4F4;">
		        <div style="padding:5px 0 0 10px;">
		        	<form name="fm" id="fm" method="post">
		        <input type="hidden" name="in_sms_content" id="in_sms_content" value="" />	
		        	
        	地区：<input id="in_area_id" name="in_area_id" class="easyui-validatebox" style="width:100px;"/>
         	学历：<input id="in_education" name="in_education" class="easyui-validatebox" style="width:100px;"/>
          	学校：<input id="in_school_name" name="in_school_name" class="easyui-validatebox" />
         	专业：<input id="in_profession" name="in_profession" class="easyui-validatebox"  style="width:110px;"/>

          	注册日期: <input  id="in_add_time_1" name="in_add_time_1" class="easyui-datebox" style="width:100px" />
            -- <input id="in_add_time_2" name="in_add_time_2" class="easyui-datebox" style="width:100px" />
          	<br/>
          	登录日期: <input  id="in_login_time_1" name="in_login_time_1" class="easyui-datebox" style="width:100px" />
            -- <input id="in_login_time_2" name="in_login_time_2" class="easyui-datebox" style="width:100px" />
			毕业年份：<select id="in_grad_year" name="in_grad_year" class="easyui-combobox">
						<option value="">请选择</option>
						<option value="2018">2018</option>
						<option value="2017">2017</option>
						<option value="2016">2016</option>
						<option value="2015">2015</option>
						<option value="2014">2014</option>
					</select>	
        	姓名：<input id="in_student_name" name="in_student_name" class="easyui-validatebox" />
        	手机：<input id="in_tel" name="in_tel" class="easyui-validatebox"/>
 			 邮箱：<input id="in_email" name="in_email" class="easyui-validatebox"/>

            <a href="javascript:;" onclick="searchStudent();" class="easyui-linkbutton" iconCls="icon-search">搜索</a>	
           
			</form>
		        </div>
		    </div>
			<div data-options="region:'center',border : false">	
				<table id="resultId" name='resultId'>
				</table>
			</div>
	    </div>
		<div id="dlg_deal" class="easyui-dialog" fit="true" style="width: 100%; height: 100%; padding: 0px 0px" closed="true" buttons="#dlg-buttons">
			<iframe scrolling="auto" id="if_deal" frameborder="0" src="" style="width: 100%; height: 100%;"></iframe>
		</div>
		
		
	<div id="dlg_check2" style="display:none">
	<form id="fm_msg" method="post"  name="fm">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="70" align="right">手机号：</td>
				<td><input id="in_sms_to" name="in_sms_to"  class="easyui-numberbox" data-options="required:true,missingMessage:'输入手机号',invalidMessage:'请输入11位手机号',validType:'length[11,11]' "/></td>
			</tr>
			<tr>
				<td align="right">内容：</td>
				<td><textarea  cols="25" rows="6" id="sms_content" name="in_sms_content" class="easyui-validatebox" data-options="required:true,missingMessage:'输入短信内容'"></textarea>
				</td>
			</tr>
		</table>
	</form>
	</div>
	<div id="dlg_check3" style="display:none;padding-top:15px;">
	<form id="fm_allmessage" method="post"  name="fm_all">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td align="right">内容：</td>
				<td><textarea  cols="25" rows="6" id="bat_sms_content" name="in_sms_content" class="easyui-validatebox" data-options="required:true,missingMessage:'输入短信内容'"></textarea>
				</td>
			</tr>
		</table>
	</form>
	</div>
  </body>
</html>
