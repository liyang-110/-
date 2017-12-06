<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"  import="java.util.*"%>


<html>
  <head>
    
    <title>项目添加页面</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="<%=request.getContextPath()%>/css/sheetstyle.css"  rel="stylesheet" type="text/css" />

  </head>
  <script type="text/javascript">
  function fileup(){
  window.open('<%=request.getContextPath()%>/base/file/jUploadFile.jsp?text_new_name=file_id&text_old_name=file_name','附件上传','status=no,menubar=no,toolbar=no,dependent=yes,width=600,height=500,left=230,top=130')
  }
  function uploadAfterDo(){
  	alert('父页面方法');
  }
  </script>
  <body leftmargin="0" topmargin="0" class="body" >
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="Tr_place">
			<tr>
				<td width="3%" height="25">
					<IMG SRC="<%=request.getContextPath()%>/images/sheet/main_21.gif"
						align="right">
				</td>
				<td width="94%" valign="middle" nowrap>
					您目前所在的位置&gt;&gt;&gt;业务管理&gt;&gt;&gt;项目立项管理&gt;&gt;&gt;发起新项目&nbsp;<span ><font color="red" id='res'></font> <font color="red" id="text"></font></span>
				</td>
			</tr>
		</table>
		<table width="100%" border="0" cellpadding="0" cellspacing="1">
			<tr>
				<td class="Tr_title">
					<form name="form1" id="form1" method="post" action="<%=request.getContextPath()%>/item/itemAction.do?method=add">
						<table width="100%" border="0" cellpadding="0" cellspacing="1"
							class="table_title" style="margin-top: 1; margin-bottom: 1">
							<tr>
								<td height="25" align="left" class="Tr_title" colspan="4">
									<img src="<%=request.getContextPath()%>/images/sheet/main_26.gif" width="20" height="23" style="float:left;">
									<span style="line-height:23px;">项目新增</span>
								</td>
							</tr>
							
							<tr>
							<td width="15%" align="right" class="Tr_1">登录用户ID：</td>
								<td  bgcolor="#FFFFFF" >
								<input name="uploadusername" type="text" class="text"  id="uploadusername" value="">
						        </td>
						        <td width="15%" align="right" class="Tr_1">要显示的附件ID：</td>
								<td  bgcolor="#FFFFFF" >
								<input name="uploadfileid" type="text" class="text"  id="uploadfileid" style="width: 200px;">
						        </td>
						        </tr>
						        <tr>
							<td width="15%" align="right" class="Tr_1">上传附件：</td>
								<td width="85%" bgcolor="#FFFFFF" colspan="3">
								<input name="file_name" type="text" class="text" readonly id="file_name" style="width: 50%">
								<input type="hidden" name="file_id" id="file_id">
								<input type="hidden" name="uploadmethod" id="uploadmethod" value="false">
								<input name="Submit43" type="button" class="sbttn_select" value="选择  " 
								onClick="fileup()">
						        </td>
								<!-- onClick="window.open('<%=request.getContextPath()%>/base/file/jUploadFile.jsp?text_new_name=file_id&text_old_name=file_name','附件上传','status=no,menubar=no,toolbar=no,dependent=yes,width=600,height=500,left=230,top=130')" -->
							</tr>	
							
						</table>	
						
						</form></td></tr>
		</table>
	</body>
</html>
					
