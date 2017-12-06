<%@ page language="java" pageEncoding="UTF-8"%>
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
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"></script>
<script type="text/javascript" src="CompanyAdd.js"  charset="utf-8"></script>
<script type="text/javascript">
	function fileup(file_id,file_name){
    	window.open('<%=request.getContextPath()%>/base/file/jUploadFile.jsp?text_new_name='+file_id+'&text_old_name='+file_name+'','附件上传','status=no,menubar=no,toolbar=no,dependent=yes,width=600,height=500,left=230,top=130')
    }
	$(function(){
		var ifram = parent.document.getElementById("rightFrm");
		$(ifram).attr("height",document.body.scrollHeight); 
	});
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
			var $obj = $(window.frames["add"].document).find("input:checked");
			if($obj.length === 0){
				alert("请选择行业");
			}
			else{
				$("#in_industry").val($obj.val())
				$("#industry_name").val($obj.attr("namekey"));
				$('#w1').window('close');
			}				
		});
		$("#btn_industryReturn").click(function(){
			$('#w1').window('close');
		});
	});
</script>
</head>

<body>
<form id="fm" method="post"  name="fm">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td class="tabright">企业名称：</td>
		<td><input id="in_company_name"  name="in_company_name" class="easyui-validatebox inputbox" required="true"/> <span class="red">请输入全称，一经输入，不可修改</span></td>
	</tr>
	<tr>
		<td class="tabright">上传代码证：</td>
		<td><input name="uploadusername" type="hidden"   id="uploadusername" value="loader"/>
					<input name="company_pic_name" type="text" readonly id="company_pic_name" style="width: 300px;"/>
					<input type="hidden" name="in_company_pic" id="in_company_pic"/>
					<input type="hidden" name="uploadmethod" id="uploadmethod" value="false"/>
					<input name="Submit43" type="button" class="sbttn_select" value=" 选择 " onClick="fileup('in_company_pic','company_pic_name')"/>
					<input name="uploadfileid" type="hidden"   id="uploadfileid" style="width: 200px;"/>
					<input  type="button"  value=" 查看 " onClick="toViewPic('#company_pic_path')"/>
					
					<input type="hidden" name="company_pic_path" id="company_pic_path"/>
		</td>
	</tr>
	<tr>
		<td class="tabright">上传执照：</td>
		<td><input name="uploadusername" type="hidden"   id="uploadusername" value="loader"/>
					<input name="company_img_name" type="text" readonly id="company_img_name" style="width: 300px;"/>
					<input type="hidden" name="in_company_img" id="in_company_img"/>
					<input type="hidden" name="uploadmethod" id="uploadmethod" value="false"/>
					<input name="Submit43" type="button" class="sbttn_select" value=" 选择 " onClick="fileup('in_company_img','company_img_name')"/>
					<input name="uploadfileid" type="hidden"   id="uploadfileid" style="width: 200px;"/><input  type="button"  value=" 查看 " onClick="toViewPic('#company_img_path')"/><span class="red">为最近一年年检过的营业执照</span>
		
					<input type="hidden" name="company_img_path" id="company_img_path"/>
		</td>
	</tr>
	<tr>
		<td class="tabright">上传logo：</td>
		<td><input name="uploadusername" type="hidden"   id="uploadusername" value="loader"/>
					<input name="company_logo_name" type="text" readonly id="company_logo_name" style="width: 300px;"/>
					<input type="hidden" name="in_company_logo" id="in_company_logo"/>
					<input type="hidden" name="uploadmethod" id="uploadmethod" value="false"/>
					<input name="Submit43" type="button" class="sbttn_select" value=" 选择 " onClick="fileup('in_company_logo','company_logo_name')"/>
					<input name="uploadfileid" type="hidden"   id="uploadfileid" style="width: 200px;"/><input  type="button"  value=" 查看 " onClick="toViewPic('#company_logo_path')"/><span class="red">尺寸：135×135像素</span>
		
					<input type="hidden" name="company_logo_path" id="company_logo_path"/>
		</td>
	</tr>
	<tr>
		<td class="tabright">所在地区：</td>
		<td><input id="in_area_id" name="in_area_id"  />
			<input id="in_shi_id" name="in_shi_id" class="easyui-validatebox" type="hidden"  />
			<input id="in_qu_id" name="in_qu_id" class="easyui-validatebox"  type="hidden" />
		</td>
	</tr>
	<tr style="display:none">
		<td class="tabright">联系信息：</td>
		<td><input id="in_company_tel" name="in_company_tel" class="easyui-validatebox inputbox" /></td>
	</tr>
	<tr>
		<td class="tabright">企业性质：</td>
		<td><input id="in_company_nature" name="in_company_nature" class="easyui-validatebox"/></td>
	</tr>
	<tr>
		<td class="tabright">单位人数：</td>
		<td><input id=in_company_person_num name="in_company_person_num" class="easyui-validatebox"/></td>
	</tr>
	<tr>
		<td class="tabright">注册资金：</td>
		<td><input id="in_company_registered_capital" name="in_company_registered_capital" class="easyui-validatebox"/></td>
	</tr>
	<tr>
		<td class="tabright">所属行业：</td>
		<td><input id="in_industry" name="in_industry" type="hidden" class="easyui-validatebox inputbox"/><input id="industry_name" name="industry_name" type="text" class="inputbox" readonly="readonly"/ ><input  type="button" class="button" value="请选择 " onClick="toOpen()"/></td>
	</tr>
	<tr>
		<td class="tabright">成立日期：</td>
		<td><input id="in_establish_date" name="in_establish_date" class="easyui-datebox" required="true" /></td>
	</tr>
	<tr>
		<td class="tabright">公司地址：</td>
		<td><input id="in_company_addr" name="in_company_addr" class="easyui-validatebox inputbox" required="true" /></td>
	</tr>
	<tr>
		<td class="tabright">联系人：</td>
		<td><input id="in_contact_person" name="in_contact_person"  class="easyui-validatebox inputbox"  required="true"/></td>
	</tr>
	<tr>
		<td class="tabright">联系电话：</td>
		<td><input id="in_contact_tel" name="in_contact_tel" class="easyui-validatebox inputbox" required="true" /></td>
	</tr>
	<tr>
		<td class="tabright">公司传真：</td>
		<td><input id="in_faxcode" name="in_faxcode" class="easyui-validatebox inputbox"  /></td>
	</tr>
	<tr>
		<td class="tabright">电子邮件：</td>
		<td><input validType="email" id="in_email" name="in_email" class="easyui-validatebox inputbox" /></td>
	</tr>
	<tr>
		<td class="tabright">公司网址：</td>
		<td><input id="in_website" name="in_website" class="easyui-validatebox inputbox"  /></td>
	</tr>
	<tr>
		<td class="tabright">企业简介：</td>
		<td><textarea  cols="80" rows="14" id="in_company_info" name="in_company_info" class="easyui-validatebox"></textarea></td>
	</tr>
	<tr>
		<td></td>
		<td>

		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_save" id="btn_save">确定</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_return" id="btn_return">取消</a></td>
	</tr>
</table>
</form>
 	<div id="w1" class="easyui-window" title="行业选择" data-options="modal:true,closed:true" style="width:650px;height:480px;padding:10px;display:none;">
 		<p>
 			<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_save" id="btn_industrySave">确定</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_return" id="btn_industryReturn">取消</a>
		</p>
		<iframe  frameborder="0" id="add"  scrolling="hidden" src="" width="100%" height="820"></iframe>
	</div>
	<div id="w2" class="easyui-window" title="图片查看" data-options="modal:true,closed:true" style="width:650px;height:350px;padding:10px;display:none;">
		<iframe  frameborder="0" id="view"  scrolling="hidden" src="" width="100%" height="500"></iframe>
	</div>
</body>
</html>