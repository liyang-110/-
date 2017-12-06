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
	    var is_agent = <%=("00".equals(role_id) )?"false":"true" %>
	</script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"></script>
	<script type="text/javascript" src="./AreaPoints.js" charset="UTF-8"></script>
  </head>
  
  <body>
		<div class="easyui-layout" style="width: 100%; height: 350px;" data-options="fit:true">
					
			<div data-options="region:'center',border:false">
				<table id="resultId" name='resultId'>
				</table>
			</div>
	    </div>
		<div id="dlg_deal" class="easyui-dialog" fit="true" style="width: 100%; height: 100%; padding: 0px 0px" closed="true" buttons="#dlg-buttons">
			<iframe scrolling="auto" id="if_deal" frameborder="0" src="" style="width: 100%; height: 100%;"></iframe>
		</div>
		
 	<div id="w1" class="easyui-window" title="行业选择" data-options="modal:true,closed:true" style="width:690px;height:370px;padding:10px;">
		<iframe  frameborder="0" id="add"  scrolling="hidden" src="" width="100%" height="630"></iframe>
	</div> <!-- id="w1" -->
 	<div id="edit" class="easyui-window" title="修改点数" data-options="modal:true,closed:true" style="width:300px;height:200px;padding:10px 20px 10px 20px;">
		<form id="fm" method="post"  name="fm">
			<input type="hidden" id="in_id" name="in_id"/>
			地区：<input  class="easyui-validatebox" disabled="true" id="in_name" name="in_name"/>
			<br/>
			企业点数：<input  class="easyui-numberbox" data-options="min:0,precision:0" id="in_company_points" name="in_company_points" required="true"/>
			<br/>
			学校点数：<input  class="easyui-numberbox" data-options="min:0,precision:0" id="in_school_points" name="in_school_points" required="true"/>
			<br/>
			开始：<input  class="easyui-datebox" id="in_begin_date" name="in_begin_date"/>
			<br/>
			截止：<input  class="easyui-datebox"  id="in_end_date" name="in_end_date"/>
		    <br/>
		    <div style="align:center;">
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_save" id="btn_save">确定</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_return" id="btn_return">取消</a>
		    </div>
		</form>
	</div>
  </body>
</html>
