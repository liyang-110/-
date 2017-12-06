<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.factory.ZkUserModel" %>
<%@ include file="checkLogin.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>211校招网销售查询系统</title>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	<script type="text/javascript">
		var cur_path = "<%=request.getContextPath()%>";
		<%if( isLogin || "employ".equals( role_id ) ) {%>
		var login = true;
		<%}%>
		var id="<%=user_code%>";

	</script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js" charset="utf-8"></script>
	<script type="text/javascript" src="CompanyUser.js" charset="utf-8"></script>

  	<style>
	.green {color:green;}
	.red {color:red;}
	a {text-decoration:none;}
	a:hover {text-decoration:underline;}
	</style>
  </head>
  
  <body>
		<div class="easyui-layout" style="width: 100%; height: 330px;" data-options="fit:true,border:false">
			<div data-options="region:'north',border : false" style="background:#F4F4F4;">
		        <div style="padding:10px 0 0 20px;height:50px;">
   		<form name="fm" id="fm" method="post">
					地区：
				   <input id="in_area_id" name="in_area_id" class="easyui-validatebox" data-options="width:60" />

		        	账号：
		        	<input id="in_user_id" name="in_user_id" class="easyui-validatebox"/>
		       		邮箱：
		            <input id="in_email" name="in_email" class="easyui-validatebox"/>
		       		注册时间: <input  id="in_add_time_1" name="in_add_time_1" class="easyui-datebox" style="width:100px" />
		            -- <input id="in_add_time_2" name="in_add_time_2" class="easyui-datebox" style="width:100px" />
		          <!--                 
		                          指导师：
		            <select name="in_admin_id" class="easyui-combobox" data-options="panelHeight: '300' ">
			           <option value="">全部</option>
			           
		               <%--
      		               	ZkUserModel adminModel=new ZkUserModel();
          	                List adminList = adminModel.getZkList(user_code);
          		            for(Iterator it=adminList.iterator();it.hasNext();){
          		  	                    HashMap row = (HashMap)it.next();
			           %>
			           <option value="<%=row.get("user_code") %>"><%=row.get("user_name") %>(<%=row.get("user_id") %>)</option>
		               <%
		                 	}
		               --%>
		       		</select> 
		       		-->
		       		回访日期: <input  id="in_visit_time_1" name="in_visit_time_1" class="easyui-datebox" style="width:100px" />
		            -- <input id="in_visit_time_2" name="in_visit_time_2" class="easyui-datebox" style="width:100px" />

		       		 <br/>

		       		类型：
		       		<input id="in_member_type" name="in_member_type" class="easyui-validatebox" data-options="width:80"/>
		       		到期：
		       			<input  id="in_end_date_1" name="in_end_date_1" class="easyui-datebox" style="width:100px" />
		            -- <input id="in_end_date_2" name="in_end_date_2" class="easyui-datebox" style="width:100px" />
					点数：
					<input id="in_points_1" style="width:60px;" name="in_points_1" class="easyui-numberbox"/>
					-
					<input id="in_points_2" style="width:60px;" name="in_points_2" class="easyui-numberbox"/>
					公司名称：
		            <input id="in_company_name" name="in_company_name" class="easyui-validatebox"/>

		            <a href="javascript:;" onclick="searchCompany();" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
		       		
					<a href="javascript:void(0)" class="easyui-linkbutton" 
         			data-options="iconCls:'icon-reload'" onclick="clearFormAndReload();">重置</a>
 
		       		</form>
		        </div>
	    
			</div>
			
			<div data-options="region:'center',border:false">
				<table id="resultId" name='resultId'>
				</table>
			</div>
	    </div>
<div id="datagrid-menu" style="text-align:left;"> 
<a href="javascript:void(0)" id="mb" class="easyui-menubutton" 
        data-options="menu:'#mm1',iconCls:'icon-wait'">我的帐户</a>
	<div id="mm1" style="width:150px;">
		<div data-options="iconCls:'icon-edit'" onclick="editLogin();">完善资料</div>
	    <div onclick="openPwd();">修改密码</div>
	    <div class="menu-sep"></div>
	    <div  href="login.jsp?exit=logout">退出</div>
	</div>
<a href="javascript:void(0)" id="mb2" class="easyui-menubutton" 
        data-options="menu:'#mm2',iconCls:'icon-doing'">企业管理</a>
	<div id="mm2" style="width:150px;">
		<div onclick="companyInfomation();">企业信息</div>
	    <div onclick="viewCompanyRecruit();">职位管理</div>
	    <div onclick="companyLicense();">证照管理</div>
	    <div onclick="uploadRecruitDoc();">招聘简章</div>
	</div>
<a href="javascript:void(0)" class="easyui-linkbutton" 
         data-options="iconCls:'icon-view',plain:'true'" onclick="sendShotMessage();">发送短信</a>
<a href="javascript:void(0)" class="easyui-linkbutton" 
         data-options="iconCls:'icon-view',plain:'true'" onclick="remark();">海报备注</a>

<a href="javascript:void(0)" class="easyui-linkbutton" 
         data-options="iconCls:'icon-view',plain:'true'" onclick="listLastResumes();">待处理简历</a>

