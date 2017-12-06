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
	String q="?methodId=job_fair_search&in_pagenum=20&in_r=co&in_URLEncoding=UTF-8&in_company_id="+user.getCompanyId()+"&in_job_fair_type=multiple";
	// &in_last_zero=on
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
<title><%=company_name %> - 校园招聘会</title>
<link rel="stylesheet" href="style/bootstrap.nav.css" type="text/css"></link>

<link type="text/css" rel="stylesheet" href="style/core.css" />
<link type="text/css" rel="stylesheet" href="img2/core.css" />

<link type="text/css" rel="stylesheet" href="style/first_firm.css" />
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
<script src="/statics/artDialog/artDialog.js?skin=green" charset="utf-8"></script>

<script src="/statics/artDialog/plugins/iframeTools.js"></script>
<script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script> 
<script type="text/javascript" src="js/artDialog.notice.js?r=co" charset="utf-8"></script>
<script type="text/javascript" src="/js/select_data_js_array.js" charset="utf-8"></script>

<script type="text/javascript" src="js/front.js" charset="utf-8"></script>
<script type="text/javascript" src="js/apply_jobfair.js" charset="utf-8"></script>
<script type="text/javascript">
	$(function(){
		$(".pagination a").bind("click",function(e){
			e.preventDefault();
			//var in_page = $(this).text();
			var in_page =$(this).attr("data-page");
			$("#pagerForm input[name='in_page']").val(in_page);
			$("#pagerForm").submit();
		});
		linkSelectCode('area_id','in_area_id',true,{id:'',text:'--请选择--'},'${params.in_area_id[0]}');

	});
	function searchForm()
	{
		$("#pagerForm input[name='in_page']").val(1);
		$("#pagerForm").submit();
	}
</script>
</head>
<body>

<jsp:include page="inc/header_c2.jsp" flush="true" />
<div class="container">
	<div class="cont">
    	<jsp:include page="inc/menu_c.jsp" flush="true"/>
        <!--left完成-->
        <div class="right">
            <div class="list_a list_b">
            	<h1>校园招聘会</h1>
                <div class="search">
<form  id="pagerForm" method="post" action="">
	<c:forEach var="p" items="${requestScope.params }">
		<c:choose>
		<c:when test="${p.key eq 'in_page' }"></c:when>
		<c:when test="${p.key eq 'in_pagenum' }"></c:when>
		<c:when test="${p.key eq 'in_area_id' }"></c:when>
		<c:when test="${p.key eq 'in_job_fair_name' }"></c:when>
		
		<c:when test="${p.key eq 'in_r' }"></c:when>
		<c:when test="${p.key eq 'methodId' }"></c:when>
		<c:when test="${p.key eq 'in_company_id' }"></c:when>
		<c:when test="${p.key eq 'in_job_fair_type' }"></c:when>
		<c:when test="${p.key eq 'in_URLEncoding' }"></c:when>
		
		
		<c:otherwise>
		<input type="hidden" name="${p.key }" value="${fn:trim( p.value[0] ) }" />
		</c:otherwise>
		</c:choose>	
	</c:forEach>
		<input type="hidden" name="in_pagenum" value="20" />
		<input type="hidden" name="in_page" value="" />
                	<span>地区：</span>
					<select name="in_area_id" id="in_area_id">
					</select>
                    <input type="text" name="in_job_fair_name"  value="${params.in_job_fair_name[0] }" placeholder="招聘会名称" class="zi" />
                    <input type="button" onclick="javascript:searchForm();" value="搜索"  class="suo"/>
</form>
                </div>
               <!--search完成-->
               <style type="text/css">
                table.datagrid {border-collapse: collapse;}
                table.datagrid tbody td { 
               		text-align:center;
               		padding:6px 10px;
               		line-height:1.5em;
               		vertical-align:top;
               		border:1px solid #ccc;
               		border-collapse:collapse;
               	}
               	table.datagrid td input[type='checkbox']{
               		  margin: auto;
					  display: block;
					  line-height: 40px;
					  font-size: 25px;
					  height: 20px;
					  width: 20px;
					  vertical-align:bottom;
               	}
               	table.datagrid tbody td.content {text-align:left;}
               	table.datagrid tbody td.content a:hover{text-decoration:underline;}
               </style>
               <script type="text/javascript">
               	  $(function(){
               		  $("input.checkall").bind("click",function(){
               			  var check = $(this).prop("checked");
               			  $("input.checkall").prop("checked",check);
               			  $("input[name="+$(this).val()+"]").prop("checked",check);
               		  });
               		  
               	  });
               	  function apply( name )
               	  {
               		  var ids="";
               		  var checkbox = $("input[name="+name+"]:checked").each(function(){
               			  ids+=$(this).val()+",";
               		  });
               		  applyJobfair(<%=user.getStatus()%>,<%=user.isExpire()%>,ids);
               	  }
               </script>
               <table class="datagrid"  width="840" border="0" cellpadding="0" cellspacing="0" style="margin-top:20px;">
                  <thead>
                  <tr style="background:#CCC; height:30px; font-size:16px;"> 
                  	<td><input type="checkbox" class="checkall" value="job_fair_id"></td>                                   
                    <td>序号</td> 
                    <td>招聘会时间</td>                                              
                    <td>招聘会名称</td>
                    <td>预订截止</td>
                    <td>展位/预订</td>
                  </tr>
                  </thead>
                  <tbody>
                  <c:if test="${empty res.queryresult }">
                  <tr>
                  	<td colspan="6">暂无数据</td>
                  </tr>
                  </c:if>
                  <c:set var="data" value="${res.queryresult}" />
				  <c:forEach var="r" items="${data }">
                  <tr>
                  	<td><input name="job_fair_id" type="checkbox" value="${r.job_fair_id }"></td>                                   
                    <td>${r.rn }</td>                                                                                                                              
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
                    	<a href="/jobfairInfo.do?id=${r.job_fair_id }" target="_blank" class="dian" style="width:340px;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;display: block;">
                    	${r.job_fair_name }
                    	</a>
                    </td>
                    <td>${r.job_fair_endtime }</td>
                    <td><span>${r.job_fair_company_num }</span>&nbsp;/&nbsp;<span>${r.company_num }</span></td>
                  </tr>
                  </c:forEach>
                  </tbody>
                  <tfoot>
                  <tr>                           
                  	<td><input type="checkbox" class="checkall" value="job_fair_id"></td>                                                        
                    <td colspan="5" style="text-align:left; padding-left:20px;">
                    <a href="javascript:;" onclick="apply('job_fair_id');" class="shengqing">申请招聘会</a>
                    &nbsp;&nbsp;&nbsp; 
                    <a href="schoolrecord_firm.jsp" class="shengqing">查看申请记录</a> 
                    </td>                                        
                  </tr>
                  </tfoot>
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
