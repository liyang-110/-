<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../checkLogin.jsp" %>
<%
String id=request.getParameter("id");
String company_status="";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>回访记录</title>
<script type="text/javascript">
	var company_id ="<%= request.getParameter("company_id")%>";
	var user_id ='${ param.user_id }';
	var cur_path ="<%=request.getContextPath()%>";
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"></script>
<script type="text/javascript" src="VisitRecord.js"  charset="utf-8"></script>
<style type="text/css">
	form table td {
		padding:2px;
	}
</style>
</head>

<body>
	<div class="easyui-layout" style="width: 100%; height: 330px;" data-options="fit:true,border:false">
		<div data-options="region:'center',border:false">
			<table id="resultId" name='resultId'>
			</table>
		</div>
	</div>
	
<div id="dlg_deal" class="easyui-dialog" fit="false" style="width:700px; height: 500px; padding: 0px 0px" closed="true" buttons="#dlg-buttons">
  <div class="easyui-layout" fit="true">
    <div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">

<form id="fm" method="post"  name="fm">
	<input id="company_id" type="hidden" name="company_id" value="${ param.company_id }"/>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td align="right">企业联系人：</td>
				<td><input id="person" name="person" class="easyui-validatebox" required="true"/></td>
			</tr>
			<tr>
				<td align="right">企业电话：</td>
				<td><input id="company_tel" name="company_tel"
					class="easyui-validatebox" required="true"/></td>
			</tr>
			<tr>
				<td align="right">企业邮箱：</td>
				<td><input id="company_email" name="company_email"
					class="easyui-validatebox" validType="email" required="true"/></td>
			</tr>
			<tr>
				<td align="right">回访内容：</td>
				<td>
					<textarea name="content" id="content" cols="30" rows="4" 
						class="easyui-validatebox"  data-options="required:true"></textarea>
					</td>
			</tr>
			<tr>
				<td align="right">下次回访日期：</td>
				<td><input id="next_time" name="next_time"
					class="easyui-datebox" data-options="required:true"/></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
		</table>
</form>
        </div>
	    <div region="south" border="false" style="text-align: right; height: 30px; line-height: 20px;">
	    <a id="btn_save" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)" onclick="add();"> 确定</a>
	    <a id="btn_return" class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0)" onclick="closePageCancel();">取消</a>
	    </div>
	  </div>
<!--
			<iframe scrolling="auto" id="if_deal" frameborder="0" src="" style="width: 100%; height: 100%;"></iframe>
-->
	</div>
</body>
</html>
