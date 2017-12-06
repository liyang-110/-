<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"  %>
<%@include file="inc/checkLogin_c.jsp" %>
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
	String q="?methodId=points_01&in_URLEncoding=UTF-8&in_company_id="+user.getCompanyId();
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
<title><%=company_name %> - 点数使用记录</title>
<link rel="stylesheet" href="style/bootstrap.nav.css" type="text/css"></link>

<link type="text/css" rel="stylesheet" href="style/core.css" />
<link type="text/css" rel="stylesheet" href="img2/core.css" />
<link type="text/css" rel="stylesheet" href="style/first_firm.css" />
<link type="text/css" rel="stylesheet" href="style/consume_details.css">

<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="../js/jquery-easyui/jquery.easyui.min.js"></script>

<script type="text/javascript">
	var cur_path="<%=path%>";
	var company_id="<%=company_id%>";
</script>
</head>
<body>

<jsp:include page="inc/header_c2.jsp" flush="true" />
<div class="container">
	<div class="cont">
    	<jsp:include page="inc/menu_c.jsp" flush="true"/>
        <!--left完成-->
        <div class="right">
            <!--right_top完成-->
            <div class="list_a">
            	<div class="daohang" style="width:845px;height:40px;border-bottom:3px solid red;">
        			<a class="active" href="#">简历使用记录</a>
        			<a href="/company/rechargecombo.do" style="margin-left:-20px;"><span style="padding-left: 40px;">返回</span></a>
        		</div>
            	
               <table class="datagrid"  width="750" border="0" cellpadding="0" cellspacing="0" class="mag">
                  <thead>
                  <tr style="background:#CCC; height:30px; font-size:16px;">                            
                    <td>时间</td>                                               
                    <td>使用</td>                                                                  
                    <td>余额</td>
                    <td>说明</td>
                  </tr>
                  </thead>
                  <tbody>
                  <c:if test="${empty res.queryresult }">
                  <tr>
                  	<td colspan="4">暂无数据</td>
                  </tr>
                  </c:if>
                  <c:set var="data" value="${res.queryresult}" />
				  <c:forEach var="r" items="${data }">
                  <tr>
                    <td class="nowrap">${r.add_time }</td>                                                                                                                       
                    <td class="content">
                    <c:choose>
                   		<c:when test="${r.points gt 0  }">
                   			<span style="color:red;">${-r.points}</span>
                   		</c:when>
                   		<c:otherwise>
                   			<span style="color:green;">${-r.points}</span>
                   		</c:otherwise>
                   	</c:choose>
                    </td>
                    <td>${r.curr_points }</td>
                    <td class="content">${r.reason }
                    &nbsp;&nbsp;
                    <c:if test="${not empty r.job_fair_name }">
                    	<a href="/jobfairInfo.do?id=${r.job_fair_id }" target="_blank">${r.job_fair_name }</a>
                    </c:if>
                     </td>
                  </tr>
                  </c:forEach>
                  </tbody>
                </table>
                <div style="clear:both;height:20px;"></div>
                <!------------------------------------------------------------------------>
                <div class="pagelist pagenation">
						${requestScope.pagenation }
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
<jsp:include page="inc/footer_c.jsp" flush="true" />
<!--footer完成-->
</body>
</html>
