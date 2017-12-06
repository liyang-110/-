<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/checkLogin.jsp" %>
<%
String id=request.getParameter("id").toString();  
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>无标题文档</title>
<script type="text/javascript">
	var cur_path = "<%=request.getContextPath()%>";
	var gi_pagesize = <%=request.getParameter("pagesize")%>;
	var gi_pagenum = <%=request.getParameter("pagenum")%>;
	var gi_currentnum = <%=request.getParameter("currentnum")%>;
	var id ="<%=id%>";
</script>
<script type="text/javascript" src="../js/in_common.js" charset="utf-8"></script>
<script type="text/javascript" src="CompanyEdit.js"  charset="utf-8"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/uploadify/swfobject.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/uploadify/jquery.uploadify.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/scripts/autouploadfile.js" charset="utf-8"></script>
<script type="text/javascript">
$(function(){
		uploadify_file('company_pic_upload', cur_path ,"in_company_pic","company_pic_name","pic_uploadify_queue","pic","uploader");
		uploadify_file('company_img_upload', cur_path ,"in_company_img","company_img_name","img_uploadify_queue","img","uploader");
});
</script>

<script type="text/javascript">
	function fileup(file_id,file_name){
    	window.open('<%=request.getContextPath()%>/base/file/jUploadFile.jsp?text_new_name='+file_id+'&text_old_name='+file_name+'','附件上传','status=no,menubar=no,toolbar=no,dependent=yes,width=600,height=500,left=230,top=130')
    }
   	function toOpen(){
		$('#w1').show().window('open');
		$('#add').attr("src","<%=request.getContextPath()%>/substation.do?method=Industry");  
	}
   	function toViewPic(id){
	   	var img_path=$(id).val();
	   	if(img_path){
	   		$('#w2').window({top:10});
			$('#w2').show().window("open");
			$('#view').attr("src","<%=request.getContextPath()%>/"+img_path);
		}
	}
	$(function(){
		$("#btn_industrySave").click(function(){
			var obj = $(window.frames["add"].document).find("input:checked");
			if(obj.length === 0){
				alert("请选择行业");
			}
			else{
				$("#in_industry").val(obj.val())
				$("#industry_name").val(obj.attr("namekey"));
				$('#w1').window('close');
			}				
		});
		$("#btn_industryReturn").click(function(){
			$('#w1').window('close');
		});
	});
	function setSelectObj( obj )
	{
		$("#in_industry").val(obj.val())
		$("#industry_name").val(obj.attr("namekey"));
		$('#w1').window('close');
	}
</script>
<style type="text/css">
th {text-align:right;}
</style>
</head>

<body>
<form id="fm" method="post"  name="fm">
<input type="hidden" name="in_add_person" value="" />
<table width="620" border="0" cellspacing="0" cellpadding="0">
 <colgroup>
 	<col width="120" />
     <col width="200" />
     <col width="100" />
     <col width="200" />
 </colgroup>
