<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/checkLogin.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
		var cur_path = "<%=request.getContextPath()%>";
		var querystr="&in_r=zk&in_user_code=<%=user_code%>";
	</script>
<script type="text/javascript" src="../js/in_common.js" charset="utf-8"></script>
<script type="text/javascript" src="Message.js" charset="utf-8"></script>

  </head>
  
  <body>      
  <div class="easyui-layout" style="width: 100%; height: 350px;" data-options="fit:true,border:false">
				<div data-options="region:'center',split:false,border:false">
					<table id="notice" name='notice'>
					</table>
				</div>
  </div>
  
	<div id="dlg_check" style="display:none">
			<div>消息内容：</div>
			<input type="hidden" name="in_send_type" id="in_send_type" value="zk"/>
			<input type="hidden" name="in_user_code" id="in_user_code" value="<%=user_code %>"/>

			<div style="text-align:center; margin-bottom:12px;">
		 	 <textarea name="mem" id="mem" cols="45" rows="8"></textarea>
		 	 </div>
	</div>
	</body>
</html>
