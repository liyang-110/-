<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	String q="?methodId=person_interview_query&in_r=su&in_status=5&in_URLEncoding=UTF-8";
	//response.sendRedirect("/member/easyQuery.do"+q);
	String forward = "/member/easyQuery.do"+q;
	//System.out.println( request.getRequestURI() );
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
<title>个人录用通知</title>
<link type="text/css" rel="stylesheet" href="style/core.css" />
<link type="text/css" rel="stylesheet" href="style/upload_general.css" />
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
<script type="text/javascript">
	$(function(){
		$("#menu_4_3").addClass("on");
		$("#menu_4_3 a").addClass("one");
		
	});
</script>
<script src="/statics/artDialog/artDialog.js?skin=green"></script>
<script src="/statics/artDialog/plugins/iframeTools.js"></script>
<script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script> 
<script type="text/javascript" src="js/artDialog.notice.js?r=su" charset="utf-8"></script>
<script type="text/javascript" src="js/front.js"></script>
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
</head>

<body>

<form  id="pagerForm" method="post" action="">
	<c:forEach var="p" items="${requestScope.params }"> 
		<input type="hidden" name="${p.key }" value="${fn:trim( p.value[0] ) }" />
	</c:forEach>
		<input type="hidden" name="in_pagenum" value="20" />
		<input type="hidden" name="in_page" value="" />
</form>
<jsp:include page="inc/header.jsp" flush="true" />
<div class="container">
    <div class="cont">
    
		<jsp:include page="inc/menu.jsp" flush="true" />
        <!--left完成-->
        <div class="right">
        	<div class="right_top">
            	<h1 class="interview">录用通知</h1>
                <div class="xian"></div>
                
                <div class="form">
                	<table width="750" border="0" cellpadding="5" cellspacing="0">
					  <tr>
						<td width="100">时间</td>
						<td width="100">职位</td>
                        <td width="248">企业名称</td>
                        <td width="72">状态</td>
                        <td width="65">录用通知</td>
					  </tr>
					  <tr class="xian">
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
                        <td><a target="_blank" href="/company/jobDetail.do?id=${r.job_id }" class="blue">
                        ${r.job_name }</a></td>
						<td><a target="_blank" href="/company/info.do?id=${r.company_id }" class="blue">
						${r.company_name }</a></td>
                        <td>${r.status }</td>
						<td class="bag"><a href="javascript:;" tip="${r.remark }">查看</a></td>
					  </tr>
					  </c:forEach>
					</table>
					<script type="text/javascript">
						$(function(){
							$("a[tip]").bind("click",function(e){
								e.preventDefault();
								msg_alert("提示信息", '<div style="width:300px;">'+$(this).attr("tip")+'</div>');
							});
						});
					</script>
					<div class="pagelist">
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
<jsp:include page="inc/footer.jsp" flush="true"  />
<!--footer完成-->
</body>
</html>
