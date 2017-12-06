<%@page import="com.zhaopin.dao.factory.BaseCodeModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"  %>
<%@ include file="inc/checkLogin_c.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
if( request.getAttribute("res")==null ){	
	String q="?methodId=person_order_paid&in_r=co&in_URLEncoding=UTF-8";
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
<title><%=company_name %> - 已下载简历</title>
<link rel="stylesheet" href="style/bootstrap.nav.css" type="text/css"></link>

<link type="text/css" rel="stylesheet" href="style/core.css" />
<link type="text/css" rel="stylesheet" href="img2/core.css" />

<link type="text/css" rel="stylesheet" href="style/first_firm.css" />
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
<script src="/statics/artDialog/artDialog.js?skin=green" charset="utf-8"></script>
<script type="text/javascript" src="../statics/artDialog/plugins/iframeTools.js" charset="utf-8"></script>
<script type="text/javascript" src="js/front.js" charset="utf-8"></script>
<script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script> 
<script type="text/javascript" src="js/artDialog.notice.js?r=co" charset="utf-8"></script>

<script type="text/javascript">
	$(function(){
		$(".pagenation a").bind("click",function(e){
			e.preventDefault();
			//var in_page = $(this).text();
			var in_page =$(this).attr("data-page");
			$("#pagerForm input[name='in_page']").val(in_page);
			$("#pagerForm").submit();
		});
		$("#in_status").change(function(){
			searchForm();
		});
	});
	function searchForm()
	{
		var dialog = art.dialog({
		    content: '正在拼命加载，请稍候...',
		    lock:true,
		    title:false,
		    cancel:false
		});
		$("#pagerForm input[name='in_page']").val(1);
		$("#pagerForm").submit();
	}
	function reload()
	{
		window.location.reload();
	}
	function openMemberTip( flag )
	{
		if( flag==0 ){
			msg_alert("提示信息",'<div style="width:200px;line-height:25px;">您的帐号未审核,请完善企业资料，联系您的招聘顾问，或拨打电话029-88662468进行帐号审核。</div>',"warning");

		}else if( flag==1 ){
			msg_alert("提示信息",'<div style="width:200px;line-height:25px;">您尚未开通会员或会员已过期，请联系您的招聘顾问，或拨打电话029-88662468与我们联系。</div>',"warning");
 
		}else{
			msg_alert("提示信息",'<div style="width:200px;line-height:25px;">未知错误,请刷新页面。</div>',"warning");

		}

	}
</script>
<style type="text/css">
table.datagrid {
	border-collapse: collapse;
}
table.datagrid tbody td {
	text-align: left;
	padding: 5px 10px;
	line-height: 1.5em;
	vertical-align: top;
	border: 1px solid #ccc;
	border-collapse: collapse;
}
table.datagrid tbody td.nowrap {
	white-space: nowrap;
}
table.datagrid tbody td.content a {
	color: #09c;
}
table.datagrid tbody td.content a:hover {
	text-decoration: underline;
}
.school_name {
	max-width: 185px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
.s1,.s2,.s3,.s4,.s5 {color:#FFF;float:right;border-radius:4px;padding: 0px 4px;white-space:nowrap;}
	.s1 {background-color:#FE7E1E;}
	.s2 {background-color:#9CD408;}
	.s3 {background-color:#F84819;}
	.s4 {background-color:#5DBE11;}
	.s5 {background-color:#0A540E;f}
</style>
</head>
<body>
	<jsp:include page="inc/header_c2.jsp" flush="true" />
	<div class="container">
		<div class="cont">
			<jsp:include page="inc/menu_c.jsp" flush="true" />
			<!--left完成-->
			<div class="right">
				<div class="list_a list_b">
					<h1>已下载简历</h1>
					<form id="pagerForm" method="post" action="">
						<c:forEach var="p" items="${requestScope.params }">
							<c:choose>
								<c:when test="${p.key eq 'in_page' }"></c:when>
								<c:when test="${p.key eq 'in_pagenum' }"></c:when>

								<c:when test="${p.key eq 'in_status' }"></c:when>
								<c:otherwise>
									<input type="hidden" name="${p.key }"
										value="${fn:trim( p.value[0] ) }" />
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<input type="hidden" name="in_pagenum" value="20" /> <input
							type="hidden" name="in_page" value="1" />
						<div class="sousuo">
							<table class="tbl">
								<tr>
									<td>面试状态:</td>
									<td><select id="in_status" name="in_status" style="border: 1px #999999 solid;width: 135px;height: 25px;">
											<option value="">--请选择--</option>
											<option value="0" ${params.in_status[0] eq 0 ? 'selected':''}>未处理简历</option>
											<option value="1" ${params.in_status[0] eq 1 ? 'selected':''}>简历未通过</option>
											<option value="2" ${params.in_status[0] eq 2 ? 'selected':''}>已通知面试</option>
											<option value="3" ${params.in_status[0] eq 3 ? 'selected':''}>面试未通过</option>
											<option value="4" ${params.in_status[0] eq 4 ? 'selected':''}>面试通过</option>
									</select> 
									<!--
									<input class="suo" type="button" onclick="javascript:searchForm();" value="搜索">
									-->
									</td>
								</tr>
							</table>
						</div>
					</form>
					<table class="datagrid" width="850" border="0" cellpadding="0"
						cellspacing="0" style="margin-top:10px;">
						<thead>
							<tr style="background:#CCC; height:30px; font-size:16px;">
								<td>序号</td>
								<td>下载日期</td>
								<td>姓名</td>
								<td>学历</td>
								<td>学校</td>
								<td>专业</td>
								<td>联系电话</td>
								<td>投递岗位</td>
								<td>面试状态</td>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty res.queryresult }">
								<tr>
									<td colspan="9">暂无数据</td>
								</tr>
							</c:if>
							<c:set var="data" value="${res.queryresult}" />
							<c:forEach var="r" items="${data }">
								<tr>
									<td>${r.rn }</td>
									<td class="nowrap">${r.add_time_down }</td>
									<td class="content nowrap "><c:choose>
											<c:when test="${ company_status != 1 }">
												<a href="javascript:void(0);" onclick="openMemberTip(0)">
													${fn:substring(r.name,0,1)}** </a>
											</c:when>
											<c:when test="${not empty r.student_id }">
												<a href="javascript:;"
													onclick="open_layer('/company/resumeDetail.do?callback=reload&id=${r.student_id}');">
													${r.name } </a>
											</c:when>
											<c:otherwise>${r.name }</c:otherwise>
										</c:choose></td>
									<td class="nowrap">${r.education }</td>
									<td class="school_name">${r.school_name }</td>
									<td>${r.profession }</td>
									<td>${r.tel }</td>
									<td>${r.job_name }</td>
									<td><c:choose>
											<c:when test="${ r.status eq 1 }">
												<span class="s1">简历未通过</span>
											</c:when>
											<c:when test="${ r.status eq 2 }">
												<span class="s2">已通知面试</span>
											</c:when>
											<c:when test="${ r.status eq 3 }">
												<span class="s3">面试未通过</span>
											</c:when>
											<c:when test="${ r.status eq 4 }">
												<span class="s4">已通知复试</span>
											</c:when>
											<c:when test="${ r.status eq 5 }">
												<span class="s5">面试通过</span>
											</c:when>
											<c:otherwise>
											</c:otherwise>
										</c:choose></td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="pagelist pagenation">${requestScope.pagenation }
					</div>
				</div>
				<!--list_a完成-->
			</div>
			<!--right完成-->
			<div class="clear"></div>
		</div>
		<!--cont完成-->
	</div>
	<!--footer开始-->
	<div class="fenlan"></div>
	<div class="foot">
		<div class="footer">
			<p class="text">
				<a href="http://www.211zph.com/page.do?id=201407210000321">关于我们</a><span>/</span>
				<a href="http://www.211zph.com/page.do?id=201407210000326">广告投放</a><span>/</span>
				<a href="http://www.211zph.com/page.do?id=201407210000328">法律声明</a><span>/</span>
				<a href="http://www.211zph.com/page.do?id=201407210000329">人才招聘</a><span>/</span>
				<a href="http://www.211zph.com/page.do?id=201407210000327">联系方式</a>
			</p>
			<p>地址：西安高新区科技二路65号清华科技园清扬国际大厦A410 电话：029-88662468 / 87240519</p>
			<p>工信部备案号：陕ICP备13006138号-3 西安市人力资源服务许可证编号：610100120105</p>
			<p>西安大秦人力资源有限公司 版权所有</p>
			<p>
				<a href="#"><img src="img/foot_a.png" /></a> <a href="#"><img
					src="img/foot_b.png" /></a> <a href="#"><img src="img/foot_c.png" /></a>
				<a href="#"><img src="img/foot_d.png" /></a>
			</p>
			<p>
				<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1253006258'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s95.cnzz.com/stat.php%3Fid%3D1253006258%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
			</p>
		</div>
	</div>
	<!--footer完成-->
</body>
</html>
