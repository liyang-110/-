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
		var querystr="&in_filter=zhaoke&in_role_id=<%=role_id%>";
	</script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"  charset="UTF-8"></script>
	<script type="text/javascript" src="StudentSearch.js"  charset="UTF-8"></script>
  </head>
  
  <body>
  
		<div class="easyui-layout" style="width: 100%; height: 330px;" data-options="fit:true,border : false">
			<div data-options="region:'north',border : false" style="background:#F4F4F4;">
		        <div style="padding:5px 0 0 10px;">
		        			<form name="fm" id="fm" method="post">
        	姓名：<input id="in_student_name" name="in_student_name" class="easyui-validatebox" /> 			
         	学历：<input id="in_education" name="in_education" class="easyui-validatebox" />
          	学校：<input id="in_school_name" name="in_school_name" class="easyui-validatebox" />
         	专业：<input id="in_profession" name="in_profession" class="easyui-validatebox"  style="width:110px;"/>
			<br/>
			        	
          	注册日期: <input  id="in_add_time_1" name="in_add_time_1" class="easyui-datebox" style="width:100px" />
            -- <input id="in_add_time_2" name="in_add_time_2" class="easyui-datebox" style="width:100px" />
          	审核日期: <input  id="in_audit_time_1" name="in_audit_time_1" class="easyui-datebox" style="width:100px" />
            -- <input id="in_audit_time_2" name="in_audit_time_2" class="easyui-datebox" style="width:100px" />

  
            
            <a href="javascript:;" onclick="searchStudent();" class="easyui-linkbutton" iconCls="icon-search">搜索</a>	
           
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
		<%--招客学生审核 
		<div id="dlg_check" style="display:none">
				<div>批注意见：</div>
				<div style="text-align:center; margin-bottom:12px;">
			 	 <textarea name="mem" id="mem" cols="45" rows="8"></textarea>
			 	 </div>
		</div>
		--%>
		<div id="dlg_student_audit" style="display:none;overflow:hidden;">
		<form id="student_audit_fm" method="post"  name="student_audit_fm">
			<ul id="student_list" style="height:105px;overflow-y:scroll;">
				<li><input type="hidden" name="ids" value="" />
					错误
				</li>
			</ul>
			<div  style="padding-left:15px;">未通过请备注原因:</div>
			<div style="margin-bottom:12px;padding-left:15px;">
			 	 <textarea name="in_remark" id="in_remark" cols="45" rows="2"></textarea>
			</div>
		</form>
		</div>
		
		
		<div id="dlg_eidt_hire" style="display:none">
			<div class="easyui-layout" fit="true">
   			 <div region="center" border="false" style="padding:15px;">
				<form id="dlg_eidt_hire_fm" method="post">
				<input type="hidden" name="in_action" value="hire" />
				<input type="hidden" name="in_user_code" value="" />
				<table>
					<tr>
						<td><label>姓名：</label></td>
						<td>
							<input readonly="readonly" name="user_name" size="40" class="easyui-validatebox"/>
						</td>
					</tr>
					<tr>
						<td><label>状态：</label></td>
						<td>
					      	<select name="in_hire_state" class="easyui-combobox">
					      		<option value="HIRE">入职</option>
					      		<option value="LEAVE">离职</option>
					      	</select>
					     </td>
					</tr>
					<tr>
						<td><label>日期：</label></td>
						<td>
							<input name="in_begin_date"  class="easyui-datebox" required="required"/>
						</td>
					</tr>
					<tr>
						<td><label>公司名称：</label></td>
						<td>
					    	<input name="in_company_name" class="easyui-validatebox" size="40"/>
					    </td>
					</tr>
					<tr>
						<td><label>备注信息：</label></td>
						<td>
			 				<textarea name="in_remark"  cols="36" rows="3"></textarea>
						</td>
					</tr>
				</table>
				</form>
			</div>
			</div>
		</div>
		
  </body>
</html>
