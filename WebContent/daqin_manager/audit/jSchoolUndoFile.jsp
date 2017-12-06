<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../include/checkLogin.jsp" %>
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
	<script type="text/javascript" src="SchoolUndoFile.js" charset="utf-8"></script>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/bootstrap/panel.css" type="text/css"></link>

  </head>
  
  <body>      
  
  <div class="easyui-layout" style="width: 100%; height: 350px;" data-options="fit:true,border:false">
				<div data-options="region:'north',border:false">
			       <div style="padding:3px 0 2px 20px;    background: #F4F4F4;text-align:left;">
			        <form id="fm" name="fm" method="post">
			       学校名称：
			            <input type="text" id="in_school_name" name="in_school_name" class="easyui-validatebox"/>
			       招聘会名称：
			            <input type="text" id="in_jobfair_name" name="in_jobfair_name" class="easyui-validatebox"/>
			       招聘会时间: <input  id="in_jobfair_time_1" name="in_jobfair_time_1" class="easyui-datebox" style="width:100px" />
			            -- <input id="in_jobfair_time_2" name="in_jobfair_time_2" class="easyui-datebox" style="width:100px" />
						<br/>
			       企业名称：
			            <input type="text" id="in_company_name" name="in_company_name" class="easyui-validatebox"/>
			       申请时间: <input  id="in_add_time_1" name="in_add_time_1" class="easyui-datebox" style="width:100px" />
			            -- <input id="in_add_time_2" name="in_add_time_2" class="easyui-datebox" style="width:100px" />
						申请状态：
						   <select class="easyui-combobox" id="in_status" name="in_status" panelHeight="auto" style="width:100px;">
						        <option value="">请选择</option>
						        <option value="0">待审核</option>
						        <option value="1">待审核/逾期</option>
						        <option value="2">待审核/已满</option>
						        <option value="3">通过</option>
						        <option value="4">未通过</option>
						   </select>
			            <a href="#" id="searchAndreloadData" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
		
			        </form>
			        </div>
				</div>
				<div data-options="region:'center',border:false">
					<table id="resultId" name='resultId'>
					</table>
				</div>
   </div>
	<!-- 审核招聘会申请 -->
	<div id="dlg_deal" class="easyui-dialog" title="企业查询窗口" 
		data-options="modal:true,closed:true,maximizable:false,minimizable:false,width:380,height:240">
	 <div class="easyui-layout" fit="true">
	 	<div region="center" border="false" style="padding:2px; background: #fff; border: 1px solid #ccc;">
		 	 <form id="deal_form" method="post" action="">
		 	 <div style="line-height:25px;width:323px;margin:auto;">
		 	 <label class="company_name">陕西新才网络技术有限公司</label><br/>
		 	 <span style="color:green;">申请&nbsp;&nbsp;&nbsp;</span>
		 	 <label class="job_fair_name">网络视频招聘会</label><span class="remark" style="color:red;"></span>.
		 	 </div>
		 	 <div style="text-align:center;">
		 	 <textarea class="text_mem" name="mem" id="mem" cols="50" rows="6"></textarea>
		 	 </div>
		 	 <div style="width:323px;margin:auto;">
		 	 (不同意, 请输入原因)
		 	 </div>
		 	 </form>
	 	</div><!-- center -->
	 	<%-- 
	 	<div region="south" border="false" style="padding-top:3px;text-align: right; height: 30px; line-height: 20px;">
		 	 <a href="javascript:void(0)" class="easyui-linkbutton" onclick="auditForm('Y');" icon="icon-ok">同意</a>
		 	 <a href="javascript:void(0)" class="easyui-linkbutton" onclick="auditForm('N');" icon="icon-no">不同意</a>
		 	 <a href="javascript:void(0)" class="easyui-linkbutton" onclick="cancelWindow('dlg_deal');" icon="icon-cancel1">取消</a>
	 	</div><!-- south -->
	 	--%>
	 </div>
	</div>
</body>
</html>
