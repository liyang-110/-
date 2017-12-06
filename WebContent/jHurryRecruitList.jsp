<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.beanutils.DynaBean" %>
<%@ page import="com.zhaopin.dao.factory.CompanyModel" %>
<%@ page import="com.zhaopin.dao.factory.CompanyRecruitModel" %>
<%@ page import="com.zhaopin.dao.factory.AreaModel" %>
<%@ page import="com.zhaopin.bean.User" %>
<%
request.setCharacterEncoding("GBK");
String area_id = (String)request.getAttribute("area_id");
String area_name=""; 
if (request.getAttribute("area_id") != null) {
	area_name=com.zhaopin.Station.getStationName( area_id );
	if(area_name.equals("")){
		area_name="全国";
	}
}
String ad_area_id=area_id==null?"0":area_id; 
String base_dir =request.getContextPath()+"/";
CompanyModel companyModel  = new CompanyModel();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta name="Keywords" content="<%=com.zhaopin.Config.getSiteKeywords() %>" />
<meta name="Description" content="<%=com.zhaopin.Config.getSiteDescription() %>" />
<title><%=area_name %>站 -- <%=com.zhaopin.Config.getSiteTitle() %></title>
<link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="statics/css/main.css" />
<link rel="stylesheet" type="text/css" href="statics/css/recruit.css">
<link rel="stylesheet" type="text/css" href="assets2/styles/site.css" />
<script src="<%=request.getContextPath()%>/assets/jquery/jquery.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/jquery/jquery.form.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/media/js/jquery.validate.min.js" type="text/javascript"></script> 

