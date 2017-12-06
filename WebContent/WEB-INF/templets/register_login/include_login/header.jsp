<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.Station"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="col-lg-9 col-md-8 col-xs-4 logo text-right">
					<c:choose>
					<c:when test="${users eq 'student' }">
						<span style="color:#02c084;">我是求职者</span>
					</c:when>
					<c:when test="${users eq 'company' }">
						<span style="color:#02c084;">我是企业</span>
					</c:when>
					<c:when test="${users eq 'school' }">
					<span style="color:#02c084;">我是高校</span>
					</c:when>
					</c:choose>
	
					<a href="/" style="color:#fff;">返回首页<i class="fa fa-angle-double-right"></i></a>
</div>