<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="TreeTag" prefix="t" %>
<%@ include file="../include/checkLogin.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>无标题文档</title>
<script type="text/javascript">
	var cur_path = "<%=request.getContextPath()%>";
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js" charset="utf-8"></script>
<script type="text/javascript" src="./RoleMenu.js"  charset="utf-8"></script>
<script type="text/javascript">
	var gi_pagesize = <%=request.getParameter("pagesize")%>;
	var gi_pagenum = <%=request.getParameter("pagenum")%>;
	var gi_currentnum = <%=request.getParameter("currentnum")%>;
</script>
	<script type="text/javascript">
function zTreeOnCheck(event, treeId, treeNode) {
}
function treeNodeToggle(event, treeId, node, clickFlag){
}
</script>
</head>

<body>
	<div style="margin:10px auto -10px 10px;">
				<a href="javascript:;" onclick="expandTree( true );return false;">全部展开</a>
				<a href="javascript:;" onclick="expandTree( false );return false;">全部收起</a>
	</div>
<%
      // String sql="select menu_id id,menu_name name,parent_id pid from tbl_menu";
       String p_role_id=request.getParameter("id");
	  String table="select a.menu_id  id,a.menu_name name,a.parent_id pid,"+
	  			" decode(r.role_id,null,'false','true') checked from tbl_admin_menu a , "+
	  			" ( select role_id,menu_id from tbl_role_menu where role_id='"+p_role_id+"') r "+
				" where a.menu_id=r.menu_id(+) order by a.menu_id asc ";
          String sql="select id,name,pid,checked "+ 
          		" from ("+table+") t where "+
				" exists (select menu_id from (select b.menu_id from tbl_admin_login a,tbl_role_menu b "+
				" where a.role_id(+)=b.role_id "+
				" and a.user_code='"+user_code+"') where menu_id=t.id) ";
   %>
  <t:TreeTag className="com.zhaopin.tree.RoleAreaTreeConfig" 
  documentObject="parent.document.getElementById('mainFrame')" 
  queryDataURL=""
   isNeedButton="1" 
   cssName="width:450px;border:0" 
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
<form id="fm" method="post"  name="fm">
		<input id="in_role_id" name="in_role_id" value="<%=p_role_id %>" type="hidden"/>
		<input id="in_menu_ids" name="in_menu_ids" value="" type="hidden"/>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td align="center">
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_save" id="btn_save">确定</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_return" id="btn_return">取消</a></td>
	</tr>
</table>
</form>
</body>
</html>
