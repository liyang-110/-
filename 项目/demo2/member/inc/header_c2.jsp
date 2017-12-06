<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.Station"%>
<%@page import="com.zhaopin.bean.Member"%>
<%@page import="com.zhaopin.bean.User"%>
<%@page import="com.zhaopin.bean.ComUserBean"%>
<%
	String base_dir =request.getContextPath()+"/";

	ComUserBean user = (ComUserBean) User.getUser(
			"company", session);
	if(user==null){
		return;
	}
    String area_id =user.getAreaId();
	String area_name=com.zhaopin.Station.getStationName( area_id );
	if( "".equals(area_name) ){
			area_name="全国";
	}
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
本月新增简历<span ><%=Station.getStat().get("month_student") %></span>份          </p>
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
							var str='<a style="color:#fd9702; font-weight:bold;" title="'+login.user_id+'" style="text-decoration:none;">'+user_id+'</a>';
							//	 str+='<a class="huiyuan" href="<%=request.getContextPath()%>/company/" >返回旧版</a>';
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
	<div class="clearfix clearfix_top">
       <div class="pull-left">
          <a target="_blank" href="/">
          <img src="/member/img2/com_logo.png" style="margin-top:15px;"><span style=" display:block; float:right; font-size:18px; font-weight:bold; color:#FFF; padding-top:20px; padding-left:20px;">创校园招聘会第一品牌</span>
          </a>
       </div>
       <div class="pull-right">
          <ul class="nav nav-pills">
          	  
               <li class="activ_one_"><a href="/member/home.do">会员中心</a></li>
             
               <li><a target="_blank" href="/company/info.do?id=<%=user.getCompanyId() %>">企业主页</a></li>
               <li><a target="_blank" href="<%=base_dir %>jobfair.do?&a=<%=area_id %>" >招聘会</a></li>
               <li><a target="_blank" href="/subStationJobs.do?a=<%=area_id %>">招聘职位</a></li>
               <!--
               <li><a href="http://www.211zph.com/">211首页</a></li>
               -->
          </ul>
       </div>
    </div>	
</div>
<!--header_top完成-->