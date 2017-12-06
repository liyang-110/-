<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.factory.SchoolGraduationModel" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String school_id = request.getParameter("school_id");
%>

	<div>
		<table class="table datagrid" style="margin:0;padding;0;">
		<thead>
			<tr>
				<th style="width:50px;">&nbsp;</th>
				<th style="width:100px;">毕业生年份</th><th>毕业生信息</th>
			</tr>
		</thead>
		</table>
	</div>
	<div style="height:300px;width:520px;overflow:scroll;">
	<%
		SchoolGraduationModel gradM=new SchoolGraduationModel();
		List grad_info= gradM.getGradInfoList(school_id);
		if(grad_info!=null && grad_info.size()>0){
	%>
	<table class="table datagrid" style="margin:0;padding;0;">
		<thead style="display:none;">
			<tr>
				<th>&nbsp;</th><th>毕业生年份</th><th>毕业生信息</th>
			</tr>
		</thead>
		<tbody>

	<%
			for(Iterator it=grad_info.iterator();it.hasNext();){
				HashMap map=(HashMap)it.next();
	%>
				<tr onclick="set_grad_info('<%=map.get("g_id") %>','<%=map.get("g_title") %>');" data-ref="<%=map.get("g_id") %>">
				<td style="width:50px;">
					<input name="g_id" type="checkbox" value="<%=map.get("g_id") %>" />
				</td>
				<td style="width:100px;"><%=map.get("g_year") %></td>
				<td>
				<a href="/school/graduation.do?id=<%=map.get("g_id") %>" target="_blank"><%=map.get("g_title") %></a>
				</td>
				</tr>
	<%
			}
	%>
		</tbody>
	</table>
	<%
		}else{
	%>
	<div style="width:520px;height:250px;padding:30px;text-align:center;">您尚未添加毕业生信息！</div>
	<%
		}
	%>
	</div>
	<script type="text/javascript">
	function select_grad_info()
	{
		var g_id = $("input[name=in_grad_info_id]").val();
		var content=$("#dlg_check").html();
		var title = "选择毕业生信息";
		art.dialog({
			id:'set_grad_info',
			title: title , // '提示信息',
			content: content,
			fixed: false,
			lock:true,
			padding:'0 0',
			ready: function(){
				alert('ab');
			},
			init:function(){
				if( g_id ){
					try{
						var content = this.content();
						var dom = $(content).find('tr[data-ref='+g_id+']');
						dom.parents("table").find("input[type='checkbox']").prop("checked",false);
						dom.parents("table").find("tr").css({'background-color':'transparent'});
						dom.find("input[type='checkbox']").prop("checked",true);
						dom.css({'background-color':'#98d237'});
					}catch(e){
					}
				}
			},
			button:[{
				name:"清空",
				callback:function(){
					set_grad_info('','');
					return true;
				}
			},{
				name:"关闭",
				callback:function(){
					return true;
				}
			}]
		});
	}
	function set_grad_info(g_id, g_title)
	{
		try{
			var dom = $('tr[data-ref='+g_id+']');
			dom.parents("table").find("input[type='checkbox']").prop("checked",false);
			dom.parents("table").find("tr").css({'background-color':'transparent'});
			dom.find("input[type='checkbox']").prop("checked",true);
			dom.css({'background-color':'#98d237'});
		}catch(e){
		}
		$("input[name=in_grad_info_id]").val( g_id );
		$("input[name=in_grad_info]").val( g_title );
		art.dialog({id:'set_grad_info'}).close();
	}
	</script>