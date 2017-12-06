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
	<script type="text/javascript" src="CardOrder.js" charset="UTF-8"></script>
 <style type="text/css">
 	a {color:#000;}
 </style>
 </head>
  
  <body>
		<div class="easyui-layout" style="width: 100%; height: 330px;" data-options="fit:true,border:false">
			<div data-options="region:'north',border : false" style="background:#F4F4F4;">
		        <div style="padding:5px 0 0px 20px;">
		       		<form name="fm" id="fm" method="post">
					券卡名称：
		            <input id="in_card_name" name="in_card_name" class="easyui-validatebox"/>
		                                   学生名称：
		            <input id="in_student_name" name="in_student_name" class="easyui-validatebox"/>                                                 
		                                    客户名称：
		            <input id="in_customer" name="in_customer" class="easyui-validatebox"/>
		                                   券卡类型：
		            <select name="in_type_id" class="easyui-combobox">
		            	<option value="">全部</option>
						<option value="ed78b28d-6c5a-4a6d-a8fc-965772a684f2">就业服务</option>
						<option value="c28854f5-0557-4b4a-8fd1-c500c8b2141b">技能培训</option>
				   	    <option value="23eb4ee8-20c4-4a82-85a0-4c7089266b6e">其他</option>
					</select>
					<a href="javascript:;" id="searchAndreloadData" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
		           
		            </form>
		        </div>
	    
			</div>
			<div data-options="region:'center',split:false,border : false">
				<table id="resultId" name='resultId'>
				</table>
			</div>
	    </div>
		<!-- <div id="dlg_deal" class="easyui-dialog" fit="true" style="width: 100%; height: 100%; padding: 0px 0px" closed="true" buttons="#dlg-buttons">
			<iframe scrolling="auto" id="if_deal" frameborder="0" src="" style="width: 100%; height: 100%;"></iframe>
		</div>
		<div id="dlg_check" style="display:none">
			<div>批注意见：</div>
			<div style="text-align:center; margin-bottom:12px;">
		 	 	<textarea name="mem" id="mem" cols="45" rows="8"></textarea>
		 	</div>
		</div>
		<div id="w1" class="easyui-window" title="查看详情页" data-options="modal:true,closed:true" style="width:690px;height:370px;padding:10px;">
			<iframe  frameborder="0" id="see_win"  scrolling="hidden" src="" width="100%" height="100%"></iframe>
		</div> id="w1" -->
  </body>
</html>
