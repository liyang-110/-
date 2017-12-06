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
		var user_code = "<%=user_code%>";
		var role_id="<%=role_id%>";		
	</script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"  charset="utf-8"></script>
	<script type="text/javascript" src="Login.js"  charset="utf-8"></script>
  </head>
  
  <body>
		<div class="easyui-layout" style="width: 100%; height: 350px;" data-options="fit:true">
			
		<div data-options="region:'north',border : false" style="background:#F4F4F4;">
	        <div style="padding:10px 0 10px 20px;">
	        	<form id="fm" name="fm" method="post">
	        	账号：
	        	<input id="in_user_id" name="in_user_id" class="easyui-validatebox"/>
	       		姓名：
	            <input id="in_user_name" name="in_user_name" class="easyui-validatebox"/>
	      		手机：
	            <input id="in_user_tel" name="in_user_tel" class="easyui-validatebox"/>
	      		QQ：
	            <input id="in_user_qq" name="in_user_qq" class="easyui-validatebox"/>
	       		邮箱：
	            <input id="in_user_email" name="in_user_email" class="easyui-validatebox"/>
	       		<%-- 
	       		注册时间: 
	       		<input  id="in_job_add_time_1" class="easyui-datebox" style="width:100px" />
	            -- <input id="in_job_add_time_2" class="easyui-datebox" style="width:100px" />
	            --%>
	            <a href="javascript:;" id="searchAndreloadData" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
	        	</form>
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
<div id="edit" class="easyui-window" title="充点" data-options="modal:true,closed:true,minimizable:false,maximizable:false" style="width:290px;height:180px;padding:10px 20px 10px 20px;">
		<form id="fm" method="post"  name="fm">
			<input type="hidden" id="in_id" name="in_id"/>
			<table><tr><td>
			用户帐号：</td><td>
			<input  class="easyui-validatebox" disabled="true" id="in_user_id" name="in_user_id"/>
			</td></tr><tr><td>
			充值企业点：</td><td>
			<input  class="easyui-numberbox" data-options="min:0,precision:0" id="in_company_points" value="0" name="in_company_points" required="true"/>
			</td></tr><tr><td>
			充值学校点：</td><td>
			<input  class="easyui-numberbox" data-options="min:0,precision:0" id="in_school_points"  value="0"  name="in_school_points" required="true"/>
		    </td></tr><tr><td colspan="2">
		    <div style="width:135px; margin:auto;">
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_save" id="btn_save">确定</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_return" id="btn_return">取消</a>
		    </div>
		    </td></tr></table>
		</form>
	</div>
 	<div id="w1" class="easyui-window" title="行业选择" data-options="modal:true,closed:true" style="width:690px;height:370px;padding:10px;">
		<iframe  frameborder="0" id="add"  scrolling="hidden" src="" width="100%" height="300"></iframe>
	</div> <!-- id="w1" -->
	<div id="dlg_check2" style="display:none">
	<form id="fm2" method="post"  name="fm">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="70" align="right">手机号：</td>
				<td><input id="in_sms_to" name="in_sms_to"  class="easyui-numberbox" data-options="required:true,missingMessage:'输入手机号',invalidMessage:'请输入11位手机号',validType:'length[11,11]' "/></td>
			</tr>
			<tr>
				<td align="right">内容：</td>
				<td><textarea  cols="25" rows="6" id="in_sms_content" name="in_sms_content" class="easyui-validatebox" data-options="required:true,missingMessage:'输入短信内容'"></textarea>
				</td>
			</tr>
		</table>
	</form>
	</div>
	<div id="dlg_sms_account" style="display:none">
	<style type="text/css">
		.easy-form tr>td:first-child {width:120px;text-align:right;}
		.easy-form tr td {padding-top:5px;padding-bottom:5px;}
	</style>
	<form id="setSmsAccountForm" method="post"  name="fm" class="easy-form">
		<input type="hidden" name="in_user_code" />
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td>累计发送短信：</td>
				<td><input id="in_sms_used" name="in_sms_used" readonly="readonly" class="easyui-numberbox" data-options="disabled:true"/></td>
			</tr>
			<tr>
				<td>帐户短信余量：</td>
				<td><input id="in_sms_last" name="in_sms_last" readonly="readonly" class="easyui-numberbox" data-options="disabled:true" /></td>
			</tr>
			<tr>
				<td>充值短信条数：</td>
				<td><input id="in_sms_add" name="in_sms_add"  value="0" class="easyui-numberbox" data-options="required:true,missingMessage:'充值短信条数',invalidMessage:'充值短信条数' "/></td>
			</tr>
		</table>
	</form>
	</div>
<script type="text/javascript">
function industry(){
	var li_currentnum =0; //当前行
	var li_pagesize   =0; //每页行数
	var li_pagenum    =0; //页码
	
	var lo_selected;      //当前选中行
    var lo_pg;            //分页对象
	var ls_id="";	  //

    //得到选中行对象 code:请选择一行用户信息！
    lo_selected   = getCheckObj('resultId','请选择一行信息！');   
    if(lo_selected.length!=1){
    	$.messager.alert('提示信息','请选择一行来查看！','info');
    	return false;
    }else{
	    ls_id     = lo_selected[0].role_id;
	    
	    if(ls_id==role_id){
	    	$.messager.alert('提示信息','您不能修改自己账户的角色权限！','info');
	    	return false;
	    }
	    li_currentnum = $("#resultId").datagrid("getRowIndex",lo_selected[0]);
        lo_pg         = $("#resultId").datagrid("getPager");
        li_pagenum    = lo_pg.pagination('options').pageNumber;

        // $('#if_deal')[0].src='./jRoleMenu.jsp?id='+ls_id+'&in_pagesize=' + li_pagesize+'&in_pagenum=' + li_pagenum+'&in_currentnum=' +li_currentnum +"&date="+new Date();
		$('#w1').window('open');
		$('#add').attr("src","../substation.do?method=Industry&id="+ls_id);  
    }
}
function close(){
	$('#w1').window('close');
}
	
	</script>
  </body>
</html>
