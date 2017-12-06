<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="../include/checkLogin.jsp" %>
<%@ page import="com.zhaopin.dao.factory.AdminLoginModel" %>
<%
	AdminLoginModel adminModel=new AdminLoginModel();
	List adminList = adminModel.getSelfAdminList(user_code);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page"/>
	<script type="text/javascript">
		var cur_path = "<%=request.getContextPath()%>";
		var school_id ="";
		var job_fair_id="<%=request.getParameter("id")!=null ?request.getParameter("id") :""%>";
		var title="黑名单企业";
	</script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"></script>
	<script type="text/javascript" src="CompanyBlack.js" charset="UTF-8"></script>
   <link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/bootstrap/panel.css" type="text/css"></link>
   <link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/bootstrap/window.css" type="text/css"></link>
 	<script type="text/javascript">
	 $(function(){
	 		if( window!=top ){
	 			window.parent.$('body,html').animate({scrollTop:0},200);
	 		}
	 });
	</script>
  </head>
  
  <body>
		<div class="easyui-layout" style="width: 100%; height: 350px;" data-options="fit:true,border:false">
<div data-options="region:'north',border : false" style="background:#F4F4F4;">
		        <div style="padding:5px 0 5px 20px;">
		       		<form name="fm" id="fm" method="post">
					地区：
				   <input id="in_area_id" name="in_area_id" class="easyui-validatebox" />
		                        招聘顾问：
		           <select name="in_admin_id" class="easyui-combobox" data-options="panelHeight: '300' ">
						<option value="">全部</option>
						<option value="0">未分配</option>
						<option value="1">待分配</option>
					<%
					  for(Iterator it=adminList.iterator();it.hasNext();){
					  	HashMap row = (HashMap)it.next();
					%>
						<option value="<%=row.get("user_code") %>"><%=row.get("user_name") %>(<%=row.get("user_id") %>)</option>
					<%}
					%>
					</select>
		       		类型：
		       		<input id="in_member_type" name="in_member_type" class="easyui-validatebox" />
		      		公司名称：
		            <input id="in_company_name" name="in_company_name" class="easyui-validatebox"/>
		            <a href="javascript:;" id="searchAndreloadData" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
		           
		            </form>
		        </div>
	    
			</div>
			
			<div data-options="region:'center',split:true,border:false">
				<table id="resultId" name='resultId'>
				</table>
			</div>
	    </div>
		<div id="dlg_deal" class="easyui-dialog" fit="true" style="width: 100%; height: 100%; padding: 0px 0px" closed="true" buttons="#dlg-buttons">
			<iframe scrolling="auto" id="if_deal" frameborder="0" src="" style="width: 100%; height: 100%;"></iframe>
		</div>
		
		<div id="dlg_check" style="display:none">
				
				<input type="hidden" name="in_send_type" id="in_send_type" value="user"/>
				<div>
					<ul>
					<li><label><input type="radio" value="不按规定时间参加招聘会。" name="reason_type" />不按规定时间参加招聘会</label></li>
					<li><label><input type="radio" value="夸大宣传。" name="reason_type" />夸大宣传</label></li>
					<li><label><input type="radio" value="有收取学生费用行为。" name="reason_type" />有收取学生费用行为</label></li>
					<li><label><input type="radio" value="其他。" name="reason_type" />其他</label></li>
					</ul>
				</div>
				<div style="text-align:center; margin-bottom:12px;">
					<div style="text-align:left;width:290px;margin:auto;">备注：</div>
				 	 <textarea name="mem" id="mem" cols="45" rows="5"></textarea>
				</div>
		</div>
  </body>
</html>
