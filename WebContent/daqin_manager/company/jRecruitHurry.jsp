<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../include/checkLogin.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title></title>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	<script type="text/javascript">
		var cur_path = "<%=request.getContextPath()%>";
		var querystr="&in_role_id=<%=role_id%>";
	</script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"  charset="UTF-8"></script>
	<script type="text/javascript" src="RecruitHurry.js"  charset="UTF-8"></script>
  </head>
  
  <body>
  
		<div class="easyui-layout" style="width: 100%; height: 330px;" data-options="fit:true,border : false">
			<div data-options="region:'center',border : false">	
				<table id="resultId" name='resultId'>
				</table>
			</div>
	
	    </div>
       <div id="toolbar" style="padding:0 0 0 20px;text-align:left;">
        	<div style="padding:5px 0;">
        	
        	企业：<input id="in_company_name" name="in_company_name" class="easyui-validatebox" />
        	职位：<input id="in_position" name="in_position" class="easyui-validatebox" />
        	截至: <input  id="in_end_date_1" class="easyui-datebox" style="width:100px" />
            -- <input id="in_end_date_2" class="easyui-datebox" style="width:100px" />
            <a href="javascript:;" onclick="searchStudent();" class="easyui-linkbutton" iconCls="icon-search">搜索</a>	
            <!-- 
            <a href="javascript:;" onclick="deleteStudent();" class="easyui-linkbutton" iconCls="icon-cancel1"><span style="color:red;">删除</span></a>	
			 -->
	        </div>
        </div>
		<div id="dlg_deal" class="easyui-dialog" fit="true" style="width: 100%; height: 100%; padding: 0px 0px" closed="true" buttons="#dlg-buttons">
			<iframe scrolling="auto" id="if_deal" frameborder="0" src="" style="width: 100%; height: 100%;"></iframe>
		</div>
	    
   
  </body>
</html>
