<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../checkLogin.jsp" %>
<%
String id=request.getParameter("id");
String company_status="";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>无标题文档</title>
<script type="text/javascript">
	var id ="<%=id%>";
	var cur_path ="<%=request.getContextPath()%>";
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"></script>
<script type="text/javascript">
  	function toViewPic(id){
   	var img_path=$(id).val();
   	if(img_path){
   		$('#w2').window({top:10});
		$('#w2').show().window("open");
		$('#view').attr("src","<%=request.getContextPath()%>/"+img_path);
	}
}
  	function setData() {	
  		var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=company_04&in_r=co&in_id="+id+"&date=" + new Date();
  		$.ajax({
  			url:ls_url, 
  			type:"post", 
  			dataType:"text", 
  			success:function (data) {
  			if (!data) {
  				return false;
  			}
  			data = decodeURIComponent(data);
  			var re = eval("[" + data + "]");
  			if (re.length > 0 && re[0].returncode == "ok") {
  				initdata= re[0].queryresult;
  				$("#fm").form("load", initdata[0]);
  				$('#in_company_name').attr("disabled",true);
  			}
  		}});
  	}
$(function(){
		setData();
});
function edit() {
	var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=company_05&in_r=ad&in_action=license&in_id=" + id+"&date=" + new Date();
	saveData(ls_url, closepage, "企业证照修改成功!");
}
function closepage()
{
	parent.closepage();
}
function cancel()
{
	parent.closePageCancel();
}
</script>

<link rel="stylesheet" href="/statics/Huploadify/Huploadify.css" type="text/css"></link>
<script type="text/javascript" src="/statics/Huploadify/jquery.Huploadify.js" charset="utf-8"></script>
<script type="text/javascript" src="/statics/Huploadify/autouploadfile.js" charset="utf-8"></script>
<script type="text/javascript">
$(function(){
	Huploadify_file('company_pic_upload_btn', cur_path ,"in_company_pic","company_pic_name","pic","uploader");
	Huploadify_file('company_img_upload_btn', cur_path ,"in_company_img","company_img_name","img","uploader");

});
</script>
<style type="text/css">
.uploadify-button {
    display: inline-block;
    margin: 12px;
    border: 1px solid #808080;
    background-color: #dcdcdc;
    line-height: 20px;
    border-radius: 0px;
    padding: 0 18px;
    font-size: 12px;
    font-weight: 600;
    font-family: '微软雅黑';
    color: #666;
    cursor: pointer;
    text-decoration: none;
}
.uploadify-button:hover {
	color:#fff;
}
</style>
</head>

<body>
<form id="fm" method="post"  name="fm">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td class="tabright">企业名称：</td>
		<td><input id="in_company_name"  name="in_company_name" class="easyui-validatebox inputbox" required="true"/>
		<span class="red" style="display:none;" id="in_company_name_tip">请输入全称，一经输入，不可修改</span></td>
	</tr>
	<%   if(!"1".equals( company_status )) {%>
	<tr>
		<td class="tabright">组织机构代码证：</td>
		<td>
		<table><tr><td>
		<input name="company_pic_name" type="text" readonly id="company_pic_name" style="width:200px;"/>
		<input type="hidden" name="in_company_pic" id="in_company_pic"/>
		
		</td><td>
		<div id="company_pic_upload_btn" style="line-height:1em;"></div>
		</td>

		<td>
		<input style="display:none;"  type="button"  value=" 查看 " onClick="toViewPic('#company_pic_path')"/>
		<span class="red">图片格式：jpg，png，文件小于1M。</span>
		
		</td>

		</tr></table>
		
		</td>
	</tr>
	<tr>
		<td class="tabright">营业执照：</td>
		<td>
		<table><tr><td>
		<input name="company_img_name" type="text" readonly id="company_img_name" style="width: 200px;"/>
		<input type="hidden" name="in_company_img" id="in_company_img"/>
		
		</td><td>
		<div id="company_img_upload_btn" style="line-height:1em;"></div>
		</td>

		<td>
		<input style="display:none;"  type="button"  value=" 查看 " onClick="toViewPic('#company_img_path')"/>
		<span class="red">图片格式：jpg，png，文件小于1M。</span>
		
		</td>
	
		</tr></table>
		
		</td>
	</tr>
	<%  }else{ %>
	<tr>
		<td class="tabright">组织机构代码证：</td>
		<td>
		<table><tr><td>
		<input name=""  type="text" readonly value="已审核" style="width: 300px;" />
		</td><td>
		</td>

		<td>
		</td>

		</tr></table>
		
		</td>
	</tr>
	<tr>
		<td class="tabright">营业执照：</td>
		<td>
		<table><tr><td>
		<input name="" type="text" readonly value="已审核"  style="width: 300px;"/>
		</td><td>
		</td>
		<td>
		</td>
		</tr></table>
		
		</td>
	</tr>
	<%  } %>
	<tr>
		<td></td>
		<td>
 			<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_save" onclick="edit();">保存</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_return" onclick="cancel();">取消</a>
		</td>
	</tr>
</table>
</form>
	<div id="w2" class="easyui-window" title="图片查看" data-options="modal:true,closed:true" style="width:650px;height:350px;padding:10px;display:none;">
		<iframe  frameborder="0" id="view"  scrolling="hidden" src="" width="100%" height="500"></iframe>
	</div>
</body>
</html>
