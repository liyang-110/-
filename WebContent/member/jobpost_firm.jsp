<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="inc/checkLogin_c.jsp" %>
<%
String action="/esbServer.do?method=execProc&methodId=company_recruit_03&in_r=co";
			//+"&in_company_id="+company_id+"&in_area_id="+area_id+"&in_add_person="+user_code;
if("edit".equals( request.getParameter("action") )){
	String job_id=request.getParameter("id");
	action="/esbServer.do?method=execProc&methodId=company_recruit_05&in_r=co&in_id="+job_id;
}
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><%=company_name %> - 发布职位</title>
<link rel="stylesheet" href="style/bootstrap.nav.css" type="text/css"></link>
<link rel="stylesheet" href="/js/jquery-easyui/themes/default/easyui.css" type="text/css">

<link type="text/css" rel="stylesheet" href="style/core.css" />
<link type="text/css" rel="stylesheet" href="img2/core.css" />

<link type="text/css" rel="stylesheet" href="style/first_firm.css" />
<link type="text/css" rel="stylesheet" href="style/alter_general.css"/>
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
<link rel="stylesheet" href="../js/jquery-easyui/themes/metro/validatebox.css" type="text/css"></link>
<script type="text/javascript" src="../js/jquery-easyui/jquery.easyui.min.js"></script>

<script type="text/javascript">
var user_code = "<%=user_code%>";
var company_id = "<%=company_id%>";
var area_id = "<%=area_id%>";
var chargetype= "<%=user.getChargeType() %>";
var action="<%=request.getParameter("action")%>";
var job_id="<%=request.getParameter("id")%>";
</script>
<script src="/statics/artDialog/artDialog.js?skin=green"></script>

<script src="/statics/artDialog/plugins/iframeTools.js"></script>
<script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script> 
<script type="text/javascript" src="js/artDialog.notice.js?r=co" charset="utf-8"></script>

