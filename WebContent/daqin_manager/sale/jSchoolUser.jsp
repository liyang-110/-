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
		var role_id = "<%=role_id%>";
		var user_type = "school";
		var querystr="&in_role_id="+role_id+"&in_user_type="+user_type;
	</script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"></script>
	<script type="text/javascript" src="./SchoolUser.js" charset="UTF-8"></script>
   	<style>
	.green {color:green;}
	.red {color:red;}
	</style>
  </head>
  
  <body>
		<div class="easyui-layout" style="width: 100%; height: 350px;" data-options="fit:true,border:false">
			<div data-options="region:'north',border : false" style="background:#F4F4F4;">
		        <div style="padding:10px 0 10px 20px;">
		        	账号：
		        	<input id="in_user_id" name="in_user_id" class="easyui-validatebox"/>
		       姓名：
		            <input id="in_user_name" name="in_user_name" class="easyui-validatebox"/>
		       邮箱：
		            <input id="in_email" name="in_email" class="easyui-validatebox"/>
		       学校名称：
		            <input id="in_school_name" name="in_school_name" class="easyui-validatebox"/>
		       		 <br/>
		       注册时间: <input  id="in_add_time_1" name="in_add_time_1" class="easyui-datebox" style="width:100px" />
		            -- <input id="in_add_time_2" name="in_add_time_2" class="easyui-datebox" style="width:100px" />
		       会员到期: <input  id="in_end_date_1" name="in_end_date_1" class="easyui-datebox" style="width:100px" />
		            -- <input id="in_end_date_2" name="in_end_date_2" class="easyui-datebox" style="width:100px" />

		            <a href="#" id="searchAndreloadData" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
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
  </body>
</html>
