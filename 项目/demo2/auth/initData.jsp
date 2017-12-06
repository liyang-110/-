<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
test data init 
<%
String qq_access_token= (String)session.getAttribute("qq_access_token");
String qq_token_expirein=(String)session.getAttribute("qq_token_expirein");
 if( qq_access_token ==null ){
 	session.setAttribute("qq_openid", "5E41F9EFFBEABB1D02837BDF25A6989E");
 }
 %>
 <br/>
 <%=qq_access_token %><br/>
 <%=qq_token_expirein %><br/>
 <%=System.currentTimeMillis() %>
</body>
</html>