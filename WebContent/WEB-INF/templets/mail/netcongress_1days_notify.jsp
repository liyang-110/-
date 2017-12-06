<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html xmlns="http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=Content-Type  content="text/html; charset=gb2312" >
<title>贵单位申报的${job_fair_name}将于${job_fair_time}准时召开，请您提前做好准备，准时参会！</title>
<style>
span.10 {
	font-family: Calibri;
}
p.p {
	text-align: left;
	font-family: Calibri;
'Times New Roman';
	font-size: 12.0000pt;
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
  <p class=p  style="text-autospace:ideograph-numeric;line-height:150%;background:rgb(255,255,255);" ><span style="font-family:宋体;color:rgb(51,51,51);font-size:12.0000pt;background:rgb(255,255,255);" ><font face="宋体" >标题：贵单位申报的</font></span><u><span style="font-family:宋体;color:rgb(51,51,51);text-decoration:underline;text-underline:single;font-size:12.0000pt;background:rgb(255,255,255);" >&nbsp;&nbsp;&nbsp;</span><span style="color:rgb(51,51,51);text-decoration:underline;text-underline:single;font-size:12.0000pt;background:rgb(255,255,255);; background-color: rgb(255,255,255)" ><font face="宋体" >${job_fair_name}</font></span><span style="font-family:宋体;color:rgb(51,51,51);text-decoration:underline;text-underline:single;font-size:12.0000pt;background:rgb(255,255,255);" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></u><span style="font-family:宋体;color:rgb(51,51,51);font-size:12.0000pt;background:rgb(255,255,255);" ><font face="宋体" >将于</font></span><u><span style="font-family:宋体;color:rgb(51,51,51);text-decoration:underline;text-underline:single;font-size:12.0000pt;background:rgb(255,255,255);" >&nbsp;&nbsp;&nbsp;&nbsp;</span></u><u><span style="font-family:宋体;color:rgb(51,51,51);text-decoration:underline;text-underline:single;font-size:12.0000pt;background:rgb(255,255,255);" >${job_fair_time}&nbsp;&nbsp;&nbsp;</span></u><span style="font-family:宋体;color:rgb(51,51,51);font-size:12.0000pt;background:rgb(255,255,255);" ><font face="宋体" >准时召开，请您提前做好准备，准时参会！</font></span></p>
  -->
  
  <p class=p  style="text-autospace:ideograph-numeric;line-height:150%;background:rgb(255,255,255);" ><u><span style="font-family:宋体;'Times New Roman';text-decoration:underline;text-underline:single;font-size:10.5000pt;">&nbsp;&nbsp;${company_name}&nbsp;&nbsp;</span></u><span style="font-family:宋体;'Times New Roman';font-size:12.0000pt;" ><font face="宋体" >（</font>211<font face="宋体" >校招网企业会员账号：</font></span><u><span style="font-family:宋体;'Times New Roman';text-decoration:underline;text-underline:single;font-size:12.0000pt;" >&nbsp;&nbsp;${user_id}&nbsp;&nbsp;</span></u><span style="font-family:宋体;'Times New Roman';font-size:12.0000pt;" ><font face="宋体" >）</font>HR<font face="宋体" >，您好：</font></span></p>
  <p class=p  style="text-autospace:ideograph-numeric;line-height:150%;background:rgb(255,255,255);" ><u><span style="font-family:宋体;color:rgb(51,51,51);text-decoration:underline;text-underline:single;font-size:12.0000pt;background:rgb(255,255,255);" >&nbsp;&nbsp;&nbsp;&nbsp;</span><font face="宋体"><span style="font-size: 12.0000pt; color: rgb(51,51,51); background-color: rgb(255,255,255)">${job_fair_name}</span></font><span style="font-family:宋体;color:rgb(51,51,51);text-decoration:underline;text-underline:single;font-size:12.0000pt;background:rgb(255,255,255);" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></u><span style="font-family:宋体;color:rgb(51,51,51);font-size:12.0000pt;background:rgb(255,255,255);" ><font face="宋体" >将于</font></span><u><span style="font-family:宋体;color:rgb(51,51,51);text-decoration:underline;text-underline:single;font-size:12.0000pt;background:rgb(255,255,255);" >&nbsp;&nbsp;${job_fair_time}</span></u><u><span style="font-family:宋体;color:rgb(51,51,51);text-decoration:underline;text-underline:single;font-size:12.0000pt;background:rgb(255,255,255);" >&nbsp;&nbsp;</span></u><span style="font-family:宋体;color:rgb(51,51,51);font-size:12.0000pt;background:rgb(255,255,255);" >进行，<font face="宋体" >现已有</font></span><u><span style="font-family:宋体;color:rgb(51,51,51);text-decoration:underline;text-underline:single;font-size:12.0000pt;background:rgb(255,255,255);" >&nbsp;&nbsp;${order_person_num}&nbsp;&nbsp;</span></u><span style="font-family:宋体;color:rgb(51,51,51);font-size:12.0000pt;background:rgb(255,255,255);" ><font face="宋体" >名求职者给贵公司投递了简历，届时我司会安排专人通知给贵司投递简历的求职者准时上线，等待贵司面试官进行视频面试，烦请贵司提前做好人员安排及视频面试准备，于明日</font>9:00<font face="宋体" >点准时上线进行面试。</font></span></p>
  <p class=p  style="text-autospace:ideograph-numeric;line-height:150%;background:rgb(255,255,255);" >
  	<b><span style="font-family:宋体;color:rgb(255,0,0);font-weight:bold;font-size:12.0000pt;background:rgb(255,255,255);" ><font face="宋体" >客服电话</font>:029-88662468&nbsp;</span></b>
  </p>
  <c:if test="${not empty employ_tel }">
  <p class=p  style="text-autospace:ideograph-numeric;line-height:150%;background:rgb(255,255,255);" >
  	<b><span style="font-family:宋体;color:rgb(255,0,0);font-weight:bold;font-size:12.0000pt;background:rgb(255,255,255);" ><font face="宋体" >招聘顾问</font>:${employ_tel}&nbsp;</span></b>
  </p>
  </c:if>
  <p class=p  style="text-autospace:ideograph-numeric;line-height:150%;background:rgb(255,255,255);" >
  	<b><span style="font-family:宋体;color:rgb(255,0,0);font-weight:bold;font-size:12.0000pt;background:rgb(255,255,255);" ><font face="宋体" >投诉拨打</font>:13709267332&nbsp;</span></b>
  </p>
  <p class=p  style="text-autospace:ideograph-numeric;line-height:150%;background:rgb(255,255,255);" ><b><span style="font-family:宋体;color:rgb(51,51,51);font-weight:bold;font-size:12.0000pt;background:rgb(255,255,255);" ><font face="宋体" >参会流程</font></span></b><b><span style="font-family:宋体;color:rgb(51,51,51);font-weight:bold;font-size:12.0000pt;background:rgb(255,255,255);" ><font face="宋体" >：</font></span></b></p>
  <p class=p  style="text-autospace:ideograph-numeric;line-height:150%;background:rgb(255,255,255);" ><span style="font-family:宋体;color:rgb(51,51,51);font-size:12.0000pt;background:rgb(255,255,255);" >1、选择一个</span><span style="font-family:宋体;color:rgb(51,51,51);font-size:12.0000pt;background:rgb(255,255,255);" ><font face="宋体" >适宜视频面试的场所（环境：</font></span><span style="font-family:宋体;color:rgb(51,51,51);font-size:12.0000pt;background:rgb(255,255,255);" ><font face="宋体" >安静、整洁</font></span><span style="font-family:宋体;color:rgb(51,51,51);font-size:12.0000pt;background:rgb(255,255,255);" ><font face="宋体" >、可代表企业形象）</font></span><span style="font-family:宋体;color:rgb(51,51,51);font-size:12.0000pt;background:rgb(255,255,255);" ><font face="宋体" >，准备一台</font></span><span style="font-family:宋体;color:rgb(51,51,51);font-size:12.0000pt;background:rgb(255,255,255);" ><font face="宋体" >连</font></span><span style="font-family:宋体;color:rgb(51,51,51);font-size:12.0000pt;background:rgb(255,255,255);" ><font face="宋体" >网电脑，须有摄像头、耳麦，</font></span><span style="font-family:宋体;color:rgb(51,51,51);font-size:12.0000pt;background:rgb(255,255,255);" ><font face="宋体" >提前调试是否可以</font></span><span style="font-family:宋体;color:rgb(51,51,51);font-size:12.0000pt;background:rgb(255,255,255);" ><font face="宋体" >视频；</font></span></p>
  <p class=p  style="text-autospace:ideograph-numeric;line-height:150%;background:rgb(255,255,255);" ><span style="font-family:宋体;color:rgb(51,51,51);font-size:12.0000pt;background:rgb(255,255,255);" >2、使用</span><span style="font-family:宋体;color:rgb(51,51,51);font-size:12.0000pt;background:rgb(255,255,255);" >360极速浏览器</span><span style="font-family:宋体;color:rgb(51,51,51);font-size:12.0000pt;background:rgb(255,255,255);" ><font face="宋体" >登录</font>211校招网</span><span style="font-family:宋体;color:rgb(51,51,51);font-size:12.0000pt;background:rgb(255,255,255);" ><font face="宋体" >企业会员中心</font></span><span style="font-family:宋体;color:rgb(51,51,51);font-size:12.0000pt;background:rgb(255,255,255);" ><font face="宋体" >；</font></span></p>
  <p class=p  style="text-autospace:ideograph-numeric;line-height:150%;background:rgb(255,255,255);" ><span style="font-family:宋体;color:rgb(51,51,51);font-size:12.0000pt;background:rgb(255,255,255);" >3、进入会员中心，</span><span style="font-family:宋体;color:rgb(51,51,51);font-size:12.0000pt;background:rgb(255,255,255);" ><font face="宋体" >点击</font></span><span style="font-family:宋体;color:rgb(51,51,51);font-size:12.0000pt;background:rgb(255,255,255);" >&#8220;</span><b><span style="font-family:宋体;color:rgb(51,51,51);font-weight:bold;font-size:12.0000pt;background:rgb(255,255,255);" ><font face="宋体" >预订成功招聘会</font></span></b><span style="font-family:宋体;color:rgb(51,51,51);font-size:12.0000pt;background:rgb(255,255,255);" >&#8221;</span><span style="font-family:宋体;color:rgb(51,51,51);font-size:12.0000pt;background:rgb(255,255,255);" ><font face="宋体" >按钮</font></span><span style="font-family:宋体;color:rgb(51,51,51);font-size:12.0000pt;background:rgb(255,255,255);" ><font face="宋体" >选择正在进行的已预订成功的网络视频招聘会，点击</font>&#8220;</span><b><span style="font-family:宋体;color:rgb(51,51,51);font-weight:bold;font-size:12.0000pt;background:rgb(255,255,255);" ><font face="宋体" >进入会场</font></span></b><span style="font-family:宋体;color:rgb(51,51,51);font-size:12.0000pt;background:rgb(255,255,255);" >&#8221;按钮进入会场；</span></p>
  <p class=p  style="text-autospace:ideograph-numeric;line-height:150%;background:rgb(255,255,255);" ><span style="font-family:宋体;color:rgb(51,51,51);font-size:12.0000pt;background:rgb(255,255,255);" >4、进入会场后，点击&#8220;</span><b><span style="font-family:宋体;color:rgb(51,51,51);font-weight:bold;font-size:12.0000pt;background:rgb(255,255,255);" ><font face="宋体" >收到简历</font></span></b><span style="font-family:宋体;color:rgb(51,51,51);font-size:12.0000pt;background:rgb(255,255,255);" >&#8221;按钮，点击求职者姓名查看简历，如符合要求，点击&#8220;</span><b><span style="font-family:宋体;color:rgb(51,51,51);font-weight:bold;font-size:12.0000pt;background:rgb(255,255,255);" ><font face="宋体" >一键面试</font></span></b><span style="font-family:宋体;color:rgb(51,51,51);font-size:12.0000pt;background:rgb(255,255,255);" >&#8221;按钮，选择求职者投递岗位名称，确定后</span><span style="font-family:宋体;color:rgb(51,51,51);font-size:12.0000pt;background:rgb(255,255,255);" ><font face="宋体" >进行</font></span><span style="font-family:宋体;color:rgb(51,51,51);font-size:12.0000pt;background:rgb(255,255,255);" ><font face="宋体" >视频面试（如求职者不在线请按提示电话联系求职者上线面试）；</font></span></p>
  <p class=p  style="text-autospace:ideograph-numeric;line-height:150%;background:rgb(255,255,255);" ><span style="font-family:宋体;color:rgb(51,51,51);font-size:12.0000pt;background:rgb(255,255,255);" >5、如需面试未给企业投递简历的求职者，可在招聘大厅按条件（如专业、求职意向、学校等）搜索筛选简历，点击求职者姓名查看简历详细内容，如符合要求，点击&#8220;</span><b><span style="font-family:宋体;color:rgb(51,51,51);font-weight:bold;font-size:12.0000pt;background:rgb(255,255,255);" ><font face="宋体" >一键面试</font></span></b><span style="font-family:宋体;color:rgb(51,51,51);font-size:12.0000pt;background:rgb(255,255,255);" >&#8221;按钮，选择求职者投递岗位名称，确定后视频面试（如求职者不在线请按提示电话联系求职者上线面试）；</span></p>
  <p class=p  style="text-autospace:ideograph-numeric;line-height:150%;background:rgb(255,255,255);" ><b><span style="font-family:宋体;color:rgb(51,51,51);font-weight:bold;font-size:14.0000pt;background:rgb(255,255,255);" ><font face="宋体" >注意事项：</font></span></b></p>
  <p class=p  style="text-autospace:ideograph-numeric;line-height:150%;background:rgb(255,255,255);" ><span style="font-family:宋体;color:rgb(51,51,51);font-size:12.0000pt;background:rgb(255,255,255);" >1、如果出现&#8220;与服务器断开&#8217;提示，请关闭其余会场页面，并刷新当前会场页面或重新登录；</span></p>
  <p class=p  style="text-autospace:ideograph-numeric;line-height:150%;background:rgb(255,255,255);" ><span style="font-family:宋体;color:rgb(51,51,51);font-size:12.0000pt;background:rgb(255,255,255);" >2、IE浏览器和QQ浏览器会造成通信错误，影响使用，建议使用360极速浏览器</span><span style="font-family:宋体;color:rgb(51,51,51);font-size:12.0000pt;background:rgb(255,255,255);" ><font face="宋体" >；</font></span></p>
  <p class=p  style="text-autospace:ideograph-numeric;line-height:150%;background:rgb(255,255,255);" ><span style="font-family:宋体;color:rgb(51,51,51);font-size:12.0000pt;background:rgb(255,255,255);" >3</span><span style="font-family:宋体;color:rgb(51,51,51);font-size:12.0000pt;background:rgb(255,255,255);" ><font face="宋体" >、使用过程中如有任何问题请联系招聘顾问，联系方式位于</font></span><span style="font-family:宋体;color:rgb(51,51,51);font-size:12.0000pt;background:rgb(255,255,255);" ><font face="宋体" >企业</font></span><span style="font-family:宋体;color:rgb(51,51,51);font-size:12.0000pt;background:rgb(255,255,255);" ><font face="宋体" >会员中心正上方（公司名称下方）；</font></span></p>
  <p class=p  style="text-autospace:ideograph-numeric;line-height:150%;background:rgb(255,255,255);" ><span style="font-family:宋体;color:rgb(51,51,51);font-size:12.0000pt;background:rgb(255,255,255);" >4</span><span style="font-family:宋体;color:rgb(51,51,51);font-size:12.0000pt;background:rgb(255,255,255);" ><font face="宋体" >、确保公司基本信息完善，职位发布正确。</font></span></p>
</div>
<!--EndFragment-->
</body>
</html>
