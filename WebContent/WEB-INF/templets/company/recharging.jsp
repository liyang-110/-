<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<base href="<%=basePath%>">

	<title>211校招网 - 会员套餐充值</title>
	
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">


	<link type="text/css" rel="stylesheet" href="/static/bootstrap/css/bootstrap.min.css"  />
    <link rel="stylesheet" href="/static/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/static/jquery.spinner/css/bootstrap-spinner.min.css">

	<script type="text/javascript" src="/member/js/jquery-1.11.3.js"></script>
	<script type="text/javascript" src="/static/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/static/jquery.spinner/js/jquery.spinner.min.js"></script>
	<script type="text/javascript" src="/static/artDialog/artDialog.js?skin=green"></script>
	<script type="text/javascript" src="/static/artDialog/plugins/iframeTools.js"></script>

	<script type="text/javascript" src="/static/jquery/jquery.cookie.js"></script> 

	<style>
		table {width:280px;margin:auto;}
		table td {text-align:center;}
	</style>
	<script type="text/javascript">
	var parent  = art.dialog.parent,				// 父页面window对象
			api = art.dialog.open.api;	// 			art.dialog.open扩展方法
	function doClose(){
			api.close();
	}
	function doPaid(){
		parent.location="/company/recharge.do?id=${param.id}&action=paid";
	}
	function rePay(){
		parent.location="/company/recharge.do?id=${param.id}&action=repay";
	}
</script>
</head>
<body>
	<div class="container">
		<c:choose>
			<c:when test="${'SUCCESS' eq tradeState }">
				支付成功
			</c:when>
			<c:when test="${'REFUND' eq tradeState }">
				转入退款 
			</c:when>
			<c:when test="${'NOTPAY' eq tradeState }">
				<!--未支付 -->
				<table>
					<tr>
						<td>
							<img src="${qrcode }" width="260" height="260" />
							<!--
							<img src="/static/image/WePayQrcode.jpg" width="260" height="260"/>
							-->
						</td>
					</tr>
					<tr>
						<td>
							<img src="/static/image/WePayTip.png" width="180" height="60" />
						</td>
					</tr>
					<tr>
						<td>
							<button onclick="rePay();" class="btn" style="margin-top:15px;">取消支付</button>
							<button onclick="doPaid();" class="btn btn-success" style="margin-top:15px;">支付完成</button>
						</td>
					</tr>
				</table>
			</c:when>
			<c:when test="${'CLOSED' eq tradeState }">
				已关闭
			</c:when>
			<c:when test="${'REVOKED' eq tradeState }">
				已撤销（刷卡支付）
			</c:when>
			<c:when test="${'USERPAYING' eq tradeState }">
				用户支付中
			</c:when>
			<c:when test="${'PAYERROR' eq tradeState }">
				支付失败(其他原因，如银行返回失败)
			</c:when>
			<c:otherwise>
				<table>
					<tr>
						<td>
							<img src="/static/image/WePayQrcode.jpg" width="260" height="260"/>
						</td>
					</tr>
					<tr>
						<td>
							支付失败
						</td>
					</tr>
					<tr>
						<td>
							<button onclick="doClose();" class="btn" style="margin-top:15px;">关闭</button>
						</td>
					</tr>
				</table>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>