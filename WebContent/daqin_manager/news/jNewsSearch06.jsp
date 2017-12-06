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
	<script type="text/javascript" src="news06.js" charset="UTF-8"></script>
	 <style type="text/css">
	 	a {color:#000;}
	 </style>
 </head>
  
  <body>
		<div class="easyui-layout" style="width: 100%; height: 350px;" data-options="fit:true,border:false">
<div data-options="region:'north',border : false" style="background:#F4F4F4;">
		        <div style="padding:5px 0 0px 20px;">
		       		<form name="fm" id="fm" method="post">
					标题：
		            <input id="in_news_title" name="in_news_title" class="easyui-validatebox"/>
		            <a href="javascript:;" id="searchAndreloadData" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
		           
		            </form>
		        </div>
	    
			</div>
			<div data-options="region:'center',split:false,border : false">
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
  </body>
</html>
