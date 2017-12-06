<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.zhaopin.dao.factory.BaseCodeModel"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>
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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"></script>
<script type="text/javascript" src="NewsAdd.js"  charset="utf-8"></script>
<script type="text/javascript">
	var gi_pagesize = <%=request.getParameter("pagesize")%>;
	var gi_pagenum = <%=request.getParameter("pagenum")%>;
	var gi_currentnum = <%=request.getParameter("currentnum")%>;
	var role_id ="<%=role_id%>";
	var user_code = "<%=user_code%>";
	function fileup(){
    	window.open('<%=request.getContextPath()%>/base/file/jUploadFile.jsp?text_new_name=file_id&text_old_name=file_name','附件上传','status=no,menubar=no,toolbar=no,dependent=yes,width=600,height=500,left=230,top=130')
    }
</script>
<style type="text/css">
	#fm table .tabright {width:10%;vertical-align: middle;}
	.ztree li {float:left;width:102px;}
</style>
</head>

<body>
<form id="fm" method="post"  name="fm">
		<input type="hidden" id="in_role_id" name="in_role_id" value="<%=role_id %>"/>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td class="tabright" width="10%">新闻标题：</td>
		<td width="90%">
		<input id="in_news_title" name="in_news_title" class="easyui-validatebox inputbox" data-options="required:true,missingMessage:'请输入新闻标题' "/></td>
	</tr>
	<tr>
		<td class="tabright">类别：</td>
		<td><input id="in_news_type" name="in_news_type" class="easyui-validatebox"  /></td>
	</tr>
	<tr>
		<td class="tabright">上传图片：</td>
		<td><input name="uploadusername" type="hidden"   id="uploadusername" value="loader"/>
					<input name="file_name" type="text" readonly id="file_name" style="width: 300px;"/>
					<input type="hidden" name="file_id" id="file_id"/>
					<input type="hidden" name="uploadmethod" id="uploadmethod" value="false"/>
					<input name="Submit43" type="button" class="sbttn_select" value=" 选择 " onClick="fileup()"/>
					<input name="uploadfileid" type="hidden"   id="uploadfileid" style="width: 200px;"/></td>
	</tr>
	<tr style="display:none">
		<td class="tabright">重要性：</td>
		<td><input id="in_news_level" name="in_news_level" class="easyui-validatebox"/></td>
	</tr>
	<tr>
		<td class="tabright">作者：</td>
		<td><input id="in_news_author" name="in_news_author" class="easyui-validatebox inputbox"/></td>
	</tr>
	<tr>
		<td class="tabright">来源：</td>
		<td><input id="in_news_source" name="in_news_source" class="easyui-validatebox inputbox"/></td>
	</tr>
	<tr>
		<td class="tabright">新闻内容：</td>
		<td><FCK:editor instanceName="news_content" height="400px">
			<jsp:attribute name="value"></jsp:attribute>
		</FCK:editor></td>
	</tr>
	<tr>
		<td class="tabright">显示站点：<br/>
			<a href="javascript:void(0);" onclick="zTreeSelectAll('myTree',true);return false;">全选</a>
			<a href="javascript:void(0);" onclick="zTreeSelectAll('myTree',false);return false;">取消</a>
			<span>&nbsp;&nbsp;</span>
		</td>
		<td>
	<% //  if("00".equals(role_id) ) {%>
	<input type="hidden" id="in_area_id" name="in_area_id" />
	<%
	      // String sql="select menu_id id,menu_name name,parent_id pid from tbl_menu";
			String sql="select '0' id,'总站' name,null pid,'false' checked from dual union all "+
			"select id id,name name ,null pid,'false' checked from tbl_area where parent_id=0";
	 %>
	  <t:TreeTag className="com.zhaopin.tree.RoleAreaTreeConfig" 
	  documentObject="parent.document.getElementById('mainFrame')" 
	  queryDataURL=""
	   isNeedButton="1" 
	   cssName="width:700px;border:0;height:120px;overflow: hidden;" 
	   displayText="testName" 
	   displayVlaue="testValue" 
	   getTreeValueStyle="2" 
	   isCheckBox="1" 
	   isAutoClose="1"
	   JSONDataFunctionName="getData" 
	   autoParam="type"
	   treeName="myTree"
	   treeNodeClickFunctionName="treeNodeToggle"
	   sql="<%=sql%>"
	   commitURL=""
	    />
		<% // } %>
		</td>
	</tr>
	<tr>
		<td></td>
		<td>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_save" id="btn_save">确定</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_return" id="btn_return">取消</a></td>
	</tr>
</table>
</form>
<div style="height:25px;"></div>
</body>
</html>
