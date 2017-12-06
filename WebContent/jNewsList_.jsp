<%@page import="com.zhaopin.dao.factory.NewsModel"%>
<%@page import="com.zhaopin.Station"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.zhaopin.dao.factory.AreaModel" %>
<%
	String area_id=(String)request.getAttribute("area_id");
	String sub_type=request.getParameter("t");
	String contextPath=request.getContextPath();
	NewsModel newsModel= new NewsModel();
	String aParam = area_id==null?"":"&a="+area_id;
	String sParam = sub_type==null?"":"&s="+sub_type;
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="Keywords" content="<%=com.zhaopin.Config.getSiteKeywords() %>" />
<meta name="Description" content="<%=com.zhaopin.Config.getSiteDescription() %>" />
<title><%=com.zhaopin.Config.getSiteTitle() %></title>

<link href="assets2/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/statics/css/main.css" />
<link rel="stylesheet" type="text/css" href="assets2/styles/site.css" />

<script src="statics/js/isPhoneSet.js"></script>
<script type="text/javascript">
//是否跳转手机页面
mobile_device_detect('http://h5.211zph.com/mobile/newsList.jsp');
</script>
<script src="assets2/jquery/jquery.min.js" type="text/javascript"></script>
<script src="assets2/jquery/jquery.form.js" type="text/javascript"></script>
<script src="assets2/js/jquery.validate.min.js" type="text/javascript"></script> 

<link rel="stylesheet" type="text/css" href="assets2/slide/slide.css" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/news/style/core.css" />
<script type="text/javascript" src="assets2/slide/g.base.js"></script>

<script src="assets2/artDialog/artDialog.js?skin=green"></script>

<script type="text/javascript" src="assets2/scripts/front.js"></script>
<script type="text/javascript" src="assets2/scripts/login.js" charset="utf-8"></script>

	<script type="text/javascript">
		if (window!=top) // 判断当前的window对象是否是top对象
			top.location.href =window.location.href; 
	</script>

</head>
<body>
<!--heard完成-->
<jsp:include  page="/include/header.jsp" flush="true"/>
    <div class="container">
        <ul class="breadcrumb">
                  <li>
                    <a href="/">首页</a> <span class="divider">&gt;</span>
                  </li>
                  <li class="active">最新名企招聘</li>
          </ul>

    </div>
    
    <div class="container">	<div class="select_area">
    	<div class="pull-left">
        	<img src="assets2/images/ditu.png"  style="margin:5px 20px;"/>
        </div>
        <div class="pull-right">
<div class="area_select_link">
	<a <%=area_id==null?"class=\"active\"":"" %> href="?t=news<%=sParam %>">全国站</a>
					<%
					AreaModel areaM= new AreaModel();
					List areaList = areaM.getProvionce();
                    for( Iterator it=areaList.iterator();it.hasNext();)
                    {
                    	List row =(List)it.next();
                    	if( area_id!=null&&area_id.equals( row.get(0).toString()) ){
                     %>
                     <a class="active" href="?t=news&a=<%=row.get(0) %><%=sParam %>"><%=row.get(1) %></a>
                     <% }else{ %>
                     <a href="?t=news&a=<%=row.get(0) %><%=sParam %>"><%=row.get(1) %></a>

                     <%
                     	}
                     }
                      %>
</div>
        
        </div>
        <div style="clear:both;"></div>
    </div></div>
    <div class="container">
	<div class="left">
        <!--left_a结束-->   
        <div class="left_b" style="margin:10px 0px">
        	<h1>最新招聘</h1>
            <ul>
                 <%
                 newsModel= new NewsModel();
                  List newsList1= newsModel.getPageNewsList("news_type03", null,null,null, 1,15);
                    for(int i=0;i<newsList1.size();i++){
                    	// JSONArray row = JSONArray.fromObject(newsList.get(i));
                    	Map row =(Map) newsList1.get(i);
                    	%>
 <li><a href="<%=request.getContextPath() %>/newsDetail.do?id=<%=row.get("news_id") %>"  target="_blank" alt="<%=row.get("news_title") %> " title="<%=row.get("news_title") %> ">
					<%=row.get("add_time") %>&nbsp;&nbsp;<%=row.get("news_title") %> </a></li>	
				<% }%>
            </ul>
        </div>
        <!--left_b结束-->
    </div>
    <!--right开始-->
    <div class="right">
        <div class="menu2">
            <ul>
                <li class="hotel" ><a href="<%=contextPath %>/list.do?t=news<%=aParam %>">最新资讯 </a></li>
                	<li  >
								<a href="<%=contextPath %>/list.do?t=kaoshi<%=aParam %>">最新招聘</a>
							</li>
							<!-- 
							<li  >
								<a href="<%=contextPath %>/list.do?t=kaoshi&s=guoqizp<%=aParam %>">国企招聘</a>
							</li>
							<li <%="mingqizp".equals(sub_type)?"class=\"hotel\"":""%> >
								<a href="<%=contextPath %>/list.do?t=kaoshi&s=mingqizp<%=aParam %>">名企招聘</a>
							</li>
							 -->
            </ul>
            <div class="clear"></div>
        </div>
        <div class="typ">
            <div id="typ1" class="content">
              <h1>资讯中心 <span> Reference&nbsp; Center</span></h1>
              <table width="658" border="0" cellpadding="5" cellspacing="0">
               	  <tr>
                  	<td>地区</td>
                    <td></td>
                    <td>日期</td>			    
                  </tr>
                  <tr class="xian">
                  	<td></td>
                    <td></td>    	                          
                    <td></td>
                  </tr>
                  <%
	List newsList =(List)request.getAttribute("newsList");

	if(newsList!=null && newsList.size()>0){
   			for(Iterator it=newsList.iterator();it.hasNext();){
				HashMap row = (HashMap)it.next();
				                 
 %>
 <tr><td style="color:#f8974e;width:40px;" ><div class="rightdirection">[<%=row.get("area_name") %>]</div></td>
<td>
<a title="<%=row.get("news_title")%>" href="<%=request.getContextPath()%>/newsDetail.do?id=<%=row.get("news_id")%>&area_id=<%=area_id%>" target="_blank">
<%=row.get("news_title")%>
</a>
</td><td><%=row.get("add_time") %></td></tr>
 <%
 			}
 	}
  %>
         	</table>
            <div class="pagelist">
                <ul class="pages1">
                <%=request.getAttribute("pagenation") %>
                </ul>
            </div>    
            </div>
            <!--er-->
        </div>
        </div> 
        <!--right结束-->
    </div>


                    
<jsp:include  page="include3/bottom.jsp" flush="true"/>

	<script src="assets2/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>