<link href="/js/layer/skins/default.css" rel="stylesheet" />
<script type="text/javascript" src="/js/layer/getprovince211.js" charset="utf-8"></script>
<script type="text/javascript" src="/js/layer/getposition.js" charset="utf-8"></script>
<script type="text/javascript" src="/js/layer/jobjss.js" charset="utf-8"></script>
<script type="text/javascript" src="../js/select_data_js_array.js" charset="utf-8"></script>
<script type="text/javascript" src="js/front.js" charset="utf-8"></script>
<% if("edit".equals( request.getParameter("action") )){ %>
<script type="text/javascript" src="js/company_recruit_edit.js" charset="utf-8"></script>
<% }else{ %>
<script type="text/javascript" src="js/company_recruit_add.js" charset="utf-8"></script>
<% } %>
</head>
<body>
<jsp:include page="inc/header_c2.jsp" flush="true" />
<div class="container">
	<div class="cont">
    	<jsp:include page="inc/menu_c.jsp" flush="true"/>
        <!--left完成-->
        <div class="right">
            <div class="list_a list_b">
            	<h1>发布职位</h1>
                <div class="right_bottom">
                    <div class="bottom_a">
                        <form name="fm" id="fm" method="post" 
                        	action="<%=action%>">
                        <table width="750" border="0">
                         <tr>
                            <td width="106" class="tda"><span><img src="img/images/wanshan_15.gif" /></span>职位名称：</td>
                            <td width="560" class="tdb"><input id="in_job_name" maxlength="10" name="in_job_name" class="easyui-validatebox text" 
		data-options="required:true,missingMessage:'请输入职位名称' ,validType:'length[2,10]' , invalidMessage:'职位名称长度为2到10个字符' "/>
		<span style="color:red">( 职位发布后,名称不允许修改  )</span>
		</td>
                          </tr>
                           <!-- <tr>
                             <td class="tda"><span><img src="img/images/wanshan_15.gif" /></span>职位名称：</td>
                            <td class="tdb">
		<input name="in_job_name" id="in_job_name" type="text" class="easyui-validatebox text" data-options="required:true,missingMessage:'请选择岗位' " readonly/>
		<input id="in_position" name="in_position" type="hidden" />
		<a class="button fabu" href="javascript:;" onclick="JumpSearchLayer(1,'fm','in_position','in_job_name',1);" >请选择</a>
		<span style="color:red">( 职位发布后,名称不允许修改  )</span>
                             </td>
                          </tr> -->
                          <tr>
                             <td class="tda"><span><!-- <img src="img/images/wanshan_15.gif" /> --></span>职位类别：</td>
                            <td class="tdb">
		<input name="positions" id="positions" type="text" class="easyui-validatebox text" data-options="missingMessage:'请选择岗位类别' " readonly/>
		<input id="in_position" name="in_position" type="hidden" />
		<a class="button fabu" href="javascript:;" onclick="JumpSearchLayer(1,'fm','in_position','positions',1);" >请选择</a><span style="color:red">(填写职位类别,有利于系统为您精准匹配人才！ )</span>
                             </td>
                          </tr>
                          <tr>
                            <td width="106" class="tda"><span><img src="img/images/wanshan_15.gif" /></span>招聘类型：</td>
                            <td class="tdb radio">
        <style>
        	td.radio input[type='radio'] {
        		font-size:16px;
        		line-height:16px;
        		width:16px;
        		height:16px;
        	}
        	td.radio label {margin-right:25px;}
        </style>
		<label>
		<input type="radio" checked="checked" value="全职" name="in_job_type" />全职</label>
		<label>
		<input type="radio" value="兼职" name="in_job_type" />兼职</label>
		<label>
		<input type="radio" value="实习" name="in_job_type" />实习</label>
                             </td>
                          </tr>
                          <tr>
                             <td class="tda"><span><img src="img/images/wanshan_15.gif" /></span>工作地区：</td>
                            <td class="tdb">
		<input name="areas" id="areas" type="text" class="easyui-validatebox text" data-options="required:true,missingMessage:'请选择工作地区' "  readonly/>
		<input name="in_area" type="hidden"  id="in_area"/>
		<a href="javascript:;" onclick="JumpSearchLayer(2,'fm','in_area','areas',1);">请选择</a>
		
                             </td>
                          </tr>
                         
                          <tr>
                             <td class="tda"><span><img src="img/images/wanshan_15.gif" /></span>招聘人数：</td>
                            <td class="tdb"><input id="in_job_person_num" name="in_job_person_num" class="easyui-numberbox text" style="width:100px;" value="1" 
                            	data-options="missingMessage:'请输入招聘人数,范围1-100',invalidMessage:'请输入1 - 100之间的整数',min:1,max:100,required:true"/>人</td>
                          </tr>
                           <tr>
                             <td class="tda"><span><img src="img/images/wanshan_15.gif" /></span>性别限制：</td>
                            <td class="tdb">
                                <select id="in_sex" name="in_sex" style="width:100px;margin-bottom:0px;padding:0px;height:25px;line-height:25px;">
                                    <option value="">不限</option>
                                    <option value="男">男</option>
                                    <option value="女">女</option>
                                </select>
                             </td>
                          </tr>
                           <tr>
                             <td class="tda"><span><img src="img/images/wanshan_15.gif" /></span>学历要求：</td>
                            <td class="tdb">
                                <select id="in_education" name="in_education" style="width:100px;margin-bottom:0px;padding:0px;height:25px;line-height:25px;">
                                    <option value="">不限</option>
                                </select>及以上
                             </td>
                          </tr>
                          <tr>
                             <td class="tda"><span><img src="img/images/wanshan_15.gif" /></span>月薪：</td>
                            <td class="tdb">
                            	<%-- 
                             	<select id="in_money" name="in_money" style="width:100px;margin-bottom:0px;padding:0px;height:25px;line-height:25px;">
                                </select>
                                --%>
                                <input id="in_money_1" name="in_money_1" class="easyui-numberbox text" style="width:100px;" value="2000" 
                            	data-options="missingMessage:'请输入月薪范围',invalidMessage:'请输入整数',min:0,required:true"/>
                            	-
                            	<input id="in_money_2" name="in_money_2" class="easyui-numberbox text" style="width:100px;" value="3000" 
                            	data-options="missingMessage:'请输入月薪范围',invalidMessage:'请输入整数',min:0,required:true"/>
                            	
                            	<input id="in_money" type="hidden" name="in_money"/>
                            	
                            	<label>
                            	&nbsp;&nbsp;
                            	<input id="in_money_cus" type="checkbox" name="in_money_cus" value="1"/>&nbsp;面议
                            	</label>
                            </td>
                          </tr>
	<tr id="selectProfession"  style="display:none;">
		<td class="tda">招聘专业：</td>
		<td class="tdb"><input id="in_professional" name="in_professional" type="hidden" class="easyui-validatebox text" />
		<input onClick="toOpen()" id="professional_name" name="professional_name" type="text"  class="inputbox" readonly />
		<input  type="button" class="button" value="请选择 " onClick="toOpen()"/>
		<a href="javascript:;" onclick="inputProfession();">点击这里输入招聘专业</a>
		</td>
	</tr>
	<tr id="inputProfession">
		<td class="tda"><span><img src="img/images/wanshan_15.gif" /></span>招聘专业：</td>
		<td class="tdb">
			<input class="easyui-validatebox text" data-options="required:true,missingMessage:'请输入专业' " id="in_profession" name="in_profession" style="width:300px;"/>
			<!--
			<a href="JavaScript:;" onclick="selectProfession();">点击这里选择专业</a>
			-->
		</td>
	</tr>
		<script type="text/javascript">
		function selectProfession()
		{
			$("#inputProfession").hide();
			$("#selectProfession").show();
			$("#in_profession").val("");
		}
		function inputProfession()
		{
			$("#inputProfession").show();
			$("#selectProfession").hide();
			$("#in_professional").val("");
			$("#professional_name").val("");
		}
	</script>
	<tr>
		<td class="tda">岗位职责：</td>
		<td class="tdb">
		<textarea cols="60" rows="6" id="in_introduction" name=in_introduction onkeyup="this.value = this.value.substring(0, 1000)" onmouseout="$(this).trigger('keyup')"></textarea>

		</td>
	</tr>
	<tr>
		<td class="tda">任职资格：</td>
		<td class="tdb">
		<textarea cols="60" rows="6" id="in_requirement" name="in_requirement" onkeyup="this.value = this.value.substring(0, 1000)" onmouseout="$(this).trigger('keyup')"></textarea>

		</td>
	</tr>
                          <tr>
                             <td class="tda"></td>
                             <td class="tdb">
                             	<a href="javascript:;" class="fabu form_submit">保存</a>     
                             	
                             	<a href="jobposted_firm.jsp" class="fabu">取消</a>                         
                            </td>
                          </tr>
                        </table>
                        </form>
                    </div>
            	</div>
            	<!--right_bottom完成-->   
          	</div>
            <!--list_a完成-->   
        </div>
        <!--right完成-->
        <div class="clear"></div>	
    </div>
    <!--cont完成-->
</div>
<!--footer开始-->
<jsp:include page="inc/footer_c.jsp" flush="true" />
<!--footer完成-->
</body>
</html>
