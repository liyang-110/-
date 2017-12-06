<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.zhaopin.dao.factory.AreaModel" %>

<div class="site_select_link">
	<a href="<%=request.getContextPath()%>">全国站</a>
<%
					AreaModel areaM= new AreaModel();
					List areaList = areaM.getProvionce();
                    for( Iterator it=areaList.iterator();it.hasNext();)
                    {
                    	List row =(List)it.next();
  					 %>
                     <a href="<%=request.getContextPath() %>/site.do?a=<%=row.get(0) %>"><%=row.get(1) %></a>

                     <%
                     }
                      %>


</div>