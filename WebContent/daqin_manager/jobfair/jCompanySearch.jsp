<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title></title>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0" />   
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	<script type="text/javascript">
		var cur_path = "<%=request.getContextPath()%>";
		var school_id ="<%=request.getParameter("school_id")!=null ?request.getParameter("school_id") :""%>";
		var job_fair_id="<%=request.getParameter("id")!=null ?request.getParameter("id") :""%>";
	</script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"></script>
	<script type="text/javascript" src="Company.js" charset="UTF-8"></script>
   <link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/bootstrap/panel.css" type="text/css"></link>
   <link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/bootstrap/window.css" type="text/css"></link>

  </head>
  
  <body>
		<div class="easyui-layout" style="width: 100%; height: 350px;" data-options="fit:true,border:false">
			<div data-options="region:'center',split:true,border:false">
				<table id="resultId" name='resultId'>
				</table>
			</div>
	    </div>
		<div id="dlg_deal" class="easyui-dialog" fit="true" style="width: 100%; height: 100%; padding: 0px 0px" closed="true" buttons="#dlg-buttons">
			<iframe scrolling="auto" id="if_deal" frameborder="0" src="" style="width: 100%; height: 100%;"></iframe>
		</div>
		
	<div id="dlg_check" style="display:none">
			<div style="text-align:center; margin-bottom:12px;">
				<div style="text-align:left;width:290px;margin:auto;">备注：</div>
			 	 <textarea name="mem" id="mem" cols="45" rows="5"></textarea>
			</div>
	</div>
	<!-- 发送短信  -->
	<div id="dlg_check2" style="display:none">
	<form id="fm_msg" method="post"  name="fm">
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
	
	<div id="jCompanyCredit" title="导出参会企业资质" data-options="iconCls:'icon-save'" style="width:500px;height:200px;padding:10px;display:none;">
        The window content.
    </div>
  </body>
</html>
