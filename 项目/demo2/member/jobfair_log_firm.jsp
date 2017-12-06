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
	String job_fair_type  = request.getParameter("type");
	String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	String q="?methodId=member_log&in_r=co&in_job_fair_type="+job_fair_type+"&in_URLEncoding=UTF-8";
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
<title><%=company_name %> - 招聘会使用记录</title>
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
        			<a class="active" href="#">招聘会使用记录</a>
        			<a href="/company/rechargecombo.do" style="margin-left:-20px;"><span style="padding-left: 40px;">返回</span></a>
        		</div>
        	
               <table class="datagrid"  width="845" border="0" cellpadding="0" cellspacing="0" class="mag">
                  <thead>
                  <tr style="background:#CCC; height:30px; font-size:16px;">                            
                    <td>时间</td>                                               
                    <td>内容</td>                                                                  
                  </tr>
                  </thead>
                  <tbody>
                  <c:if test="${empty res.queryresult }">
                  <tr>
                  	<td colspan="2">暂无数据</td>
                  </tr>
                  </c:if>
                  <c:set var="data" value="${res.queryresult}" />
				  <c:forEach var="r" items="${data }">
                  <tr>
                    <td class="time">${r.log_add_time }</td>                                                                                                                              
                    <td class="content">
                     <c:choose>
                     		<c:when test="${r.type eq 1 }">
								<span style="color:#2FEC23;">[个人充值]</span>         
							</c:when>
							<c:when test="${r.type eq 2 }">
								<span style="color:#2FEC23;">[管理员充值]</span>         
							</c:when>
                     		<c:when test="${r.type eq 3 }">
								<span style="color:red;">[会员过期清零]</span>         
							</c:when>
							<c:when test="${r.type eq 4 }">
								<span style="color:blue;">[待审核]</span>         
							</c:when>
                    		<c:when test="${r.type eq 5 }">
								<span style="color:#2FEC23;">[撤回申请]</span>         
							</c:when>
							<c:when test="${r.type eq 6 }">
								<span style="color:red;">[审核完成]</span>         
							</c:when>
							<c:when test="${r.type eq 7 }">
								<span style="color:red;">[未通过]</span>         
							</c:when>
                    		<c:otherwise>
                    			
                    		</c:otherwise>
                    	</c:choose>
                    <c:choose>
                    		<c:when test="${not empty r.remark }">
                    			<a href="/jobfairInfo.do?id=${r.job_fair_id }" target="_blank">${r.job_fair_time }&nbsp;${r.remark }</a>
                    		</c:when>
                    		<c:otherwise>
                    			${r.log_content }
                    		</c:otherwise>
                    	</c:choose>
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
