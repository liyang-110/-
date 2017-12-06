<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../include/checkLogin.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title></title>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<script type="text/javascript">
		var cur_path = "<%=request.getContextPath()%>";
		var querystr="&in_role_id=<%=role_id%>";
	</script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"  charset="UTF-8"></script>
	<script type="text/javascript" src="Notice.js"  charset="UTF-8"></script>
  		<style type="text/javascript">
			.datagrid td label{
				vertical-align:top;
			}
		</style>
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
		<table  class="datagrid" width="100%" border="0" cellspacing="10" cellpadding="0">
			<tr>
				<td width="70" align="right">用户：</td>
				<td>
				<label>
					<input type="radio" name="in_sms_to" value="company"/>企业
				</label>
				<label>
					<input type="radio" name="in_sms_to" value="student"/>学生
				</label>
				<label>
					<input type="radio" name="in_sms_to" value="school" />学校
				</label>
				</td>
			</tr>
			<tr>
				<td align="right">标题:</td>
				<td>
				<input size="35" maxlength="20" name="in_sms_title" value="" class="easyui-validatebox" data-options="required:true,missingMessage:'请输入通知标题' "/>
				</td>
			</tr>
			<tr>
				<td align="right">内容：</td>
				<td><textarea  cols="30" rows="6" id="in_sms_content" name="in_sms_content" class="easyui-validatebox" data-options="required:true,missingMessage:'输入通知内容'"></textarea>
				</td>
			</tr>
			<tr>
				<td align="right">网址:</td>
				<td>
				<input size="35" maxlength="255" name="in_sms_url"  value="" class="easyui-validatebox" data-options="required:false"/>
				<label>文本消息,请留空</label>
				</td>
			</tr>
			<tr>
				<td align="right">离线消息:</td>
				<td>
				<%-- 
				<label>
				<input type="checkbox" name="in_offline"/>
				离线消息
				</label>
				--%>
				<input name="in_enddate" type="text" class="easyui-datebox"/>
				(离线消息请设置消息有效期)
				</td>
			</tr>
			<%--
			<tr>
				<td align="right">&nbsp;</td>
				<td>
				<label>
					<input type="radio" name="in_shedule" value="now"/>立即发送
				</label>
				<label>
					<input type="radio" name="in_shedule" value="time"/>定时发送
				</label>
				</td>
			</tr>
			--%>
		</table>
	</form>
	</div>
	
  </body>
</html>
