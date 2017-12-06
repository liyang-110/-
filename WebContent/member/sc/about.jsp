<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="include/checkLogin.jsp" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>高校简介</title>
<link type="text/css" rel="stylesheet" href="style/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="style/core.css" />
<link type="text/css" rel="stylesheet" href="style/all.css" />
<link type="text/css" rel="stylesheet" href="style/form.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/adddate.js"></script>

<link rel="stylesheet" href="/js/jquery-easyui/themes/metro/validatebox.css" type="text/css"></link>
<script type="text/javascript" src="/js/jquery-easyui/jquery.easyui.min.js"></script>

<script src="/assets/artDialog/artDialog.js?skin=green"></script>
<script src="/assets/artDialog/plugins/iframeTools.js"></script>

<script type="text/javascript" src="/js/select_data_js_array.js" charset="utf-8"></script>
<script type="text/javascript" src="../js/front.js" charset="utf-8"></script>
<script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script> 
<script type="text/javascript" src="../js/artDialog.notice.js?r=sc" charset="utf-8"></script>
<script type="text/javascript">
var id ="<%=school_id%>";
function saveDataForm()
{
	var ls_url = "/esbServer.do?method=execProc&methodId=school_05&in_r=sc&in_id=" + id+"&date=" + new Date();
	
	if($("#in_contact_fixedtel_1").val()!=0 || $("#in_contact_fixedtel_2").val()!=0){		
		$("#in_contact_fixedtel").val($("#in_contact_fixedtel_1").val()+"-"+$("#in_contact_fixedtel_2").val());
	}
	
	$("#fm").form("submit",{
		url:ls_url,
		onSubmit:function(){
			return $(this).form("validate");;
		},
		success:function( data ){
			data = decodeURIComponent(data);
			var re = eval("[" + data + "]");
			console.info( re );
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
var cur_path = "<%=request.getContextPath()%>";
function setData() {	
	var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=school_04&in_id=" + id + "&date=" + new Date();
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
			}
		}
	});
}
$(function(){
	linkSelectCode('area_id','in_area_id',true,'','');
	setTimeout("setData()", 500);
});
</script>
<link rel="stylesheet" href="/statics/Huploadify/Huploadify.css" type="text/css"></link>
<script type="text/javascript" src="/statics/Huploadify/jquery.Huploadify.js" charset="utf-8"></script>
<script type="text/javascript" src="/statics/Huploadify/autouploadfile.js" charset="utf-8"></script>
<script type="text/javascript">
$(function(){
	Huploadify_file('logo_img_upload_btn', '' ,"in_logo_img","in_logo_img_name","img","uploader",function(d){
	var temp = d.split("|");
		var path = temp[2];
		$("#in_logo_path").val( path );
	});
	Huploadify_file('poster_img_upload_btn', '' ,"in_poster_img","in_poster_img_name","img","uploader",function(d){
	var temp = d.split("|");
		var path = temp[2];
		$("#in_poster_path").val( path );
	});

});
</script> 
<style type="text/css">
.list_b table {
  margin-top: 0;
}
.uploadify-button {
	margin:0;
	color:#FFF;
	background:#599f06;
	border:none;
	width:90px;
}
.uploadify-button:hover {
	background:#6495ED;	
}
table td .padd{
	padding:0px;
}
</style>   
</head>

<body>
<jsp:include page="include/head.jsp" flush="true"/>
<!--menu完成-->
<div class="hy">
	<p>当前位置：首页 &gt; <a href="/member/sc/home.do" style="color:#5a9707;">会员中心</a> </p>