<tbody>
	<tr>
		<th>企业名称：</th>
		<td  colspan="3"><input id="in_company_name"  name="in_company_name" class="easyui-validatebox inputbox" required="true"/>
		<span class="red" style="display:none;" id="in_company_name_tip">请输入全称，一经输入，不可修改</span></td>
	</tr>
	<tr>
		<th >联系人：</th>
		<td><input id="in_contact_person" name="in_contact_person"  class="easyui-validatebox"  required="true"/></td>
		<th >手机：</th>
		<td><input id="in_contact_tel" name="in_contact_tel"  class="easyui-validatebox"  required="true"/></td>
	</tr>
	<tr>
		<th >电子邮件：</th>
		<td  colspan="3"><input validType="email" id="in_email" name="in_email" class="easyui-validatebox inputbox"  required="true"/></td>
	</tr>
	<tr>
		<th >登录帐号：</th>
		<td><input id="in_user_id" name="in_user_id"  class="easyui-validatebox" readonly disabled="true"/></td>
	</tr>
	<tr>
		<th >组织机构代码证：</th>
		<td  colspan="3">
		<table><tr><td>
		<input name="company_pic_name" type="text" readonly id="company_pic_name" style="width: 150px;"/>
		<input type="hidden" name="in_company_pic" id="in_company_pic"/>
		<div id="pic_uploadify_queue"></div>
		</td><td>
		<input id="company_pic_upload" name="company_pic_upload" type="file" />
		</td>

		<td>
		<input style="display:none;"  type="button"  value=" 查看 " onClick="toViewPic('#company_pic_path')"/>
		<span class="red">图片格式：jpg，png，文件小于1M。</span>
		<input type="hidden" name="company_pic_path" id="company_pic_path"/>
		</td>

		</tr></table>
		
		</td>
	</tr>
	<tr>
		<th >营业执照：</th>
		<td  colspan="3">
		<table><tr><td>
		<input name="company_img_name" type="text" readonly id="company_img_name" style="width: 150px;"/>
		<input type="hidden" name="in_company_img" id="in_company_img"/>
		<div id="img_uploadify_queue"></div>
		</td><td>
		<input id="company_img_upload" name="company_img_upload" type="file" />
		</td>

		<td>
		<input style="display:none;"  type="button"  value=" 查看 " onClick="toViewPic('#company_img_path')"/>
		<span class="red">图片格式：jpg，png，文件小于1M。</span>
		<input type="hidden" name="company_img_path" id="company_img_path"/>
		</td>
	
		</tr></table>
		
		</td>
	</tr>
	<tr>
		<th >企业性质：</th>
		<td><input id="in_company_nature" name="in_company_nature" class="easyui-validatebox" editable="false"/></td>
		<th>单位人数：</th>
		<td><input id=in_company_person_num name="in_company_person_num" class="easyui-validatebox" editable="false"/></td>
	</tr>
	<tr>
		<th >成立日期：</th>
		<td><input id="in_establish_date" name="in_establish_date" class="easyui-datebox" editable="false" /></td>
		<th >注册资金：</th>
		<td><input id="in_company_registered_capital" name="in_company_registered_capital" class="easyui-validatebox" editable="false"/></td>
	</tr>
	<tr>
		<th >所在地区：</th>
		<td>
			<input id="in_area_id" name="in_area_id" class="easyui-validatebox" editable="false"/>
		</td>
		<th >所属行业：</th>
		<td>
		<input id="in_industry" name="in_industry" type="hidden" class="easyui-validatebox"/>
		<input id="industry_name" name="industry_name" type="text" class="easyui-validatebox" readonly="readonly" />
		<input  type="button" class="button" value="请选择 " onClick="toOpen()"/></td>
	</tr>
	<tr>
		<th >公司地址：</th>
		<td colspan="3"><input id="in_company_addr" name="in_company_addr" class="easyui-validatebox inputbox"  /></td>
	</tr>
	<tr>
		<th >公司座机：</th>
		<td><input id="in_company_tel" name="in_company_tel" class="easyui-validatebox" /></td>
		<th >公司传真：</th>
		<td><input id="in_faxcode" name="in_faxcode" class="easyui-validatebox"  /></td>
	</tr>
	<tr>
		<th >公司网址：</th>
		<td colspan="3"><input id="in_website" name="in_website" class="easyui-validatebox inputbox"  /></td>
	</tr>
	<tr>
		<th >企业简介：</th>
		<td colspan="3"><textarea  cols="80" rows="14" 
								id="in_company_info" 
								name="in_company_info" 
								class="easyui-validatebox" 
								onkeyup="this.value = this.value.substring(0, 1000)"></textarea></td>
	</tr>
	<tr>
		<td></td>
		<td>

		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_save" id="btn_save">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_return" id="btn_return">取消</a>
		</td>
	</tr>
</tbody>
</table>

</form>
  	<div id="w1" class="easyui-window" title="行业选择" data-options="modal:true,closed:true" style="width:650px;height:390px;padding:0px;display:none;">
		<iframe  frameborder="0" id="add"  scrolling="hidden" src="" width="100%" height="350"></iframe>
	</div>
	<div id="w2" class="easyui-window" title="图片查看" data-options="modal:true,closed:true" style="width:650px;height:350px;padding:10px;display:none;">
		<iframe  frameborder="0" id="view"  scrolling="hidden" src="" width="100%" height="500"></iframe>
	</div>
</body>
</html>