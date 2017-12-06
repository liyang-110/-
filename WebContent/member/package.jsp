<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="inc/checkLogin_c.jsp" %>
<%@ page import="com.zhaopin.bean.*" %>
<%@ page import="com.zhaopin.dao.Model" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String id=company_id;

String sql=" select a.sms_used,a.sms_last,a.points,to_char(a.end_date,'YYYY-fmMM-DD') end_date, b.points1,b.points2,b.chargetype,a.member_type,b.type_name,"+
		" nvl(c.multiple,0) multiple,nvl(c.netcongress,0) netcongress,nvl(multipleplus,0) multipleplus,nvl(netcongressplus,0) netcongressplus from ( "+
		" select user_code,end_date,points,nvl(member_type,'member_type_01') member_type,sms_used,sms_last  "+
		" from tbl_login where  user_code='"+user_code+"' ) a left join tbl_member_type b  "+
		" on a.member_type=b.type_code "+
		" left join tbl_account_jobfair c on a.user_code =c.a_owner "+
		" left join ( select sum(case when log_type='attend-multiple' then 1 else 0 end) multipleplus,sum(case when log_type='attend-netcongress' then 1 else 0 end) netcongressplus "+
		" from tbl_member_log t where t.log_user_code='"+user_code+"' and status=0  ) d on 1=1" ;
Model model = new Model();
HashMap pack = new Model().findMap(sql);
request.setAttribute("pack",pack);
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><%=company_name %> - 企业套餐查询</title>
<link type="text/css" rel="stylesheet" href="/static/bootstrap/css/bootstrap.min.css"  />

<link rel="stylesheet" href="style/bootstrap.nav.css" type="text/css"></link>

<link type="text/css" rel="stylesheet" href="style/core.css" />
<link type="text/css" rel="stylesheet" href="img2/core.css" />

<link type="text/css" rel="stylesheet" href="style/first_firm.css" />
<link type="text/css" rel="stylesheet" href="style/alter_firm.css" />
<script type="text/javascript" src="/statics/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="/static/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../js/jquery-easyui/themes/metro/validatebox.css" type="text/css"></link>
<script type="text/javascript" src="../js/jquery-easyui/jquery.easyui.min.js"></script>

<script src="/assets/artDialog/artDialog.js?skin=green"></script>
<script src="/assets/artDialog/plugins/iframeTools.js"></script>

<script type="text/javascript" src="../assets/My97DatePicker/WdatePicker.js"  charset="utf-8"></script>

<script type="text/javascript" src="../js/select_data_js_array.js" charset="utf-8"></script>
<script type="text/javascript" src="js/front.js" charset="utf-8"></script>
<script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script> 
<script type="text/javascript" src="js/artDialog.notice.js?r=co" charset="utf-8"></script>

<link rel="stylesheet" href="/statics/Huploadify/Huploadify.css" type="text/css"></link>
<script type="text/javascript" src="/statics/Huploadify/jquery.Huploadify.js" charset="utf-8"></script>
<script type="text/javascript" src="/statics/Huploadify/autouploadfile.js" charset="utf-8"></script>
<style type="text/css">
	.list_b .tda {line-height:25px;}
	.list_b .text{
		border:none;
		border-bottom:1px #bebebe solid;
		width: 200px;
    	height: 25px;
    	line-height:25px;
    	font-size:14px;
    	font-weight:bold;
	}
	.list_b .text:focus{
		box-shadow:none;
	}
</style>
</head>

<body>
<jsp:include page="inc/header_c2.jsp" flush="true" />
<div class="container">
	<div class="cont">
    	<jsp:include page="inc/menu_c.jsp" flush="true"/>
        <!--left完成-->
        <div class="right">
            <div class="list_a list_b">
            	<h1>套餐剩余查询</h1>
                <div class="table">
                	<form name="fm" id="fm" action="" method="post">
                	<table width="750" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td class="tda">会员类型：</td>
                        <td class="tdb">
                        	<div class="text">${pack.type_name }</div></td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
					  <tr>
                        <td class="tda">会员有效期：</td>
                        <td class="tdb">
                        	<div class="text">
                        	${pack.end_date }</div></td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                       <tr>
                        <td class="tda">账户点数：</td>
                        <td class="tdb">
                        	<div class="text">
                        	${pack.points }</div>
                        	</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                       <tr>
                        <td class="tda">短信帐户：</td>
                        <td class="tdb">
                        	<div class="text">
                        	${pack.sms_last }</div>
                        	</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td class="tda">校园招聘会场次：</td>
                        <td class="tdb">
                        	<div class="text">
                        	<c:choose>
                        	<c:when test="${pack.member_type eq 'member_type_06' }">
                        	不限场次
                        	</c:when>
                        	<c:otherwise>
                        	 ${pack.multiple }+<span style="color:#fd9702;">( ${pack.multipleplus } )</span>
                        	</c:otherwise>
                        	</c:choose>
                        	</div>
                        		</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td class="tda">网络招聘会场次：</td>
                        <td class="tdb">
                        	<div class="text">
                        	${pack.netcongress }+<span style="color:#fd9702;">( ${pack.netcongressplus } )</span>
                        	</div>
                        		</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                    </table>
                    </form>
                    <div style="font-size:14px;line-height:25px;width:500px;margin:20px auto;">
                    	<p>
                    	说明:
                    	</p>
                    	<p style="text-indent:2em;">一场招聘会消耗一个场次，招聘会审核未通过场次退回！</p>
                    </div>
					<div class="baocun">
                        <div class="clear"></div>
                    </div>
                </div>
                <!--table完成-->
                <% if("201408120000594".equals( id )){ %>
            	<div style="width:200px;text-align:center;">
            		<a class="btn btn-success" href="/company/recharged.do" target="_blank">订单管理</a>
            	</div>
            	<div style="width:200px;text-align:center;">
            		<a class="btn btn-success" href="/company/rechargeable.do" target="_blank">充值</a>
            	</div>
            	<%} %>
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
