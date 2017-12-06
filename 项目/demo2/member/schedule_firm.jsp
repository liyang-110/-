<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	String q="?methodId=com_JobfairQuickFrm&in_r=co&in_bussid=schedule&in_company_id="+user.getCompanyId()+"&in_URLEncoding=UTF-8";
	//response.sendRedirect("/member/easyQuery.do"+q);
	//	q+="&in_job_fair_type=all&in_order=asc&in_success=on&in_job_fair_time_1="+today;
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
<title><%=company_name %> - 招聘会日程</title>
<link rel="stylesheet" href="style/bootstrap.nav.css" type="text/css"></link>

<link type="text/css" rel="stylesheet" href="style/core.css" />
<link type="text/css" rel="stylesheet" href="img2/core.css" />

<link type="text/css" rel="stylesheet" href="style/first_firm.css" />
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>

<script type="text/javascript" src="../assets/My97DatePicker/WdatePicker.js"  charset="utf-8"></script>

<script src="/assets/artDialog/artDialog.js?skin=green"></script>
<script src="/assets/artDialog/plugins/iframeTools.js"></script>

<script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script> 
<script type="text/javascript" src="js/artDialog.notice.js?r=co" charset="utf-8"></script>

<script type="text/javascript" src="../js/flow.js" charset="utf-8"></script>
<script type="text/javascript" src="../assets2/scripts/front.js" charset="utf-8"></script>
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
		$("input[name='in_success']").bind("click",function(e){
			$(this).parents("form").submit();
		});
	});
</script>
<jsp:include page="inc/header_c2.jsp" flush="true" />
<div class="container">
	<div class="cont">
    	<jsp:include page="inc/menu_c.jsp" flush="true"/>
        <!--left完成-->
        <div class="right">
            <div class="list_a list_b">
<form  id="pagerForm" method="post" action="">
	<c:forEach var="p" items="${requestScope.params }">
		<c:choose>
		<c:when test="${p.key eq 'in_page' }"></c:when>
		<c:when test="${p.key eq 'in_pagenum' }"></c:when>
		<c:when test="${p.key eq 'in_job_fair_time_1' }"></c:when>
		<c:when test="${p.key eq 'in_job_fair_time_2' }"></c:when>
		<c:when test="${p.key eq 'in_success' }"></c:when>
		
		<c:otherwise>
		<input type="hidden" name="${p.key }" value="${fn:trim( p.value[0] ) }" />
		</c:otherwise>
		</c:choose>
	</c:forEach>
		<input type="hidden" name="in_pagenum" value="20" />
		<input type="hidden" name="in_page" value="1" />
            	<h1 class="title">招聘会日程</h1>
            	<style type="text/css">
	        		.search .small {
	        			margin-left:10px;
	        			font-size:14px;
	        			color:#666;
	        			vertical-align: middle;
	        		}
	        		.search .zi {background:none;}
	        	</style>
                <div class="search">
                	招聘会日期：
                	<input class="zi" type="text" value="${params.in_job_fair_time_1[0]}" name="in_job_fair_time_1"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" readonly/>
                	-
                	<input class="zi" type="text" value="${params.in_job_fair_time_2[0]}" name="in_job_fair_time_2"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" readonly />

                    <input type="submit" value="搜索"  class="suo"/>
                    <label class="small">
                    <input type="checkbox" name="in_success" value="all" 
                    	${params.in_success[0] eq 'all'?'checked':''}/>
            		显示待审核的记录
            		</label>
                </div>
               <!--search完成-->
</form>               
               <style type="text/css">
                table.datagrid {border-collapse: collapse;}
                table.datagrid tbody td { 
               		text-align:left;
               		padding:5px 10px;
               		line-height:1.5em;
               		vertical-align:top;
               		border:1px solid #ccc;
               		border-collapse:collapse;
               	}
               	table.datagrid tbody td.content a:hover{text-decoration:underline;}
               </style>
               <table class="datagrid" width="750" border="0" cellpadding="0" cellspacing="0">
                  <colgroup>
                  	<col width="120"/>
                  	<col width="230"/>
                  	<col width="270"/>
                  </colgroup>
                  <thead>
                  <tr style="background:#CCC; height:30px; font-size:16px;">                                   
                    <td>招聘会时间</td>                                              
                    <td>招聘会名称</td>
                    <td>招聘会地点</td>
                  </tr>
                  </thead>
                  <tbody>
                  <c:set var="data" value="${res.queryresult}" />
				  <c:forEach var="r" items="${data }">
                  <tr>                                                                                                                             
                    <td>${r.job_fair_time }</td>
                    <td class="content">
                    	<c:choose>
                    		<c:when test="${r.apply_type eq 'success' }">
                    		<!-- [已预订] -->	
                    		</c:when>
                    		<c:when test="${r.apply_type eq 'company' }">
                    			<a title="等待学校审核" style="text-decoration:none;color:red;">[已申请]</a>
                    		</c:when>
                    		<c:when test="${r.apply_type eq 'school' }">
                    			<a title="请通过学校邀请" style="text-decoration:none;color:green;">[已邀请]</a>
                    		</c:when>
                    		<c:otherwise></c:otherwise>
                    	</c:choose>
                    	<a href="/jobfairInfo.do?id=${r.job_fair_id }" target="_blank" class="dian">
                    	${r.job_fair_name }
                    	</a>
                    </td>
                    <td class="content">
                    <c:if test="${r.job_fair_type_code eq 'netcongress' }">
		                    	<a href="/netcongress/start.do?id=${r.job_fair_id }" target="_blank" class="btn btn-success">进入会场</a>
		            </c:if>
                    ${r.job_fair_addr }
                    </td>
                  </tr>
                  </c:forEach>
                  </tbody>
                </table>
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
<jsp:include page="inc/footer_c.jsp" flush="true"  />
<!--footer完成-->
</body>
</html>
