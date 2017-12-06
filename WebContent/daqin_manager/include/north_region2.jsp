<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import ="com.zhaopin.bean.*" %>
    <%
            	String path=request.getServletPath();
            	int pos = path.indexOf("/",1);
				String mgr_path = path.substring(0,pos);
     %>
	<div class="region-north" data-options="region:'north',border:false">
	    <div class="north-region" style="width:500px;float:left;">
	    	<div class="pull-left">您好！
<%
String user_id="";
String role_id="";
AdUserBean user=(AdUserBean)User.getUser("admin",session);
if( user !=null )
{
	user_id = user.getUserId();
	role_id = user.getRoleId();
}

 if(user_id!=null){
    out.print(" ["+user_id+"]");
    %>        
    <a href="<%=request.getContextPath() %>/loginOut.do?method=exitData">退出系统</a>
    <a href="<%=request.getContextPath() %><%=mgr_path %>/login.jsp">切换用户</a>
    <%if( "main".equals( request.getParameter("page") ) ){%>
    	<a id="editpass" href="javascript:;">修改密码</a>
    <%} %>

    <%
 } 
 %> 
            </div>
		</div>
		<div class="north-region" style="float:right;">
                    <a href="<%=request.getContextPath() %>/" target="_blank">网站首页</a>
					<a href="<%=request.getContextPath() %><%=mgr_path %>/">管理首页</a>
		<%if(false) {%>						
					<a href="<%=request.getContextPath() %><%=mgr_path %>/fuwu/" target="_blank">招聘服务</a>
		<%} %>
					
        </div>
        
 
    </div>