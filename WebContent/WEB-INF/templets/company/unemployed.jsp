<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@page import="com.zhaopin.dao.factory.BaseCodeModel"%>
<%@page import="com.zhaopin.dao.factory.BaseCodeModel"%>
<%@ include file="/member/inc/checkLogin_c.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String id=company_id;
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><%=company_name %> - 精英人才库</title>
	<link type="text/css" rel="stylesheet" href="/static/bootstrap/css/bootstrap.min.css"  />
	<link type="text/css" rel="stylesheet" href="/member/style/bootstrap.nav.css"  />
	<link type="text/css" rel="stylesheet" href="/member/style/core.css" />
	<link type="text/css" rel="stylesheet" href="/member/img2/core.css" />
	
	<link type="text/css" rel="stylesheet" href="/member/style/first_firm.css" />
	
    <link rel="stylesheet" href="/static/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/static/jquery.spinner/css/bootstrap-spinner.min.css">

	<script type="text/javascript" src="/member/js/jquery-1.11.3.js"></script>
	<script type="text/javascript" src="/static/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/static/jquery.spinner/js/jquery.spinner.min.js"></script>
	<script type="text/javascript" src="/static/artDialog/artDialog.js?skin=aero"></script>
	<script type="text/javascript" src="/static/artDialog/plugins/iframeTools.js"></script>

	<script type="text/javascript" src="/static/jquery/jquery.cookie.js"></script> 
	
	<link rel="stylesheet" href="/js/jquery-easyui/themes/metro/validatebox.css" type="text/css"></link>
	<script type="text/javascript" src="/js/jquery-easyui/jquery.easyui.min.js"></script>
	
	<link rel="stylesheet" href="/static/jquery/jquery.autocompleter.css">	
	<script src="/static/jquery/jquery.autocompleter.min.js" type="text/javascript"></script>
		
	<script type="text/javascript" src="/member/js/front.js" charset="utf-8"></script>
	<script type="text/javascript" src="/static/company/js/unemployed.js" charset="utf-8"></script>
	<style type="text/css">
		.table.datagrid>tbody>tr>td{
			vertical-align:middle;
		}
		.table.datagrid>tbody>tr>td.content{
			text-align:left;
		}
		.table.datagrid>tbody>tr>td>label{
			display:block;
		}
		#pagerForm table.table td { text-align:left;border-top:none;}
		#pagerForm table.table td .suo {
		    border: 1px #999 solid;
		    background: #93d942;
		    border-radius: 10px;
		    padding: 2px 10px;
		    margin-left: 20px;
		}
		input.text {
			border:none;
			background-color:transparent;
		}
		input.text:focus {
			box-shadow:none;
		}
		input:focus {
			box-shadow:none;
		}
		input[type='text']{
			width:100%;
		}
	</style>
	<script type="text/javascript">
		$(function(){
			$(".pagination a").bind("click",function(e){
				e.preventDefault();
				//var in_page = $(this).text();
				var in_page =$(this).attr("data-page");
				$("#pagerForm input[name='in_page']").val(in_page);
				$("#pagerForm").submit();
			});
			$("input[name='in_success']").bind("click",function(e){
				$(this).parents("form").submit();
			});
		});
	</script>
</head>

