<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../checkLogin.jsp" %>
<%
String id="";
%>
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
		var id="<%=id%>";
		var user_id="<%=user_id%>";
	</script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"></script>
	<script type="text/javascript" src="SchoolGraduation.js" charset="utf-8"></script>
  	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/bootstrap/panel.css" type="text/css"></link>
	<script type="text/javascript">
	 $(function(){
	 		if( window!=top ){
	 			window.parent.$('body,html').animate({scrollTop:0},200);
				var ifram = parent.document.getElementById("rightFrm");
				$(ifram).attr("height",608); 
	 		}
	 });
	</script>
  </head>
  
  <body>      
	<div class="easyui-layout" style="width: 100%; height: 350px;" data-options="fit:true,border:false">
		<div data-options="region:'center',split:true,border:false">
			<table id="notice" name='notice'></table>
		</div>
	</div>
	<div id="toolbar" style="padding:10px 0 5px 20px;text-align:left;">
		<form id="fm" name="fm" method="post">
	          	学校名称：
	            <input type="text" id="in_school_name" name="in_school_name" class="easyui-validatebox"/>
	       		毕业时间：
	            <input type="text" id="in_graduation_time" name="in_graduation_time" class="easyui-validatebox"/>
	             <a href="#" id="searchAndreloadData" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
	        </form>
	</div>
	<div id="dlg_deal" class="easyui-window" title="企业查询窗口" data-options="modal:true,closed:true" style="width: 380px; height: 260px; padding: 0px 0px" buttons="#dlg-buttons">
		<iframe scrolling="auto" id="if_deal" frameborder="0" src="" style="width: 100%; height: 100%;"></iframe>
	</div>
	</body>
</html>
