<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.zhaopin.dao.factory.AreaModel" %>
<%@ page import ="com.zhaopin.dao.factory.SchoolGraduationModel" %>

<%
	HashMap jobfairInfo = (HashMap)request.getAttribute("jobfairInfo");
	String area_id=(String)request.getAttribute("area_id");
	String contextPath=request.getContextPath();
	String aParam = area_id==null?"":"&a="+area_id;
	String base_dir = request.getContextPath()+"/";
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="Keywords" content="<%=com.zhaopin.Config.getSiteKeywords() %>" />
<meta name="Description" content="<%=com.zhaopin.Config.getSiteDescription() %>" />
<title>全国高校毕业生就业网络联盟秋季招聘周 - 陕西分会场 - 211校招网</title>

<link href="/assets2/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css"  href="/statics/css/main.css">
<link rel="stylesheet" type="text/css" href="/assets2/styles/jobfair.css" />

<link rel="stylesheet" href="/special/2015/0916/styles.css">
<script type="text/javascript" src="/statics/jquery/1.11.0/jquery.min.js"></script>
<!-- 
<script src="/assets2/jquery/jquery.min.js" type="text/javascript"></script>
 -->
<script src="/assets2/jquery/jquery.form.js" type="text/javascript"></script>
<script src="/assets2/js/jquery.validate.min.js" type="text/javascript"></script> 
<script type="text/javascript" src="/statics/jquery/jquery-scrollable.js"></script>

<script src="/assets2/artDialog/artDialog.js?skin=green"></script>

<script type="text/javascript" src="/assets2/scripts/front.js"></script>
<script type="text/javascript" src="/assets2/scripts/login.js" charset="utf-8"></script>
<script src="<%=request.getContextPath()%>/assets/artDialog/plugins/iframeTools.js"></script>

	<script type="text/javascript">
		if (window!=top) // 判断当前的window对象是否是top对象
			top.location.href =window.location.href; 
		var cur_path = "<%=request.getContextPath()%>";
	</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/flow.js" charset="utf-8"></script>
<style>
.header {display:none;}
.zph_head  .link a{
	display:block;
	height:50px;
	width:260px;
	margin-left:90px;
}
.zph_head  .link a:hover{
	background-color:rgba(255, 255, 255, 0.5);
	opacity:0.5;
	/*
	outline-style:solid;
	outline-width:1px;
	outline-color:#f00;
	*/
}
.xiebandy .logo a{
	width:118px;
	height:56px;
	text-align:center;
	display:inline-block;
}
.xiebandy .logo a:hover{
	/*
	outline-style:solid;
	outline-width:1px;
	outline-color:#f00;
	*/
}
.xiebandy .logo img {
	width:118px;
	height:56px;
}
</style>

</head>

<body>
	<div class="container  zph_head  xiebandy">
	<div style="margin-top:255px;">
		<div class="link" style="margin-top:2px;padding-left:0;width:490px;float:left;">
			<a target="_blank"  style="width:350px;" href="http://www.211zph.com/jobfairInfo.do?id=201509160006443" title="211校招网"></a>
		</div>
		<div class="logo" style="padding-top:80px;margin-top:0;float:left;overflow:hidden;width:496px;height:58px;">
			<a target="_blank"  style="width:230px;" href="http://www.sxgxbys.com/" title="陕西分会场"></a>
			<a target="_blank" href="http://www.ncss.org.cn/wlzph/wllmzph/" title="教育部主会场"></a>
		</div>
		<div style="clear:both;"></div>
	</div>
	</div>
	<div style="clear:both;"></div>
	<div class=" f_content container zph_card">
	
		<div class="info_card">
			<div class="title"><%=jobfairInfo.get("job_fair_name") %></div>			
			<div class="line">举办时间：<%=jobfairInfo.get("job_fair_time") %> 至 <%=jobfairInfo.get("job_fair_overtime") %></div>				
			<div class="line">计划规模：<%=jobfairInfo.get("job_fair_company_num") %>家企业</div>
			<div class="action">
				<!-- 
				<a href="javascript:;" onclick="ComApply('<%=jobfairInfo.get("job_fair_id")%>','<%=jobfairInfo.get("school_id")%>')" class="btn btn-warning btn-medium">企业订展</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="javascript:;" onclick="openOrder('<%=jobfairInfo.get("job_fair_id")%>','<%=jobfairInfo.get("school_id")%>')" class="btn  btn-warning btn-medium">投递简历</a>
		    	 -->
		    	<a class="btn btn-warning btn-large" href="http://www.211zph.com/jobfairInfo.do?id=201509160006443" target="_blank">企业报名</a>
		    	&nbsp;&nbsp;&nbsp;
		    	&nbsp;&nbsp;&nbsp;
		    	<a class="btn btn-warning btn-large" href="http://www.211zph.com/jobfairInfo.do?id=201509160006443" target="_blank">个人求职</a>

			
			</div>
		</div>
	</div>
