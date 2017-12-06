<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.service.CompanyRecruitService" %>
<%
	response.sendRedirect("http://www.211zph.com/special/zph2015.do?id=201507300006102");
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="refresh" content="0; url=http://www.211zph.com/special/zph2015.do?id=201507300006102" />
<title>2015年离校未就业高校毕业生网上招聘|陕西分会场|211校招网</title>
<link rel="stylesheet" href="/statics/bootstrap/2.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/statics/bootstrap/2.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="/statics/css/main.css">
<link rel="stylesheet" href="styles.css">

<script type="text/javascript" src="/statics/jquery/jquery.form.js"></script>
<script src="/statics/jquery/jquery.validate.min.js" type="text/javascript"></script> 
<script src="/statics/artDialog/artDialog.js?skin=green"></script>
<script type="text/javascript">
var cur_path = "<%=request.getContextPath()%>";
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/statics/js/login.js" charset="utf-8"></script>
<script src="<%=request.getContextPath()%>/assets/artDialog/plugins/iframeTools.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/flow.js" charset="utf-8"></script>
</head>
<body>
<div class="container header">
	<div class="topnav">
		<ul>
			<li>
				<a target="_blank" href="http://csicc.moe.edu.cn/">全国高等学校学生信息咨询与就业指导中心</a>
			</li>
			<li>
				<a target="_blank" href="http://www.ncss.org.cn/">新职业</a>
			</li>
			<li>
				<a target="_blank" href="http://www.211zph.com/">211校招网</a>
			</li>
		</ul>
	</div>
	<div class="news">
        <div class="zc">
        	<div class="title">
            	政策解读
            </div>
            <div class="content">
            	<!-- 
				<ul>
                   <li><a href="http://www.cssn.cn/gx/gx_zcjd/201507/t20150722_2088795.shtml" target="_blank">关于做好2015年离校未就业高校毕业生就业服务工作的通知</a></li>
                   <li><a target="_blank" href="http://learning.sohu.com/20150722/n417293828.shtml">教育部：做好2015届离校未就业高校毕业生就业工作</a></li>
                   <li><a target="_blank" href="http://www.moe.edu.cn/jyb_xwfb/gzdt_gzdt/s5987/201507/t20150716_194136.html?sign=ABZ0cnNfd2NtX3ByZXZpZXdfYWNjZXNzAAAH3wAAAAYAAAARAAAADgAAAB4AAAAv">教育部将为2015年离校未就业高校毕业生举办3场网上招聘活动</a></li>
                   <li><a href="http://www.snedu.gov.cn/news/jiaoyutingwenjian/201507/21/9500.html">关于做好2015年离校未就业高校毕业生就业服务工作的通知</a></li>
                   <li><a target="_blank" href="http://www.211zph.com/newsDetail.do?id=201507290020124">关于举办2015年离校未就业高校毕业生网上招聘活动的通知</a></li>
                </ul>
            	 -->
            	<ul>
                   <li><a target="_blank"  href="http://www.211zph.com/newsDetail.do?id=201507290020287&area_id=28">211校招网承办教育部离校未就业毕业生网上招聘活动</a></li>
                   <li><a target="_blank"  href="http://www.211zph.com/newsDetail.do?id=201507290020124&area_id=28">关于举办2015年离校未就业高校毕业生网上招聘活动的通知</a></li>
                   <li><a target="_blank"  href="http://www.211zph.com/newsDetail.do?id=201507290020122&area_id=28">陕西省人才中心举办毕业生就业创业工作座谈会</a></li>
                   <li><a target="_blank"  href="http://www.211zph.com/newsDetail.do?id=201508010020543&area_id=28">陕西科技大学领导来211校招网考察</a></li>
                   <li><a target="_blank"  href="http://www.211zph.com/newsDetail.do?id=201507300020364&area_id=28">陕西高校就业率88.52% 女生就业受歧视</a></li>
                </ul>
            </div>
        </div>
        <div class="gg">
        	<div class="title">
            	活动公告
            </div>
            <div class="content">
            	<ul>
                	<li><a target="_blank" href="http://www.211zph.com/newsDetail.do?id=201507290020288">211校招网承办教育部离校未就业毕业生招聘周活</a></li>
                   <li><a target="_blank" href="http://www.211zph.com/newsDetail.do?id=201503120002472">陕西省教育厅就业中心发文《关于动员2015届毕业生免费注册求职信息的建议》</a></li>
                   <li><a target="_blank" href="http://www.211zph.com/newsDetail.do?id=201411140000682">陕西省教育厅就业中心发文《关于推广使用211校招网就业招聘会管理系统的通知》</a></li>

                </ul>
            </div>
        </div>
    </div>
    <div class="reg_btn">
    	<a class="btn btn-success btn-large" href="http://www.211zph.com/jobfairInfo.do?id=201507300006102">企业报名</a>
    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	<a class="btn btn-warning btn-large" href="http://www.211zph.com/jobfairInfo.do?id=201507300006102">个人求职</a>
    </div>
