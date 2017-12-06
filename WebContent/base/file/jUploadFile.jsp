<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="cn.com.zhaopin.base.pub.cCharControl"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>文件上传</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">

*{margin:0px; padding:0px;}
img{border:0px;}
.fL{float:left;}
.fR{float:right;}
.uploading{width:600px; height:308px; margin:0 auto; border-left:1px solid #9ecbe0; border-right:1px solid #9ecbe0;}
.uploadingTitle{width:100%; height:40px; background:url(base/file/images/uploadingTitle_bj.jpg) repeat-x;}
.uploadingTitle span{font-size:14px; float:left; font-weight:bold; color:#257f9a; display:block; margin-top:10px;}

.button{width:100%; height:40px;}
.button a{border:0px; width:auto; height:24px; margin:5px;}
.uploading_button1{width:88px; height:40px; border:0px; background:url(base/file/images/uploading-button1.jpg) no-repeat;}
.uploading_button2{width:88px; height:40px; border:0px; background:url(base/file/images/uploading-button2.jpg) no-repeat;}
.uploading_button3{width:88px; height:40px; border:0px; background:url(base/file/images/uploading-button3.jpg) no-repeat;}
.uploading_button1hover{width:88px; height:40px; border:0px; background:url(base/file/images/uploading-button1hover.jpg) no-repeat;}
.uploading_button2hover{width:88px; height:40px; border:0px; background:url(base/file/images/uploading-button2hover.jpg) no-repeat;}
.uploading_button3hover{width:88px; height:40px; border:0px; background:url(base/file/images/uploading-button3hover.jpg) no-repeat;}
</style>
<link rel="stylesheet" href="<%=request.getContextPath() %>/base/file/uploadify-v3.2/uploadify.css" type="text/css"></link>
<script type="text/javascript" src="<%=request.getContextPath() %>/base/file/uploadify-v3.2/jquery-1.7.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/base/file/uploadify-v3.2/swfobject.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/base/file/uploadify-v3.2/jquery.uploadify.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/base/file/uploadify-v3.2/button.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/base/file/uploadify-v3.2/upload.js"></script>
   <script type="text/javascript">
  
   
 function up(){
 
 var contextpath='<%=request.getContextPath() %>';
 var text_new_name='<%=request.getParameter("text_new_name")!=null?request.getParameter("text_new_name"):""%>';
 var text_old_name='<%=request.getParameter("text_old_name")!=null?request.getParameter("text_old_name"):""%>';
 var directory='<%=request.getParameter("directory")!=null?request.getParameter("directory"):""%>';
 var userid=opener.document.getElementById('uploadusername').value;
 var fileid=opener.document.getElementById(text_new_name).value;/*alert(userid+"..."+text_new_name);*/
 var uploadmethod=opener.document.getElementById('uploadmethod').value;
 var num='<%=request.getParameter("num")!=null?request.getParameter("num"):""%>';
 upload(contextpath,text_new_name,text_old_name,directory,userid,fileid,uploadmethod,'1',num);
 var path=contextpath+'/fileup.do?fileid='+fileid;
 document.file.location.replace(path);	
 }
 /* 
 功能：删除是更新父页面文本域的文件内容
 */
 function setNewfile(id,name){
 	 var text_new_name='<%=request.getParameter("text_new_name")!=null?request.getParameter("text_new_name"):""%>';
 	 var text_old_name='<%=request.getParameter("text_old_name")!=null?request.getParameter("text_old_name"):""%>';
 	 var fileid=opener.document.getElementById(text_new_name).value;
 	 var filename=opener.document.getElementById(text_old_name).value;
 	 if(fileid.indexOf(id+",")>=0){
 	 	fileid=fileid.replace(id+",","");
 	 }else{
 	 	fileid=fileid.replace(id,"");
 	 }
 	 if(filename.indexOf(name+",")>=0){
 	 	filename=filename.replace(name+",","");
 	 }else{
 	 	filename=filename.replace(name,"");
 	 }
 	 opener.document.getElementById(text_new_name).value=fileid;
 	 opener.document.getElementById(text_old_name).value=filename;
 }
        </script>
  <body onload="up()">
 <style type="text/css">   
     .scroll {
         width: 582px;                                      /*宽度*/    
         height: 225px;                                   /*高度*/             
         overflow-x: no;                              /*横向滚动条*/  
         overflow-y: auto;                              /*竖向滚动条*/      
         scrollbar-face-color: #D4D4D4;                   /*滚动条滑块颜色*/    
         scrollbar-hightlight-color: #ffffff;                 /*滚动条3D界面的亮边颜色*/    
         scrollbar-shadow-color: #919192;                     /*滚动条3D界面的暗边颜色*/    
         scrollbar-3dlight-color: #ffffff;                /*滚动条亮边框颜色*/    
         scrollbar-arrow-color: #919192;                  /*箭头颜色*/    
         scrollbar-track-color: #ffffff;                  /*滚动条底色*/    
         scrollbar-darkshadow-color: #ffffff;                 /*滚动条暗边框颜色*/    
     }    
  </style>
  <table align="center">
  <tr>
  <td>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="uploading" >
  <tr>
    <td class="uploadingTitle"><img src="base/file/images/ico01.jpg" class="fL" /><span>文件上传&nbsp;&nbsp;&nbsp;<font id="res" color="red"></font></span>
    <a href="javascript:window.close();" onfocus="this.blur()" class="fR"><img src="base/file/images/close.jpg" /></a></td>
  </tr>
 <tr>
            <td height="306">
            	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td valign="top" height="225" align="center"><div id="fileQueue" class="scroll"></div></td>
                  </tr>
                  <tr>
                    <td align="center">
                    	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="width:200px;">
		                  <tr>
		                  	<td> <input type="file" name="file_upload" id="file_upload"  tab="tab" /></td>
		                    <td>
								<input tab="tab" type="button" class="uploading_button2" 
								onclick="javascript:$('#file_upload').uploadify('upload','*')" style="margin-bottom:16px;">
								</td>
		                  </tr>
						</table>
						</td>
                  </tr>
				</table>
            </td>
          </tr>
</table>
  </td>
  </tr>
   <tr>
  <td>
  <table  width="100%" border="0" cellpadding="0" cellspacing="0">
<tr>
<td>
<iframe scrolling="auto" id="file" name="file" frameborder="0" width="100%" height="100%" src=""></iframe>
</td>
</tr>
</table>
  </td>
  </tr>
  </table>
 

  </body>
</html>