<div class=" f_content container zpn_company_list">
<div class="company_info " >
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
				<%
						List companyList = (List)request.getAttribute("companyList") ;
						String pagenation =  (String)request.getAttribute("pagenation") ;
						boolean isLogin= true;// session.getAttribute("userInfo") instanceof HashMap;
				%>
		<style>
			.companyList table { table-layout:fixed; }
			.companyList table td { white-space:nowrap; overflow:hidden; text-overflow:ellipsis;}
			.companyList table tr td:nth-child(1) {width:50px; text-align:center;}
			.companyList table tr td:nth-child(2) {width:60px; text-align:center; }
			.companyList table tr td:nth-child(3) {width:500px; text-align:left;}
			.companyList table tr td:nth-child(4) {width:50px; text-align:center;}
		</style>
    	<div class="companyList">
    		<!-- 
        	<h3>参会企业名单</h3>
            <div class="top-border"></div>
			 -->
            <table class="table table-striped table-hover table-bordered table-condensed">
            	<thead >
                <tr style="background-color:#EDEBE9; height:33px;line-height:33px;">
                	<td>序号</td>
                    <td>地区</td>
                    <td>企业名称</td>
                    <td>&nbsp;</td>
                 </tr>
                </thead>
                <tbody>
       <%
    	if(!isLogin){
					%>
	             	<tr><td colspan='3'>只有登陆用户才可以查看参会企业列表！<a href="<%=request.getContextPath() %>/register.jsp" target="_top">注册</>&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath() %>/" target="_top">登录</a></td></tr>
					<%
	  	}else if(companyList!=null &&companyList.size()>0){
	          	    int i=0;
	            	for(Iterator iter=companyList.iterator();iter.hasNext();){
	            		HashMap row=(HashMap)iter.next();
	            	%>
	            		<tr><td style="text-align:center;"><%=row.get("rn")%>.</td>
	            		<td><%=row.get("area_name")%></td>
	            		<td style="padding-left:20px;text-align:left;">
	            		<a href='<%=request.getContextPath()%>/company/info.do?id=<%=row.get("company_id")%>' target='_blank'>
	            		<%=row.get("company_name")%></a>
	            		<span style="color:#FF5100;">&nbsp;&nbsp;&nbsp;&nbsp;诚聘：</span>
	                    <% List jobs= (List)row.get("jobs"); %>
	                    <% if(jobs!=null && jobs.size()>0){ 
	                    			for(Iterator jt=jobs.iterator();jt.hasNext();){
	                    				HashMap job=(HashMap)jt.next();
	                    %>
          						<a title="<%=job.get("job_name") %>" href="<%=base_dir %>company/jobDetail.do?id=<%=job.get("job_id") %>" target="_blank">
          							<%=job.get("job_name") %>
          						</a>&nbsp;
	                    <% 		}
	                    		}else{%>
	                    			无
	                    <%	}%>
	            		
	            		
	            		<% if(false) {%>
	            		<a href="javascript:;" class="btn btn-info btn-mini" style="font-size:12px;" onclick="parent.openOrder('<%=request.getParameter("job_fair_id") %>','','<%=row.get("job_fair_id").toString() %>')">投递简历</a>
	            		<%} %>
	            		</td>
	            		<td>
	            		<a href="<%=request.getContextPath()%>/company/info.do?id=<%=row.get("company_id").toString() %>&jobs=1" target="_blank" class="btn btn-info btn-mini" style="font-size:12px;">投递简历</a>

	            		</td>

						</tr>
						<%
	             	}
	    }else{ %>
	             	<tr><td colspan='3'>还没有企业申请参会！</td></tr>
	             	<% 

		}
	    %>
                </tbody>
            </table>
          <%
          if(isLogin && pagenation!=null ){
           %>
					<div class=" pagination pagination-centered">
						<%=pagenation %>
					</div>
            <%
            }
             %>
        </div>
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
</div> <!-- content -->
</div><!-- main -->
<div class="f_content container  zph_company_foot">
</div>
<jsp:include page="../../include3/bottom4.jsp"></jsp:include>	<script src="<%=request.getContextPath()%>/assets2/bootstrap/js/bootstrap.min.js" type="text/javascript"></script> 

	<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":" 211校招网是一个免费为高校和企业开展校园招聘，提供校园招聘会在线发布、预订、宣传、管理的平台。在全国30个省市设立了分站，服务中小企业和大学生。","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"16"},"slide":{"type":"slide","bdImg":"6","bdPos":"left","bdTop":"100"}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>

</body>
</html>