</div>
<!--当前位置-->
<div class="header_main">
	<div class="clearfix">
        <div class="pull-left">
            <div class="pull_left">
                <!--折叠-->
                <jsp:include page="include/menu.jsp" flush="true"/>
            </div>
        </div>
    	<!--pull-left结束-->
        <div class="pull-right">
            <div class="pull_right">
                <div class="biankuang">
                	<div class="list_alter">
                    	<span style="color:#FFF; font-weight:bold; font-size:16px;">高校简介</span>
                    </div>
                    <!----------------------------标题------------------------------------->
                    <div class="form" style="margin:20px 0;padding-left:50px;">
                    	<form id="fm" method="post"  name="fm">
                    	<table class="table">
                           <tbody>
                              <tr>
                                 <td class="text_right">单位名称：</td>
                                 <td class="text_left" >
                                   <input type="text" name="in_school_name" readonly="readonly" class="form-control easyui-validatebox" 
                                   	data-options="required:true,missingMessage:'请输入学校名称' " placeholder="">
                                 </td>
                              </tr>
                              <tr>
                                 <td class="text_right">地区：</td>
                                 <td class="text_left">
                                   <select id="in_area_id" name="in_area_id" class="form-control width">

                                   </select>
                                 </td>
                              </tr>
                               <tr>
                                 <td class="text_right">详细地址：</td>
                                 <td class="text_left">
                                   <input type="text" id="in_school_addr" name="in_school_addr" class="form-control" placeholder="">
                                 </td>
                              </tr>
                              <tr>
                                 <td class="text_right">联系方式：</td>
                                 <td class="text_left">
                                   <textarea class="form-control"  id="in_school_contact" name="in_school_contact" rows="3"></textarea>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="text_right">网址：</td>
                                 <td class="text_left">
                                   <input type="text" id="in_school_website" name="in_school_website" class="form-control" placeholder="">
                                 </td>
                              </tr>
                              <tr>
                                 <td class="text_right">简介：</td>
                                 <td class="text_left">
                                   <textarea id="in_school_info" name="in_school_info" class="form-control" rows="6"></textarea>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="text_right">联系人：</td>
                                 <td class="text_left">
                                 	<input id="in_contact_person" data-options="required:true,missingMessage:'请输入联系人' " name="in_contact_person"  class="form-control width easyui-validatebox " type="text"  placeholder="">
                                 </td>
                              </tr>
                               <tr>
                                 <td class="text_right">固定电话：</td>
                                 <td class="text_left">
                                 	<input id="in_contact_fixedtel_1" maxlength="3" data-options="required:false,missingMessage:'请输入手机号码',invalidMessage:'只能输入数字' " name="in_contact_fixedtel_1"  class="form-control width  " type="text"  placeholder="" style="width:50px;display:inline;">&nbsp;-
                                 	<input id="in_contact_fixedtel_2" maxlength="8" data-options="required:false,missingMessage:'请输入手机号码',invalidMessage:'只能输入数字' " name="in_contact_fixedtel_2"  class="form-control width  " type="text"  placeholder="" style="width:104px;display:inline;">                              
                                 	<input id="in_contact_fixedtel" name="in_contact_fixedtel"  type="hidden" />                              
                                 	
                                 </td>
                              </tr>
                              <tr>
                                 <td class="text_right">手机：</td>
                                 <td class="text_left">
                                 	<input id="in_contact_tel" data-options="required:true,missingMessage:'请输入手机号码',invalidMessage:'只能输入数字' " name="in_contact_tel"  class="form-control width easyui-numberbox " type="text"  placeholder="">
                                 </td>
                              </tr>
                              <tr>
                                 <td class="text_right">电子邮件：</td>
                                 <td class="text_left">
                                 	<input type="text"  data-options="required:true,validType:'email',missingMessage:'请输入联系邮箱',invalidMessage:'请输入正确的电子邮箱地址' " id="in_email" name="in_email" class="form-control easyui-validatebox"  placeholder="">
                                 </td>
                              </tr>
                             <tr>                            
                             <tr>
								<td class="text_right">校徽图片：</td>
								<td class="text_left">	
								<table class="padd" style="margin-left:-5px;"><tr><td>
									<input class="form-control" name="in_logo_img_name" type="text" readonly id="in_logo_img_name" />
									<input type="hidden" name="in_logo_img" id="in_logo_img"/>
									<input type="hidden" name="in_logo_path" id="in_logo_path" />
									</td><td>
									<div id="logo_img_upload_btn" style="line-height:1em;">
									</div>
									</td>
									<td>
									<span class="red" style="white-space:nowrap;">格式：*.jpg;*.png，大小<1M。</span>
									</td>
									</tr>
								</table>
								</td>
							  </tr>
							  <tr>
								<td class="text_right" style="white-space:nowrap;">校园招聘会海报：</td>
								<td class="text_left">	
								<table class="padd" style="margin-left:-5px;"><tr><td>
									<input class="form-control" name="in_poster_img_name" type="text" readonly id="in_poster_img_name" />
									<input type="hidden" name="in_poster_img" id="in_poster_img"/>
									<input type="hidden" name="in_poster_path" id="in_poster_path" />
									</td><td>
									<div id="poster_img_upload_btn" style="line-height:1em;">
									</div>
									</td>
									<td>
									<span class="red" style="white-space:nowrap;">格式：*.jpg;*.png，大小<1M。</span>
									</td>
									</tr>
								</table>
								</td>
							  </tr>
                              <tr>
                              	 <td class="text_right"></td>
                                 <td class="text_left">
                                 	<button type="button" class="btn btn-default anniu_a" onclick="saveDataForm();">保存</button>
                                 </td>
                              </tr>
                        
                           </tbody>
                        </table>
                        </form>
                    </div>
                    <!--form------>
                </div>
            </div>
            <!--pull-right结束-->
        </div>
	</div>	
</div>
<!--footer-->
<jsp:include page="include/foot.jsp" flush="true" />

</body>
</html>
