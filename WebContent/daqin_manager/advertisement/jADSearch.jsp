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
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"></script>
	<script type="text/javascript" src="AD.js" charset="UTF-8"></script>
	<style>
	.green {color:green;}
	.red {color:red;}
	</style>
  </head>
  
  <body>
		<div class="easyui-layout" style="width: 100%; height: 320px;" data-options="fit:true,border:false">
		<div data-options="region:'north',border : false" style="background:#F4F4F4;">
        <div style="padding:10px 0 0 20px;">
        <form id="fm" name="fm" method="post">
	地区：
   <input id="in_area_id" name="in_area_id" class="easyui-validatebox" />

   文本：
    <input id="in_ad_title" name="in_ad_title" class="easyui-validatebox" />
	添加日期: <input  id="in_add_time_1" name="in_add_time_1" class="easyui-datebox" style="width:100px" />
     -- <input id="in_add_time_2" name="in_add_time_2" class="easyui-datebox" style="width:100px" />
     
     <br/>
	  开始日期：<input  id="in_begindate_1" name="in_begindate_1" class="easyui-datebox" style="width:100px" />
	     -- <input id="in_begindate_2" name="in_begindate_2" class="easyui-datebox" style="width:100px" />
	 
	  截止日期：<input  id="in_enddate_1" name="in_enddate_1" class="easyui-datebox" style="width:100px" />
	     -- <input id="in_enddate_2" name="in_enddate_2" class="easyui-datebox" style="width:100px" />
	 
	<a href="javascript:void(0);" id="searchAndreloadData" class="easyui-linkbutton" iconCls="icon-search">检索</a>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<label><input value="1" name="in_show_all" type="checkbox"  onclick="$('#searchAndreloadData').trigger('click');"/>显示已过期</label>

			</form>
			
			</div>
	</div>
			<div data-options="region:'center',border : false">
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
