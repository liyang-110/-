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
	<% if( "00".equals( user.getRoleId() ) ){ %>
	<script type="text/javascript" src="ShotMessageManager.js"  charset="UTF-8"></script>
  	<% }else{ %>
	<script type="text/javascript" src="ShotMessage.js"  charset="UTF-8"></script>
  	<% } %>
  </head>
  
  <body>
  
		<div class="easyui-layout" style="width: 100%; height: 350px;" data-options="fit:true,border : false">
		
			<div data-options="region:'center',border : false">	
				<table id="resultId" name='resultId'>
				</table>
				
			</div>
	
	    </div>

		<div id="dlg_deal" class="easyui-dialog" fit="true" style="width: 100%; height: 100%; padding: 0px 0px" closed="true" buttons="#dlg-buttons">
			<iframe scrolling="auto" id="if_deal" frameborder="0" src="" style="width: 100%; height: 100%;"></iframe>
		</div>
	    
	<div id="dlg_check2" style="display:none">
	<form id="fm" method="post"  name="fm">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="70" align="right">手机号：</td>
				<td><input id="in_sms_to" name="in_sms_to"  class="easyui-numberbox" data-options="required:true,missingMessage:'输入手机号',invalidMessage:'请输入11位手机号',validType:'length[11,11]' "/></td>
			</tr>
			<tr>
				<td align="right">内容：</td>
				<td><textarea  cols="25" rows="6" id="in_sms_content" name="in_sms_content" class="easyui-validatebox" data-options="required:true,missingMessage:'输入短信内容'"></textarea>
				</td>
			</tr>
		</table>
	</form>
	</div>
	
	<div id="dlg_check3" style="display:none">
	<form id="fm2" method="post"  name="fm">
		<table width="90%" border="0" cellspacing="0" cellpadding="0" style="margin-left:10px;">
			<tr>
				<td align="left">手机号(每行一个)：</td><td>&nbsp;</td>
			</tr><tr>
				<td>
				<input name="in_sms_to_bat" type="hidden" id="in_sms_to_bat" value="bat"/>
				<textarea cols="25" rows="16" id="sms_to_bat" name="sms_to_bat"  class="easyui-validatebox" data-options="required:true,missingMessage:'输入手机号'"></textarea>
				</td>
				<td>
				内容：
				<textarea  cols="25" rows="6" id="in_sms_content" name="in_sms_content" class="easyui-validatebox" data-options="required:true,missingMessage:'输入短信内容'"></textarea>
				</td>
			</tr>
		</table>
	</form>
	</div>
	
	
  </body>
</html>
