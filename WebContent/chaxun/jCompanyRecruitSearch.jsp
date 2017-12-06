<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="checkLogin.jsp" %>
<%
String id=request.getParameter("id");
%>
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
		var company_id = "<%=id%>";
		var member_expire=false;
	</script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"></script>
	<script type="text/javascript" src="CompanyRecruit.js" charset="UTF-8"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/bootstrap/panel.css" type="text/css"></link>
   <link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/bootstrap/window.css" type="text/css"></link>
  <style>
  .datagrid-btable a.recruit {color: inherit;text-decoration:none;}
  .datagrid-btable a.recruit:hover{text-decoration:underline;}
  </style>
  </head>
  
  <body>
		<div class="easyui-layout" style="width: 100%; height: 350px;" data-options="fit:true,border:false">
			<div data-options="region:'center',split:true,border:false">
				<table id="resultId" name='resultId'>
				</table>
			</div>
	    </div>
		<div id="dlg_deal" class="easyui-dialog" fit="true" style="width: 100%; height: 100%; padding: 0px 0px" closed="true" buttons="#dlg-buttons">
			<iframe scrolling="auto" id="if_deal" frameborder="0" src="" style="width: 100%; height: 100%;"></iframe>
		</div>
		<div id="recruitHurry" class="easyui-window" title="紧急招聘" collapsible="false" minimizable="false" 
        maximizable="false" data-options="closed: true" style="width: 300px; height: 175px; padding: 5px;
        background: #fafafa;">
        	<div class="easyui-layout" fit="true">
        		<div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
				<form method="post" id="apply_hurry_form" name="apply_hurry_form" action="<%=request.getContextPath()%>/company/hurryRecruit.do">
				<input class="job_id"  name="job_id" type="hidden"  />
				<input class="is_hurry"  name="is_hurry"  type="hidden"  />
				<table><tr><td>
				推广职位：<label class="position">职位</label>
				</td></tr><td>
						<input type="hidden" name="begin_date" id="hurry_begin_input"  />
						<input type="hidden" name="hurry_price" id="hurry_price"  />
				推广日期：<input class="easyui-datebox"  data-options="editable:false" id="hurry_begin" name="hurry_begin" />
						-
						<input class="easyui-datebox"  id="hurry_end"   name="end_date"/><br/>
				</td></tr><td>
				需要点数：<label id="hurry_need_points">0</label>
				</td></tr></table>
				</form>
				</div>
			    <div region="south" border="false" style="text-align: right; height: 30px; line-height: 20px;">
			    <a id="hurry_btnEp" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)"  onclick="submitHurryApply();"> 确定</a>
			    <a id="hurry_btnCancel" class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0)" onclick="closeHurryWindow();">取消</a>
			    </div>
			</div>
		</div>
  </body>
</html>
