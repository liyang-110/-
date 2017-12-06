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
	    	 //out.print("<a href='"+request.getContextPath()+"/"+Station.getSubstationCode( (String)templist.get(0) )+"'>"+(String)templist.get(1)+"</a>");
	    	out.print("<a href=javascript:parent.selectArea('"+(String)templist.get(0)+"','"+(String)templist.get(1)+"'); data-id='"+(String)templist.get(0)+"' data-name='"+(String)templist.get(1)+"'>"+(String)templist.get(1)+"</a>");
	    }
    }
     %> 
</div>