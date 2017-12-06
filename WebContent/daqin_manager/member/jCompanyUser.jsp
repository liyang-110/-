<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.factory.AdminLoginModel" %>
<%@ include file="../include/checkLogin.jsp" %>
<%
	AdminLoginModel adminModel=new AdminLoginModel();
	List adminList = adminModel.getSiteEmployList(user_code);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>0</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page"/>
	<script type="text/javascript">
		var cur_path = "<%=request.getContextPath()%>";
		var role_id = "<%=role_id%>";
		var user_type = "company";
		var querystr="&in_role_id="+role_id+"&in_user_type="+user_type;
	</script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js" charset="utf-8"></script>
	<% if(acc_type==2){ %>
	<script type="text/javascript" src="CompanyUser2.js" charset="utf-8"></script>
  	
  	<% }else{ %>
	<script type="text/javascript" src="CompanyUser.js" charset="utf-8"></script>
  	<% } %>
  	
  	<style>
	.green {color:green;}
	.red {color:red;}
	a {text-decoration:none;}
	a:hover {text-decoration:underline;}
	</style>
  </head>
  
  <body>
		<div class="easyui-layout" style="width: 100%; height: 320px;" data-options="fit:true,border:false">
			<div data-options="region:'north',border : false" style="background:#F4F4F4;">
		        <div style="padding:5px 0 0 10px;">
		       		<form name="fm" id="fm" method="post">
					 招聘顾问：
					<select name="in_admin_id" class="easyui-combobox" data-options="panelHeight: '300' ">
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
					状态：
				   <select class="easyui-combobox" id="in_status" name="in_status" panelHeight="auto" >
				        <option value="">请选择</option>
				        <option value="9">待审核</option>
				        <option value="1">已审核</option>
				        <option value="2">未通过</option>
				        <option value="3">已逾期</option>
				        <option value="0">未审核</option>
				   </select>
					地区：
				    <input id="in_area_id" name="in_area_id" class="easyui-validatebox" style="width:80px;"/>
		        	账号：
		        	<input id="in_user_id" name="in_user_id" class="easyui-validatebox"/>
		       		<%-- 
		       		邮箱：
		            <input id="in_email" name="in_email" class="easyui-validatebox"/>
		       		--%>
		       		注册: <input  id="in_add_time_1" name="in_add_time_1" class="easyui-datebox" style="width:100px" />
		            -- <input id="in_add_time_2" name="in_add_time_2" class="easyui-datebox" style="width:100px" />
					点数：
					<input id="in_points_1" style="width:60px;" name="in_points_1" class="easyui-numberbox"/>
					-
					<input id="in_points_2" style="width:60px;" name="in_points_2" class="easyui-numberbox"/>

		       		<!-- 
		      		 排序：
		            <select id="in_order" name="in_order" class="easyui-combobox" panelHeight="auto">
		            	<option value="add_time">注册时间</option>
		            	<option value="company_name">企业名称</option>
		            	<option value="login_date">最后登录</option>
		            </select>
		             -->
		       		 <br/>
					会员类型：
		       		<input id="in_member_type" name="in_member_type" class="easyui-validatebox" />
		       		开始：
		       		<input id="in_begin_date_1" name="in_begin_date_1" class="easyui-datebox" style="width:100px" />
		            -- <input id="in_begin_date_2" name="in_begin_date_2" class="easyui-datebox" style="width:100px" />
		       		截止：<input  id="in_end_date_1" name="in_end_date_1" class="easyui-datebox" style="width:100px" />
		            -- <input id="in_end_date_2" name="in_end_date_2" class="easyui-datebox" style="width:100px" />
					公司名称：
		            <input id="in_company_name" name="in_company_name" class="easyui-validatebox"/>
		            <a href="javascript:;" id="searchAndreloadData" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
		             <%-- 
		             &nbsp;&nbsp;&nbsp;<label>
		             <input type="checkbox" name="in_audit" value="wait" />仅显示待审核的企业
		       		 </label>
		       		 --%>
		            </form>
		        </div>
	    
			</div>
			
			<div data-options="region:'center',border:false">
				<table id="resultId" name='resultId'>
				</table>
			</div>
	    </div>
	<div id="dlg_deal" class="easyui-dialog" fit="true" style="width: 100%; height: 100%; padding: 0px 0px" closed="true" buttons="#dlg-buttons">
			<iframe scrolling="auto" id="if_deal" frameborder="0" src="" style="width: 100%; height: 100%;"></iframe>
	</div>
	<div id="dlg_check" style="display:none">
			<div>消息内容：</div>
			<input type="hidden" name="in_send_type" id="in_send_type" value="user"/>

			<div style="text-align:center; margin-bottom:12px;">
		 	 <textarea name="mem" id="mem" cols="45" rows="8"></textarea>
		 	 </div>
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
				<td><textarea  cols="25" rows="6" id="in_sms_content" name="in_sms_content" class="easyui-validatebox" data-options="required:true,missingMessage:'输入短信内容'"></textarea>
				</td>
			</tr>
		</table>
	</form>
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
		<%
		  for(Iterator it=adminList.iterator();it.hasNext();){
		  	HashMap row = (HashMap)it.next();
		%>
			<option value="<%=row.get("user_code") %>"><%=row.get("user_name") %>(<%=row.get("user_id") %>)</option>
		<%}
		%>
		</select>
		</div>
	</form>
	</div>
	
  </body>
</html>
