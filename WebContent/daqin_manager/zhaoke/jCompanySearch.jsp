<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.factory.AdminLoginModel" %>
<%@ include file="../include/checkLogin.jsp" %>
<%
	AdminLoginModel adminModel=new AdminLoginModel();
	List adminList = adminModel.getSelfAdminList(user_code);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title></title>
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	<script type="text/javascript">
		var cur_path = "<%=request.getContextPath()%>";
		var querystr="&in_filter=zhaoke&in_role_id=<%=role_id%>";
	</script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"></script>
	<script type="text/javascript" src="Company.js" charset="UTF-8"></script>
	<style>
	.green {color:green;}
	.red {color:red;}
	</style>
  </head>
  
  <body>
		<div class="easyui-layout" style="width: 100%; height: 330px;" data-options="fit:true,border:false">
		<div data-options="region:'north',border : false" style="background:#F4F4F4;">
        <div style="padding:10px 0 0 20px;">
   <form name="fm" id="fm" method="post">
	地区：
   <input id="in_area_id" name="in_area_id" class="easyui-validatebox" style="width:60px;"/>
 	
	 招聘顾问：<select name="in_admin_id" class="easyui-combobox" data-options="panelHeight: '300' ">
			<option value="">全部</option>
			<option value="0">未分配</option>
			<option value="1">待分配</option>
		<%
		  for(Iterator it=adminList.iterator();it.hasNext();){
		  	HashMap row = (HashMap)it.next();
		%>
			<option value="<%=row.get("user_code") %>"><%=row.get("user_name") %>(<%=row.get("user_id") %>)</option>
		<%}
		%>
		</select>
	   审核状态：
	   <select class="easyui-combobox" id="in_status" name="in_status" panelHeight="auto" style="width:100px;">
	        <option value="">请选择</option>
	        <option value="0">待审核</option>
	        <option value="1">已审核</option>
	        <option value="2">未通过</option>
	        <option value="3">已逾期</option>
	   </select>
	
   会员类型：
	<input id="in_member_type" name="in_member_type" class="easyui-validatebox" />
<br/>
	注册日期: <input  id="in_add_time_1" name="in_add_time_1" class="easyui-datebox" style="width:100px" />
     -- <input id="in_add_time_2" name="in_add_time_2" class="easyui-datebox" style="width:100px" />
        审核日期 <input  id="in_audit_time_1" name="in_audit_time_1" class="easyui-datebox" style="width:100px" />
     -- <input id="in_audit_time_2" name="in_audit_time_2" class="easyui-datebox" style="width:100px" />
    企业名称：
    <input id="in_company_name" name="in_company_name" class="easyui-validatebox" />
        
	<a href="javascript:void(0);" id="searchAndreloadData" class="easyui-linkbutton" iconCls="icon-search">检索</a>
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
	<div id="dlg_check" style="display:none">
			<div>批注意见：</div>
			<div style="text-align:center; margin-bottom:12px;">
		 	 <textarea name="mem" id="mem" cols="45" rows="8"></textarea>
		 	 </div>
	</div>
	<div id="dlg_change_admin" style="display:none">
	<form id="fm2" method="post"  name="fm2">
		
		<ul id="company_list" style="height:130px;overflow:scroll;">
			<li><input type="hidden" name="ids" value=""/>
				错误
			</li>
		</ul>
		<div style="margin-left:20px;">
		管理员：<select name="in_admin_id">
		<%AdminLoginModel model=new AdminLoginModel();
		  List list = model.getSelfAdminList(user_code);
		  for(Iterator it=list.iterator();it.hasNext();){
		  	HashMap row = (HashMap)it.next();
		%>
			<option value="<%=row.get("user_code") %>"><%=row.get("user_name") %>(<%=row.get("user_id") %>)</option>
		<%}
		%>
		</select>
		</div>
	</form>
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
	
  </body>
</html>