<body>
<jsp:include page="/member/inc/header_c2.jsp" flush="true" />
<div class="container">
	<div class="cont">
    	<jsp:include page="/member/inc/menu_c.jsp" flush="true"/>
        <!--left完成-->
        <div class="right">
            <div class="list_a list_b">
                <!--table完成-->
            	<h1>离校未就业人才库</h1>
            	<div>
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
							<input type="hidden" name="in_pagenum" value="20" />
							<input type="hidden" name="in_page" value="1" />
							<div>
								<table class="table">
									<tr>
										<td>学校:</td>
										<td>
										<!-- 
										<input type="text" name="in_school_name"
											value="${params.in_school_name[0] }"
											style="border:1px #999999 solid; width:165px; height:25px;">
										-->	
										<select name="in_school_name"
											style="border:1px #999999 solid; width:165px; height:25px;">
												<option value="">--选择学校--</option>
												<c:forEach var="s" items="${schoolOptions}">
													<c:choose>
														<c:when test="${params.in_school_name[0] eq (empty s.school_name?'null':s.school_name)}">
															<option value="${empty s.school_name?'null':s.school_name}" selected="selected">
																<c:out value="${empty s.school_name?'其他':s.school_name}" />（${s.total }）
															</option>
														</c:when>
														<c:otherwise>
															<option value="${empty s.school_name?'null':s.school_name}">
																<c:out value="${empty s.school_name?'其他':s.school_name}" />（${s.total }）
															</option>
														</c:otherwise>
													</c:choose>
												</c:forEach>
										</select>
										
										</td>
										<td>专业:</td>
										<td><input type="text" name="in_profession"
											value="${params.in_profession[0] }"
											style="border:1px #999999 solid; width:165px; height:25px;">
										</td>
									</tr>
									<tr>
										<td>学历:</td>
										<td><select name="in_education"
												style="border:1px #999999 solid; width:165px; height:25px;">
												<option value="">--请选择--</option>
												<option value="大学专科" ${params.in_education[0] eq '大学专科'?'selected':''}>大学专科</option>
												<option value="大学本科" ${params.in_education[0] eq '大学本科'?'selected':''}>大学本科</option>
												<option value="硕士研究生" ${params.in_education[0] eq '硕士研究生'?'selected':''}>硕士研究生</option>
												<option value="博士研究生" ${params.in_education[0] eq '博士研究生'?'selected':''}>博士研究生</option>
										</select></td>

										<td>毕业时间:</td>
										<td>
											<%
									List gradYearList = com.zhaopin.dao.factory.SelectDataModel.getYearList(0,1);
									pageContext.setAttribute("gradYearList",gradYearList);
								%> <select name="in_grad_year"
											style="border:1px #999999 solid; width:165px; height:25px;">
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
										<input class="suo" type="submit" value="搜索">
										</td>
									</tr>
								</table>
							</div>
						</form>
            	</div>
                <div class="table">
						<table class="table table-bordered table-hover datagrid" width="750" border="0" cellpadding="0"
							cellspacing="0">
							<tbody>
								<tr style="background:#CCC;font-size:16px;">
									<td rowspan="2">姓名</td>
									<td rowspan="2">学校</td>
									<td rowspan="2">专业</td>
									<td rowspan="2">学历</td>
									<td rowspan="2">毕业</td>
									<td colspan="3">电话面试</td>
								</tr>
								<tr style="background:#CCC;font-size:16px;">
									<td>意向岗位</td>
									<td>期望薪资</td>
									<td>面试结果</td>
								</tr>
								<c:choose>
								<c:when test="${empty free_resume }">
									<tr>
										<td colspan="9">正在开发，敬请期待...</td>
									</tr>
								</c:when>
								<c:when test="${empty queryresult }">
									<tr>
										<td colspan="9">暂无数据</td>
									</tr>
								</c:when>
								</c:choose>
								<c:forEach var="r" items="${queryresult }">
								<tr data-rownum="${r.rn }">
									<td class="content nowrap stuname">
										<c:choose>
											<c:when test="${ company_status != 1 }">
												<a href="javascript:void(0);" onclick="openMemberTip(0)">
													${fn:substring(r.name,0,1)}** </a>
											</c:when>
											<c:otherwise>
												<a href="javascript:;"
													onclick="contact('${r.student_id}');">
													${r.name } </a>
											</c:otherwise>
										</c:choose>
									</td>
									<td>${r.school_name }</td>
									<td>${r.profession}</td>
									<td>${r.education }</td>
									<td>${r.grad_year}</td>
									<td>${r.hope_position }</td>
									<td>${r.hope_salary }</td>
									<!--
									<td>${r.remark }</td>
									-->
									<td>
									<c:choose>
										<c:when test="${not empty r.remark }">
										<a href="javascript:;" onclick="contact('${r.student_id}');">${r.remark }</a>
										</c:when>
										<c:when test="${r.download eq 1 }">
										<a class="btn btn-info btn-small" href="javascript:;" onclick="contact('${r.student_id}');">面试</a>
										</c:when>
										<c:otherwise>
										<a class="btn btn-success btn-small" href="javascript:;" onclick="contact('${r.student_id}');">下载</a>
										</c:otherwise>
									</c:choose>
									</td>
								</tr>
								</c:forEach>
				
							</tbody>
						</table>
		                <div>
		                	<nav aria-label="Page navigation" style="text-align: center;">
								${requestScope.pagination }
							</nav>
		                </div>
                </div>
          </div>
            <!--list_a完成-->   
         </div>
        <!--right完成-->
        <div class="clear"></div>	
    </div>
    <!--cont完成-->
</div>

<div id="contact_form" style="display:none;">
<form id="form" class="form-horizontal" action="/company/unemploy.do?method=contact" style="width:320px;" method="post" onsubmit="return false;">
	<input type="hidden" name="in_student_id" value="" />
	<table class="table table-condensed table-bordered datagrid">
		<tr>
			<td>姓名</td>
			<td><input type="text" name="name" readonly="readonly" class="text"></td>
		</tr>
		<tr>
			<td>民族</td>
			<td><input type="text" name="nation" readonly="readonly" class="text"></td>
		</tr>
		<tr>
			<td>学校</td>
			<td><input type="text" name="school_name" readonly="readonly"  class="text"></td>
		</tr>
		<tr>
			<td>专业</td>
			<td><input type="text" name="profession" readonly="readonly" class="text"></td>
		</tr>
		<tr>
			<td>学历</td>
			<td><input type="text" name="education" readonly="readonly" class="text"></td>
		</tr>
		<tr>
			<td class="nowrap">毕业年份</td>
			<td><input type="text" name="grad_year" readonly="readonly" class="text"></td>
		</tr>
		<tr>
			<td class="nowrap">电话</td>
			<td><input type="text" name="contact_tel" readonly="readonly" class="text"></td>
		</tr>
		<tr>
			<td>就业意向</td>
			<td><input type="text" name="in_hope_position"></td>
		</tr>
		<tr>
			<td>月薪要求</td>
			<td><input type="text" name="in_hope_salary"></td>
		</tr>
		<tr>
			<td>面试岗位</td>
			<td>
				<select name="in_job_name">
					<option value="">--选择--</option>
					<c:forEach var="r" items="${recruitList}">
						<option value="${r.job_name}">
							<c:out value="${r.job_name }" />
						</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td>面试结果</td>
			<td>
				<select name="in_remark">
							<option value="预约面试">预约面试</option>
							<option value="通知录用">通知录用</optio>
							<option value="不合适">不合适</option>
							<option value="电话错误">电话错误</option>
							<option value="已入职">已入职</option>
							<option value="未找工作">未找工作</option>
				</select>
				<!--	
				<label><input type="radio" name="in_result"/>电话错误</label>
				<label><input type="radio" name="in_result"/>已入职</label>
				<label><input type="radio" name="in_result"/>未找工作</label>
				<label><input type="radio" name="in_result"/>通知录用</label>
				<label><input type="radio" name="in_result"/>预约面试</label>
				<label><input type="radio" name="in_result"/>不合适</label>
				-->
			</td>
		</tr>
	</table>
</form>
</div>


<!--footer开始-->
<jsp:include page="/member/inc/footer_c.jsp" flush="true"  />
<!--footer完成-->
</body>
</html>
