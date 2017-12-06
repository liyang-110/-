<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.factory.NewsModel" %>
<%@ page import="com.zhaopin.dao.factory.JobFairModel" %>
<%@ page import="org.apache.commons.beanutils.DynaBean" %>
<%@page import="com.zhaopin.Station"%>
<%@ page import="com.zhaopin.dao.factory.AdvertisementModel" %>
<%@ page import="cn.com.zhaopin.base.pub.cCharControl" %>
<%
	String base_dir =request.getContextPath()+"/";
	AdvertisementModel	AdM = new AdvertisementModel();
 %>
           <div class="center" >
			  	<%
				   	List text_ad = AdM.getAdList("text_ad", "-1", 12 );
				   	int text_ad_size=0;
				   	if( text_ad!=null){
				   		text_ad_size=text_ad.size();
				   	}
			   	%>
            	<div class="top" >
                	<ul>
				    	<% for(int i=0;i<6&&i<text_ad_size;i++){ 
				    		List row = (List)text_ad.get(i); %>
							<li><a target="_blank" href="<%=row.get(0) %>" style="color:<%=row.get(4) %>">
								<%=row.get(3) %></a></li>
				    	<% } %>
						<!--
                        <li><a href="">陕西新才网络技术有限公司</a></li>
                    	-->
                    </ul>
                </div>
           </div>
     