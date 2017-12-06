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
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-easyui/datagrid-groupview.js"></script>
	<script type="text/javascript" src="MailTemplate.js"  charset="UTF-8"></script>
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
	<div id="dlg_process" style="display:none;padding:10px 0 0 10px;">
	<form id="fm" method="post"  name="fm">
		<input type="hidden" name="in_r" value="ad" />
		<input type="hidden" name="in_order_id" value=""  id="process_order_id" />
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr><td colspan="2">
				 单位名称：<span id="process_company_name"></span><br/>
				  联系人：<span  id="process_contact_person"></span>,
				  电话：<span id="process_contact_tel"></span>
			</td></tr>
			<tr>
				<td>进度：</td>
				<td>
				<label><input type="radio" id="status_01" name="in_status" value="已购"/>已购</label>
				<label><input type="radio" id="status_02" name="in_status" value="确认"/>确认</label>
				<label><input type="radio" id="status_03"  name="in_status" value="处理"/>处理</label>
				<label><input type="radio" id="status_04"  name="in_status" value="完成"/>完成</label>
				</td>
			</tr>
			<tr>
				<td>备注：</td>
				<td><textarea  cols="30" rows="6" id="process_content" name="in_process" class="easyui-validatebox" ></textarea>
				</td>
			</tr>
		</table>
	</form>
	</div>
   
  </body>
</html>
