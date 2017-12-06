<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.bean.*" %>
<%@ page import="com.zhaopin.dao.Model" %>
<%@ include file="../include/checkLogin.jsp" %>
<%
	String id = request.getParameter("id");
	String sql=" with company  as ( select member_type from tbl_login "
			+"			where user_type='company' and user_code='"+id+"') "
			+" select * from ( select sum(permit) permits from ( "
			+"  select case when b.menu_url='member/jPoints.jsp' then 3 "
			+"              when b.menu_url='member/jPoints.jsp#1' then -1 "
			+"              when b.menu_url='member/jPoints.jsp#2'  then 2 else 0 end permit "
			+"  from tbl_role_menu a left join tbl_admin_menu b on a.menu_id = b.menu_id "
			+"  where role_id='"+role_id+"'  and instr(b.menu_url,'member/jPoints.jsp')>0 ) "
			+" ) t left join company on 1=1 "; 
	int privilege=0;
	String type="";
	try{
		HashMap map = new Model().findMap(sql);
		type = (String)map.get("member_type");
		privilege=Integer.parseInt( map.get("permits").toString() );
	}catch(NumberFormatException e){
		return;
	}
	String validity="";
	if( privilege < 3 ){
		if( type==null || "member_type_01".equals( type ) ||"member_type_13".equals( type ) ){
		}else{
			validity="disabled";
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title></title>
<script type="text/javascript">
	var cur_path = "<%=request.getContextPath()%>";
</script>
<script type="text/javascript" src="/js/js_common.js"></script>
<script type="text/javascript" src="Points.js" charset="utf-8"></script>
<script type="text/javascript">
	var gi_pagesize = <%=request.getParameter("in_pagesize")%>;
	var gi_pagenum = <%=request.getParameter("in_pagenum")%>;
	var gi_currentnum = <%=request.getParameter("in_currentnum")%>;
	var id = "<%=request.getParameter("id")%>";
	var user_type = "<%=request.getParameter("user_type")%>";
</script>
<style>
td {padding:3px 2px; }
td.label { text-align:right;}
input.label { border:none; background:transparent;}
</style>
</head>

<body style="padding:10px 10px;">
<form id="fm" method="post"  name="fm">
<input type="hidden" name="in_user_type" value="<%=request.getParameter("user_type")%>"/>
<input type="hidden" id="in_user_code" name="in_user_code" value="<%=request.getParameter("id")%>"/>

<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td class="label">账号：</td>
		<td  colspan="3">
		<span><input  id="user_id" name="user_id" disabled="disabled" class="label"/></span>
		<% if(request.getParameter("zk_id")!=null && !"".equals(request.getParameter("zk_id"))){ %>
		<span style="color:red;">(该企业通过招客注册！)</span>
		<%} %>
		</td>
	</tr>
	<tr>
		<td class="label">有效期：</td>
		<td colspan="3">
		<input <%=validity %> id="in_begin_date" name="in_begin_date" class="easyui-datebox" />
		--
		<input <%=validity %> id="in_end_date" name="in_end_date" class="easyui-datebox" />
		&nbsp;&nbsp;
		<input id="in_edit_date" name="in_edit_date" type="hidden" value="true" />
		<!--  
		<a href="javascript:;" id="editValidDate" onclick="editValidDate();">修改</a>
		-->
		</td>
	</tr>
	<tr>
		<td  class="label">会员类型：</td>
		<td colspan="3">
		<input  <%=privilege<3?"disabled":"" %> id="in_member_type" name="in_member_type" class="easyui-validatebox" data-options=" editable:false"/>
		&nbsp;&nbsp;
		<input id="in_edit_type" name="in_edit_type" type="hidden" value="true" />
		<!-- 
		<a href="javascript:;"  id="editMemberType" onclick="editMemberType();">修改</a>
		-->
		<label><input name="in_free_resume" value="1" type="checkbox" />精英人才库</label>
		</td>
	</tr>
	<tr>
		<td class="label">当前点数：</td>
		<td><input   id="points" name="points" class="label" disabled="disabled" /></td>
		<td class="label">充值：</td>
		<td>
		<input <%=privilege<3?"disabled":"" %> class="easyui-numberspinner" id="in_recharge" name="in_recharge"  precision="0" data-options="increment:100" value="0"  required="true"  />
		</td>
	</tr>
	<tr>
		<td class="label">校招会场次：</td>
		<td><input   id="multiple" name="multiple" class="label" disabled="disabled" /></td>
		<td class="label">充值：</td>
		<td>
		<input class="easyui-numberspinner" id="in_multiple" name="in_multiple"  precision="0" data-options="increment:1<%=privilege<3?",max:0":"" %>" value="0"  required="true"  />
		</td>
	</tr>
	<tr>
		<td class="label">网络会场次：</td>
		<td><input   id="netcongress" name="netcongress" class="label" disabled="disabled" /></td>
		<td class="label">充值：</td>
		<td>
		<input class="easyui-numberspinner" id="in_netcongress" name="in_netcongress"  precision="0" data-options="increment:1<%=privilege<3?",max:2":"" %>" value="0"  required="true"  />
		</td>
	</tr>
	<!-- 
	<tr>
		<td class="label">短信帐户：</td>
		<td><input   id="sms_last" name="sms_last" class="label" disabled="disabled" /></td>
		<td class="label">短信充值：</td>
		<td>
		<input class="easyui-numberspinner" id="in_sms_add" name="in_sms_add"  precision="0" data-options="increment:1<%=privilege<3?",max:10":"" %>" value="0"  required="true"  />
		</td>
	</tr>
	<tr>
		<td class="label">微信推广次数：</td>
		<td><input   id="weixin" name="weixin" class="label" disabled="disabled" /></td>
		<td class="label">充值次数：</td>
		<td>
		<input class="easyui-numberspinner" id="in_weixin" name="in_weixin"  precision="0" data-options="increment:1<%=privilege<3?",max:0":"" %>" value="0"  required="true"  />
		</td>
	</tr>
	 -->
	<tr>
		<td class="label">发布职位次数：</td>
		<td><input   id="recruit_issue" name="recruit_issue" class="label" disabled="disabled" /></td>
		<td class="label">充值：</td>
		<td>
		<input class="easyui-numberspinner" id="in_recruit_issue" name="in_recruit_issue"  precision="0" data-options="increment:1<%=privilege<3?",max:5":"" %>" value="0"  required="true"  />
		</td>
	</tr>
	<tr>
		<td class="label">职位刷新次数：</td>
		<td><input   id="recruit_refresh" name="recruit_refresh" class="label" disabled="disabled" /></td>
		<td class="label">充值：</td>
		<td>
		<input class="easyui-numberspinner" id="in_recruit_refresh" name="in_recruit_refresh"  precision="0" data-options="increment:1<%=privilege<3?",max:0":"" %>" value="0"  required="true"  />
		</td>
	</tr>
	<tr>
		<td class="label">职位急聘天数：</td>
		<td><input   id="recruit_hot" name="recruit_hot" class="label" disabled="disabled" /></td>
		<td class="label">充值：</td>
		<td>
		<input class="easyui-numberspinner" id="in_recruit_hot" name="in_recruit_hot"  precision="0" data-options="increment:1<%=privilege<3?",max:0":"" %>" value="0"  required="true"  />
		</td>
	</tr>
	<tr>
		<td class="label">离校未就业人才库：</td>
		<td><input   id="unemployed" name="unemployed" class="label" disabled="disabled" /></td>
		<td class="label">充值：</td>
		<td>
		<input class="easyui-numberspinner" id="in_unemployed" name="in_unemployed"  precision="0" data-options="increment:1<%=privilege<3?",max:0":"" %>" value="0"  required="true"  />
		</td>
	</tr>
	<tr>
		<td colspan="4"  align="center"> 
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_save" id="btn_save">确定</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_return" id="btn_return">取消</a></td>
	</tr>
</table>
</form>
</body>
</html>
