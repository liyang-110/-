<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="com.zhaopin.Station"%>
<div class="site_select_link">
	<!-- 
	<a href="<%=request.getContextPath() %>/">全国站</a>
	 -->	
	<% // request.getContextPath()+"substation.do?method=siteIndex" %>
    <p/>
    <%@page import="com.zhaopin.dao.factory.AreaModel" %>
    <% 
    AreaModel areaModel =new AreaModel();
    List area_list=areaModel.getProvionce();
    if (area_list!=null && area_list.size()>0){
    	for(Iterator iter=area_list.iterator();iter.hasNext();){
	    	List templist=(List)iter.next();
	    	 out.print("<a href='"+request.getContextPath()+"/"+Station.getSubstationCode( (String)templist.get(0) )+"'>"+(String)templist.get(1)+"</a>");
			 //out.println("<a href=\"/site.do?a="+(String)templist.get(0)+"\"><div class=\"area site"+(String)templist.get(0)+"\">"+(String)templist.get(1)+"</div></a>");
			 //out.println("<div class=\"area site"+(String)templist.get(0)+"\"><a href=\"/site.do?a="+(String)templist.get(0)+"\">"+(String)templist.get(1)+"</a></div>");
    	}
    }
     %> 
</div>