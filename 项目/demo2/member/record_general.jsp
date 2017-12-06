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
	// /esbServer.do?method=execProc&methodId=person_order_log&in_r=su&in_student_id=4c779542-3cba-488d-8ff8-5cab1e7e72be&in_page=1&in_pagenum=20
	String q="?methodId=person_order_log&in_r=su&in_URLEncoding=UTF-8&in_student_id="+user.getStudentId();
	
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
<title>投递记录</title>
<link type="text/css" rel="stylesheet" href="style/core.css" />
<link type="text/css" rel="stylesheet" href="style/upload_general.css" />
<link type="text/css" rel="stylesheet" href="style/post_general.css" />
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
<script type="text/javascript">
	$(function(){
		$("#menu_2_2").addClass("on");
		$("#menu_2_2 a").addClass("one");
		
	});
</script>
<script src="/statics/artDialog/artDialog.js?skin=green"></script>

<script src="/statics/artDialog/plugins/iframeTools.js"></script>
<script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script> 
<script type="text/javascript" src="js/artDialog.notice.js?r=su" charset="utf-8"></script>

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
            	<h1 class="record">投递记录</h1> 
                <div class="xian"></div>
            </div>
            <!--right_top完成--> 
            <div class="post_table record_table">
            	<table width="710" border="0" cellpadding="0" cellspacing="0">
                  <tr style="font-size:16px;"> 
                    <td>投递日期</td>
                    <td>企业名称</td>
                    <td>招聘职位</td>
                  </tr>
                  <tr class="xian">
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
                  </tr>
                  </c:forEach>
                </table>
                <div class="pagelist pagenation">
						${requestScope.pagenation }
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
<jsp:include page="inc/footer.jsp" flush="true"  />
<!--footer完成-->
</body>
</html>
