<%@ page language="java" pageEncoding="UTF-8"%>
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
	</script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"  charset="UTF-8"></script>
	<script type="text/javascript" src="./BaseProcMethod.js" charset="UTF-8"></script>
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
 	<div id="edit" class="easyui-window" title="存储管理" data-options="modal:true,closed:true" style="width:360px;height:470px;padding:10px 20px 10px 20px;">
		<form id="fm" method="post"  name="fm">
			<input type="hidden" id="in_action" name="in_action" value="save" />
			方法ID：<input  class="easyui-validatebox" disabled="true" id="in_method_code" name="in_method_code"/>
			<br/>
			方法名称：<input  class="easyui-validatebox" id="in_method_name" name="in_method_name" required="true"/>
			<br/>
			对应存储：<input  class="easyui-validatebox"  id="in_method_proc" name="in_method_proc" required="true"/>
			<br/>
			参数个数：<input  class="easyui-validatebox" id="in_method_proc_arguments" name="in_method_proc_arguments"/>
			<br/>
			入参名称：<input  class="easyui-validatebox"  id="in_method_proc_in" name="in_method_proc_in"/>
		    <br/>
			出参名称(游标)：<input  class="easyui-validatebox"  id="in_method_proc_out_cursor" name="in_method_proc_out_cursor"/>
		    <br/>
			出参名称(字符型)：<input  class="easyui-validatebox"  id="in_method_proc_out_string" name="in_method_proc_out_string"/>
		    <br/>
			方法描述：<input  class="easyui-validatebox"  id="in_method_mem" name="in_method_mem"/>
		    <br/>
			页面转向：<input  class="easyui-validatebox"  id="in_forward" name="in_forward"/>
		    <br/>
			类的内部页面转向：<input  class="easyui-validatebox"  id="in_pageforward" name="in_pageforward"/>
		    <br/>
			转向（class/jsp）：<input  class="easyui-validatebox"  id="in_forwardtype" name="in_forwardtype"/>
			<br/>
			返回类型：<input  class="easyui-validatebox" id="in_return_type" name="in_return_type"/>
			<br/>
			状态：<input  class="easyui-validatebox"  id="in_method_status" name="in_method_status"/>
		    <br/>
			memo1：<input  class="easyui-validatebox"  id="in_memo1" name="in_memo1"/>
		    <br/>
			memo2：<input  class="easyui-validatebox"  id="in_memo2" name="in_memo2"/>
		    <br/>
			memo3：<input  class="easyui-validatebox"  id="in_memo3" name="in_memo3"/>
		    <br/>
			memo4：<input  class="easyui-validatebox"  id="in_memo4" name="in_memo4"/>
		    <br/>
			memo5：<input  class="easyui-validatebox"  id="in_memo5" name="in_memo5"/>
		    <br/>
		    
		    
		    <div style="align:center;">
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_save" id="btn_save">确定</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_return" id="btn_return">取消</a>
		    </div>
		</form>
	</div>
  </body>
</html>
