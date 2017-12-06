<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="net.zhaopin.member.student.PreviewGeneralBusiness" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/static/inc/checkLogin.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>简历预览</title>
<link href="/static/css/font-awesome.min.css" rel="stylesheet" media="screen">
<link type="text/css" rel="stylesheet" href="/static/css/stu_center(10preview).css" />
<link type="text/css" rel="stylesheet" href="/member/style/core.css" />
<script src="/static/jquery/1.11.3/jquery.min.js"></script>

<script type="text/javascript">
             	$(function(){
             		$(".auto-height").each(function(){
             			var height=$(this)[0].scrollHeight;
             			if(height<30)height=30;
             			$(this).css( {height:height} );
             		});
             		$(".auto-height").on("propertychange",function(){
             			var height=$(this)[0].scrollHeight;
             			if(height<30)height=50;
             			$(this).css( {height:height} );
             		});
             		$(".auto-height").on("change",function(){
             			var height=$(this)[0].scrollHeight;
             			if(height<30)height=50;
             			$(this).css( {height:height} );
             		});
             		$(".auto-height").on("click",function(){
             			var height=$(this)[0].scrollHeight;
             			$(this).css( {height:height} );
             		});
             	});
 	</script>

</head>

<body>
	<%
		String exportToWord = request.getParameter("exportToWord");
		if (exportToWord != null
				&& exportToWord.toString().equalsIgnoreCase("YES")) {
			response.setContentType("application/vnd.ms-word");
			response.setHeader("Content-Disposition", "inline; filename="
					+ "word.doc");

		}
	%>
	 <%-- <div class="main">
        <div class="main_top"><img src="/static/img/preview_logo.png" width="100" height="38"><p class="main_top_r">校园招聘服务专家</p></div>
        <div class="cont">
            <div class="text">
            	<div class="list_a">
                	<dl class="dl_l">
                    	<dt><span class="name">${student.name}</span></dt>
                        <dt><span>户籍：${student.home_areas}</span></dt> 
                        <dt><span>现居住地：${student.areas}</span></dt> 
                        <dt><span>生日：${student.birth}</span></dt>
                    </dl>
                    
                    <dl class="dl_r">
                    <dt><span>${student.sex} | ${student.educations} | 2年工作经验 | ${student.work_status}</span></dt>
                    <dt><span>手机：${student.contact_tel }</span></dt>
                    <dt><span>Q Q ：${student.bind_qq }</span></dt>
                    <dt><span>E-mail：${student.contact_email }</span></dt>
                    
                    </dl>
                </div>
                <div class="img" >
                		<img style="height:122px;width:92px;"
                		src="${ (empty student.head_pic)?'img/photo.png':student.head_pic }">
                </div>
                <div class="clear"></div>
            </div>
            <div class="content">
            	<h1><i class="fa fa-graduation-cap"></i> 教育背景<span class="content_lable">Education background</span></h1>
                <dl>
                <c:forEach var="e" items="${edu}">
                    <dt>${e.begin_date}-${e.end_date }</dt>
                    <dt style="padding-bottom:20px;">${e.school_name} | ${e.profession } | ${e.education }</dt>
				</c:forEach>
                </dl>
                <h1><i class="fa fa-suitcase "></i> 期望职业<span class="content_lable">Expercted career</span></h1>
                <dl>
                    <dt>${student.hope_type } 、${student.hope_industrys }、${student.hope_salary } </dt>
                    <dt>${student.hope_positions }</dt>
                    <dt>${student.hope_areas }</dt>
                    <dt></dt>
                    
                </dl>
            	<h1><i class="fa fa-folder-open "></i> 工作/实习经历<span class="content_lable">Internaship experience</span></h1>
                <dl>
                <c:forEach var="w" items="${work}">
                	 <dt>${w.begin_date}-${w.end_date }</dt>
                    <dt>${w.company_name} | ${w.position}</dt>
                    <dt><textarea class="auto-height hyper" style="padding-bottom:10px;" cols="80" rows="2" >${w.introduce }</textarea></dt>
				</c:forEach>
                </dl>
                <h1><i class="fa fa-pencil"></i> 自我评价<span class="content_lable">Evaluation</span></h1>
                <dl class="introduce">
                    <dt><textarea class="auto-height hyper" cols="80" rows="2">${student.introduce }</textarea></dt>
                </dl>
                <p class="tips">简历来自 —— 211校招网 校园招聘专家www.211zph.com</p>
            </div>
        </div>
    </div> --%>
    
	
