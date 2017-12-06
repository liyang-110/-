<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="TreeTag" prefix="t" %>
<%@ include file="../include/checkLogin.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>daqin_manager/member/企业会员管理添加页面</title>
<script type="text/javascript">
	var cur_path = "<%=request.getContextPath()%>";
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"></script>
<script type="text/javascript" src="./CompanyAdd.js"  charset="utf-8"></script>
<script type="text/javascript">
	var gi_pagesize = <%=request.getParameter("pagesize")%>;
	var gi_pagenum = <%=request.getParameter("pagenum")%>;
	var gi_currentnum = <%=request.getParameter("currentnum")%>;
</script>
<script type="text/javascript" src="../js/common.js"></script>
<link rel="stylesheet" href="/statics/Huploadify/Huploadify.css" type="text/css"></link>
<script type="text/javascript" src="/statics/Huploadify/jquery.Huploadify.js" charset="utf-8"></script>
<script type="text/javascript" src="/statics/Huploadify/autouploadfile.js" charset="utf-8"></script>
<script type="text/javascript">
$(function(){
	Huploadify_file('pic_uploadify_queue', '' ,"in_company_pic","company_pic_name","pic","uploader");
	Huploadify_file('img_uploadify_queue', '' ,"in_company_img","company_img_name","img","uploader");
});
</script>
</head>

<body>
<form id="fm" method="post"  name="fm">
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
		<td colspan="3"><input id="in_user_id" name="in_user_id"  class="easyui-validatebox"  data-options="missingMessage:'请输入字母和数字' ,required:true"/></td>
		</tr>
	<tr>
		<th >登录密码：</th>
		<td><input id="in_user_pass" name="in_user_pass"  class="easyui-validatebox"  required="true"/></td>
	    <th >确认密码：</th>
		<td><input type="password" id="eq_user_pass" name="eq_user_pass" class="easyui-validatebox"  validType="equalTo['#in_user_pass']" required="true"/></td>
	</tr>
	<tr>
		<th >组织机构代码证：</th>
		<td  colspan="3">	
		<table><tr><td>
		<input class="text" name="company_pic_name" type="text" readonly id="company_pic_name" />
		<input type="hidden" name="in_company_pic" id="in_company_pic"/>
		<input type="hidden" name="in_company_pic_path" id="in_company_pic_path" />
		</td><td>
		<div id="pic_uploadify_queue" style="line-height:1em;"></div>
		</td>
		<td>
		<span class="red">格式：*.jpg;*.png，大小<1M。</span>
		</td>
		</tr></table>
		</td>
	</tr>
	<tr>
		<th >营业执照：</th>
		<td  colspan="3">
		<table><tr><td>
		<input class="text" name="company_img_name" type="text" readonly id="company_img_name" />
		<input type="hidden" name="in_company_img" id="in_company_img"/>
		<input type="hidden" name="in_company_img_path" id="in_company_img_path" />
		</td><td>
		<div id="img_uploadify_queue" style="line-height:1em;"></div>
		</td>
		<td>
		<span class="red">格式：*.jpg;*.png，大小<1M。</span>
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
	</tr>
	<tr>
	<th >所属行业：</th>
	 		<td><select id="in_big" name="in_big" class="easyui-combobox" style="width:160px;">
				<option value="">--行业--</option>
			</select></td>
			<td><select id="in_small" name="in_small" class="easyui-combobox" style="width:160px;">
				<option value="">--行业--</option>
			</select></td>
		    <td><input type="hidden" name="in_industry" id="in_industry" /></td>
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
</body>
</html>
