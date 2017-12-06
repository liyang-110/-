<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="TreeTag" prefix="t" %>
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
	<script type="text/javascript" src="./Menu.js" charset="UTF-8"></script>
	<script type="text/javascript">
function zTreeOnCheck(event, treeId, treeNode) {
}
function treeNodeToggle(event, treeId, node, clickFlag){
}
</script>
  </head>
  <body>
		<div class="easyui-layout" style="width: 100%; height: 350px;" data-options="fit:true">
			
		<div data-options="region:'north',border : false" style="background:#F4F4F4;">
<div class="datagrid-toolbar">
<table cellspacing="0" cellpadding="0">
<tbody><tr>
<td><a href="javascript:void(0)" class="l-btn l-btn-plain" id="tree-add">
<span class="l-btn-left"><span class="l-btn-text icon-add l-btn-icon-left">添加</span>
</span></a></td>
<td><a href="javascript:void(0)" class="l-btn l-btn-plain" id="tree-edit">
<span class="l-btn-left"><span class="l-btn-text icon-edit l-btn-icon-left">修改</span>
</span></a>
</td><td><a href="javascript:void(0)" class="l-btn l-btn-plain" id="tree-del">
<span class="l-btn-left"><span class="l-btn-text icon-cancel1 l-btn-icon-left">删除</span>
</span></a></td>
</tr></tbody></table></div>  
		</div>
			
			<div data-options="region:'center',border:false">
				<div style="padding:10px 0 10px 50px;">
				<a href="javascript:;" onclick="expandTree( true );return false;">全部展开</a>
				<a href="javascript:;" onclick="expandTree( false );return false;">全部收起</a>
				<%
      // String sql="select menu_id id,menu_name name,parent_id pid from tbl_menu";
		String sql="select menu_id id ,"+
		       " menu_name ||'['||menu_url|| ']' name, "+
		      " parent_id pid from tbl_admin_menu";
   %>
  <t:TreeTag className="com.zhaopin.tree.RoleAreaTreeConfig" 
  documentObject="parent.document.getElementById('mainFrame')" 
  queryDataURL=""
   isNeedButton="1" 
   cssName="border:0; width:700px;" 
   displayText="testName" 
   displayVlaue="testValue" 
   getTreeValueStyle="2" 
   isCheckBox="1" 
   isAutoClose="1"
   JSONDataFunctionName="getData" 
   autoParam="type"
   treeName="myTree"
   treeNodeClickFunctionName="zTreeOnCheck"
   sql="<%=sql%>"
   commitURL=""
    />
				</div>
			</div>
	    </div>
		<div id="dlg_deal" class="easyui-dialog" fit="true" style="width: 100%; height: 100%; padding: 0px 0px" closed="true" buttons="#dlg-buttons">
			<iframe scrolling="auto" id="if_deal" frameborder="0" src="" style="width: 100%; height: 100%;"></iframe>
		</div>
  </body>
</html>
