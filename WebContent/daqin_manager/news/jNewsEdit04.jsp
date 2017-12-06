<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>
<%@page import="com.zhaopin.dao.factory.NewsModel"%>
<%@ taglib uri="TreeTag" prefix="t" %>
<%
NewsModel model=new NewsModel();
String content=""; 
content=model.getNewsContent( request.getParameter("id") );
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>无标题文档</title>
<script type="text/javascript">
	var cur_path = "<%=request.getContextPath()%>";
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"></script>
<script type="text/javascript" src="NewsEdit04.js"  charset="utf-8"></script>
<script type="text/javascript">
	var gi_pagesize = <%=request.getParameter("pagesize")%>;
	var gi_pagenum = <%=request.getParameter("pagenum")%>;
	var gi_currentnum = <%=request.getParameter("currentnum")%>;
	var id = "<%=request.getParameter("id")%>";
	var status = "<%=request.getParameter("status")%>";
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
	<input type="hidden" name="in_id" id="in_id" value="<%=request.getParameter("id") %>"/>
	<input type="hidden" name="in_status" id="in_status" value="<%=request.getParameter("status") %>"/>
	<input type="hidden" name="in_news_display" id="in_news_display" />
	<input id="in_news_type" name="in_news_type" type="hidden" value="news_type03"  />

<table width="100%" border="0" cellspacing="0" cellpadding="0">

	<tr>
		<td class="tabright" width="10%">标题：</td>
		<td width="90%">
		<input id="in_sub_type" name="in_sub_type" class="easyui-validatebox"  />
		<input id="in_news_title" name="in_news_title" class="easyui-validatebox inputbox" required="true"/></td>
	</tr>

	<tr>
		<td class="tabright">图片：</td>
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
		<td><FCK:editor instanceName="news_content"  height="400px">
				<jsp:attribute name="value">    
                   <%=content %>
                </jsp:attribute>
		</FCK:editor>
		</td>
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
	        // [ id, name, pid checked ]
	        String news_id=request.getParameter("id");
			String sql="select a.*,decode(b.area_id,null,'false','true') checked from ("+
			" select '0' id,'总站' name,null pid from dual union all "+ 
			"      select id id,name name ,null pid from tbl_area where parent_id=0 ) a "+
			" left join "+
			" ( select column_value area_id from table ( "+
			" select fn_split(area_id,',') from tbl_news where news_id='"+news_id+"' "+
			" )   ) b on a.id=b.area_id order by id asc";
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
