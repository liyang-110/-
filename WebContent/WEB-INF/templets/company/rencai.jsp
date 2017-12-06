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
	<script type="text/javascript" src="/static/artDialog/artDialog.js?skin=green"></script>
	<script type="text/javascript" src="/static/artDialog/plugins/iframeTools.js"></script>

	<script type="text/javascript" src="/static/jquery/jquery.cookie.js"></script> 
	
	<script type="text/javascript" src="/member/js/front.js" charset="utf-8"></script>
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
		.table.datagrid>tbody>tr>td.pay{
			text-align:right;padding-right:1em;
		}
		.table.datagrid>tbody>tr>td.pay p{
			margin:10px;
		}
		#pagerForm table.table td { text-align:left;border-top:none;}
		#pagerForm table.table td .suo {
		    border: 1px #999 solid;
		    background: #93d942;
		    border-radius: 10px;
		    padding: 2px 10px;
		    margin-left: 20px;
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
            	<h1>精英人才库</h1>
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
										<td><select name="in_education"
												style="border:1px #999999 solid; width:135px; height:25px;">
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

											<input class="suo" type="submit" value="搜索"></td>
									</tr>
								</table>
							</div>
						</form>
            	</div>
                <div class="table">
						<table class="table table-bordered datagrid" width="750" border="0" cellpadding="0"
							cellspacing="0">
							<tbody>
								<tr style="background:#CCC;font-size:16px;">
									<td>最近登录</td>
									<td>姓名</td>
									<td>学历</td>
									<td>毕业</td>
									<td>专业</td>
									<td>求职岗位</td>
									<td>意向地区</td>
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
								<tr>
									<td data-rownum="${r.rn }" class="nowrap">
										${r.login_date }</td>
									<td class="content nowrap stuname">
										<c:choose>
											<c:when test="${ company_status != 1 }">
												<a href="javascript:void(0);" onclick="openMemberTip(0)">
													${fn:substring(r.name,0,1)}** </a>
											</c:when>
											<c:otherwise>
												<a href="javascript:;"
													onclick="open_layer('/company/resumeDetail.do?callback=reload&id=${r.student_id}');">
													${r.name } </a>
											</c:otherwise>
										</c:choose>
									</td>
									<td>${r.education }</td>
									<td>${r.grad_year}</td>
									<td>${r.profession}</td>
									<td>${r.hope_positions}</td>
									<td>${r.hope_areas}</td>
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

<script type="text/javascript">
function wxScanPay( trade_no ){
	art.dialog.open('/company/recharging.do?id='+trade_no+'&_t='+new Date(), 
			{title:false,
			 height:400,
			 width:300,	
			 fixed:true,
			 lock:true,
			 cancel:false,
			 padding:0,
			 background:'#666',
			 opacity:0.5,
			 },false);
}
</script>
<!--footer开始-->
<jsp:include page="/member/inc/footer_c.jsp" flush="true"  />
<!--footer完成-->
</body>
</html>
