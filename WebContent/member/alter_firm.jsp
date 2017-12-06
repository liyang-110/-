<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="inc/checkLogin_c.jsp" %>
<%@ page import="com.zhaopin.bean.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String id=company_id;
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><%=company_name %> - 企业信息</title>
<link rel="stylesheet" href="style/bootstrap.nav.css" type="text/css"></link>
<link type="text/css" rel="stylesheet" href="style/core.css" />
<link type="text/css" rel="stylesheet" href="img2/core.css" />
<link type="text/css" rel="stylesheet" href="style/first_firm.css" />
<link type="text/css" rel="stylesheet" href="style/alter_firm.css" />

<script type="text/javascript" src="../statics/jquery/1.11.3/jquery.min.js"></script>
<link rel="stylesheet" href="../js/jquery-easyui/themes/metro/validatebox.css" type="text/css"></link>
<script type="text/javascript" src="../js/jquery-easyui/jquery.easyui.min.js"></script>

<script src="/assets/artDialog/artDialog.js?skin=green"></script>
<script src="/assets/artDialog/plugins/iframeTools.js"></script>
<script type="text/javascript" src="../assets/My97DatePicker/WdatePicker.js"  charset="utf-8"></script>

<script type="text/javascript" src="../js/select_data_js_array.js" charset="utf-8"></script>
<script type="text/javascript" src="js/front.js" charset="utf-8"></script>
<script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script> 
<script type="text/javascript" src="js/artDialog.notice.js?r=co" charset="utf-8"></script>

