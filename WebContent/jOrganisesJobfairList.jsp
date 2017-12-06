<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.zhaopin.dao.factory.AreaModel" %>
<%
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
<link rel="stylesheet" type="text/css" href="assets2/styles/global.css" />
<link rel="stylesheet" type="text/css" href="assets2/styles/site.css" />


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



<body>
<jsp:include  page="include2/head.jsp" flush="true"/>

    <div class="container">
        <ul class="breadcrumb">
                  <li>
                    <a href="./">首页</a> <span class="divider">&gt;</span>
                  </li>
                  <li class="active">宣讲会</li>
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
	<a <%=area_id==null?"class=\"active\"":"" %> href="?t=organises">全国站</a>
					<%
					AreaModel areaM= new AreaModel();
					List areaList = areaM.getProvionce();
                    for( Iterator it=areaList.iterator();it.hasNext();)
                    {
                    	List row =(List)it.next();
                    	if( area_id!=null&&area_id.equals( row.get(0).toString()) ){
                     %>
                     <a class="active" href="?t=organises&a=<%=row.get(0) %>"><%=row.get(1) %></a>
                     <% }else{ %>
                     <a href="?t=organises&a=<%=row.get(0) %>"><%=row.get(1) %></a>

                     <%
                     	}
                     }
                      %>
</div>
        
        </div>
        <div style="clear:both;"></div>
    </div></div>
    
     <div class=" container f_content"><!-- 招聘会类型 -->

<div class="info_card_container current"><!-- 0-->
<%
	List jobfairList =(List)request.getAttribute("jobfairList");

	if(jobfairList!=null && jobfairList.size()>0){
			String job_fair_name;
   			for(Iterator it=jobfairList.iterator();it.hasNext();){
				HashMap row = (HashMap)it.next(); 
				job_fair_name = (String)row.get("job_fair_name");
				if (job_fair_name.length()>13){
	                    	job_fair_name=job_fair_name.substring(0,12)+"...";
	            }             
 %>
					<div class="info_card">
						<!-- info_card 招聘会卡片模板，可循环套用 -->
						<div class="title"><%=row.get("job_fair_date") %>
							<a title="<%=row.get("job_fair_name") %>"><%=job_fair_name%></a>
						</div>
						<div class="line">
							时间：<%=row.get("job_fair_time") %>
						</div>
						<div class="line last">
							地点：<%=row.get("job_fair_addr") %>
						</div>
						<div class="action">
							<a href="javascript:;" onclick="openOrder('<%=row.get("job_fair_id")%>','<%=row.get("school_id")%>')" class="btn btn-warning btn-small">投递简历</a>
							<a href="<%=request.getContextPath()%>/jobfairInfo.do?id=<%=row.get("job_fair_id")%>" target="_blank" class="btn  btn-warning btn-small">查看详情</a>
						</div>
					</div> <!--  /info_card -->
 <%
 			}
 	}
  %>          
					
					
				</div>
    	</div>

<div class=" pagination pagination-centered">
<%=request.getAttribute("pagenation") %>
</div>
                    
	<jsp:include  page="include2/footer.jsp" flush="true"/>


</body>
</html>
