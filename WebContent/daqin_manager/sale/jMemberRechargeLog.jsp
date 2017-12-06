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
	    var user_code ="<%=user_code%>";
	    var role_id ="<%=role_id%>";
	</script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"></script>
	<script type="text/javascript" src="MemberRechargeLog.js" charset="utf-8"></script>
  </head>
  
  <body>
	<div class="easyui-layout" style="width: 100%; height: 350px;" data-options="fit:true">
		<!--搜索区  -->
		<div data-options="region:'north',border : false" style="background:#F4F4F4;">
        	<div style="padding:10px 0 0 20px;">
    			<form name="fm" id="fm" method="post">
    			操作时间：
   				<input  id="in_operation_time" name="in_operation_time" class="easyui-datebox"/>
				管理员名称：
   				<input id="in_admin_name" name="in_admin_name" class="easyui-validatebox" />
       			用户名称：
   				<input id="in_user_name" name="in_user_name" class="easyui-validatebox"/>
   				会员类型：
   				<input id="in_member_type" name="in_member_type" class="easyui-validatebox"/>
   				<br/>
       			会员起止时间: 
       			<input  id="in_begin_date" name="in_begin_date" class="easyui-datebox" />
            	-- <input id="in_end_date" name="in_end_date" class="easyui-datebox" />
       		
            	<a href="javascript:void(0);" id="searchAndreloadData" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
            	<label>
            		<input type="checkbox" name="in_admin_id" value="0" />仅显示在线充值记录
            	</label>
			</form>          
        	</div>
		</div>
		<!--列表区  -->
		<div data-options="region:'center',border:false">
			<table id="resultId" name='resultId'>
			</table>
		</div>
	</div>
</body>
</html>