<script type="text/javascript">
var id='<%=user.getCompanyId()%>';
var cur_path='<%=path%>';
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
			//console.info(  initdata[0] );
			$("#fm").form("load", initdata[0]);
			if( initdata[0].email_verify=='success' ){
				$('#in_email').attr("disabled",true);
				$('#email_tip_1').show();
			}else{
				$('#email_tip_3').show();
			}
			if( initdata[0].in_company_name!=""&& initdata[0].in_company_name!=null){
				$('#in_company_name').attr("disabled",true);
			}else{
				$("#in_company_name_tip").show();
			}
			if( initdata[0].in_establish_date=="" ||  initdata[0].in_establish_date==null ){
				//$('#in_establish_date').datebox("setValue",initdate() );
			}
			
			if( initdata[0].in_industry ){
				linkSelectCode('industry','in_big',false,false,initdata[0].in_big,function( d ){
					$("#in_big").bind("change",function(){
						linkSelectCode( $(this).val() ,'in_small',true,{id:'',text:'--请选择--'},d );
						$("#in_small").trigger("change");
					});
					$("#in_big").trigger("change");
				});
				$("#in_small").find("option[value='"+initdata[0].in_small+"']").attr("selected",true);

			}else{
				linkSelectCode('industry','in_big',false,false,undefined,function( d ){
					$("#in_big").bind("change",function(){
						linkSelectCode( $(this).val() ,'in_small',true,{id:'',text:'--请选择--'},d );
						$("#in_small").trigger("change");
					});
					$("#in_big").trigger("change");
				});
			}
			$("#in_small").bind("change",function(){
				if( $(this).val()!='' ){
					$("#in_industry").val( $(this).val() );
				}else{
					$("#in_industry").val( $("#in_big").val() );
				}
			});
		}
	}});
}
function editEmail()
{
	//$.messager.confirm("提示信息","修改邮箱后，需要重新验证，确定修改吗？",function(r){
	//	if(r){
			$('#in_email').attr("disabled",false );
			$('#email_tip_2').siblings('label').hide();
			$('#email_tip_2').show();
	//	}
	//});
}
function saveDataForm()
{
	var url="/esbServer.do?method=execProc&methodId=company_05&in_r=co&in_id=" + id+"&date=" + new Date();
	$("#fm").form("submit",{
		url:url,
		onSubmit:function(){
			return $(this).form("validate");
		},
		success:function( data ){
			data = decodeURIComponent(data);
			var re = eval("[" + data + "]");
			//console.info( re );
			if (re.length > 0 && re[0].returncode == "ok") {
				queryresult = re[0].queryresult;
				if( queryresult[0].ok == 'ok' ){
					msg_alert("提示信息","保存成功!","succeed",function(){
						$('body,html').animate({scrollTop:0},0);
						window.location.reload();
					});
				}else{
					msg_alert("错误信息","保存失败","error");
				}
			}else{
				msg_alert("错误信息","保存失败,请稍后再试","error");
			}
		}
	});
	
}
$.extend($.fn.validatebox.defaults.rules, {    
    telNum:{ //既验证手机号，又验证座机号
      validator: function(value, param){ 
          return /(^(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$)|(^((\d3)|(\d{3}\-))?(1[34578]\d{9})$)/.test(value);
         },    
         message: '请输入正确的电话号码。' 
    }  
});

$(function(){
	setTimeout("setData()", 500);	
	linkSelectCode('area_id','in_area_id',true,{id:'',text:'--请选择--'});
	linkSelectCode('company_nature','in_company_nature',true,{id:'',text:'--请选择--'});
	linkSelectCode('company_person_num','in_company_person_num',true,{id:'',text:'--请选择--'});
	linkSelectCode('company_registered_capital','in_company_registered_capital',false );
});
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
.list_b table {
  margin-top: 0;
}
.uploadify-button {
	margin:0;
	color:#FFF;
	background:#f39800;
	border:none;
}
.uploadify-button:hover {
	background:#04ba33;	
}
</style>
</head>

<body>
<jsp:include page="inc/header_c2.jsp" flush="true" />
<div class="container">
	<div class="cont">
    	<jsp:include page="inc/menu_c.jsp" flush="true"/>
        <!--left完成-->
        <div class="right">
            <div class="list_a list_b">
            	<h1>企业信息</h1>
                <div class="table">
                	<form name="fm" id="fm" action="" method="post">
                	<table width="750" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td class="tda">企业名称：</td>
                        <td class="tdb">
                        	<input id="in_company_name" name="in_company_name" type="text" 
                        		class="text easyui-validatebox" data-options="required:true,missingMessage:'请输入企业名称' " /></td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                      
<% if(!"1".equals( company_status )) {%>
                      <tr>
                        <td class="tda">组织机构代码证：</td>
                      	<td colspan="3">
							<table>
								<tr>
									<td>
										<input class="text" name="company_pic_name" type="text" readonly id="company_pic_name"/>
										<input type="hidden" name="in_company_pic" id="in_company_pic"/>
									</td>
									<td>
										<div id="company_pic_upload_btn" style="line-height:1em;"></div>
									</td>
									<td>
										<input style="display:none;"  type="button"  value=" 查看 " onClick="toViewPic('#company_pic_path')"/>
										<span class="red" style="font-size:12px;">请上传加盖公章的证件；格式：*.jpg;*.png，大小<1M。</span>
										<input type="hidden" name="company_pic_path" id="company_pic_path"/>
									</td>
		
								</tr>
							</table>
					  	</td>
                      </tr>
                      
                      <tr>
                        <td class="tda">营业执照：</td>
                        <td class="tdb" colspan="3">
        				<table>
        					<tr>
        						<td>
									<input class="text" name="company_img_name" type="text" readonly id="company_img_name"/>
									<input type="hidden" name="in_company_img" id="in_company_img"/>
								</td>
								<td>
									<div id="company_img_upload_btn" style="line-height:1em;"></div>
								</td>
								<td>
									<input style="display:none;"  type="button"  value=" 查看 " onClick="toViewPic('#company_img_path')"/>
									<span class="red">请上传加盖公章的证件；格式：*.jpg;*.png，大小<1M。</span>
									<input type="hidden" name="company_img_path" id="company_img_path"/>
								</td>
							</tr>
						</table>
                        </td>
                      </tr>
<%}else{ %>
                     <tr>
                        <td class="tda">组织机构代码证：</td>
                      	<td colspan="3">
		<table><tr><td>
		<input name=""  type="text" readonly disabled="disabled" value="已审核" class="text" />
		</td>
		</tr></table>
					  </td>
                      </tr>
                      <tr>
                        <td class="tda">营业执照：</td>
                        <td class="tdb" colspan="3">
        <table><tr><td>
		<input name=""  type="text" readonly disabled="disabled" value="已审核" class="text" />
		</td>
		</tr></table>
                        </td>
                      </tr>
<%} %>
                      <tr>
                      	<td class="tda">所在地区：</td>
                        <td class="tdb">
                        	<select id="in_area_id" name="in_area_id" style="width:150px;margin-bottom:0px;padding:0px;height:25px;line-height:25px;">
								<option value="">--地区--</option>
							</select>
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td class="tda">企业性质：</td>
                        <td class="tdb">
                        	<select id="in_company_nature" name="in_company_nature" style="width:150px;margin-bottom:0px;padding:0px;height:25px;line-height:25px;"
                        	class="easyui-validatebox" data-options="required:true,missingMessage:'请选择企业性质！'">
									<option value="-1">--性质--</option>
									<option value="1">国企</option>
									<option value="2">私企</option>
									<option value="3">个人</option>
									<option value="4">外企</option>
							</select>
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td class="tda">单位人数：</td>
                        <td class="tdb">
                        	<select id="in_company_person_num" name="in_company_person_num" style="width:150px;margin-bottom:0px;padding:0px;height:25px;line-height:25px;">
									<option value="-1">--性质--</option>
									<option value="1">国企</option>
									<option value="2">私企</option>
									<option value="3">个人</option>
									<option value="4">外企</option>
							</select>
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td class="tda">注册资金：</td>
                        <td class="tdb">
                        	<select id="in_company_registered_capital" name="in_company_registered_capital" style="width:150px;margin-bottom:0px;padding:0px;height:25px;line-height:25px;"
                        	class="easyui-validatebox" data-options="required:true,missingMessage:'请选择注册资金！'">
								<option value="">--选择--</option>
							</select>
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                       <tr>
                        <td class="tda">所属行业：</td>
                        <td class="tdb">
                        	<select id="in_big" name="in_big" style="width:150px;margin-bottom:0px;padding:0px;height:25px;line-height:25px;"class="easyui-validatebox" data-options="required:true,missingMessage:'请输入企业行业！'">
								<option value="">--行业--</option>
							</select>
							<select id="in_small" name="in_small" style="width:150px;margin-bottom:0px;padding:0px;height:25px;line-height:25px;" class="easyui-validatebox" data-options="required:true,missingMessage:'请输入企业行业！'">
								<option value="">--行业--</option>
							</select>
							<input type="hidden" name="in_industry" id="in_industry" />
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td class="tda">成立日期：</td>
                        <td class="tdb">
                        <input id="in_establish_date" name="in_establish_date" type="text" 
                        	class="text easyui-validatebox" data-options="required:true,missingMessage:'点击选择公司成立日期'"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" readonly/></td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td class="tda">公司地址：</td>
                        <td class="tdb">
                        <input id="in_company_addr" name="in_company_addr" type="text" style="width:350px;"
                        	class="text easyui-validatebox" data-options="required:true,missingMessage:'请输入公司地址'"  /></td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td class="tda">公司座机：</td>
                        <td class="tdb">
                        <input id="in_company_tel" name="in_company_tel"
                        	class="text easyui-validatebox"  data-options="required:true,missingMessage:'请输入正确的座机号码,如：029-88662468',invalidMessage:'请输入正确的座机号码,如：029-88662468',validType:'telNum'"/></td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td class="tda">公司网址：</td>
                        <td class="tdb">
                        <input id="in_website" name="in_website" type="text" 
                        	class="text easyui-validatebox" /></td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td class="tda" valign="top">企业简介：</td>
                        <td colspan="3" class="tdb">
                        	<textarea style="border-radius:5px; border:1px #666666 solid;"
                        		cols="80" rows="14" 
								id="in_company_info" 
								name="in_company_info" 
								class="easyui-validatebox" data-options="required:true,missingMessage:'请输入企业简介' " 
								onkeyup="this.value = this.value.substring(0, 1000)"
                        	></textarea>	
                            </td>
                      </tr>
                      <tr>
                        <td class="tda">联系人：</td>
                        <td class="tdb">
                        <input id="in_contact_person" name="in_contact_person" type="text" 
                        	class="text easyui-validatebox" data-options="required:true"  /></td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td class="tda">手机：</td>
                        <td class="tdb">
                        <input id="in_contact_tel" name="in_contact_tel"
                        	class="text easyui-validatebox easyui-numberbox" data-options="required:true,missingMessage:'请输入手机号！',invalidMessage:'请输入正确的11位手机号码。',validType:'telNum'"  /></td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td class="tda">邮箱：</td>
                        <td class="tdb">
                        <input id="in_email" name="in_email" type="text" 
                        	class="text easyui-validatebox" data-options="validType:'email',required:true" />
				 		<label id="email_tip_1" style="color:green;display:none;">已验证&nbsp;<a href="javascript:;" onclick="editEmail();" style="text-decoration:underline;">修改</a></label>
						<label id="email_tip_2" style="color:red;display:none;">请保存后验证邮件地址，以正确接收会员邮件！</label>
						<label id="email_tip_3" style="color:red;display:none;">未验证&nbsp;<a href="/verifyEmail.do?t=com"" target="_blank" style="text-decoration:underline;">验证</a></label>

                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td class="tda">QQ：</td>
                        <td class="tdb">
                        <input id="in_bind_qq" name="in_bind_qq" type="text" 
                        	class="text easyui-validatebox" data-options="required:true,missingMessage:'请输入联系QQ'"  /></td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                    </table>
                    </form>
					<div class="baocun">
                    	<ul>
                        	<li><a href="javascript:;" onclick="saveDataForm();">保存</a></li>
                        </ul>
                        <div class="clear"></div>
                    </div>
                </div>
                <!--table完成-->
          </div>
            <!--list_a完成-->   
         </div>
        <!--right完成-->
        <div class="clear"></div>	
    </div>
    <!--cont完成-->
</div>
<!--footer开始-->
<jsp:include page="inc/footer_c.jsp" flush="true"  />
<!--footer完成-->
</body>
</html>
