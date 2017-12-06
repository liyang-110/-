<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../include/checkLogin.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title></title>
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
	<meta http-equiv="description" content="This is my page"/>
	<script type="text/javascript">
		var cur_path = "<%=request.getContextPath()%>";
		var user_code ="<%=user_code%>";
		var querystr="&in_zk_id=<%=user_code%>";
		var zk_url="http://www.211zph.com/register.jsp?tid=<%=user_id %>";
	</script>
<link rel="stylesheet" type="text/css" href="../easyui/1.3.4/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../css/wu.css" />
<link rel="stylesheet" type="text/css" href="../css/icon.css" />
<%-- 
<script type="text/javascript" src="../js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="../easyui/1.3.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../easyui/1.3.4/locale/easyui-lang-zh_CN.js" charset="utf-8"></script>

<script type="text/javascript" src="../js/common.js" charset="utf-8"></script>
--%>
<script type="text/javascript" src="/js/js_common.js"></script>

<script type="text/javascript" src="StudentSearch.js"  charset="UTF-8"></script>
  </head>
  
  <body>
  
		<div class="easyui-layout" style="width: 100%; height: 330px;" data-options="fit:true,border : false">
			<div data-options="region:'north',border : false" style="background:#F4F4F4;">
	        <div style="padding:10px 0 0 20px;">
			<form name="fm" id="fm" method="post">
			审核状态：<select class="easyui-combobox" id="in_flag" name="in_flag" panelHeight="auto" style="width:100px;">
                       <option value="">全部</option>
                       <option value="0">已审核</option>
                       <option value="1">待审核</option>
                       <option value="2">未通过</option>
                  </select>
          	注册日期: <input  id="in_add_time_1" name="in_add_time_1" class="easyui-datebox" style="width:100px" />
            -- <input id="in_add_time_2" name="in_add_time_2" class="easyui-datebox" style="width:100px" />
          	审核日期: <input  id="in_audit_time_1" name="in_audit_time_1" class="easyui-datebox" style="width:100px" />
            -- <input id="in_audit_time_2" name="in_audit_time_2" class="easyui-datebox" style="width:100px" />
        	<br/>
        	姓名：<input id="in_student_name" name="in_student_name" class="easyui-validatebox" />
          	学校：<input id="in_school_name" name="in_school_name" class="easyui-validatebox" />
 			
 			<%-- 
         	学历：<input id="in_education" name="in_education" class="easyui-validatebox" />
         	专业：<input id="in_profession" name="in_profession" class="easyui-validatebox"  style="width:110px;"/>
			--%>
            
            <a href="javascript:;" onclick="searchStudent();" class="easyui-linkbutton" iconCls="icon-search">搜索</a>	
            <%-- 
            <a href="javascript:;" onclick="deleteStudent();" class="easyui-linkbutton" iconCls="icon-cancel1"><span style="color:red;">删除</span></a>	
			--%>
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
	    
   
  </body>
</html>
