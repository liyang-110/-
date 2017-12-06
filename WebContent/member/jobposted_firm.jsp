<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"  %>
<%@ include file="inc/checkLogin_c.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
if( user ==null ){
	response.sendRedirect( request.getContextPath()+"/");
	return;
}else if( request.getAttribute("res")==null ){
	String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	String q="?methodId=company_recruit_01&in_r=co&in_pagenum=20&in_URLEncoding=UTF-8&in_company_id="+user.getCompanyId();
	String forward = "/member/easyQuery.do"+q;
	request.setAttribute("forward", request.getRequestURI() );
	request.getRequestDispatcher(
						request.getContextPath() + "/" + forward).forward(
						request, response);
	return;
}
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><%=company_name %> - 企业会员中心首页</title>
<link rel="stylesheet" href="style/bootstrap.nav.css" type="text/css"></link>

<link type="text/css" rel="stylesheet" href="style/core.css" />
<link type="text/css" rel="stylesheet" href="img2/core.css" />
<link type="text/css" rel="stylesheet" href="style/first_firm.css" />
<link type="text/css" rel="stylesheet" href="style/jobposted_firm.css" />

<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
<link rel="stylesheet" href="../js/jquery-easyui/themes/metro/validatebox.css" type="text/css"></link>
<script type="text/javascript" src="../js/jquery-easyui/jquery.easyui.min.js"></script>

<script src="/static/artDialog/artDialog.js?skin=green"></script>
<script src="/static/artDialog/plugins/iframeTools.js"></script>
<script src="/static/jquery/jquery.cookie.js" type="text/javascript"></script> 
<script src="/assets/My97DatePicker/WdatePicker.js"  type="text/javascript" charset="utf-8"></script>

<script type="text/javascript">
	var cur_path="<%=path%>";
	var company_id="<%=company_id%>";
	var expire=<%=expire%>;
</script>
<script type="text/javascript" src="js/artDialog.notice.js?r=co" charset="utf-8"></script>
<script type="text/javascript" src="js/front.js" charset="utf-8"></script>
<script type="text/javascript" src="js/company_recruit.js" charset="utf-8"></script>
<style type="text/css">
	.apply_hurry_form table td {height:30px;line-height:30px;}
</style>
</head>
<body>
	<script id="recruitHurry" type="text/plain">
		<form method="post" class="apply_hurry_form" name="apply_hurry_form" action="/company/hurryRecruit.do">
				<input class="buss" name="buss" type="hidden" value="recruitHot" />
				<input class="job_id" name="job_id" type="hidden"  />
				<input class="is_hurry" name="is_hurry"  type="hidden"  />
				<table><tr><td>
				职位：<label class="position">职位</label>
				</td></tr>
				<tr><td>
						<input type="hidden" name="begin_date" class="hurry_begin_input"  />
						<input type="hidden" name="hurry_price" class="hurry_price"  />
				日期：<input readonly="readonly" disabled="disabled" class=" text easyui-validatebox hurry_begin"  data-options="required:true" name="hurry_begin" value=""/>-
						<input class=" text easyui-validatebox hurry_end" name="end_date" value="" readonly />

				</td></tr>
				<tr><td>
				天数：<label class="hurry_need_points">0</label>
				</td></tr>
				</table>
		</form>
</script>
	<jsp:include page="inc/header_c2.jsp" flush="true" />
	<div class="container">
		<div class="cont">
			<jsp:include page="inc/menu_c.jsp" flush="true" />
			<!--left完成-->
			<div class="right">
				<div class="option">
					<a href="jobpost_firm.jsp" class="shengqing">发布职位</a>
				</div>
				<!--right_top完成-->
				<div class="list_a">
					<h1>招聘职位管理</h1>
					<table class="datagrid" width="850" border="0" cellpadding="0"
						cellspacing="0" class="mag">
						<thead>
							<tr style="background:#CCC; height:30px; font-size:16px;">
								<td>日期</td>
								<td>类别</td>
								<td>职位名称</td>
								<td>工作地区</td>
								<td>学历要求</td>
								<td>薪资待遇</td>
								<td>操作</td>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty res.queryresult }">
								<tr>
									<td colspan="6">暂无数据</td>
								</tr>
							</c:if>
							<c:set var="data" value="${res.queryresult}" />
							<c:forEach var="r" items="${data }">
								<tr style="color:${r.flag eq 1?"#DADAD8":"#555" };background:${r.flag eq 1?"#efefef":"#fff" }">
									<td>${r.add_time }</td>
									<td>${r.job_type }</td>
									<td class="content">
										<c:if test="${r.is_hurry eq 1 }">
											<span style="color:red;">[急聘]</span>
										</c:if> 
										<a href="/company/jobDetail.do?id=${r.job_id }" target="_blank" class="dian"> ${r.job_name } </a></td>
									<td>${r.areas }</td>
									<td>${r.education }</td>
									<c:if test="${empty r.money }">
										<td>面议</td>
									</c:if>
									<c:if test="${not empty r.money }">
										<td>${r.money }</td>
									</c:if>
									<%-- <td>${r.money}</td> --%>
									<td class="content"><c:choose>
											<c:when test="${r.flag eq 1 }">
												<a href="javascript:;"
													onclick="setShow('${r.job_id}', 'show' );"
													style="color:green;">[显示]</a>
											</c:when>
											<c:otherwise>
												<a href="javascript:;"
													onclick="setShow('${r.job_id}', 'hide' );"
													style="color:red;">[屏蔽]</a>
											</c:otherwise>
										</c:choose> <a href="javascript:;" onclick="refreshJob('${r.job_id}','${r.company_id}')">[刷新]</a>
										<a href="jobpost_firm.jsp?action=edit&id=${r.job_id }">[编辑]</a>
										<a href="javascript:;" onclick="setDel('${r.job_id}','1');">[删除]</a>
										<!-- 
										<a href="javascript:;" onclick="setHurry('${r.job_id}');">&nbsp;&nbsp;[急聘]</a>
										-->
										<a href="javascript:;" onclick="recruitHurry('${r.job_id}','${r.job_name }','${r.is_hurry}')">[急聘]</a>
										
