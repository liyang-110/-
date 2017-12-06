<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.zhaopin.dao.factory.AreaModel" %>
<%@ page import ="com.zhaopin.dao.factory.SchoolGraduationModel" %>

<%
	HashMap jobfairInfo = (HashMap)request.getAttribute("jobfairInfo");
	String area_id=(String)request.getAttribute("area_id");
	String contextPath=request.getContextPath();
	String aParam = area_id==null?"":"&a="+area_id;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="Keywords" content="<%=com.zhaopin.Config.getSiteKeywords() %>" />
<meta name="Description" content="<%=com.zhaopin.Config.getSiteDescription() %>" />
<title><%=com.zhaopin.Config.getSiteTitle() %></title>

<link href="assets2/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css"  href="statics/css/main.css">
<link rel="stylesheet" type="text/css" href="assets2/styles/jobfair.css" />
<script src="statics/js/isPhoneSet.js"></script>
<script type="text/javascript">
//是否跳转手机页面
mobile_device_detect('http://h5.211zph.com/mobile/jobFair/fairPage?id=<%=jobfairInfo.get("job_fair_id")%>');
</script>
<script src="assets2/jquery/jquery.min.js" type="text/javascript"></script>
<script src="assets2/jquery/jquery.form.js" type="text/javascript"></script>
<script src="assets2/js/jquery.validate.min.js" type="text/javascript"></script> 

<link rel="stylesheet" type="text/css" href="assets2/slide/slide.css" />
<script type="text/javascript" src="assets2/slide/g.base.js"></script>

<script src="assets2/artDialog/artDialog.js?skin=green"></script>

<script type="text/javascript" src="assets2/scripts/front.js"></script>
<script type="text/javascript" src="assets2/scripts/login.js" charset="utf-8"></script>
<script src="<%=request.getContextPath()%>/assets/artDialog/plugins/iframeTools.js"></script>

	<script type="text/javascript">
		if (window!=top) // 判断当前的window对象是否是top对象
			top.location.href =window.location.href; 
		var cur_path = "<%=request.getContextPath()%>";
	</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/flow.js" charset="utf-8"></script>


</head>

<body>
	<jsp:include  page="include3/header.jsp" flush="true"/> 

    <div class="container">
        <ul class="breadcrumb">
                  <li>
                    <a href="./">首页</a> <span class="divider">&gt;</span>
                  </li>
                  <li class="active">招聘会</li>
          </ul>

    </div>
	
	<div class="container f_content">
		<div class="info_card">
			<div class="title"><%=jobfairInfo.get("job_fair_name") %></div>
			<div class="capture">基本信息</div>
			
			<div class="line">举办时间：<%=jobfairInfo.get("job_fair_time") %> 至 <%=jobfairInfo.get("job_fair_overtime") %></div>			
			<div class="line">举办学校：
			<a href="<%=request.getContextPath() %>/school/info.do?id=<%=jobfairInfo.get("school_id") %>" target="_blank">
			<%=jobfairInfo.get("school_name") %>
			</a>
			</div>			
			<div class="line">举办地点：<%=jobfairInfo.get("job_fair_addr") %></div>
			<div class="line">计划规模：<%=jobfairInfo.get("job_fair_company_num") %>家企业</div>
			<div class="line">预定截止：<%=jobfairInfo.get("job_fair_endtime") %></div>
			<div class="line">乘车路线：<%=jobfairInfo.get("job_fair_bus_route") %></div>
			<div class="action">
				<a href="javascript:;" onclick="ComApply('<%=jobfairInfo.get("job_fair_id")%>','<%=jobfairInfo.get("school_id")%>')" class="btn btn-warning">企业订展</a>
				<a href="javascript:;" onclick="openOrder('<%=jobfairInfo.get("job_fair_id")%>','<%=jobfairInfo.get("school_id")%>')" class="btn  btn-warning">投递简历</a>
			</div>
		</div>
	</div>
	
<div class="container company_info" style="margin-top:15px;">
	<ul class="nav nav-tabs ajaxTabs">
				<li>
					<a href="#zc-d1" data-toggle="tab">邀请函</a>
				</li>
				<li class="active">
					<a href="#zc-d2" data-toggle="tab">参会企业</a>
				</li>
				<li class="">
					<a href="#zc-d4" data-toggle="tab">毕业生信息</a>
				</li>
				<li></li>
	</ul>
	<div class="tab-content">
		<div class="tab-pane" id="zc-d1">
		<!--  
		<h4>招聘专业</h4>
		<p>
		<%=jobfairInfo.get("professional")%>
		</p>
		<h4>招聘会邀请函：</h4>
		 -->
	     <%= com.zhaopin.Help.textToHtml( (String)jobfairInfo.get("job_fair_invitation") )%>

		</div>
		<div class="tab-pane active" id="zc-d2">
		    <iframe name="attendComFrm" id="attendComFrm" src="<%=request.getContextPath()%>/multiQueryAction.do?method=companySearch&queryType=attendCom&savesign=savesign&job_fair_id=<%=jobfairInfo.get("job_fair_id")%>&area_id=<%=area_id %>" frameborder="0" width="100%" height="600"></iframe>

		</div>
		<div class="tab-pane" id="zc-d4">
			<div style="min-height:300px;">
				<%
				String g_id = (String)jobfairInfo.get("grad_info_id") ;
				if(g_id != null ){
					 SchoolGraduationModel model = new SchoolGraduationModel();
					 out.println( model.getContent(g_id)  );
				 }
				%>
			</div>
		</div>
    </div>
</div>
                    
	<jsp:include page="include3/bottom.jsp" flush="true" />
	<script src="<%=request.getContextPath()%>/assets2/bootstrap/js/bootstrap.min.js" type="text/javascript"></script> 
	<script type="text/javascript" src="<%=request.getContextPath() %>/assets/scripts/vlstat.js"></script>
	<script type="text/javascript">
		$(function(){
			vlstatInitLE("jobfair",'<%=request.getParameter("job_fair_id")%>'); 
		});
	</script>

</body>
</html>
