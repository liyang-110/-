<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"  %>
<%@ include file="inc/checkLogin_c.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"  %>
<%
//methodId=all_file&in_URLEncoding=UTF-8&in_success="+success+"&in_id="+id+"&in_user_id="+user_id+"&in_apply_type="+apply_type
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
if( user ==null ){
	response.sendRedirect( request.getContextPath()+"/");
	return;
}else if( request.getAttribute("res")==null ){
	String q="?methodId=all_file&in_r=co&in_URLEncoding=UTF-8&in_apply_type=company&in_id="+company_id+"&in_user_id="+user_id;
	//System.out.println( q );
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
<title><%=company_name %> - 校园招聘会申请记录</title>
<link rel="stylesheet" href="style/bootstrap.nav.css" type="text/css"></link>

<link type="text/css" rel="stylesheet" href="style/core.css" />
<link type="text/css" rel="stylesheet" href="img2/core.css" />

<link type="text/css" rel="stylesheet" href="style/first_firm.css" />
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
<script src="js/jquery-easyui/jquery.easyui.min.js"></script>
<script src="/statics/artDialog/artDialog.js?skin=green"></script>

<script src="/statics/artDialog/plugins/iframeTools.js"></script>
<script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script> 
<script src="js/school_record.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	var cur_path="<%=request.getContextPath()%>"; </script>
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
		$("a.tip").bind("click",function(e){
			e.preventDefault();
			var tip = $(this).attr("title");
			if( tip!='' ){
				alert( $(this).text()+'\n'+tip );
			}
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
		<c:when test="${p.key eq 'in_job_fair_name' }"></c:when>
		<c:when test="${p.key eq 'in_success' }"></c:when>
		
		<c:otherwise>
		<input type="hidden" name="${p.key }" value="${fn:trim( p.value[0] ) }" />
		</c:otherwise>
		</c:choose>
	</c:forEach>
		<input type="hidden" name="in_pagenum" value="20" />
		<input type="hidden" name="in_page" value="1" />
            	<h1>招聘会申请记录</h1>
                <div class="search search_left">
                    <input name="in_job_fair_name" value="${params.in_job_fair_name[0] }" type="text" placeholder="请输入招聘会名称" class="zi width" />
                    <input type="submit" value="查询"  class="suo"/>
                    <label class="small">
                    &nbsp;&nbsp;
                    <input type="checkbox" name="in_success" value="wait" 
                    	${params.in_success[0] eq 'wait'?'checked':''}/>
            			仅显示待审核的记录
            		</label>
                </div>
                <div class="search_right">
                	<!-- 
                	<a href="schoolyard_firm.html" target="_blank">返回继续申请</a>
                	-->
                </div>
                <div class="clear"></div>
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
               <table class="datagrid" width="830" border="0" cellpadding="0" cellspacing="0" style="margin-top:10px;">
                  <colgroup>
                  	<col width="40" />
                  	<col width="160" />
                  	<col width="130" />
                  	<col width="50" />
                  	<col width="100" />
                  </colgroup>
                  <thead>
                  <tr style="background:#CCC; height:30px; font-size:16px;">                                   
                    <td>序号</td> 
                    <td>申请时间</td>                                              
                    <td>招聘会时间</td>
                    <td>招聘会名称</td>
                    <td>审核状态</td>
                   <td>撤销申请</td>
                  </tr>
                  </thead>
                  <tbody>
                  <c:if test="${empty res.queryresult }">
                  <tr>
                  	<td colspan="5">暂无数据</td>
                  </tr>
                  </c:if>
                  <c:set var="data" value="${res.queryresult}" />
				  <c:forEach var="r" items="${data }">
                  <tr>
                  	<td>${r.rn }</td> 
                  	<td>${r.add_time }</td>                                                                                                                            
                    <td>${r.job_fair_time }</td>
                    <td class="content">
                    	<div style="width:300px;height:100%;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;color:#39F;">
                    	<a href="/jobfairInfo.do?id=${r.job_fair_id }" target="_blank" class="dian">
                    	${r.job_fair_name }
                    	</a>
                    	</div>
                    </td>
                    <td>
                    	<c:choose>
                    		<c:when test="${r.status_code eq 'success' }">
                    			<a href="javascript:;" title="${r.mem }" class="pass tip">已通过</a>
                    			
                    		</c:when>
                    		<c:when test="${r.status_code eq 'failure' }">
                    			<a href="javascript:;" title="${r.mem }" class="not_pass tip">未通过</a>
                    		</c:when>
                    		<c:when test="${r.status_code eq 'wait' }">
                    			<a href="javascript:;" title="${r.mem }" class="wait tip">待审核</a>
                    		</c:when>
                    		<c:when test="${r.status_code eq 'cancel' }">
                    			<a href="javascript:;" title="${r.mem }" class="wait tip">已撤销</a>
                    		</c:when>
                    		<c:otherwise></c:otherwise>
                    	</c:choose>
                    </td>
                    <td>
                    <c:if test="${r.status_code eq 'wait' }">
                    	<input type="button" value="撤销申请" class="cancle_btn" onClick="cancelSheet('${r.processid }')" />
                    </c:if>
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
