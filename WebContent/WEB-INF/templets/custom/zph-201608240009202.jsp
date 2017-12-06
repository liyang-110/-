<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.Station"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% HashMap jobfairInfo=(HashMap)request.getAttribute("jobfairInfo");
	if(jobfairInfo ==null){
		response.sendRedirect(request.getContentType()+"/");
		return;
	}
	String job_fair_id=(String)jobfairInfo.get("job_fair_id");
	String base_dir = request.getContextPath()+"/";
 %>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="keywords"
	content="<%=com.zhaopin.Config.getSiteKeywords() %>" />
<meta name="description"
	content="<%=com.zhaopin.Config.getSiteDescription() %>" />
<title>${jobfairInfo.job_fair_name }- <%=com.zhaopin.Config.getSiteTitle() %></title>

<link href="/static/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	media="screen">
<link href="/static/css/common-element.css" rel="stylesheet"
	type="text/css">
<link href="/static/css/dzswbolanhui(zty).css" rel="stylesheet"
	type="text/css">
<link href="/static/css/font-awesome.min.css" rel="stylesheet"
	media="screen">

<script src="/static/jquery/1.11.3/jquery.min.js"></script>
<script src="/static/bootstrap/js/bootstrap.min.js"></script>
<script src="/static/artDialog/artDialog.js?skin=green" charset="utf-8"></script>
<script src="/static/artDialog/plugins/iframeTools.js"></script>
<script src="/static/js/flow.js" type="text/javascript" charset="utf-8"></script>
</head>




<body>

	<div class="bg"></div>


	<!--main区架构开始-->

	<div class="main">


		<div class="cont">
			<div class="list">
				<h3>${jobfairInfo.job_fair_name }</h3>
				<style>
.table.info_card tbody tr td {
	line-height: 32px;
	border-top: none;
}

.table.info_card tbody tr td {
	padding: 0;
	text-align: left;
}
</style>
				<table class="table info_card">
					<tbody>
						<tr>
							<td colspan="2">举办单位： <a
								href="/jobfair/school.do?id=${jobfairInfo.school_id }"
								target="_blank">${jobfairInfo.school_name }</a>
							</td>
							<td colspan="2">举办时间：${jobfairInfo.job_fair_time } 至
								${jobfairInfo.job_fair_overtime }</td>
						</tr>

						<tr>
							<td style="width:70px;">主办单位：</td>
							<td>${jobfairInfo.job_fair_sponsor }</td>
							<td style="width:70px;">承办单位：</td>
							<td>${jobfairInfo.job_fair_organizer }</td>
						</tr>

						<tr>
							<td colspan="2">招聘会规模：企业 ${jobfairInfo.job_fair_company_num }
								家</td>
							<td colspan="2">预定截止：${jobfairInfo.job_fair_endtime }</td>
						</tr>

						<tr>
							<td colspan="2">招聘会特色：${jobfairInfo.job_fair_feature }</td>
							<td colspan="2">招聘会层次：${jobfairInfo.job_fair_level }</td>
						</tr>

					</tbody>
				</table>

			</div>
			<div style="margin:20px 0 20px 10px">
				<a class="btn btn-warning  btn-large"
					onclick="ComApply('${jobfairInfo.job_fair_id }','${jobfairInfo.school_id }')"
					style="color:#fff;" href="javascript:;">企业订展</a> <a
					class="btn btn-success btn-large" target="_blank"
					style="margin-left:20px;color:#fff;"
					href="http://www.211zph.com/netcongress/start.do?id=${jobfairInfo.job_fair_id }">进入会场</a>
			</div>
			<style>
.xinxi {
	border: 2px solid #019ce9;
}

.table.info_card tbody tr td {
	padding: 0;
	text-align: left;
	font-size: 14px;
}
</style>

			<div class="xinxi">
				<div class="nav_tab">
					<ul id="myTab" class="nav nav-tabs">
						<li class="active"><a href="#tab1" data-toggle="tab">邀请函</a></li>
						<li><a href="#tab2" data-toggle="tab" class="companyList">参会企业</a></li>

					</ul>
				</div>
				<style type="text/css">
#tab1 .tab .text p {
	padding: 0;
	margin-bottom: 0;
	text-indent: 2em;
}
</style>
				<!--<div class="container tab-content tab-news">-->
				<div id="myTabContent" class="tab-content">
					<div class="tab-pane fade active in" id="tab1">
						<div class="tab">
							<div role="tabpanel" class="tab-pane active" id="yaoqinghan">
								<div class="text">
				<%
					String content=(String)jobfairInfo.get("job_fair_invitation");
					if( content==null ){
						content=new com.zhaopin.dao.factory.JobFairModel().getRecommend(job_fair_id);
						out.println( content );
					}else{
						out.println( com.zhaopin.Help.textToHtml( content ) );
					}
 				%>
								</div>
							</div>
						</div>
					</div>















					<div class="tab-pane fade" id="tab2">
						<div class="tab">
							<ul class="main_but_qiye1">
								<li class="xuhao">序号</li>
								<li class="gongsimingchen">公司名称</li>
								<li class="gongsidizhi">公司地址</li>
								<li class="toudijianli">投递简历</li>
							</ul>
							<%
					List companyList = (List)request.getAttribute("companyList") ;
					boolean isLogin= true;// session.getAttribute("userInfo") instanceof HashMap;
		%>
							<%
    		if(!isLogin){
		%>
							<ul style="cursor:default;">
								<li>只有登陆用户才可以查看参会企业列表！<a
									href="<%=request.getContextPath() %>/register.jsp"
									target="_top">注册</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
									href="<%=request.getContextPath() %>/" target="_top">登录</a></li>
							</ul>
							<%
	  		}else if(companyList!=null &&companyList.size()>0){
	          	int i=0;
	            for(Iterator iter=companyList.iterator();iter.hasNext();){
	            			HashMap row=(HashMap)iter.next();
	    %>
							<ul class="main_but_qiye1" style="cursor:default;">
								<li class="xuhao"><%=row.get("rn") %></li>
								<li class="gongsimingchen"><a
									href="/jobfair/company.do?id=<%=row.get("company_id")%>"
									target="_blank"><%=row.get("company_name")%></a></li>
								<li class="gongsidizhi"><%=row.get("company_addr")==null?"":row.get("company_addr")%></li>
								<li class="toudijianli"><a
									href="/jobfair/company.do?id=<%=row.get("company_id").toString() %>&jobs=1"
									target="_blank">投递简历</a></li>
							</ul>
							<%
	             }
	    	}else{ 
	    %>
							<ul class="main_but_qiye1" style="cursor:default;">
								<li class="xuhao" style="width:960px;">还没有企业申请参会！</li>
							</ul>
							<% 

			}
	    %>
							<div style="text-align:center;">${pagenation}</div>
		  <% if(  request.getParameter("page")!=null ) {%>
			<script type="text/javascript">
				$(function(){
					$(".companyList").trigger("click");
				});
			</script>
		  <% } %>


							<table class="table table-condensed">
								<thead>
								</thead>
								<tbody>







								</tbody>

							</table>

						</div>




					</div>



				</div>
			</div>
		</div>
		<!--标签页-->


	</div>

<!--main区架构结束-->
<style type="text/css">
	.footer {
		    background: #019ce9;
	}
	.footer_top {
			display:none;
	}
	.footer_r_top, .footer_l a, .footer_r a {
			color:#333;
	}
</style>
<jsp:include page="../include/footer.jsp" flush="true" ></jsp:include>
<!--footer区架构结束-->
</body>
</html>