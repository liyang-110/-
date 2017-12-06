<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.zhaopin.Station"%>
<%@page import="com.zhaopin.bean.*" %>
<%
	UserInterface member=null;
	ArrayList<String[]> user_type_list=new ArrayList<String[]>(){
		{
			add( new String[]{"company","company/main.jsp"});
			add(new String[]{"school","school/main.jsp"});
			add(new String[]{"student","student"});
		}
	};
	String user_id=null;
	String user_type=null;
	String user_type_name=null;
	String jumpUrl="";
	
	for(String type[] : user_type_list){
		if( (member=User.getUser(type[0],session) )!=null){
			jumpUrl = type[1];
			break;
		}
			
	}
	if (member!=null){
		user_id=member.getUserId();
		user_type=member.getUserType();
		user_type_name=( (Member)member).getUserTypeName();
	}
 %>
 	<div id="goto_reg_div" style="display:none;">
 	<ul>
 		<li><a>企业注册</a></li>
 		<li><a>学校注册</a></li>
 		<li><a>学生注册</a></li>
 	</div>
    <div class="f_head">
        <div class="container">
        	<div class="pull-left">您好，欢迎光临！</div>
            <div class="pull-left">
            	<%
 if( user_id!=null ){
 	%>
 	<a title="<%=user_id %>" style="text-decoration:none;"><%=( user_id.length()>10)?user_id.substring(0,10)+"…":user_id %></a>
 	[<%=user_type_name %>]
 	&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/<%=jumpUrl%>" >进入会员中心</a>
 	<a href="<%=request.getContextPath()%>/loginOut.do?method=exitData">退出登录</a>
 	<%
 }else{
%>
            	[<a href="<%=request.getContextPath()%>/">登陆</a>
                <span class="divider">|</span>
                <a href="<%=request.getContextPath()%>/register.jsp" id="goto_reg_link">免费注册</a>]
                <script type="text/javascript">
                /*
                	$("#goto_reg_link").live("click",function(e){
                		e.preventDefault();
                				art.dialog({
									title: false,
									content:$("#goto_reg_div").text(),
									lock:false,
									fixed: true,
									id:'goto_reg',
									time: 10
								});
                	});
                */
                </script>
   <%} %>              
                               &nbsp;&nbsp;&nbsp;&nbsp;
截至<%=Station.getStat().get("time") %>,
已有企业<span style="color:#266844;font-weight:bold;font-style:italic;text-decoration: underline;"><%=Station.getStat().get("company_size") %></span>家,
高校<span style="color:#266844;font-weight:bold;font-style:italic;text-decoration: underline;"><%=Station.getStat().get("school_size") %></span>	所.
发布招聘会<span style="color:#266844;font-weight:bold;font-style:italic;text-decoration: underline;"><%=Station.getStat().get("job_fair") %></span>	场,
今日新增企业<span style="color:#266844;font-weight:bold;font-weight:bold;text-decoration: underline;"><%=Station.getStat().get("today_company") %></span>家
                
            </div><%
 if(user_id==null){
 %>
            <div class="pull-right">
            	<div>

            	<%=com.zhaopin.Config.getSiteTop() %>
                </div>
            </div>
<% } %>
        </div>
    </div><!-- 页顶导航 -->