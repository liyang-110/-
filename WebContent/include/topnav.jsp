<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.zhaopin.Station"%>
<%@page import="com.zhaopin.bean.*" %>
 	<div id="goto_reg_div" style="display:none;">
 	<ul>
 		<li><a>企业注册</a></li>
 		<li><a>学校注册</a></li>
 		<li><a>学生注册</a></li>
 	</div>
    <div class="f_head">
        <div class="container">
        	<div class="pull-left">您好，欢迎光临！</div>
            <div class="pull-left" id="loginInfo">
			<span id="login_user_info">
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
            </span>
         	<span>
                               &nbsp;&nbsp;&nbsp;&nbsp;
截至<%=Station.getStat().get("time") %>,
已有企业<span style="color:#266844;font-weight:bold;font-style:italic;text-decoration: underline;"><%=Station.getStat().get("company_size") %></span>家,
高校<span style="color:#266844;font-weight:bold;font-style:italic;text-decoration: underline;"><%=Station.getStat().get("school_size") %></span>	所.
发布招聘会<span style="color:#266844;font-weight:bold;font-style:italic;text-decoration: underline;"><%=Station.getStat().get("job_fair") %></span>	场,
今日新增企业<span style="color:#266844;font-weight:bold;font-weight:bold;text-decoration: underline;"><%=Station.getStat().get("today_company") %></span>家
              </span>  
            </div>

            <div class="pull-right"  id="brower360tip">
            	<div>
            	<%=com.zhaopin.Config.getSiteTop() %>
                </div>
            </div>
			<script type="text/javascript">
				$(function(){
						$.get( '<%=request.getContextPath()%>/login.do?check=true&date='+new Date(),function(data){
						if(data.login){
							var login = data.login;
							var user_id=(login.user_id.length>10)?login.user_id.substring(0,10)+'...':login.user_id;
							var str='<a title="'+login.user_id+'" style="text-decoration:none;">'+user_id+'</a>';
								 str+='['+login.user_type_name+']';
								 str+='&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/member/home.do" >进入会员中心</a>';
								 str+='&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/loginOut.do?method=exitData">退出登录</a>';
						   $("#login_user_info").html(str);
						   $("#brower360tip").hide();
						}
					});
				});
				</script>
        </div>
    </div><!-- 页顶导航 -->