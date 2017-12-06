<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.bean.ComUserBean" %>
<%@include file="inc/checkLogin_c.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
if( user ==null ){
	response.sendRedirect( request.getContextPath()+"/");
}else if( request.getAttribute("res")==null ){
	String q="?methodId=message_01&in_r=co&in_URLEncoding=UTF-8";
	//response.sendRedirect("/member/easyQuery.do"+q);
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
<title><%=company_name %> - 企业紧急通知</title>
<link rel="stylesheet" href="style/bootstrap.nav.css" type="text/css"></link>

<link type="text/css" rel="stylesheet" href="style/core.css" />
<link type="text/css" rel="stylesheet" href="img2/core.css" />

<link type="text/css" rel="stylesheet" href="style/upload_general.css" />
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
<script src="/statics/artDialog/artDialog.js?skin=green"></script>

<script src="/statics/artDialog/plugins/iframeTools.js"></script>
<script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script> 
<script type="text/javascript" src="js/artDialog.notice.js?r=co" charset="utf-8"></script>

<script type="text/javascript">
	$(function(){
		$("#menu_4_2").addClass("on");
		$("#menu_4_2 a").addClass("one");
		
	});
</script>
</head>

<body>
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
</script>
<form  id="pagerForm" method="post" action="">
	<c:forEach var="p" items="${requestScope.params }">
		<c:choose>
		<c:when test="${p.key eq 'in_page' }"></c:when>
		<c:when test="${p.key eq 'in_pagenum' }"></c:when>
		<c:otherwise>
		<input type="hidden" name="${p.key }" value="${fn:trim( p.value[0] ) }" />
		</c:otherwise>
		</c:choose>
	</c:forEach>
		<input type="hidden" name="in_pagenum" value="20" />
		<input type="hidden" name="in_page" value="" />
</form>
<jsp:include page="inc/header_c2.jsp" flush="true" />
<div class="container">
    <div class="cont">
		<jsp:include page="inc/menu_c.jsp" flush="true" />
        <!--left完成-->
        <div class="right">
            <div class="right_top">
            	<h1 class="interview">系统消息</h1>
                <div class="xian"></div>
                
                <div class="form">
                	<style>
                		.form td.time, .form td.content {
                			vertical-align:top;
                			text-align:left;
                			line-height:1.3em;
                			padding:5px 10px;
                		}
                		.form .content a {color:#666;}
                		.form .content a:hover{text-decoration:underline;}
                	</style>
                	<table width="750" border="0" cellpadding="5" cellspacing="0">
					  <tr>                  	              	                             
						<td width="170">时间</td>
                        <td width="580">消息内容</td>
					  </tr>
					  <tr class="xian">
						<td></td>
						<td></td>                	                     
					  </tr>
					  <c:set var="data" value="${res.queryresult}" />
					  <c:forEach var="r" items="${data }">
					   <tr>
                        <td class="time">${r.add_time }</td>
                        <td class="content">
                        <c:if test="${not empty r.job_fair_name and r.job_fair_name ne 'no' }">
                        	<a title="${r.job_fair_name }" href="/jobfairInfo.do?id=${r.job_fair_id}" target="_blank">${r.job_fair_name }</a>
                        </c:if>
                        ${r.message_content }                        
                        </td>
					  </tr>
					  </c:forEach>
					</table>
					<div class="pagelist pagenation">
						${requestScope.pagenation }
                    </div>
                </div>   
            </div>
            <!--right_top完成-->  
        </div>
        <!--right完成-->
        <div class="clear"></div>	
    </div>
    <!--cont完成-->
</div>
<!--footer开始-->
<jsp:include page="inc/footer_c.jsp" flush="true"  />
<!--footer完成-->
</body>
</html>
