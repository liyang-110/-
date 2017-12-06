<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html xmlns="http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=Content-Type  content="text/html; charset=gb2312" >
<title>您申报的${job_fair_name}将于明日${job_fair_time}准时召开。届时，请您携带未收费证明准时参会！【211校招网】</title>
<style>
span.10 {
	font-family: Calibri;
}
span.15 {
	font-family: Calibri;
	color: rgb(0,0,255);
	text-decoration: underline;
	text-underline: single;
}
span.msoIns {
	text-decoration: underline;
	text-underline: single;
	color: blue;
}
span.msoDel {
	text-decoration: line-through;
	color: red;
}
div.Section0 {
	page: Section0;
}
</style>
</head>
<body>
<!--StartFragment-->
<div class="Section0"  style="layout-grid:15.6000pt;" >
<!--
  <p ><b><span style="font-family:宋体;'Times New Roman';font-weight:bold;font-size:10.5000pt;" ><font face="宋体" >标题：</font></span></b><span style="font-family:宋体;'Times New Roman';font-weight:normal;font-size:10.5000pt;" ><font face="宋体" >您申报的</font></span><u><span style="font-family:宋体;'Times New Roman';text-decoration:underline;text-underline:single;font-size:10.5000pt;" >&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="'Times New Roman';text-decoration:underline;text-underline:single;font-size:10.5000pt;" ><font face="宋体">${job_fair_name}</font></span><span style="font-family:宋体;'Times New Roman';text-decoration:underline;text-underline:single;font-size:10.5000pt;" >&nbsp;&nbsp;&nbsp;&nbsp;</span></u><span style="font-family:宋体;'Times New Roman';font-size:10.5000pt;" ><font face="宋体" >将于明日</font></span><u><span style="font-family:宋体;'Times New Roman';text-decoration:underline;text-underline:single;font-size:10.5000pt;" >&nbsp;&nbsp;&nbsp;${job_fair_time}</span></u><u><span style="font-family:宋体;'Times New Roman';text-decoration:underline;text-underline:single;font-size:10.5000pt;" >&nbsp;&nbsp;&nbsp;</span></u><span style="font-family:宋体;'Times New Roman';font-size:10.5000pt;" ><font face="宋体" >准时召开。届时，请您携带未收费证明准时参会！【</font>211<font face="宋体" >校招网】</font></span></p>
  -->
  <p ><u><span style="font-family:宋体;'Times New Roman';text-decoration:underline;text-underline:single;font-size:10.5000pt;">&nbsp;&nbsp;${company_name}&nbsp;&nbsp;</span></u><span style="font-family:宋体;'Times New Roman';font-size:10.5000pt;" ><font face="宋体" >（</font>211<font face="宋体" >校招网企业会员账号：</font></span><u><span style="font-family:宋体;'Times New Roman';text-decoration:underline;text-underline:single;font-size:10.5000pt;" >&nbsp;&nbsp;${user_id}&nbsp;&nbsp;</span></u><span style="font-family:宋体;'Times New Roman';font-size:10.5000pt;" ><font face="宋体" >）</font>HR<font face="宋体" >，您好：</font></span></p>
  <p ><span style="font-family:宋体;'Times New Roman';font-size:10.5000pt;" ><font face="宋体" >贵单位</font></span><span style="font-family:宋体;'Times New Roman';font-size:10.5000pt;" ><font face="宋体" >申请的</font></span><u><span style="font-family:宋体;'Times New Roman';text-decoration:underline;text-underline:single;font-size:10.5000pt;" >&nbsp;&nbsp;&nbsp;&nbsp;<font face="宋体" >${job_fair_name}</font>&nbsp;&nbsp;&nbsp;&nbsp;</span></u><span style="font-family:宋体;'Times New Roman';font-size:10.5000pt;" ><font face="宋体" >，将于明日</font></span><u><span style="font-family:宋体;'Times New Roman';text-decoration:underline;text-underline:single;font-size:10.5000pt;" >&nbsp;&nbsp;&nbsp; ${job_fair_time}</span></u><u><span style="font-family:宋体;'Times New Roman';text-decoration:underline;text-underline:single;font-size:10.5000pt;" >&nbsp;&nbsp;&nbsp;</span></u><span style="font-family:宋体;'Times New Roman';font-size:10.5000pt;" ><font face="宋体" >准时召开。届时请携带未收费证明（加盖公章）准时签到参会！</font></span></p>
  <p ><span style="font-family:宋体;font-weight:normal;font-size:11.0000pt;" >1.详情登陆211校招网，查询地址：</span><u><span style="font-family:宋体;font-weight:normal;text-decoration:underline;text-underline:single;font-size:11.0000pt;" >&nbsp;&nbsp;<font face="宋体" ><a href="http://www.211zph.com/jobfair/detail.do?id=${job_fair_id}">http://www.211zph.com/jobfair/detail.do?id=${job_fair_id}</a></font>&nbsp;&nbsp;</span></u><span style="font-family:宋体;font-weight:normal;font-size:11.0000pt;" >&nbsp;&nbsp;&nbsp;</span></p>
  <p ><span style="font-family:宋体;font-weight:normal;font-size:11.0000pt;" >2.登陆密码找回：</span><u><span style="font-family:宋体;color:rgb(255,0,0);font-weight:normal;text-decoration:underline;text-underline:single;font-size:11.0000pt;" ><font face="宋体" ><a href="http://www.211zph.com/forget.do">http://www.211zph.com/forget.do</a></font></span></u></p>
  <p >
  	<span style="font-family:宋体;font-size:10.5000pt;" >3.未收费证明附件</span>
  	<span style="font-family:宋体;'Times New Roman';font-size:10.5000pt;" >
		<a href="https://www.211zph.com/upload/doc/20171016.doc">点击下载</a>
  	</span>
  </p>
  <p ><span style="font-family:宋体;'Times New Roman';font-size:10.5000pt;" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face="宋体" >网站：</font></span><a href="http://www.211zph.com" ><u><span class="15"  style="font-family:宋体;color:rgb(0,0,255);text-decoration:underline;text-underline:single;" >www.211zph.com</span></u></a><span style="font-family:宋体;'Times New Roman';font-size:10.5000pt;" >&nbsp;</span></p>
  <p ><span style="font-family:宋体;'Times New Roman';font-size:10.5000pt;" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face="宋体" >详情咨询：</font>02988662468</span></p>
  <c:if test="${not empty employ_tel }">
  <p ><span style="font-family:宋体;'Times New Roman';font-size:10.5000pt;" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face="宋体" >招聘顾问：</font>${employ_tel }</span></p>
  </c:if>
  <p ><span style="font-family:宋体;'Times New Roman';font-size:10.5000pt;" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face="宋体" >投诉电话：</font>13709267332</span></p>
</div>
<!--EndFragment-->
</body>
</html>
