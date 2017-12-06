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
		var base_type="<%=request.getParameter("base_type")%>";
	</script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"></script>
	<script type="text/javascript" src="BaseCode.js" charset="UTF-8"></script>
  </head>
  
  <body>
	<div class="easyui-layout" style="width:100%;height: 350px;" data-options="fit:true,border:false">
			<div data-options="region:'center',split:true,border:false">
				<table id="resultId" name='resultId'>
				</table>
			</div>
	</div>
	<div id="dlg_deal" class="easyui-dialog" fit="true" style="width: 100%; height: 100%; padding: 0px 0px" closed="true" buttons="#dlg-buttons">
			<iframe scrolling="auto" id="if_deal" frameborder="0" src="" style="width: 100%; height: 100%;"></iframe>
	</div>
	<div id="edit" class="easyui-window" title="会员类型" data-options="modal:true,closed:true,minimizable:false,maximizable:false" style="width:720px;height:360px;padding:10px 20px 10px 20px;">
		<form id="fm" method="post"  name="fm">
		<table>
		<tr><td colspan="2">
			<input type="hidden" id="in_action" name="in_action" value="save" />
			编码：<input  class="easyui-validatebox" id="in_type_code" name="in_type_code" required="true"/>
			&nbsp;
			名称：<input  class="easyui-validatebox" id="in_type_name" name="in_type_name" required="true"/>
			&nbsp;
			排序：<input  class="easyui-validatebox"  id="in_type_no" name="in_type_no" required="true"/>
			</td></tr>
			<tr><td>
			<fieldset>
			<legend>普通会员点数规则：</legend>
			申请招聘会：
			<input  class="easyui-numberbox" value="0" data-options="min:0,precision:0,required:true" id="in_points1" name="in_points1"/>
			<br/>
			申请失败退点：
			<input  class="easyui-numberbox" value="0" data-options="min:0,precision:0,required:true" id="in_points2" name="in_points2"/>
		    <br/>
			同意学校邀请：
			<input  class="easyui-numberbox" value="0" data-options="min:0,precision:0,required:true" id="in_points3" name="in_points3"/>
		    <br/>
			发一场招聘会：
			<input  class="easyui-numberbox" value="0" data-options="min:0,precision:0,required:true"  id="in_points4" name="in_points4"/>
		    <!--  
		    <br/>
			信息通过审核：
			<input  class="easyui-numberbox" value="0" data-options="min:0,precision:0,required:true"  id="in_points5" name="in_points5"/>
		    -->
		    <br/>
			发布一个职位：
			<input  class="easyui-numberbox" value="0" data-options="min:0,precision:0,required:true"  id="in_points8" name="in_points8"/>
		    <br/>
			下载一份简历：
			<input  class="easyui-numberbox" value="0" data-options="min:0,precision:0,required:true"  id="in_points9" name="in_points9"/>
	
			</fieldset>
	    	</td><td valign="top" style="padding-left:15px;">
	    	<fieldset>
	    	<legend>套餐会员：</legend>
			参加校园招聘场次：
			<input  class="easyui-numberbox" value="0" data-options="min:0,precision:0,required:true"  id="in_multiple" name="in_multiple"/>
		    <br/>
			发布招聘会数量：
			<input  class="easyui-numberbox" value="0" data-options="min:0,precision:0,required:true"  id="in_organises" name="in_organises"/>
			<br/>
			发布职位数量：
			<input  class="easyui-numberbox" value="0" data-options="min:0,precision:0,required:true"  id="in_recruit" name="in_recruit"/>
		    <br/>
			下载简历量：
			<input  class="easyui-numberbox" value="0" data-options="min:0,precision:0,required:true"  id="in_resume" name="in_resume"/>

	    	</fieldset>
	    	<fieldset style="margin-top:5px;">
	    	<legend>付费方式</legend>
	    				
			<label>
			<input type="radio" value="1" name="in_chargetype" checked="checked" />普通会员</label>
			<label>
			<input type="radio" value="3" name="in_chargetype" />  招聘会套餐会员</label>
	    	
	    	</fieldset>
	    	
	    	</td></tr></table>
		    <div style="align:center;">
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_save" id="btn_save">确定</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_return" id="btn_return">取消</a>
		    </div>
		</form>
	</div>
  </body>
</html>