<a href="javascript:void(0)" class="easyui-linkbutton" 
         data-options="iconCls:'icon-view',plain:'true'" onclick="companyStatus();">注册查询</a>
<a href="javascript:void(0)" class="easyui-linkbutton" 
         data-options="iconCls:'icon-view',plain:'true'" onclick="companyVisitRecord();">回访记录</a>
<a href="javascript:void(0)" class="easyui-linkbutton" 
         data-options="iconCls:'icon-3',plain:'true'" onclick="showNeedTodayVisit();">今日回访</a>
    
<a href="javascript:void(0)" id="mb3" class="easyui-menubutton" 
        data-options="menu:'#mm3',iconCls:'icon-view'">数据查询</a>
	<div id="mm3" style="width:150px;">
        <% if("admin".equals( session.getAttribute("chaxun") ) ){ %>
            <div><a href="jJobFairSearchAD.jsp">参会企业查询</a></div>
		<% } else { %>
            <div><a href="jJobFairSearch.jsp" target="_blank">查询招聘会</a></div>
            <div><a href="jobfair/jJobFairApply.jsp" target="_blank">游客申请招聘会</a></div>
			<div><a href="jNewsSearch.jsp" target="_blank">查询资讯</a></div>
			<div><a href="audit/jCompanyUndoFile.jsp"  target="_blank">查询学校邀请企业参会</a></div>
			<div><a href="audit/jSchoolGraduation.jsp"  target="_blank">查询学校毕业生信息</a></div>
			<div><a href="audit/jSchoolUndoFile.jsp"  target="_blank">查询企业申请招聘会</a></div>
			<div><a href="audit/jMemberRechargeLog.jsp"  target="_blank">查询企业会员套餐记录</a></div>
		<% } %>
	</div>

	

</div><!-- datagrid-menu -->   
	    

	<div id="dlg_deal" class="easyui-dialog" fit="false" style="width:700px; height: 500px; padding: 0px 0px" closed="true" buttons="#dlg-buttons">
			<iframe scrolling="auto" id="if_deal" frameborder="0" src="" style="width: 100%; height: 100%;"></iframe>
	</div>
	<div id="dlg_check" style="display:none">
			<div>海报备注：</div>
			<input type="hidden" name="in_send_type" id="in_send_type" value="user"/>

			<div style="text-align:center; margin-bottom:12px;">
		 	 <textarea name="mem" id="mem" cols="45" rows="8"></textarea>
		 	 </div>
	</div>
	<div id="dlg_check2" style="display:none">
	<form id="fm2" method="post"  name="fm">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="70" align="right">手机号：</td>
				<td><input id="in_sms_to" name="in_sms_to"  class="easyui-numberbox" data-options="required:true,missingMessage:'输入手机号',invalidMessage:'请输入11位手机号',validType:'length[11,11]' "/></td>
			</tr>
			<tr>
				<td align="right">内容：</td>
				<td><textarea  cols="25" rows="6" id="in_sms_content" name="in_sms_content" class="easyui-validatebox" data-options="required:true,missingMessage:'输入短信内容'"></textarea>
				</td>
			</tr>
		</table>
	</form>
	</div>
	<%
		if( !isLogin ){ // !"employ".equals( role_id ) ){
			%>
 <div id="editpassw" class="easyui-window" 
 		data-options="title:'登录',collapsible:false,minimizable:false,maximizable:false,icon:'con-save',closed:false,modal:true,closable:false"  
        style="width: 265px; height: 165px; padding: 5px;
        background: #fafafa;">
      <div class="easyui-layout" fit="true">
    <div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
          <table cellpadding=3>
        <tr>
              <td>用户名：</td>
              <td><input id="txtNewPass" type="text" class="txt01" /></td>
        </tr>
        <tr>
              <td>密&nbsp;&nbsp;码：</td>
              <td><input id="txtRePass" type="password" class="txt01" /></td>
        </tr>
      </table>
        </div>
	    <div region="south" border="false" style="text-align: right; height: 30px; line-height: 20px;">
	    <a id="btnEp" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)" >登录</a>
	    <% /*
	    <a id="btnCancel" class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0)">取消</a>
	    */ %>
	    </div>
	  </div>
</div>
			<%
		}else{
	%>
 <div id="editpassw" class="easyui-window" title="修改密码" collapsible="false" minimizable="false" 
        maximizable="false" icon="icon-save"  style="width: 300px; height: 175px; padding: 5px;
        background: #fafafa;" closed="true">
      <div class="easyui-layout" fit="true">
    <div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
          <table cellpadding=3>
        <tr>
              <td>新密码：</td>
              <td><input id="txtNewPass" type="password" class="txt01" /></td>
            </tr>
        <tr>
              <td>确认密码：</td>
              <td><input id="txtRePass" type="password" class="txt01" /></td>
            </tr>
      </table>
        </div>
	    <div region="south" border="false" style="text-align: right; height: 30px; line-height: 20px;">
	    <a onclick="changePwd();" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)" > 确定</a>
	    <a id="btnCancel" onclick="closePwd();"class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0)">取消</a>
	    </div>
	  </div>
</div>

	<%} %>
  </body>
</html>
