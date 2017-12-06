<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.factory.AdminLoginModel" %>
<%@ include file="checkLogin.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>资讯查询</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page"/>
	<script type="text/javascript">
		var cur_path = "<%=request.getContextPath()%>";
		 var role_id ="<%=role_id%>";
		 var user_code="<%=user_code%>";
	</script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"  charset="UTF-8"></script>
	<script type="text/javascript" src="NewsSearch.js"  charset="UTF-8"></script>
   <style type="text/css">
 	a {color:#000;}
   </style>
  </head>
  <body>
  
		<div class="easyui-layout" style="width: 100%; height: 330px;" data-options="fit:true,border : false">
			<div data-options="region:'north',border : false" style="background:#F4F4F4;">
		        <div style="padding:5px 0 0px 20px;">
		       		<form name="fm" id="fm" method="post">
		       		地区:
		       		<input name="in_area_id" id="in_area_id" class="easyui-validatebox"/>
					标题：
		            <input id="in_news_title" name="in_news_title" class="easyui-validatebox"/>
		            <a href="javascript:;" id="searchAndreloadData" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
		           
		            </form>
		        </div>
	    
			</div>
		
			<div data-options="region:'center',border : false">	
				<table id="resultId" name='resultId'>
				</table>
			</div>
	
	    </div>

		<div id="dlg_deal" class="easyui-dialog" fit="true" style="width: 100%; height: 100%; padding: 0px 0px" closed="true" buttons="#dlg-buttons">
			<iframe scrolling="auto" id="if_deal" frameborder="0" src="" style="width: 100%; height: 100%;"></iframe>
		</div>
		<div id="dlg_check" style="display:none">
				<div style="text-align:center; margin-bottom:12px;">
					<div style="text-align:left;width:290px;margin:auto;">备注：</div>
				 	 <textarea name="mem" id="mem" cols="45" rows="5"></textarea>
				</div>
		</div>
		<div id="dlg_change_admin" style="display:none">
			<form id="fm2" method="post"  name="fm2">
				<div style="margin:10px 20px;">
				类型：<input type="text" class="easyui-validatebox" data-options="editable:false" name="in_news_type" id="in_news_type"/>
				<%--<input type="text" class="easyui-validatebox" data-options="editable:false" name="in_sub_type" id="in_sub_type" />--%>
				</div>		
					<ul id="company_list" style="height:130px;overflow:scroll;">
						<li><input type="hidden" name="ids" value=""/>
						错误
						</li>
					</ul>

			</form>
		</div>
		<div id="dlg_change_admin2" style="display:none">
			<form id="fm3" method="post"  name="fm3">
				<%-- 所选企业列表--%>
				<ul id="company_list2" style="height:130px;overflow:scroll;">
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
		         	<% } %>
		        	 </select>
		  		 </div>
			</form>
		</div>
  		 <div id="deal_newscj" style="display:none">
			<form id="fm4" method="post"  name="fm4">
				<input type="hidden" name="in_news_id" value="" />
				<div style="padding:10px;">
					<p>回访结果:</p>
					<textarea rows="8" cols="50" name="in_remark"></textarea>
				</div>
			</form>
		</div>
  </body>
</html>
