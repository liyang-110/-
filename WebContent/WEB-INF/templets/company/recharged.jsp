<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/member/inc/checkLogin_c.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String id=company_id;
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><%=company_name %> - 套餐充值</title>
	<link type="text/css" rel="stylesheet" href="/static/bootstrap/css/bootstrap.min.css"  />
	<link type="text/css" rel="stylesheet" href="/member/style/bootstrap.nav.css"  />
	<link type="text/css" rel="stylesheet" href="/member/style/core.css" />
	<link type="text/css" rel="stylesheet" href="/member/img2/core.css" />
	
	<link type="text/css" rel="stylesheet" href="/member/style/first_firm.css" />

    <link rel="stylesheet" href="/static/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/static/jquery.spinner/css/bootstrap-spinner.min.css">

	<script type="text/javascript" src="/member/js/jquery-1.11.3.js"></script>
	<script type="text/javascript" src="/static/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/static/jquery.spinner/js/jquery.spinner.min.js"></script>
	<script type="text/javascript" src="/static/artDialog/artDialog.js?skin=green"></script>
	<script type="text/javascript" src="/static/artDialog/plugins/iframeTools.js"></script>

	<script type="text/javascript" src="/static/jquery/jquery.cookie.js"></script> 
	
	<script type="text/javascript" src="/assets/My97DatePicker/WdatePicker.js"  charset="utf-8"></script>


	<style type="text/css">
		.table.datagrid>tbody>tr>td{
			vertical-align:middle;
		}
		.table.datagrid>tbody>tr>td.content{
			text-align:left;
		}
		.table.datagrid>tbody>tr>td>label{
			display:block;
		}
		.table.datagrid>tbody>tr>td.pay{
			text-align:right;padding-right:1em;
		}
		.table.datagrid>tbody>tr>td.pay p{
			margin:10px;
		}
	</style>
	<script type="text/javascript">
		$(function(){
			$(".pagination a").bind("click",function(e){
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
</head>

<body>
<jsp:include page="/member/inc/header_c2.jsp" flush="true" />
<div class="container">
	<div class="cont">
    	<jsp:include page="/member/inc/menu_c.jsp" flush="true"/>
        <!--left完成-->
        <div class="right">
            <div class="list_a list_b">
                <!--table完成-->
            	
            	<div class="daohang" style="width:845px;height:40px;border-bottom:3px solid red;">
        			<a href="/company/rechargeable.do">套餐详情</a>
        			<a href="/company/rechargecombo.do">企业套餐</a>
        			<a class="active" href="/company/recharged.do">企业订单</a>
        		</div>
            	<div>
            	<form  id="pagerForm" method="post" action="">
	<c:forEach var="p" items="${requestScope.params }">
		<c:choose>
		<c:when test="${p.key eq 'in_page' }"></c:when>
		<c:when test="${p.key eq 'in_pagenum' }"></c:when>
		<c:when test="${p.key eq 'in_time_1' }"></c:when>
		<c:when test="${p.key eq 'in_time_2' }"></c:when>
		
		<c:otherwise>
		<input type="hidden" name="${p.key }" value="${fn:trim( p.value[0] ) }" />
		</c:otherwise>
		</c:choose>
	</c:forEach>
		<input type="hidden" name="in_pagenum" value="10" />
		<input type="hidden" name="in_page" value="1" />
                <div class="search">
                	日期：
                	<input class="zi" type="text" value="${params.in_time_1[0]}" name="in_time_1"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" readonly/>
                	-
                	<input class="zi" type="text" value="${params.in_time_2[0]}" name="in_time_2"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" readonly />

                    <input type="submit" value="查询"  class="suo"/>

                </div>
               <!--search完成-->
</form>    
            	
            	</div>
                <div class="table">
						<table class="table table-bordered datagrid" width="750" border="0" cellpadding="0"
							cellspacing="0">
							<tbody>
								<tr style="background:#CCC;font-size:16px;">
									<td>日期</td>
									<td>单号</td>
									<td>项目</td>
									<td>金额</td>
									<td>状态</td>
								</tr>
								<c:forEach var="r" items="${queryresult }">
								<tr>
									<td>${r.time_start }</td>
									<td>${r.trade_no}</td>
									<td>${r.order_title }</td>
									<td>金额：${r.totalamount}
										<br/>
										付款：${r.payamount }
									</td>
									<td>
				<c:choose>
					<c:when test="${r.order_status eq 'SUCCESS'}">
						已完成
					</c:when>
					<c:when test="${r.pay_status eq 'SUCCESS'}">
						已付款
					</c:when>
					<c:when test="${r.is_expire eq 'EXPIRE'}">
						订单已关闭
					</c:when>
					<c:when test="${r.pay_status eq 'NOTPAY'}">
						<a href="/company/recharge.do?id=${r.trade_no }&action=paid" target="_blank">待支付</a>
					</c:when>
					<c:otherwise>
						--
					</c:otherwise>
					</c:choose>
					<br/>
					<a href="/company/recharge.do?id=${r.trade_no }" target="_blank">订单详情</a>
									</td>
								</tr>
								</c:forEach>
				
							</tbody>
						</table>
		                <div>
		                	<nav aria-label="Page navigation" style="text-align: center;">
								${requestScope.pagination }
							</nav>
		                </div>
                </div>
          </div>
            <!--list_a完成-->   
         </div>
        <!--right完成-->
        <div class="clear"></div>	
    </div>
    <!--cont完成-->
</div>

<script type="text/javascript">
function wxScanPay( trade_no ){
	art.dialog.open('/company/recharging.do?id='+trade_no+'&_t='+new Date(), 
			{title:false,
			 height:400,
			 width:300,	
			 fixed:true,
			 lock:true,
			 cancel:false,
			 padding:0,
			 background:'#666',
			 opacity:0.5,
			 },false);
}
</script>
<!--footer开始-->
<jsp:include page="/member/inc/footer_c.jsp" flush="true"  />
<!--footer完成-->
</body>
</html>
