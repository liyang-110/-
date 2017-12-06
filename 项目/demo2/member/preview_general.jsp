<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="net.zhaopin.member.student.PreviewGeneralBusiness" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
PreviewGeneralBusiness buss = PreviewGeneralBusiness.create(request, response);
if( buss == null ){
	response.sendRedirect("/");
}else{
	buss.initRequestData();
	
}
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>简历预览</title>
<link type="text/css" rel="stylesheet" href="style/preview_general.css" />
<link type="text/css" rel="stylesheet" href="style/core.css" />
</head>

<body>
	<div class="main">
        <h1>简历预览</h1>
        <div class="cont">
        	<h2>${student.name}</h2>
            <div class="text">
            	<div class="list_a">
                	<dl>
                    	<dt style="color:#fd7604; font-size:16px; font-weight:bold;">${student.sex} | ${student.birth}</dt>
                        <dt>现居住地：${student.areas} | 户籍：${student.home_areas} 
                        <dt>最高学历：${student.educations} | 专业：${student.profession} </dt>
                        <dt>毕业院校：${student.school_name} | ${student.grad_year }</dt>
                        <dt>到岗时间：${student.work_status}</dt>
                    </dl>
                </div>
                <div class="img" >
                		<img style="height:122px;width:92px;"
                		src="${ (empty student.head_pic)?'img/photo.png':student.head_pic }">
                </div>
                <div class="clear"></div>
            </div>
            <div class="content">
            	<h1>教育学习经历</h1>
                <img src="img/xian.png" height="6" width="630">
                <dl>
                <c:forEach var="e" items="${edu}">
                    <dt>${e.begin_date}-${e.end_date }</dt>
                    <dt>学校:${e.school_name}</dt>
                    <dt>专业:${e.profession }</dt>
                    <dt>学历:${e.education }</dt>
				</c:forEach>
                </dl>
            	<h1>工作/实习经历</h1>
                <img src="img/xian.png" height="6" width="630">
                <dl>
                <c:forEach var="w" items="${work}">
                    <dt>${w.company_name} | ${w.work_type}</dt>
                    <dt>工作时间：${w.begin_date}-${w.end_date }</dt>
                    <dt>职务：${w.position}</dt>
                    <dt>工作描述：${w.introduce }</dt>
					<dt>薪资待遇：${w.salary }元</dt>
				</c:forEach>
                </dl>
                <h1>求职意向</h1>
                <img src="img/xian.png" height="6" width="630">
                <dl>
                    <dt>${student.hope_type } | ${student.hope_industrys }</dt>
                    <dt>工作职位：${student.hope_positions }</dt>
                    <dt>工作地点：${student.hope_areas }</dt>
                    <dt>期望月薪：${student.hope_salary }元</dt>
                    <dt>自我评价：${student.introduce }
                    </dt>
                </dl>
                <h1>联系方式</h1>
                <img src="img/xian.png" height="6" width="630">
                <dl>
                    <dt>手机：${student.contact_tel }</dt>
                    <dt>QQ: ${student.bind_qq }</dt>
                    <dt>E-mail: ${student.contact_email }</dt>
                </dl>
            </div>
        </div>
    </div>
</body>
</html>
