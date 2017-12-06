<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.Station"%>
<%@ page import="com.zhaopin.bean.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="keywords" content="<%=com.zhaopin.Config.getSiteKeywords() %>" />
<meta name="description" content="<%=com.zhaopin.Config.getSiteDescription() %>" />
<meta name="author" content="">
<title><%=com.zhaopin.Config.getSiteTitle() %></title>
 
	<link href="/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link href="/static/css/common-element.css" rel="stylesheet" type="text/css">
    <link href="/static/css/index-gjzss.css" rel="stylesheet" type="text/css">
    <link href="/static/css/font-awesome.min.css" rel="stylesheet" media="screen">

    <script type="text/javascript" src="/statics/jquery/1.11.3/jquery.min.js"></script>
    <script  type="text/javascript" src="/static/bootstrap/js/bootstrap.min.js"></script>
    
	<script type="text/javascript" src="/statics/jquery/jquery.form.js"></script>
	<script type="text/javascript" src="/statics/jquery/jquery.validate.min.js"></script>
	<script type="text/javascript" src="/static/artDialog/artDialog.js?skin=aero"></script>
	<script type="text/javascript" src="/statics/artDialog/plugins/iframeTools.js"></script>
	<script src="/static/js/flow.js" type="text/javascript" charset="utf-8"></script>
	
</head>
<body>
<!--头部架构开始-->
<jsp:include page="include/header.jsp" flush="true"></jsp:include>
<!--头部架构结束-->
<!--main架构开始-->
<div class="main">
   <div class="main_l">
        <div class="main_l ss">
        <form method="get" id="seacherForm" action="/jobfair/search.do">
        <input type="hidden" value="search_jobfair"  name="type" />
        <input type="hidden" value="20" name="in_pagenum" />
        <input type="hidden" name="in_r" value="co" />
        	
        <input class=" ss gjzss" type="text" placeholder="请输入关键字" value="${seacher.in_key}"  name="in_key"/>
        <input class=" ss sou" type="submit"  value="搜索">
         
         </form>
         <div style="clear:both"></div>
        </div>
        
        <p class="main_l text">搜索结果显示：共有${counts }条</p>
        <div class="main_l form">
        <div class="main_l checkboxes">
          <ul class="main_l checkboxes options">
          	  <%-- 
              <li class="checkbox1">
              <input type="checkbox"/>全选 
              </li>
              <li class="zhiwei1">职位</li>
              --%>
              <li class="salarywage">日期</li>
              <li class="companyname">招聘会名称</li>
              <li class="workposition">类型</li>
          </ul>
        </div>
          <div class="main_l form content">
			<%
			boolean front_sign=true;
			ComUserBean companyUser = (ComUserBean)User.getUser("company",session );
			if( companyUser!=null && !"member_type_01".equals( companyUser.getMemberType() ) ){
				front_sign=false;
			}
			List result = (List)(List)request.getAttribute("queryresult");
		  	if( result !=null && result.size()>0)
		  	{
		  			 String job_fair_name;
				     for(Iterator it = result.iterator(); it.hasNext(); )
				     {
				     	Map row = (Map)it.next();
				     	if( front_sign 
				     		&& "1".equals(row.get("front_sign").toString() ) ){
				     		continue;
				     	}
				     	job_fair_name = (String)row.get("job_fair_name");
			%>
					<ul>
						<%--
						<li class="checkbox1"><input type="checkbox" /></li>
						<li class="zhiwei">销售助理</li>
						--%>
						<li class="salarywage"><%=row.get("job_fair_date") %></li>
						<li class="companyname">
							<a href="/jobfair/detail.do?id=<%=row.get("job_fair_id") %>" target="_blank"
								title="<%=job_fair_name%>">
								<%=job_fair_name%>
							</a>
						</li>
						<li class="workposition">
						<%
							if("multiple".equals( row.get("job_fair_type") ) ){
								out.println("校园招聘会");
							}else if("netcongress".equals( row.get("job_fair_type") ) ){
								out.println("网络招聘会");
							}else {
								out.println("<!--"+row.get("job_fair_type")+"-->");
							}
						%>
						</li>
						</li>
						<div style="clear:both"></div>
					</ul>
			<%
				     }
		  	}
			%>
          </div>
		  <div class="main_l form content" style="text-align:center;">
				 <%=request.getAttribute("pagenation") %>
		  </div>
        </div>
   
   </div>
	
	<div style="clear:both"></div>  

</div>
<!--main架构结束-->

<!--footer区架构结束-->
<jsp:include page="include/footer.jsp" flush="true"></jsp:include>
<!--footer区架构结束-->



</body>
</html>
