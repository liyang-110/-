<%@page import="com.util.mail.MailSender"%>
<%@page language="java" import="java.util.*" pageEncoding="UTF-8" isErrorPage = "true"%>
<%@page import="java.io.*,com.alibaba.fastjson.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";



StringWriter   sw=new   StringWriter();
exception.printStackTrace( new   PrintWriter(sw,true) );
MailSender.sendHtml("2420858896@qq.com","Exception["+exception.toString()+"]","<p>"+request.getQueryString()+"</p><pre>"+sw.toString()+"</pre>" );
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>404 Not Found</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

<style type="text/css">
<!--
.t {
        font-family: Verdana, Arial, Helvetica, sans-serif;
        color: #CC0000;
}
.c {
        font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 11px;
        font-weight: normal;
        color: #000000;
        line-height: 18px;
        text-align: center;
        border: 1px solid #CCCCCC;
        background-color: #FFFFEC;
}
body {
        background-color: #FFFFFF;
        margin-top: 100px;
}
-->
</style>
  </head>
  
  <body>
<div align="center">
	<!--
 	-->
  <h2><span class="t">404 Not Found</span></h2>
  <table border="0" cellpadding="8" cellspacing="0" width="460">
    <tbody>
      <tr>
        <td class="c">The requested URL was not found on this server. >><a href="http://www.211zph.com">http://www.211zph.com</</a><<</td>
      </tr>
    </tbody>
  </table>
</div>
  </body>
</html>
