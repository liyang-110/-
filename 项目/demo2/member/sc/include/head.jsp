<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.Station"%>
<%@page import="com.zhaopin.bean.Member"%>
<%@page import="com.zhaopin.bean.User"%>
<%@page import="com.zhaopin.bean.SchUserBean"%>
<%
	SchUserBean user=(SchUserBean)User.getUser("school",session);
	String base_dir =request.getContextPath()+"/";
%>
<div class="header">
	<div class="clearfix">
       <div class="pull-left">
          <p>
<%=Station.getStat().get("time") %>,
企业<span ><%=Station.getStat().get("company_size") %></span>家.
高校<span ><%=Station.getStat().get("school_size") %></span>	所.
招聘会<span ><%=Station.getStat().get("job_fair") %></span>	场.
本月新增企业<span ><%=Station.getStat().get("today_company") %></span>家.
本月新增简历<span ><%=Station.getStat().get("month_student") %></span>份
          </p>
       </div>
       <div class="pull-right">
          <p>
          <!-- 
          <span style="color:#fd9702; font-weight:bold;">xincaiwang</span>    <a class="huiyuan" href="#">企业会员中心</a>    <a href="#" class="huiyuan">退出</a>
          -->
<span id="login_user_info">
            	[<a href="javascript:;"  onclick="open_login_layer();">登陆</a>
                <span class="divider">|</span>
                <a href="<%=base_dir%>register.jsp" id="goto_reg_link">免费注册</a>]
            </span>
            <script type="text/javascript">
				$(function(){
						$.get( '<%=request.getContextPath()%>/login.do?check=true&date='+new Date(),function(data){
						if(data.login){
							var login = data.login;
							var user_id=(login.user_id.length>10)?login.user_id.substring(0,7)+'...':login.user_id;
							var str='<a style="color:#72b114; font-weight:bold;" title="'+login.user_id+'" style="text-decoration:none;">'+user_id+'</a>';
							//	 str+='<a class="huiyuan" href="<%=request.getContextPath()%>/school/" >返回旧版</a>';
								 str+='<a class="huiyuan" href="<%=request.getContextPath()%>/loginOut.do?method=exitData">退出登录</a>';
						   $("#login_user_info").html(str);
						}
					});
				});
				</script>
          </p>
       </div>
    </div>	
</div>
<!--header完成-->
<div class="header header_top">
	<div class="clearfix">
       <div class="pull-left">   
          <a href="/" target="_blank" style="float:left;">
          <img src="img/sch_logo.png" style="margin-top:15px;">
          </a>
          <span style=" display:block; float:left; font-size:18px; font-weight:bold; color:#FFF; padding-top:45px;">创校园招聘会第一品牌</span>
       </div>
       <div class="pull-right">
       	<div  id="latest_log" style="height:60px;overflow:hidden; margin-top:20px;">
          <ul>   
                 <%
                    List latest_log = Station.queryLatestLog();
                    for(Iterator it=latest_log.iterator();it.hasNext();){
                    	HashMap row=(HashMap)it.next();
                    	%>
                    	<li>
                    	<%=row.get("cdate") %>前，&nbsp;&nbsp;<%=row.get("content") %><br/>
                    	</li>
                    	<%
                    }     
                %>  	
        	</ul>
         </div>
         <script type="text/javascript"> 
				var box2=document.getElementById("latest_log"),can=true; 
				box2.innerHTML+=box2.innerHTML; 
				box2.onmouseover=function(){can=false}; 
				box2.onmouseout=function(){can=true}; 
				$(function (){ 
					var stop=box2.scrollTop%60==0&&!can; 
					if(!stop)box2.scrollTop==parseInt(box2.scrollHeight/2)?box2.scrollTop=0:box2.scrollTop++; 
					setTimeout(arguments.callee,box2.scrollTop%60?10:2000); 
				}); 
		</script>
       </div>
    </div>	
</div>
<!--header_top完成-->
<div class="header header_menu">
	<div class="clearfix clearfix_menu">
       <div class="pull-left">
          <ul class="nav nav-pills">
           <li class="active_one"><a href="/member/sc/home.do">会员中心</a></li>
           
           <li><a href="/school/info.do?id=<%=(user!=null)?user.getId():""%>" target="_blank">学校主页</a></li>
           
           <li><a href="http://www.211zph.com/" target="_blank">网站首页</a></li>
        </ul>
       </div>
       <div class="pull-right">
          <p class="school">
          		<%=(user!=null)?user.getName():""%>
          </p>
       </div>
    </div>	
</div>