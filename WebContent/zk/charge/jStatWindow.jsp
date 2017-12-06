<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="cn.com.zhaopin.base.pub.cCharControl"%>
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
	    var user_code ="<%=user_code%>";
	    var querystr="<%=request.getQueryString()%>";
	</script>
<script type="text/javascript" src="../js/in_common.js" charset="utf-8"></script>
<script type="text/javascript" src="StatWindow.js" charset="utf-8"></script>
  </head>
  
  <body>
		<div class="easyui-layout" style="width: 100%; height: 350px;" data-options="fit:true">
			<div data-options="region:'north',border:false">
				<div style="padding:10px;font-size:14px; line-height:20px;">
			<% if( request.getParameter("in_area_id")!=null){%>
				分站：<%=com.zhaopin.Station.getStationName( request.getParameter("in_area_id") ) %>
				<br/>
			<%} %>
			<% if( request.getParameter("in_company_name")!=null){
				String company_name = cCharControl.ISOtoUTF8( request.getParameter("in_company_name") );
				%>
				企业：<%=company_name %>
				<br/>
			<%} %>
					开始时间：<%=request.getParameter("in_add_time_1") %><br/>
					截至时间：<%=request.getParameter("in_add_time_2") %><br/>
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
		
 	<div id="w1" class="easyui-window" title="行业选择" data-options="modal:true,closed:true" style="width:690px;height:370px;padding:10px;">
		<iframe  frameborder="0" id="add"  scrolling="hidden" src="" width="100%" height="630"></iframe>
	</div> <!-- id="w1" -->
<script type="text/javascript">
function industry(){
	var li_currentnum =0; //当前行
	var li_pagesize   =0; //每页行数
	var li_pagenum    =0; //页码
	
	var lo_selected;      //当前选中行
    var lo_pg;            //分页对象
	var ls_id="";	  //

    //得到选中行对象 code:请选择一行用户信息！
    lo_selected   = getCheckObj('resultId','请选择一行信息！');   
    if(lo_selected.length!=1){
    	$.messager.alert('提示信息','请选择一行来查看！','info');
    	return false;
    }else{
	    li_currentnum = $("#resultId").datagrid("getRowIndex",lo_selected[0]);
	    ls_id     = lo_selected[0].role_id;
        lo_pg         = $("#resultId").datagrid("getPager");
        li_pagenum    = lo_pg.pagination('options').pageNumber;

        // $('#if_deal')[0].src='./jRoleMenu.jsp?id='+ls_id+'&in_pagesize=' + li_pagesize+'&in_pagenum=' + li_pagenum+'&in_currentnum=' +li_currentnum +"&date="+new Date();
		$('#w1').window('open');
		$('#add').attr("src","../substation.do?method=Industry&id="+ls_id);  
    }
}
function close(){
	$('#w1').window('close');
}
	
	</script>
  </body>
</html>
