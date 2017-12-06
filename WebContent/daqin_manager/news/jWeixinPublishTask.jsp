<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../include/checkLogin.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title></title>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	<script type="text/javascript">
		var cur_path = "<%=request.getContextPath()%>";
		var role_id = "<%=role_id%>";
		var querystr="&in_role_id="+role_id;
	</script>
	<script type="text/javascript" src="/js/js_common.js" charset="utf-8"></script>
	<script type="text/javascript" src="WeixinPublishTask.js" charset="utf-8"></script>
  	<style>
	.green {color:green;}
	.red {color:red;}
	</style>
  </head>
  
  <body>
		<div class="easyui-layout" style="width: 100%; height: 230px;" data-options="fit:true,border:false">
			<div data-options="region:'north',border : false" style="background:#F4F4F4;">
		        <div style="padding:10px 0 0 20px;">
		  <form id="fm" name="fm" method="post">  
		       公司名称：
		            <input id="in_company_name" name="in_company_name" class="easyui-validatebox"/>

		       会员截至： <input  id="in_end_date_1" name="in_end_date_1" class="easyui-datebox" style="width:100px" />
		            -- <input id="in_end_date_2" name="in_end_date_2" class="easyui-datebox" style="width:100px" />

		            <a href="#" id="searchAndreloadData" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
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
		
		<div id="dlg_check" style="display:none">
		</div>
		
		<div id="dlg_view" class="easyui-dialog" fit="true" style="width: 100%; height: 100%; padding: 0px 0px" closed="true" buttons="#dlg-buttons">
			<iframe scrolling="auto" id="if_view" frameborder="0" src="" style="width: 100%; height: 100%;"></iframe>
		</div>
		
		<div id="dlg_inputPublish" style="display:none">
			<div class="easyui-layout" fit="true">
   			 <div region="center" border="false" style="padding:15px;">
				<form id="inputPublishForm" method="post">
				<input type="hidden" name="in_action" value="publish" />
				<input type="hidden" name="in_company_id" value="" />
				<table>
					<tr>
						<td><label>客户名称：</label></td>
						<td>
							<input readonly="readonly" name="company_name" size="40" class="easyui-validatebox"/>
						</td>
					</tr>
					<tr>
						<td><label>发布状态：</label></td>
						<td>
					      	<select name="in_publish_state" class="easyui-combobox">
					      		<option value="SUCCESS">已发布</option>
					      		<option value="NOT">未发布</option>
					      	</select>
					     </td>
					</tr>
					<tr>
						<td><label>发布日期：</label></td>
						<td>
							<input name="in_publish_date"  class="easyui-datebox" required="required"/>
						</td>
					</tr>
					<tr>
						<td><label>文章地址：</label></td>
						<td>
					    	<input name="in_article_url" id="in_article_url" class="easyui-validatebox" size="40"/>
					    </td>
					</tr>
					<tr>
						<td><label>文章标题：</label></td>
						<td>
			 				<textarea name="in_article_title" id="in_article_title" cols="36" rows="3"></textarea>
						</td>
					</tr>
				</table>
				</form>
			</div>
			</div>
		</div>
		
  </body>
</html>
