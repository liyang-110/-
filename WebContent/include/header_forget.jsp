<%@ page language="java" pageEncoding="UTF-8"%>
    <div class="f_logo">
    	<div class="container">
        	<div class="row f_sec_1 pull-left">
            	<%@page import="com.zhaopin.dao.factory.PicModel" %>
        	<% PicModel picM=new PicModel(); %>
            		<a href="<%=request.getContextPath()%>/"><img src="<%=request.getContextPath()%>/<%=picM.getLogo() %>"  /></a>
            </div>
            <div class="row f_sec_2  pull-left">
            	<div>找回密码</div>
            </div>
 			<jsp:include  page="f_sec_x.jsp" flush="true"/>
 			
        </div>
    </div>
    <div style="clear:both;"></div>