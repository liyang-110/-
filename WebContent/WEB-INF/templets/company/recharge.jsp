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
<title><%=company_name %> - 订单详情</title>
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
        		
        		<a class="active" href="/company/recharge.do?id=${orderInfo.trade_no }">订单详情</a>
        		<a href="/company/rechargeable.do">套餐详情</a>
        		<a href="/company/rechargecombo.do">企业套餐</a>
        		<a href="/company/recharged.do">企业订单</a>
        		</div>
                <div class="table">
                		<p>订单号：${orderInfo.trade_no }</p>
						<table class="table table-bordered datagrid" width="750" border="0" cellpadding="0"
							cellspacing="0">
							<tbody>
								<tr style="background:#CCC;font-size:16px;">
									<td>项目</td>
									<td>单价</td>
									<td>数量</td>
									<td>金额</td>
								</tr>
								<c:forEach var="r" items="${orderItems }">
								<tr>
									<td>${r.item_name}<br/>(${r.unit_name })</td>
									<td>${r.price/100}</td>
									<td>${r.quantity eq -1?"不限":r.quantity}</td>
									<td>${r.amount/100 }</td>
								</tr>
								</c:forEach>
								<tr>
									<td>合计</td>
									<td colspan="3" class="pay">
										<p>原价：<input id="total_amount" value="<fmt:formatNumber type="currency" value="${orderInfo.totalamount }"/>"/></p>
										<p>优惠
										<c:if test="${orderInfo.discount_rate lt 1 }">
										(<span id="deposit_rate"><fmt:formatNumber value="${orderInfo.discount_rate*10 }" pattern="#"/></span>折)
										</c:if>
										：<input id="discount_amount" value="<fmt:formatNumber type="currency" value="${orderInfo.discountamount }"/>"/></p>
										<p>应付：<input id="pay_amount" value="<fmt:formatNumber type="currency" value="${orderInfo.payamount }"/>"/></p>
									</td>
								</tr>
				<c:choose>
					<c:when test="${orderInfo.order_status eq 'SUCCESS'}">
						<tr><td colspan="4">已完成</td></tr>
					</c:when>
					<c:when test="${orderInfo.pay_status eq 'SUCCESS'}">
						<tr><td colspan="4">已付款</td></tr>
					</c:when>
					<c:when test="${orderInfo.is_expire eq 'EXPIRE'}">
						<tr><td colspan="4">订单已关闭</td></tr>
					</c:when>
					<c:when test="${orderInfo.pay_status eq 'NOTPAY'}">
								<tr>
									<td>支付方式</td>
									<td colspan="3">
										<label>
											<input type="radio" checked="checked"/>
											<img style="max-height:30px;" src="/static/image/WePayLogo.png"/>
										</label>
									</td>
								</tr>
								<tr>
									<td colspan="4">
											<p><a class="btn btn-success" href="javascript:;" onclick="wxScanPay('${orderInfo.trade_no }')">付款</a></p>
									</td>
								</tr>
					</c:when>
					<c:when test="${orderInfo.pay_status eq 'ING'}">
						<tr><td colspan="4">
							<p>订单正在支付，已支付请<a class="btn btn-success" href="/company/recharge.do?id=${param.id }&action=paid">刷新</a>；支付失败，请点击<a class="btn btn-success" href="/company/recharge.do?id=${param.id }&action=repay">重新支付</a></p>
						</td></tr>
					</c:when>
					<c:otherwise>
						<tr><td colspan="4"></td></tr>
					</c:otherwise>
				</c:choose>
							</tbody>
						</table>
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
