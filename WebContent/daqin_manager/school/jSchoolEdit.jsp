<%@ page language="java" pageEncoding="UTF-8"%>
<%
String id=request.getParameter("id");  
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
<script type="text/javascript" src="./SchoolEdit.js"  charset="utf-8"></script>
<script type="text/javascript">
	var gi_pagesize = <%=request.getParameter("pagesize")%>;
	var gi_pagenum = <%=request.getParameter("pagenum")%>;
	var gi_currentnum = <%=request.getParameter("currentnum")%>;
	var id ="<%=id%>";
	function fileup(){
    	window.open('<%=request.getContextPath()%>/base/file/jUploadFile.jsp?text_new_name=file_id&text_old_name=file_name','附件上传','status=no,menubar=no,toolbar=no,dependent=yes,width=600,height=500,left=230,top=130')
    }
	$(function(){
		var ifram = parent.document.getElementById("rightFrm");
		$(ifram).attr("height",document.body.scrollHeight); 
	});
   	function toViewPic(id){
	   	var img_path=$(id).val();
	   	if(img_path){
	   		$('#w2').window({top:10});
			$('#w2').show().window("open");
			$('#view').attr("src","<%=request.getContextPath()%>/"+img_path);
		}
	}
</script>
</head>
<body>
<form id="fm" method="post"  name="fm">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td class="tabright">机构名称：</td>
		<td><input readonly="readonly" id="in_school_name" name="in_school_name" class="easyui-validatebox inputbox" required="true"/> <span class="red">请输入全称，一经输入，不可修改</span></td>
	</tr>
	<tr>
		<td class="tabright">所在地区：</td>
		<td><input id="in_area_id" name="in_area_id" class="easyui-validatebox" />
		<input id="in_shi_id" name="in_shi_id" class="easyui-validatebox" type="hidden" />
		<input id="in_qu_id" name="in_qu_id" class="easyui-validatebox" type="hidden" />
		</td>
	</tr>
	<tr>
		<td class="tabright">上传logo：</td>
		<td><input name="uploadusername" type="hidden"   id="uploadusername" value="loader"/>
					<input name="file_name" type="text" readonly id="file_name" style="width: 300px;"/>
					<input type="hidden" name="file_id" id="file_id"/>
					<input type="hidden" name="uploadmethod" id="uploadmethod" value="false"/>
					<input name="Submit43" type="button" class="sbttn_select" value=" 选择 " onClick="fileup()"/>
					<input name="uploadfileid" type="hidden"   id="uploadfileid" style="width: 200px;"/><input  type="button"  value=" 查看 " onClick="toViewPic('#school_logo_path')"/></td>
					
					<input type="hidden" name="school_logo_path" id="school_logo_path"/>
	</tr>
	<tr>
		<td class="tabright">联系方式：</td>
		<td><input id="in_school_contact" name="in_school_contact" class="easyui-validatebox inputbox"  /></td>
	</tr>
	<tr>
		<td class="tabright">毕业年份：</td>
		<td><input id="in_school_year" name="in_school_year" class="easyui-numberspinner" data-options="increment:1"  /></td>
	</tr>
		<tr>
		<td class="tabright">毕业总数：</td>
		<td><input id="in_school_studentnum" name="in_school_studentnum" class="easyui-numberspinner" data-options="increment:1" /></td>
	</tr>
	<tr>
		<td class="tabright">联系地址：</td>
		<td><input id="in_school_addr" name="in_school_addr" class="easyui-validatebox inputbox"  /></td>
	</tr>
	<tr>
		<td class="tabright">机构网站：</td>
		<td><input id="in_school_website" name="in_school_website" class="easyui-validatebox inputbox"/></td>
	</tr>
	<tr>
		<td class="tabright">参会须知：</td>
		<td><textarea  cols="80" rows="8" id="in_notes" name="in_notes" class="easyui-validatebox"></textarea></td>
	</tr>
	<tr>
		<td class="tabright">机构简介：</td>
		<td><textarea  cols="80" rows="14" id="in_school_info" name="in_school_info" class="easyui-validatebox"></textarea></td>
	</tr>
	<tr>
		<td></td>
		<td>
		<input id="pic1"  type="hidden" value=""/>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_save" id="btn_save">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_return" id="btn_return">取消</a></td>
	</tr>
</table>
</form>
	<div id="w2" class="easyui-window" title="图片查看" data-options="modal:true,closed:true" style="width:650px;height:550px;padding:10px;display:none;">
		<iframe  frameborder="0" id="view"  scrolling="hidden" src="" width="100%" height="500"></iframe>
	</div>
</body>
</html>
