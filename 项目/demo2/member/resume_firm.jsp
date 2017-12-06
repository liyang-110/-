<%@page import="com.zhaopin.dao.factory.BaseCodeModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	String q="?methodId=student_resume_query&in_r=co&in_URLEncoding=UTF-8";
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
<title><%=company_name %> - 最新简历</title>
<link type="text/css" rel="stylesheet" href="style/bootstrap.nav.css" ></link>
<link type="text/css" rel="stylesheet" href="style/core.css" />
<link type="text/css" rel="stylesheet" href="img2/core.css" />
<link type="text/css" rel="stylesheet" href="style/post_general.css" />

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
			var dialog = art.dialog({
			    content: '正在拼命加载，请稍候...',
			    lock:true,
			    title:false,
			    cancel:false
			});
			var in_page =$(this).attr("data-page");
			$("#pagerForm input[name='in_page']").val(in_page);
			$("#pagerForm").submit();
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
			msg_alert("提示信息",'<div style="width:200px;">您的帐号未审核,请完善企业资料，联系您的招聘顾问，或拨打电话029-88662468进行帐号审核。</div>',"warning");

		}else if( flag==1 ){
			msg_alert("提示信息",'<div style="width:200px;">您尚未开通会员或会员已过期，请联系您的招聘顾问，或拨打电话029-88662468与我们联系。</div>',"warning");
 
		}else{
			msg_alert("提示信息",'<div style="width:200px;">未知错误,请刷新页面。</div>',"warning");

		}
	}
</script>
<style type="text/css">
	table.datagrid {border-collapse: collapse;}
	table.datagrid tbody td { 
		text-align:left;padding:5px 10px;
		line-height:1.5em;vertical-align:top;
		border:1px solid #ccc;border-collapse:collapse;
	}
	table.datagrid tbody td.nowrap {white-space:nowrap;}
	table.datagrid tbody td.content a:hover{text-decoration:underline;}
	.stuname{min-width:75px;}
	.stugard{min-width:10px;}
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
					<h2>最新简历</h2>
					<div class="cont_top cont_gry">
						<form id="pagerForm" method="post" action="">
							<c:forEach var="p" items="${requestScope.params }">
								<c:choose>
									<c:when test="${p.key eq 'in_page' }"></c:when>
									<c:when test="${p.key eq 'in_pagenum' }"></c:when>

									<c:when test="${p.key eq 'in_education' }"></c:when>
									<c:when test="${p.key eq 'in_profession' }"></c:when>
									<c:when test="${p.key eq 'in_school_name' }"></c:when>
									<c:when test="${p.key eq 'in_grad_year' }"></c:when>
									<c:when test="${p.key eq 'in_position' }"></c:when>
									<c:when test="${p.key eq 'in_area_id' }"></c:when>

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
										<td>所在地区:</td>
										<td>
											<%
                        		List provionceList = new com.zhaopin.dao.factory.AreaModel().getProvionce();
                        		pageContext.setAttribute("provionceList", provionceList );
                        	%> <select name="in_area_id"
											style="border:1px #999999 solid; width:135px; height:25px;">
												<option value="">--请选择--</option>
												<c:forEach var="p" items="${provionceList}">
													<c:choose>
														<c:when test="${params.in_area_id[0] eq p[0] }">
															<option value="${p[0]}" selected="selected">
																<c:out value="${p[1]}" />
															</option>
														</c:when>
														<c:otherwise>
															<option value="${p[0]}">
																<c:out value="${p[1]}" />
															</option>
														</c:otherwise>
													</c:choose>
												</c:forEach>
										</select>
										</td>
										<td>学校:</td>
										<td><input type="text" name="in_school_name"
											value="${params.in_school_name[0] }"
											style="border:1px #999999 solid; width:135px; height:25px;">
										</td>
										<td>学历:</td>
										<td><select name="in_education">
												<option value="">--请选择--</option>
												<%
                                  List educationList=new BaseCodeModel().codeArray("job_fair_level");
                                  pageContext.setAttribute("educationList", educationList);
                                %>
												<c:forEach var="p" items="${educationList}">
													<c:choose>
														<c:when test="${params.in_education[0] eq p[0] }">
															<option value="${p[0]}" selected="selected">
																<c:out value="${p[1]}" />
															</option>
														</c:when>
														<c:otherwise>
															<option value="${p[0]}">
																<c:out value="${p[1]}" />
															</option>
														</c:otherwise>
													</c:choose>
												</c:forEach>
										</select></td>
									</tr>
									<tr>
										<td>毕业时间:</td>
										<td>
											<%
									List gradYearList = com.zhaopin.dao.factory.SelectDataModel.getYearList(5,25);
									pageContext.setAttribute("gradYearList",gradYearList);
								%> <select name="in_grad_year"
											style="border:1px #999999 solid; width:135px; height:25px;">
												<option value="">--年--</option>
												<c:forEach var="year" items="${gradYearList}">
													<c:choose>
														<c:when test="${params.in_grad_year[0] eq year}">
															<option value="${year}" selected="selected">
																<c:out value="${year}" />
															</option>
														</c:when>
														<c:otherwise>
															<option value="${year}">
																<c:out value="${year}" />
															</option>
														</c:otherwise>
													</c:choose>
												</c:forEach>
										</select>

										</td>
										<td>专业:</td>
										<td><input type="text" name="in_profession"
											value="${params.in_profession[0] }"
											style="border:1px #999999 solid; width:135px; height:25px;">
										</td>
										<td>意向岗位:</td>
										<td><input type="text" name="in_position"
											value="${params.in_position[0] }"
											style="border:1px #999999 solid; width:135px; height:25px;">


											<input class="suo" type="button"
											onclick="javascript:searchForm();" value="搜索"></td>
									</tr>
								</table>
							</div>
						</form>
						<div class="post_table">

							<table class="datagrid" width="830" border="0" cellpadding="0"
								cellspacing="0">
								<thead>
									<tr>
										<td>最近登录</td>
										<td>姓名</td>
										<td>学历</td>
										<td>毕业</td>
										<td>专业</td>
										<td>求职岗位</td>
										<td>意向地区</td>
									</tr>
									<tr class="xian">
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
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
											<td data-rownum="${r.rn }" class="nowrap">
												${r.login_date }</td>

											<td class="content nowrap stuname"><c:choose>
													<c:when test="${ company_status != 1 }">
														<a href="javascript:void(0);" onclick="openMemberTip(0)">
															${fn:substring(r.name,0,1)}** </a>
													</c:when>
													<c:otherwise>
														<a href="javascript:;"
															onclick="open_layer('/company/resumeDetail.do?callback=reload&id=${r.student_id}');">
															${r.name } </a>
													</c:otherwise>
												</c:choose> <c:if test="${r.paid ne 0 }">
													<img src="icon/ok.jpg" width="15" height="15"
														style="float:right" />
												</c:if></td>
											<td class="nowrap">${r.education }</td>
											<td class="stugard">${r.grad_year }</td>
											<td>${r.profession }</td>
											<td>${r.hope_positions }</td>
											<td>${r.hope_areas }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="pagelist pagenation">${requestScope.pagenation }
							</div>
						</div>
					</div>
				</div>
				<!--post_table完成-->
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
