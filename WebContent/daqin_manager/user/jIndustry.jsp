<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ include file="../include/checkLogin.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title></title>
    <style type="text/css">
.clearfix:after { content: "."; display: block; clear: both; visibility: hidden; line-height: 0; height: 0; }
.clearfix { display: inline-block; }
.containerBox { width: 550px; border: 1px solid #f0f0f0; margin: 20px auto;font-size:12px }
.containerBox table{width:100%; border-collapse:collapse;font-size:12px}
.containerBox table .left{width:120px;text-align:right;vertical-align:middle;padding-right:10px}
.containerBox table ul{list-style-type:none;padding:0;}
.containerBox table li{float:left;width:50%;}
.bg1{background-color:#EFF6FF;}
.hover{background-color:#d2ecfe}
.checked{color:#f60;}
</style>
	<script type="text/javascript">
		var cur_path = "<%=request.getContextPath()%>";
		var role_id ="<%=request.getParameter("id")%>";
	</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"></script>
<script type="text/javascript">
$(function(){
	formatStyle();
	
	$("#btn_industrySave").click(function(){
			save();
	});
	$("#btn_industryReturn").click(function(){
			close();
	});

});
function save()
{
	$obj=$("input:checked");
	
	var ls_id="&in_role_id="+role_id;
	/*
	var i=0;
	$obj.each(function(){
    	ls_id += "&in_industry_mgr"+i+"="+$(this).val();
    	i++;
   	});
   	*/
	ls_url = cur_path + "/esbServer.do?method=execProc&methodId=ad_role_industry_edit&r=ad"+ls_id+"&date=" + new Date();
	   //处理数据 code:数据修改成功
	saveData(ls_url, close, "\u6570\u636e\u4fee\u6539\u6210\u529f\uff01");
}
function close()
{
	window.parent.close();
	window.parent.downOrreloadData();
}
function formatStyle(){
	$(".containerBox tr:even").addClass("bg1");
	$(".containerBox li").hover(function(){
		$(this).addClass("hover");	
	},function(){
		$(this).removeClass("hover");
	});
	$(".containerBox td label").click(function(){
		$(".containerBox td label").removeClass("checked");
		$(this).addClass("checked");
	});	
}
</script>
</head>

<body>
 		<p>
 			<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_save" id="btn_industrySave">确定</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_return" id="btn_industryReturn">取消</a>
		</p>
<div class="containerBox">
<form id="fm" method="post"  name="fm">
	<table>
				<%
			List list = com.zhaopin.admin.model.IndustryModel.getIndustry(role_id);
			if (list != null) {
				
				int i=0;
				for (Iterator Iter1 = list.iterator(); Iter1.hasNext();) {
					List tempList1 = (List) Iter1.next();
					i++;
		%>
		<tr>
			<td class="left">
			<label>
			<input name="in_big_industry_<%=i %>" type="checkbox" namekey="<%=tempList1.get(1).toString()%>" value="<%=tempList1.get(0).toString()%>"/>
			<%=tempList1.get(1).toString()%></label></td>
			<td><ul>
			
			        <%
				List secondList = (List) tempList1.get(2);
						
						if (secondList != null && secondList.size() > 0) {
							for (Iterator Iter2 = secondList.iterator(); Iter2.hasNext();) {
								List tempList2 = (List) Iter2.next();
			%>
    				<li>
						<label>
							<%=tempList2.get(1).toString()%></label>
					</li>
     <%}
    
    } %>

			
				</ul></td>
		</tr>
		    <%}
    
    } %>
	</table>
</form>
</div>
</body>
</html>

