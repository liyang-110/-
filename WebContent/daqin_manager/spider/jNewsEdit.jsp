<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="com.zhaopin.dao.factory.SpiderTaskModel"%>
<%@ taglib uri="TreeTag" prefix="t" %>
<%@ include file="../include/checkLogin.jsp" %>
<%
SpiderTaskModel model=SpiderTaskModel.getInstance();
String content=""; 
content=model.getContent( request.getParameter("id") );
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>无标题文档</title>
<!-- ueditor -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.all.min.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8" src="/ueditor/lang/zh-cn/zh-cn.js"></script>
<!-- /ueditor -->
<script type="text/javascript">
	var cur_path = "<%=request.getContextPath()%>";
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"></script>
<script type="text/javascript" src="NewsEdit.js"  charset="utf-8"></script>
<script type="text/javascript">
	var gi_pagesize = <%=request.getParameter("pagesize")%>;
	var gi_pagenum = <%=request.getParameter("pagenum")%>;
	var gi_currentnum = <%=request.getParameter("currentnum")%>;
	var id = "<%=request.getParameter("id")%>";
	var status = "<%=request.getParameter("status")%>";
	function fileup(){
    	window.open('<%=request.getContextPath()%>/base/file/jUploadFile.jsp?text_new_name=file_id&text_old_name=file_name','附件上传','status=no,menubar=no,toolbar=no,dependent=yes,width=600,height=500,left=230,top=130')
    }
	var role_id ="<%=role_id%>";
	var user_code = "<%=user_code%>";
</script>
<style type="text/css">
	#fm table .tabright {width:10%;}
	.ztree li {float:left;width:102px;}
</style>
</head>

<body>
<form id="fm" method="post"  name="fm">
	<input type="hidden" name="in_spider_url" id="in_spider_url" value="<%=request.getParameter("id") %>"/>
	<input type="hidden" name="in_status" id="in_status" value="<%=request.getParameter("status") %>"/>
	<input type="hidden" name="in_news_display" id="in_news_display" />

<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td class="tabright" width="10%">标题：</td>
		<td width="90%">
		<input style="width:350px;" id="in_news_title" name="in_news_title" class="easyui-validatebox inputbox" required="true"/></td>
	</tr>
	<tr>
		<td class="tabright">类别：</td>
		<td>
		<input id="in_news_type" name="in_news_type" class="easyui-validatebox"  />
		<!--  
		<input id="in_sub_type" name="in_sub_type" class="easyui-validatebox"  />
		-->
		</td>
	</tr>
	<tr style="display:none;">
		<td class="tabright">图片：</td>
		<td><input name="uploadusername" type="hidden"   id="uploadusername" value="loader"/>
					<input name="file_name" type="text" readonly id="file_name" style="width: 300px;"/>
					<input type="hidden" name="file_id" id="file_id"/>
					<input type="hidden" name="uploadmethod" id="uploadmethod" value="false"/>
					<input name="Submit43" type="button" class="sbttn_select" value=" 选择 " onClick="fileup()"/>
					<input name="uploadfileid" type="hidden"   id="uploadfileid" style="width: 200px;"/></td>
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
		<td class="tabright">新闻内容：</td><td>&nbsp;</td>
	</tr>
	<tr>
		<td colspan="2" >
		<div style="width:90%;margin:auto;">
		<script id="editor"  name="news_content"  type="text/plain" style="width:100%;height:500px;">
			<%=content %>
		</script>
		</div>
		</td>
	</tr>
	<tr>
		<td style="text-align:right;vertical-align: middle;padding-top:0;">
			<div>
			显示站点：<br/>
			<a href="javascript:void(0);" onclick="zTreeSelectAll('myTree',true);return false;">全选</a>
			<a href="javascript:void(0);" onclick="zTreeSelectAll('myTree',false);return false;">取消</a>
			<span>&nbsp;&nbsp;</span>
			</div>
		</td>
		<td>
	<% //  if("00".equals(role_id) ) {%>
	<input type="hidden" id="in_area_id" name="in_area_id" />
	<%
	        // [ id, name, pid checked ]
	        String spider_url=request.getParameter("id");
			String sql="select a.*,decode(b.area_id,null,'false','true') checked from ("+
			" select '0' id,'总站' name,null pid from dual union all "+ 
			"      select id id,name name ,null pid from tbl_area where parent_id=0 ) a "+
			" left join "+
			" ( select id area_id from tbl_spider_task b1 left join tbl_area b2 "+
        	" on b1.area_name=b2.name where b1.spider_url='"+spider_url+"' ) b on a.id=b.area_id order by id asc";
	 
	 %>
	  <t:TreeTag className="com.zhaopin.tree.RoleAreaTreeConfig" 
	  documentObject="parent.document.getElementById('mainFrame')" 
	  queryDataURL=""
	   isNeedButton="1" 
	   cssName="width:700px;height:auto;border:0" 
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
<script type="text/javascript">
    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor', {
    	autoHeightEnabled:false
    	,enableAutoSave: false 
    	,initialFrameWidth:700  //初始化编辑器宽度,默认1000
        ,initialFrameHeight:565  //初始化编辑器高度,默认320
    	,toolbars: [[
            'fullscreen', 'source', '|', 'undo', 'redo', '|',
            'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',
            'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
            'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
            'directionalityltr', 'directionalityrtl', 'indent', '|',
            'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
            'link', 'unlink', 'anchor', '|', 'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
            'simpleupload', 'attachment', 'emotion','template', 'background', '|',
            'horizontal', 'spechars', 'wordimage', '|',
            'inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols'
        ]]
	});
</script>
</body>
</html>