</div>
<div class=" container main">
	<div class="title">
	</div>
	<div class="content">
    	<table class="table table-bordered table-hover job_search_list"   style="table-layout:fixed;">
        	<thead style="background-color:#EDEBE9; height:42px;">
            <tr>
            <td class="col2">企业名称</td>
            <td class="col1">岗位名称</td>
            <td class="col3">工作地区</td>
            <td class="col4">薪资待遇</td>
            <td class="col5">更新日期</td>
            <td class="col6">投简历</td>
            </tr>
            </thead>
            <tbody>
			<%
				CompanyRecruitService service = new CompanyRecruitService();
				List<HashMap> list = service.getNewRecruit(1, 50, true );
				if(list != null && list.size()>0 ){
					for(HashMap row : list ){
			 %>
            	<tr>
                <td class="col2"><a href="company/info.do?id=<%=row.get("company_id") %>&jobs=1" target="_blank"><%=row.get("company_name") %></a></td>
                <td class="col1"><a href="company/jobDetail.do?id=<%=row.get("job_id") %>" target="_blank"><%=row.get("job_name") %></a></td>
                <td class="col3"><%=row.get("areas") %></td>
                <td class="col4"><%=row.get("money")==null?"":row.get("money") %></td>
                <td class="col5"><%=row.get("add_time") %></td>
                <td class="col6">
                <a href="javascript:;" onclick="openOrderJob('<%=row.get("company_id") %>','<%=row.get("job_id") %>');" class="btn btn-info btn-small ">
                投简历
                </a>
                </td>
                </tr>
			 <%
			 		}
			 	}
			  %>
			  </tbody>
		</table>
	</div>
	<div class="more">
		<a  href="/subStationJobs.do"  title="查看更多"></a>
	</div>
</div>

<div class=" container ">
	<div class="  footer">
	<ul>
		<li><a href="http://www.211zph.com"><img src="sx_57.gif"/></a></li>
		<li><a href="http://www.211zph.com"><img src="sx_57.gif"/></a></li>
		<li><a href="http://www.211zph.com"><img src="sx_57.gif"/></a></li>
		<li><a href="http://www.211zph.com"><img src="sx_57.gif"/></a></li>
		<li><a href="http://www.211zph.com"><img src="sx_57.gif"/></a></li>
		<li><a href="http://www.211zph.com"><img src="sx_57.gif"/></a></li>
		<li><a href="http://www.211zph.com"><img src="sx_57.gif"/></a></li>
		<li><a href="http://www.211zph.com"><img src="sx_57.gif"/></a></li>
		<li><a href="http://www.211zph.com"><img src="sx_57.gif"/></a></li>
		<li><a href="http://www.211zph.com"><img src="sx_57.gif"/></a></li>
		<li><a href="http://www.211zph.com"><img src="sx_57.gif"/></a></li>
		<li><a href="http://www.211zph.com"><img src="sx_57.gif"/></a></li>
		<li><a href="http://www.211zph.com"><img src="sx_57.gif"/></a></li>
		<li><a href="http://www.211zph.com"><img src="sx_57.gif"/></a></li>
		<li><a href="http://www.211zph.com"><img src="sx_57.gif"/></a></li>
		<li><a href="http://www.211zph.com"><img src="sx_57.gif"/></a></li>
		<li><a href="http://www.211zph.com"><img src="sx_57.gif"/></a></li>
		<li><a href="http://www.211zph.com"><img src="sx_57.gif"/></a></li>
		<li><a href="http://www.211zph.com"><img src="sx_57.gif"/></a></li>
		<li><a href="http://www.211zph.com"><img src="sx_57.gif"/></a></li>
		<li><a href="http://www.211zph.com"><img src="sx_57.gif"/></a></li>
		<li><a href="http://www.211zph.com"><img src="sx_57.gif"/></a></li>
		<li><a href="http://www.211zph.com"><img src="sx_57.gif"/></a></li>
		<li><a href="http://www.211zph.com"><img src="sx_57.gif"/></a></li>
		<li><a href="http://www.211zph.com"><img src="sx_57.gif"/></a></li>
		<li><a href="http://www.211zph.com"><img src="sx_57.gif"/></a></li>
		<li><a href="http://www.211zph.com"><img src="sx_57.gif"/></a></li>
		<li><a href="http://www.211zph.com"><img src="sx_57.gif"/></a></li>
		<li><a href="http://www.211zph.com"><img src="sx_57.gif"/></a></li>
		<li><a href="http://www.211zph.com"><img src="sx_57.gif"/></a></li>
	</ul>
	</div>
</div>
<jsp:include page="../../include3/bottom2.jsp"></jsp:include>
</body>
</html>