<script src="<%=request.getContextPath()%>/assets/artDialog/artDialog.js?skin=green"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/scripts/front.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/slide/slide.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/slide/g.base.js"></script>
<script src="<%=request.getContextPath()%>/assets/artDialog/plugins/iframeTools.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/scripts/login.js" charset="utf-8"></script>
<style type="text/css">
.info_card_container {
	display: none
}
.current {
	display: block
}
.main_hothire {padding-bottom:10px;font-size:14px;}
.main_hothire div.con ul{float: left;margin-left: 20px !important; margin-left: 10px;width: 310px;}
.main_hothire div.con li{margin: 0; display: block;width:300px;height:26px;overflow:hidden; line-height:26px;}
.main_hothire div.con li.comlisttit{background:url(assets/styles/img/hire_con_li_bg.gif) center left no-repeat;padding-left: 12px;}
.main_hothire div.con li.comlisttit a{color:#59656f;}
.main_hothire div.con li.comlisttit a:link{ color:#59656f;}
.main_hothire div.con li.comlisttit a:visited{ color:#59656f;}
.main_hothire div.con li.comlisthire{padding-left: 12px;}
.main_hothire div.con li.comlisthire a {margin-right:3px;}
.main_hothire div.con li span{color: #ff8607;}
		</style>
<script type="text/javascript">
var cur_path = "<%=request.getContextPath()%>";
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/flow.js" charset="utf-8"></script>
</head>
	<body>
	<jsp:include page="include3/header.jsp" flush="true"/>
	<div style="clear:both;"></div>
	<div class="container">
	        <ul class="breadcrumb">
	        
	          <li>
	            <a href="./">首页</a> <span class="divider">&gt;</span>
	          </li>
			<% if( !"".equals(area_name) ){ %>
	           <li><a href="/site.do?a=<%=area_id %>"><%="".equals(area_name)?"总":area_name %>站</a>
	           <span class="divider">&gt;</span>
	           </li>
	         <% } %>  
	           <li class="active">紧急招聘</li>
	        </ul>
	</div>
	<div class="container ad_1000x70">
        <img src="assets2/images/1000x70.jpg" />
    </div>

    <div class="container">	<div class="select_area">
    	<div class="pull-left">
        	<img src="assets2/images/ditu.png"  style="margin:5px 20px;"/>
        </div>
        <div class="pull-right">
<div class="area_select_link">
	<a <%=area_id==null?"class=\"active\"":"" %> href="?">全国</a>
					<%
					AreaModel areaM= new AreaModel();
					List areaList = areaM.getProvionce();
                    for( Iterator it=areaList.iterator();it.hasNext();)
                    {
                    	List row =(List)it.next();
                    	if( area_id!=null&&area_id.equals( row.get(0).toString()) ){
                     %>
                     	<a class="active" href="?a=<%=row.get(0) %>"><%=row.get(1) %></a>
                     
                     <% }else{ %>
                     	<a href="?a=<%=row.get(0) %>"><%=row.get(1) %></a>
                     <%	
                     	}
                     }
                      %>
</div>
        
        </div>
        <div style="clear:both;"></div>
    </div></div>

<style>
.job_search_list  td{
	overflow:hidden;white-space:nowrap;word-break:keep-all;text-overflow: ellipsis;
}
.job_search_list  td.col1 {width:250px;}
.job_search_list  td.col2 {width:290px;}
.job_search_list  td.col3 {width:90px;}
.job_search_list  td.col4 {width:90px;}
.job_search_list  td.col5 {width:90px;}
.job_search_list  td.col6 {width:87px; text-align:center;}
</style>
<div class="container">
<div class="orange_hr"></div>
    	<table class="table table-bordered table-hover job_search_list"   style="table-layout:fixed;">
        	<thead style="background-color:#EDEBE9; height:42px;">
            <tr>
            <td class="col1">岗位名称</td>
            <td class="col2">企业名称</td>
            <td class="col3">工作地区</td>
            <td class="col4">薪资待遇</td>
            <td class="col5">更新日期</td>
            <td class="col6">投简历</td>
            </tr>
            </thead>
            <tbody>
            <%
          		List queryresult=(List)request.getAttribute("newRecruit");
             	if(queryresult!=null && queryresult.size()>0 ){
             	for(Iterator it = queryresult.iterator(); it.hasNext(); ){
             	Map row = (Map)it.next();
             %>
            	<tr>
                <td class="col1"><a href="company/jobDetail.do?id=<%=row.get("job_id") %>" target="_blank"><%=row.get("job_name") %></a></td>
                <td class="col2"><a href="company/info.do?id=<%=row.get("company_id") %>&jobs=1" target="_blank"><%=row.get("company_name") %></a></td>
                <td class="col3"><%=row.get("areas") %></td>
                <td class="col4"><%=row.get("money") %></td>
                <td class="col5"><%=row.get("add_time") %></td>
                <td class="col6">
                <a href="javascript:;" onclick="openOrderJob('<%=row.get("company_id") %>','<%=row.get("job_id") %>');" class="btn btn-info btn-small ">
                投简历
                </a>
                </td>
                </tr>
             <% }//for
             	}//if
             %>   
           </tbody>
         </table>
     </div>

     <div class=" pagination pagination-centered">
     <%=request.getAttribute("pagenation") %>
      <!-- 
      <ul><li class="disabled"><span>上一页</span></li><li class="disabled active"><span>1</span></li><li><a href="/subStationJobs.do?area_id=3&amp;page=2">2</a></li><li><a href="/subStationJobs.do?area_id=3&amp;page=3">3</a></li><li class="disabled"><span>···</span></li><li><a href="/subStationJobs.do?area_id=3&amp;page=19">19</a></li><li><a href="/subStationJobs.do?area_id=3&amp;page=2">下一页</a></li></ul>
       -->
      </div>
		<!-- 
		<div class="container f_panel_content">
		    <div class="adlist">
				<%=request.getAttribute("ad_2")==null?"":request.getAttribute("ad_2") %>
		    </div>
		</div>
		 -->
		<jsp:include page="include3/bottom.jsp" flush="true" />
		<script src="<%=request.getContextPath()%>/assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	</body>
</html>