<script type="text/javascript">
	var status=<%=status%>;

	var jobid="";
	function setHurry(job_id){
		opinion_edit_btn = art.dialog({
		    width:350 ,
		    height:150,
			id: 'opinion_edit_btn',
			title:false,
			content:'<div style="width:350px;height:150px;">正在加载...</div>',
			lock:true,
			fixed:true,
			close:function(){this.hide(); return false;},
			show:true,
			esc:true,
			padding:0,
			opacity:0.7,
			background:'#333333',
		});
		var pageContentBody1 =$(art.dialog({id: 'opinion_edit_btn'}).content());//自定义添加内容
		pageContentBody1.parents(".aui_dialog").find(".aui_close").addClass("opinion_panel_close");//自定义关闭按钮				
		pageContentBody1.html( $("#opinion_content").text() );//向弹窗加载内容
		art.dialog({id: 'opinion_edit_btn'}).show();
		jobid=job_id;
	}

	function save(){
		if(status!=1){
			art.dialog({id: 'opinion_edit_btn'}).close();
			msg_alert('提示信息','企业未审核，请联系招聘顾问！','error');
        	return null;
		};
	var begin_date=$("#in_begin_date").val();
	var end_date=$("#in_end_date").val();
	if(begin_date==''){
		msg_alert('提示信息','请填写开始日期！','warning');
		return null;
	}
	if(end_date==''){
		msg_alert('提示信息','请填写结束日期！','warning');
		return null;
	}
	if(jobid==''){
		msg_alert('提示信息','系统更新，请稍后再试！','warning');
		return null;
	}
		$.ajax({
	        url: "/company/hurryRecruit.do?buss=recruitHot",
	        data:{beginDate:begin_date,endDate:end_date,jobId:jobid},
	        type: "post",
	        dataType: "text",
	        success: function(data) {
	            if (!data) return;
	            if(data=='yes'){
	            	msg_alert('提示信息','申请成功！','succeed');
	            	art.dialog({id: 'opinion_edit_btn'}).close();
	            	window.location.reload();
	            	return null;
	            }else if(data=='recharge'){
	            	msg_alert('提示信息','急聘日不足，请充值！','succeed');
	            	art.dialog({id: 'opinion_edit_btn'}).close();
	            	return null;
	            }else if(data=='no'){
	            	msg_alert('提示信息','系统更新中！','error');
	            	art.dialog({id: 'opinion_edit_btn'}).close();
	            	return null;
	            }
	            return;
	        },
		contentType:"application/x-www-form-urlencoded; charset=utf-8"
	    });
	}
	
</script>
<script id="opinion_content" type="text/plain">
	<div style="width:350px;height:150px;">
		<from class="hot_form" style="background:red;">
			<div class="hot_apply">
				申请急聘
			</div>
			<div class="begintime">
				开始时间 : <input onClick="WdatePicker('realDateFmt')" id="in_begin_date" name="in_begin_date" type="text" class="text easyui-validatebox" data-options="required:true,missingMessage:'请输入开始日期' " style="width:130px;" readonly/>
			</div>
			<div class="endtime">
				结束时间 :<input onClick="WdatePicker('realDateFmt')"  id="in_end_date" name="in_end_date" type="text" class="text easyui-validatebox" data-options="required:true,missingMessage:'请输入开始日期' " style="width:130px;margin-left:5px;" readonly/>
			</div>
			<div class="save">
				<input class="save_btn" onclick="save();" type="submit" value="提交">
			</div>
		</from>
	</div>
</script>
<style>
	.hot_form{
		width:350px;
		height:100px;
	}
	.hot_form div{
		margin: 10px;
		text-align:center;
	}
	.hot_apply{
		color:#e03919;
		font-size: 25px;
    	font-weight: bold;
	}
	.save_btn{
		width: 150px;
		height:25px;
    	color: #fff;
    	background: #e03919;
    	border: none;
	}
</style>
										<%-- 
                    	<a href="javascript:;" onclick="recruitHurry('${r.job_id}','${r.job_name }','${r.is_hurry}')">[申请紧急招聘]</a>
                    	--%></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div style="clear:both;height:20px;"></div>
					<!------------------------------------------------------------------------>
					<div class="pagelist pagenation">${requestScope.pagenation }</div>
				</div>
				<!--list_a完成-->
			</div>
			<!--right完成-->
			<div class="clear"></div>
		</div>
		<!--cont完成-->
	</div>
	<!--footer开始-->
<jsp:include page="inc/footer_c.jsp" flush="true" />
<!--footer完成-->
</body>
</html>
