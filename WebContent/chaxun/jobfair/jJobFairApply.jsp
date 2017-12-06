<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.factory.AdminLoginModel" %>
<%@ include file="../checkLogin.jsp" %>
<%
	AdminLoginModel adminModel=new AdminLoginModel();
	List adminList = adminModel.getSelfAdminList(user_code);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>游客预定招聘会管理</title>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<script type="text/javascript">
		var cur_path = "<%=request.getContextPath()%>";
		var querystr="&in_role_id=<%=role_id%>";
	</script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"  charset="UTF-8"></script>
	<script type="text/javascript" src="JobFairApply.js"  charset="UTF-8"></script>
  		<style type="text/css">
			.datagrid td label{
				vertical-align:top;
			}
			.detail-dlg {
			}
			.detail-dlg p,.detail-dlg h6{ margin:0 auto;}
			.detail-dlg p {text-indent:2em;}
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
	    
		<div id="dd">
		
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
	
	<div id="deal_apply" style="display:none">
	<form id="fm3" method="post"  name="fm3">
		<input type="hidden" name="in_apply_id" value="" />
		<div style="padding:10px;">
		<p>回访结果:</p>
		<textarea rows="8" cols="50" name="in_remark"></textarea>
		</div>
	</form>
	</div>
  </body>
</html>
