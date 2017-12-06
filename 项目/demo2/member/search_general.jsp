<%@page import="com.zhaopin.dao.factory.BaseCodeModel"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.bean.*" %>
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
	String q="?methodId=student_jobfair&in_r=su&in_URLEncoding=UTF-8";
	
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
<title>搜索招聘会</title>
<link type="text/css" rel="stylesheet" href="style/core.css" />
<link type="text/css" rel="stylesheet" href="style/upload_general.css" />
<link type="text/css" rel="stylesheet" href="style/post_general.css" />
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
<script type="text/javascript">
	$(function(){
		$("#menu_3_1").addClass("on");
		$("#menu_3_1 a").addClass("one");
		
	});
</script>
<script src="/statics/artDialog/artDialog.js?skin=green"></script>

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
            	<h1>搜索招聘会</h1> 
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
<form  id="pagerForm" method="post" action="">
	<c:forEach var="p" items="${requestScope.params }">
		<c:choose>
		<c:when test="${p.key eq 'in_area_id' }"></c:when>
		<c:when test="${p.key eq 'in_job_fair_type' }"></c:when>
		<c:when test="${p.key eq 'in_job_fair_name' }"></c:when>
		<c:otherwise>
		<input type="hidden" name="${p.key }" value="${fn:trim( p.value[0] ) }" />
		</c:otherwise>
		</c:choose>
	</c:forEach>
		<input type="hidden" name="in_pagenum" value="20" />
		<input type="hidden" name="in_page" value="" />

                <table class="tbl">	
                    <tr>
                        <td>地区：</td>
                        <td>
                        	<%
                        	 List provionce = new com.zhaopin.dao.factory.AreaModel().getProvionce();
                        	 pageContext.setAttribute("provionce", provionce );
                        	%>
                        	<select name="in_area_id">
                                <option value="">--请选择--</option>
                        	<c:forEach var="p" items="${pageScope.provionce }">
                        	<c:choose>
                        		<c:when test="${requestScope.params.in_area_id[0] eq p[0] }" >
                        		<option value="${p[0] }" selected="selected">${p[1] }</option>
                        		</c:when>
                        		<c:otherwise>
                        		<option value="${p[0] }">${p[1] }</option>
                        		</c:otherwise>
                        	</c:choose>
                            </c:forEach>
                            </select>
                        </td>
                         <td>类型:</td>
                        <td>
							<%
                        	 List job_fair_type = new BaseCodeModel().codeArray("jobfair_type");
                        	 pageContext.setAttribute("job_fair_type", job_fair_type );
                        	%>
                        	<select name="in_job_fair_type">
                                <option value="">--请选择--</option>
                        	<c:forEach var="p" items="${pageScope.job_fair_type }">
                        	<c:choose>
                        		<c:when test="${requestScope.params.in_job_fair_type[0] eq p[0] }" >
                        		<option value="${p[0] }" selected="selected">${p[1] }</option>
                        		</c:when>
                        		<c:otherwise>
                        		<option value="${p[0] }">${p[1] }</option>
                        		</c:otherwise>
                        	</c:choose>
                            </c:forEach>
                            </select>
                        </td>
                        <td colspan="4">
                            <input name="in_job_fair_name" class="zi" type="text" value="${requestScope.params.in_job_fair_name[0] }" placeholder="请输入关键字">
                            <input class="suo" type="button" onclick="javascript:searchForm();" value="搜索">
                        </td>
                    </tr>
                </table>
</form>
            </div>
            <div class="post_table" style="margin-top:10px;">
            	<table width="710" border="0" cellpadding="0" cellspacing="0">
                  <tr style="font-size:16px;">
                    <td>招聘会时间</td>
                    <td>招聘会名称</td>
                    <td>招聘会类型</td>
                  </tr>
                  <tr class="xian">
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                  <c:set var="data" value="${res.queryresult}" />
				  <c:forEach var="r" items="${data }">
                  <tr>
                    <td>${r.job_fair_time }</td>
					<td><a target="_blank" href="/jobfairInfo.do?id=${r.job_fair_id }" class="blue">
						${r.job_fair_name }</a></td>
                    <td>${r.job_fair_type }</td>
                  </tr>
                  </c:forEach>
                </table>
                <div class="pagelist pagenation">
						${requestScope.pagenation }
                </div>
            </div>
            <!--post_table完成-->
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
