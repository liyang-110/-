<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.bean.*" %>
<%@ page import="com.util.common.DateTool" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
StudentSessionBean user=(StudentSessionBean)User.getUser("student",session);
if( user ==null ){
	response.sendRedirect( request.getContextPath()+"/");
}else if( request.getAttribute("res")==null ){
	// /esbServer.do?method=execProc&methodId=person_order_log&in_r=su&in_student_id=4c779542-3cba-488d-8ff8-5cab1e7e72be&in_page=1&in_pagenum=20
	String q="?methodId=student_recruit_query&in_r=su&in_URLEncoding=UTF-8";
	
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
<title>职位订阅</title>
<link type="text/css" rel="stylesheet" href="style/core.css" />
<link type="text/css" rel="stylesheet" href="style/upload_general.css" />
<link type="text/css" rel="stylesheet" href="style/post_general.css" />
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>

<script src="../statics/artDialog/artDialog.js?skin=green"></script>

<link href="../js/layer/skins/default.css" rel="stylesheet" />

<script type="text/javascript" src="<%=request.getContextPath()%>/js/layer/getprovince211.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/layer/getposition.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/layer/jobjss.js" charset="utf-8"></script>


<script type="text/javascript">
	$(function(){
		$("#menu_2_1").addClass("on");
		$("#menu_2_1 a").addClass("one");
		
	});
</script>
<script src="/statics/artDialog/plugins/iframeTools.js"></script>
<script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script> 
<script type="text/javascript" src="js/artDialog.notice.js?r=su" charset="utf-8"></script>

</head>

<body>
<jsp:include page="inc/header.jsp" flush="true" />
<div class="container">
    <div class="cont">
 		<jsp:include page="inc/menu.jsp" flush="true" />
        <!--left完成-->
        <div class="right">
        	<div class="right_top">
            	<h1 class="post">职位搜索</h1> 
            </div>
            <!--right_top完成-->
            <div class="cont_top">
        	<h1>高级搜索 <span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Advanced Search</span></h1>
            <div class="sousuo">
<script type="text/javascript">
	$(function(){
		$(".pagenation a").bind("click",function(e){
			e.preventDefault();
			//var in_page = $(this).text();
			var in_page =$(this).attr("data-page");
			$("#pagerForm input[name='in_page']").val(in_page);
			$("#pagerForm").submit();
		});
	});
	function searchForm()
	{
		$("#pagerForm input[name='in_page']").val(1);
		$("#pagerForm").submit();
	}
</script>
<form  id="pagerForm" name="pagerForm" method="post" action="">
	<c:forEach var="p" items="${requestScope.params }">
		<c:choose>
		<c:when test="${p.key eq 'in_position' }"></c:when>
		<c:when test="${p.key eq 'position' }"></c:when>
		<c:when test="${p.key eq 'in_industry' }"></c:when>
		<c:when test="${p.key eq 'in_add_time_1' }"></c:when>
		<c:when test="${p.key eq 'in_education' }"></c:when>
		<c:when test="${p.key eq 'in_money' }"></c:when>
		<c:when test="${p.key eq 'in_company_nature' }"></c:when>
		<c:when test="${p.key eq 'in_company_person_num' }"></c:when>
		<c:when test="${p.key eq 'in_job_type' }"></c:when>
		<c:when test="${p.key eq 'in_area' }"></c:when>
		<c:when test="${p.key eq 'areas' }"></c:when>
		<c:when test="${p.key eq 'in_job_name' }"></c:when>
		<c:otherwise>
		<input type="hidden" name="${p.key }" value="${fn:trim( p.value[0] ) }" />
		</c:otherwise>
		</c:choose>
	</c:forEach>
		<input type="hidden" name="in_pagenum" value="20" />
		<input type="hidden" name="in_page" value="" />
                <table class="tbl">
                	<tr>
                        <td>职位类别:</td>
                        <td colspan="2">
						<input type="hidden" name="in_position" id="in_position" value="${params.in_position[0]}">
						<c:if test="${!empty params.in_position[0]}">
						<input type="text" style="width:180px; border-radius:5px; height:23px;background:none;"
							class="zi" value="${params.position[0] }" title="${params.position[0]}" id="position" name="position" onclick="JumpSearchLayer(1,'pagerForm','in_position','position',1);" />
						</c:if>
						<c:if test="${empty params.in_position[0]}">
						<input type="text"  style="width:180px; border-radius:5px; height:23px;background:none;"
							class="zi" value="选择职位" title="选择职位" id="position" name="position" onclick="JumpSearchLayer(1,'pagerForm','in_position','position',1);" />
						</c:if>
						</td>
                        <td style="text-align:right;">行业类别:</td>
                        <td colspan="2">
                          <%
                        	 java.util.List industry = new com.zhaopin.dao.factory.BaseCodeModel().codeArray("industry");
                        	 pageContext.setAttribute("industry", industry );
                          %>
                          <select name="in_industry" style="width:210px;">
                              <option value="">--请选择--</option>
							<c:forEach var="p" items="${pageScope.industry }">
                        	<c:choose>
                        		<c:when test="${requestScope.params.in_industry[0] eq p[0] }" >
                        		<option value="${p[0] }" selected="selected">${p[1] }</option>
                        		</c:when>
                        		<c:otherwise>
                        		<option value="${p[0] }">${p[1] }</option>
                        		</c:otherwise>
                        	</c:choose>
                            </c:forEach>
                           </select>
                        </td>
                    </tr>
                    <tr>
                        <td>发布日期:</td>
                        <td>
                        	<%
                        		String day_1=DateTool.getAddDay("DAY", -1,"yyyy-MM-dd");
                        		String day_2=DateTool.getAddDay("DAY", -2,"yyyy-MM-dd");
                        		String day_3=DateTool.getAddDay("DAY", -3,"yyyy-MM-dd");
                        		String day_7=DateTool.getAddDay("DAY", -7,"yyyy-MM-dd");
                        		String day_14=DateTool.getAddDay("DAY", -14,"yyyy-MM-dd");
                        		String month_1=DateTool.getAddDay("MONTH", -1,"yyyy-MM-dd");
                        		String month_2=DateTool.getAddDay("MONTH", -2,"yyyy-MM-dd");
                        		pageContext.setAttribute("day_1",day_1);
                        		pageContext.setAttribute("day_2",day_2);
                        		pageContext.setAttribute("day_3",day_3);
                        		pageContext.setAttribute("day_7",day_7);
                        		pageContext.setAttribute("day_14",day_14);
                        		pageContext.setAttribute("month_1",month_1);
                        		pageContext.setAttribute("month_2",month_2);
                        	%>
                            <select name="in_add_time_1">
                              <option value="">--请选择--</option>
                              <option value="${day_1 }" ${requestScope.params.in_add_time_1[0] eq day_1?"selected":"" }
                              >近一天</option>
                              <option value="${day_2 }" ${requestScope.params.in_add_time_1[0] eq day_2?"selected":"" }
                              >近二天</option>
                              <option value="${day_3 }" ${requestScope.params.in_add_time_1[0] eq day_3?"selected":"" }
                              >近三天</option> 
                              <option value="${day_7 }" ${requestScope.params.in_add_time_1[0] eq day_7?"selected":"" }
                              >近一周</option>
                              <option value="${day_14 }" ${requestScope.params.in_add_time_1[0] eq day_14?"selected":"" }
                              >近两周</option>
                              <option value="${month_1 }" ${requestScope.params.in_add_time_1[0] eq month_1?"selected":"" }
                              >近一月</option>
                              <option value="${month_2 }" ${requestScope.in_add_time_1[0] eq month_2?"selected":"" }
                              >近两月</option>
                            </select>
						</td>
                        <td>学历要求:</td>
                        <td>
                          <%
                        	 java.util.List job_fair_level = new com.zhaopin.dao.factory.BaseCodeModel().codeArray("job_fair_level");
                        	 pageContext.setAttribute("job_fair_level", job_fair_level );
                          %>
                          <select name="in_education">
                              <option value="">--请选择--</option>
							<c:forEach var="p" items="${pageScope.job_fair_level }">
                        	<c:choose>
                        		<c:when test="${requestScope.params.in_education[0] eq p[0] }" >
                        		<option value="${p[0] }" selected="selected">${p[1] }</option>
                        		</c:when>
                        		<c:otherwise>
                        		<option value="${p[0] }">${p[1] }</option>
                        		</c:otherwise>
                        	</c:choose>
                            </c:forEach>
                           </select>
                        </td>
                        <td>月薪范围:</td>
                        <td>
                          <%
                        	 java.util.List money = new com.zhaopin.dao.factory.BaseCodeModel().codeArray("money");
                        	 pageContext.setAttribute("money", money );
                          %>
                          <select name="in_money">
                              <option value="">--请选择--</option>
							<c:forEach var="p" items="${pageScope.money }">
                        	<c:choose>
                        		<c:when test="${requestScope.params.in_money[0] eq p[0] }" >
                        		<option value="${p[0] }" selected="selected">${p[1] }</option>
                        		</c:when>
                        		<c:otherwise>
                        		<option value="${p[0] }">${p[1] }</option>
                        		</c:otherwise>
                        	</c:choose>
                            </c:forEach>
                           </select>
                      </td>
                    </tr>
                    <tr>
                        <td>公司性质:</td>
                        <td>
                          <%
                        	 java.util.List company_nature = new com.zhaopin.dao.factory.BaseCodeModel().codeArray("company_nature");
                        	 pageContext.setAttribute("company_nature", company_nature );
                          %>
                          <select name="in_company_nature">
                              <option value="">--请选择--</option>
							<c:forEach var="p" items="${pageScope.company_nature }">
                        	<c:choose>
                        		<c:when test="${requestScope.params.in_company_nature[0] eq p[0] }" >
                        		<option value="${p[0] }" selected="selected">${p[1] }</option>
                        		</c:when>
                        		<c:otherwise>
                        		<option value="${p[0] }">${p[1] }</option>
                        		</c:otherwise>
                        	</c:choose>
                            </c:forEach>
                           </select>
                        </td>
                         <td>公司规模:</td>
                        <td>
                          <%
                        	 java.util.List company_person_num = new com.zhaopin.dao.factory.BaseCodeModel().codeArray("company_person_num");
                        	 pageContext.setAttribute("company_person_num", company_person_num );
                          %>
                          <select name="in_company_person_num">
                              <option value="">--请选择--</option>
							<c:forEach var="p" items="${pageScope.company_person_num }">
                        	<c:choose>
                        		<c:when test="${requestScope.params.in_company_person_num[0] eq p[0] }" >
                        		<option value="${p[0] }" selected="selected">${p[1] }</option>
                        		</c:when>
                        		<c:otherwise>
                        		<option value="${p[0] }">${p[1] }</option>
                        		</c:otherwise>
                        	</c:choose>
                            </c:forEach>
                           </select>
                        </td>
                        <td>工作类型:</td>
                        <td>
                        	<select name="in_job_type">${requestScope.params.in_job_type}
                            	<option value="">--请选择--</option>
                                <option value="全职" ${requestScope.params.in_job_type[0] eq '全职'?'selected':''}>全职</option>
								<option value="兼职" ${requestScope.params.in_job_type[0] eq '兼职'?'selected':''}>兼职</option>
								<option value="实习" ${requestScope.params.in_job_type[0] eq '实习'?'selected':''}>实习</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>工作地点:</td>
                        <td>
                        <input name="in_area" type="hidden"  id="in_area" value="${requestScope.params.in_area[0]}"/>
							<c:if test="${empty requestScope.params.in_area}">
							<input type="text" id="areas" name="areas" style="width:140px; border-radius:5px; height:23px;background:none;" 
							 class="zi" value="选择工作地点" onclick="JumpSearchLayer(2,'pagerForm','in_area','areas',1);" />
							</c:if>
							<c:if test="${!empty requestScope.params.in_area}">
							<input type="text" id="areas" name="areas" style="width:140px; border-radius:5px; height:23px;background:none;" 
							 class="zi" value="${requestScope.params.areas[0]}" onclick="JumpSearchLayer(2,'pagerForm','in_area','areas',1);" />
							</c:if>
                        </td>
                        <td colspan="4">
                            <input class="zi" type="text" name="in_job_name" value="${params.in_job_name[0]}" placeholder="请输入关键字">
                            <input class="suo" type="button" onclick="javascript:searchForm();" value="搜索">
                        </td>
                    </tr>
                </table>
</form>
            </div>
            <div class="post_table">
            	<table width="710" border="0" cellpadding="0" cellspacing="0">
                  <tr style="font-size:16px;">
                    <td>发布日期</td>
                    <td>企业名称</td>
                    <td>招聘职位</td>
                    <td>人数</td>
                    <td>薪资</td>
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
                   <c:set var="data" value="${res.queryresult}" />
					  <c:forEach var="r" items="${data }">
					  <tr>
						<td>${r.add_time }</td>
						<td><a target="_blank" href="/company/info.do?id=${r.company_id }" class="blue">
						${r.company_name }</a></td>
                        <td><a target="_blank" href="/company/jobDetail.do?id=${r.job_id }" class="blue">
                        ${r.job_name }</a></td>
                        <td>${r.job_person_num }</td>
                        <td>${r.money }</td>
                        <!--  
						<td class="bag"><a href="javascript:;" tip="${r.remark }">查看</a></td>
					  	-->
					  </tr>
				   </c:forEach>
                  <!--
                  <tr>
                  	<td><input type="checkbox" value=""></td>
                    <td colspan="6" style="text-align:left; padding-left:20px;"><a href="#" class="batch">批量订阅选中职位</a></td>
                  </tr>
                 -->
                </table>
                 <div class="pagelist pagenation">
						${requestScope.pagenation }
                </div>
            </div>
            <!--post_table完成-->
            <%-- 
            <div class="more">
            	<table width="710" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td style="color:#F60; font-size:16px;">更多相关职位</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                   <tr class="xian">
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                  <tr>
                    <td><a href="#">市场部主管</a></td>
                    <td><a href="#">市场部主管</a></td>
                    <td><a href="#">市场部主管</a></td>
                    <td><a href="#">市场部主管</a></td>
                    <td><a href="#">市场部主管</a></td>
                    <td><a href="#">市场部主管</a></td>
                  </tr>
                   <tr>
                    <td><a href="#">市场部主管</a></td>
                    <td><a href="#">市场部主管</a></td>
                    <td><a href="#">市场部主管</a></td>
                    <td><a href="#">市场部主管</a></td>
                    <td><a href="#">市场部主管</a></td>
                    <td><a href="#">市场部主管</a></td>
                  </tr>

                </table>

            </div>
            --%>
        </div>
        <!--sousuo完成-->  
        </div>
        <!--right完成-->
        <div class="clear"></div>	
    </div>
    <!--cont完成-->
</div>
<!--footer开始-->
<jsp:include page="inc/footer.jsp" flush="true"  />
<!--footer完成-->
</body>
</html>
