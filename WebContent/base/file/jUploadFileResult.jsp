<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
  <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'jUploadFileResult.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">

*{margin:0px; padding:0px;}
img{border:0px;}
.fL{float:left;}
.fR{float:right;}
.uploading{width:600px; height:308px; margin:0 auto; border-left:1px solid #9ecbe0; border-right:1px solid #9ecbe0;}
.uploadingTitle{width:100%; height:40px; background:url(base/file/images/uploadingTitle_bj.jpg) repeat-x;}
.uploadingTitle span{font-size:14px; float:left; font-weight:bold; color:#257f9a; display:block; margin-top:10px;}
.download{height:auto;margin:0 auto; border:1px solid #9ecbe0; font-size:12px; color:#333;}
.download td{padding-left:2px; height:30px;}
.download_a{text-decoration:none; color:#224f66;}
.download_a:hover{text-decoration:underline;}
.delete_a{text-decoration:none; color:#b90101;}
.delete_a:hover{text-decoration:underline;}
.downloadTitle{width:100%; height:35px; background:url(base/file/images/downloadTitle_bj.jpg) repeat-x; font-size:13px; font-weight:bold; text-align:center;}
.trColor{width:100%; height:30px; display:block; background:#f2fbff;}
.button{width:100%; height:40px;}
.button a{border:0px; width:auto; height:24px; margin:5px;}

</style>
<script type="text/javascript" src="<%=request.getContextPath() %>/base/file/uploadify-v3.2/jquery-1.7.min.js"></script>
<script type="text/javascript">

function del(id,name){
var url="<%=request.getContextPath()%>/fileup.do?method=del&file_id="+id;
			var result = confirm("确定要删除吗?");
	         if(result==true){
				$.get(url, function(data) {
					if(data){
						parent.setNewfile(id,name);
						window.parent.document.getElementById("res").innerHTML="删除成功！";
						window.location.reload();
					}else{
						window.parent.document.getElementById("res").innerHTML="删除失败！";
					}
		 	});
		 	}
}
</script>
  </head>

  <body>
   <table width="100%" border="0" cellspacing="0" cellpadding="0" class="download " >
  <tr class="downloadTitle" style="color: #257f9a">
    <td >附件名称</td>
    <td>上传人</td>
    <td>上传时间</td>
    <td>下载</td>
    <td>删除</td>
  </tr>
  <tbody >
  <%
  	List list=null;
  	if(request.getAttribute("file")!=null&&!"".equals(request.getAttribute("file"))){
  		list=(List)request.getAttribute("file");
  	}
  	if(list!=null&&list.size()>0){
  	int count=0;
  	for(int i=0;i<list.size();i++){
  	List temp=(List)list.get(i);
  	count++;
   %>
  <tr class="<%=count%2==0?"trColor":""%>" >
    <td><%=temp.get(1) %></td>
    <td align="center"><%=temp.get(2) %></td>
    <td align="center"><%=temp.get(3) %></td>
    <td align="center"><a href="<%=request.getContextPath()%>/uploadifyDownFile?filename=<%=temp.get(0) %>" class="download_a"><img src="base/file/images/download_ico.jpg" title="下载" /></a></td>
    <td align="center"><a href="javascript:del('<%=temp.get(0) %>','<%=temp.get(1) %>')" class="delete_a"><img src="base/file/images/delete_ico.jpg" title="删除" /></a></td>
  </tr>
  <%}} %>
 </tbody>
</table>
  </body>
</html>
