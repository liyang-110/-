<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/member/inc/checkLogin_c.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<script type="text/javascript" src=""></script> 
	<link rel="stylesheet" href="/static/css/trage_combo.css" type="text/css"></link>
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
        
        	<div class="daohang" style="width:845px;height:40px;border-bottom:3px solid red;">
        		<a href="/company/rechargeable.do">套餐详情</a>
        		<a class="active" href="/company/rechargecombo.do">企业套餐</a>
        		<a href="/company/recharged.do">企业订单</a>
        	</div>
        
           <table class="info-table" border="1"  width="845">
					<caption>会员类型：<span style="color:#F30;">${pack.type_name }</span> <span style="margin-left: 530px;">会员截止时间：${pack.end_date }</span></caption>
					<tr class="info_caption">
						<th>服务</th>
						<th>已购买</th>
						<th>已使用</th>
						<th>使用明细</th>
						<th>剩余</th>
					</tr>
					<tr>
						<td>简历（份）</td>
						<td>---</td>
						<td>---</td>
						<td><a href="/member/points_log_firm.jsp">查看详情</a></td>
						<td>${pack.points }</td>
					</tr>
					<tr>
						<td>网络招聘会（场）</td>
						<td>${pack.netcongress+pack.netcongressplus+pack.netcongresson }</td>
						<td>${pack.netcongresson }</td>
						<td><a href="/member/jobfair_log_firm.jsp?type=netcongress">查看详情</a></td>
						<td>
							${pack.netcongress }+<span style="color:#fd9702;">( ${pack.netcongressplus } )</span>
						</td>
					</tr>
					<tr>
						<td>现场招聘会（场）</td>
						<td>${pack.multiple+pack.multipleplus+pack.multipleon }</td>
						<td>${pack.multipleon }</td>
						<td><a href="/member/jobfair_log_firm.jsp?type=multiple">查看详情</a></td>
						<td><c:choose>
                        	<c:when test="${pack.member_type eq 'member_type_06' }">
                        	不限场次
                        	</c:when>
                        	<c:otherwise>
                        	 ${pack.multiple }+<span style="color:#fd9702;">( ${pack.multipleplus } )</span>
                        	</c:otherwise>
                        	</c:choose>
                        </td>
					</tr>
					<tr>
						<td>职位发布（个）</td>
						<td>---</td>
						<td>---</td>
						<td><a href="/member/recruit_issue_log_firm.jsp">查看详情</a></td>
						<td>${pack.recruit_issue }</td>
					</tr>
					<tr>
						<td>急聘（日）</td>
						<td>---</td>
						<td>---</td>
						<td><a href="/member/recruit_hot_log_firm.jsp">查看详情</a></td>
						<td>${pack.recruit_hot }</td>
					</tr>
					<tr>
						<td>职位刷新（次）</td>
						<td>---</td>
						<td>---</td>
						<c:choose>
                        	<c:when test="${pack.member_type eq 'member_type_01' }">
                        	<td><a href="/member/recruit_refresh_log_firm.jsp">查看详情</a></td>
							<td>${pack.recruit_refresh }
                        	</c:when>
                        	<c:otherwise>
                        	<td>---</td>
							<td>不限次数</td>
                        	</c:otherwise>
                        </c:choose>
					</tr>
				</table>
         </div>
        <!--right完成-->
        <div class="clear"></div>	
    </div>
    <!--cont完成-->
</div>

<!--footer开始-->
<jsp:include page="/member/inc/footer_c.jsp" flush="true"  />
<!--footer完成-->
</body>
</html>
