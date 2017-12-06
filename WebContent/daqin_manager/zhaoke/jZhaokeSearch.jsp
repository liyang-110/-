<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.factory.AdminLoginModel" %>
<%@ include file="../include/checkLogin.jsp" %>
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
		var role_id="<%=role_id%>";
	</script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"></script>
	<script type="text/javascript" src="Login.js" charset="UTF-8"></script>
  </head>
  
  <body>
		<div class="easyui-layout" style="width: 100%; height: 350px;" data-options="fit:true">
			
		<div data-options="region:'north',border : false" style="background:#F4F4F4;">
	        <div style="padding:10px 0 0 20px;">
	        <form id="fm" name="fm" method="post">
	        <%if("00".equals(role_id)) {%>
	                           分站：
                <input id="in_area_id" name="in_area_id" class="easyui-validatebox" style="width:60px;"/>
	          <%} %>                   
	                             招聘顾问：
	            <select name="in_admin_id" class="easyui-combobox" data-options="panelHeight: '300' ">
			           <option value="">全部</option>
			           <option value="0">未分配</option>
			           <option value="1">待分配</option>
		               <%
		                    AdminLoginModel adminModel=new AdminLoginModel();
	                        List adminList = adminModel.getSelfAdminList(user_code);
		                    for(Iterator it=adminList.iterator();it.hasNext();){
		  	                    HashMap row = (HashMap)it.next();
		               %>
			           <option value="<%=row.get("user_code") %>"><%=row.get("user_name") %>(<%=row.get("user_id") %>)</option>
		               <%
		                 }
		               %>
		       </select>                  
	                            账号：
	        	<input id="in_user_id" name="in_user_id" class="easyui-validatebox"/>
	                             姓名：
	            <input id="in_user_name" name="in_user_name" class="easyui-validatebox"/>
	                           
	   <%--    
	       注册时间: <input  id="" name="" class="easyui-datebox" style="width:100px" />
	            -- <input id="" name="" class="easyui-datebox" style="width:100px" />
	    --%>       
	            <a href="#" id="searchAndreloadData" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
	     		<label>
	     		<input type="radio" name="in_sort" value="com"  onclick="$('#searchAndreloadData').trigger('click');"/>企业数降序
	     		</label>
	     		<label>
	     		<input type="radio" name="in_sort" value="stu" onclick="$('#searchAndreloadData').trigger('click');"/>学生数降序
	     		</label>
	     		</span>
	      	</form>
	        </div>
    
		</div>
			
			<div data-options="region:'center',border:false">
				<table id="resultId" name='resultId'>
				</table>
			</div>
	    </div>
	    
		<div id="dlg_deal" class="easyui-dialog" fit="true" style="width: 100%; height: 100%; padding: 0px 0px" closed="true" buttons="#dlg-buttons">
			<iframe scrolling="auto" id="if_deal" frameborder="0" src="" style="width: 100%; height: 100%;"></iframe>
		</div>
		<div id="dlg_change_admin" style="display:none">
	
	<form id="fm2" method="post"  name="fm2">
	
		<%-- 所选招客列表--%>
		<ul id="zk_list" style="height:130px;overflow:scroll;">
			<li><input type="hidden" name="ids" value=""/>
				错误
			</li>
		</ul>
		<%-- 招聘顾问列表--%>
		 <div style="margin-left:20px;">
		      管理员：
		       <select name="in_admin_id">
		         <%
		               AdminLoginModel model=new AdminLoginModel();
		               List list=model.getSelfAdminList(user_code);
		               for(Iterator it=list.iterator();it.hasNext();){
		                  HashMap row = (HashMap)it.next();
		         %>
			   <option value="<%=row.get("user_code") %>"><%=row.get("user_name") %>(<%=row.get("user_id") %>)</option>
		        <%
		           }
		        %>
		       </select>
		
		</div>
	</form>
  </body>
</html>