<style>
	table{
    	border-spacing:0px;
    }
    td{
    	padding-bottom:10px;
    }
    tr{
    	height:25px;
    }
    .info .info_img{
    	width:150px;
    	padding-left:27px;
    }
    .info .info_one{
    	width:245px;
    	padding-left:20px;
    }
    .info .info_two{
    	width:285px;
    }
    </style>
    
	<table align="center" style="width:680px;margin:40px auto;box-shadow: 0 0 8px rgba(0,0,0,0.2);padding: 20px 30px;" bgcolor="white">
		<tbody>
			<tr>
				<td colspan="3"><img src="/static/img/preview1.jpg"></td>
			</tr>
			<tr class="info">
				<td class="info_img" rowspan="4"><img style="height:122px;width:92px;"
                		src="${ (empty student.head_pic)?'img/photo.png':student.head_pic }"></td>
				<td class="info_one">${student.name}</td>
				<td class="info_two">${student.sex} | ${student.educations} | 2年工作经验 | ${student.work_status}</td>
			</tr>
			<tr class="info">
				<td class="info_one">户籍：${student.home_areas}</td>
				<td class="info_two">手机：${student.contact_tel }</td>
			</tr>
			<tr class="info">
				<td class="info_one">现居住地：${student.areas}</td>
				<td class="info_two">Q Q ：${student.bind_qq }</td>
			</tr>
			<tr class="info">
				<td class="info_one">生日：${student.birth}</td>
				<td class="info_two">E-mail：${student.contact_email }</td>
			</tr>
			<tr>
				<td colspan="3" style="font-size:20px;font-weight:bold;"><i class="fa fa-graduation-cap"></i>教育经历</td>
			</tr>
			<c:forEach var="e" items="${edu}">
			<tr>
				<td colspan="3" style="padding-left: 25px;">${e.begin_date}-${e.end_date }</td>
			</tr>
			<tr>
				<td colspan="3" style="padding-left: 25px;padding-bottom: 30px;">${e.school_name} | ${e.profession } | ${e.education }</td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="3" style="font-size:20px;font-weight:bold;"><i class="fa fa-suitcase "></i> 期望职业</td>
			</tr>
			<tr>
				<td colspan="3" style="padding-left: 25px;">${student.hope_type } 、${student.hope_industrys }、${student.hope_salary }</td>
			</tr>
			<tr>
				<td colspan="3" style="padding-left: 25px;">${student.hope_positions }</td>
			</tr>
			<tr>
				<td colspan="3" style="padding-left: 25px;">${student.hope_areas }</td>
			</tr>
			<tr>
				<td colspan="3" style="font-size:20px;font-weight:bold;"><i class="fa fa-folder-open "></i> 工作/实习经历</td>
			</tr>
			 <c:forEach var="w" items="${work}">
			<tr>
				<td colspan="3" style="padding-left: 25px;">${w.begin_date}-${w.end_date }</td>
			</tr>
			<tr>
				<td colspan="3" style="padding-left: 25px;">${w.company_name} | ${w.position}</td>
			</tr>
			<tr>
				<td colspan="3" style="color:#999;padding-left: 25px;padding-bottom: 30px;">${w.introduce }</td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="3" style="font-size:20px;font-weight:bold;"><i class="fa fa-pencil"></i> 自我评价</td>
			</tr>
			<tr>
				<td colspan="3" style="color:#999;padding-left: 25px;">${student.introduce }</td>
			</tr>
		</tbody>
	</table>
	<%
		if (exportToWord == null) {
	%>
	<div class="download">
		<div class="download_inner">
		<p>更多简历模板即将上线，敬请期待！</p><a href="/student/stuPreview.do?exportToWord=YES"><i class="fa fa-download"></i>下载简历</a>
		<div style="clear:both"></div>
		</div>
	</div>
	<%
		}
	%>
</body>
</html>
