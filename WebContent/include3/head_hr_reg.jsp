<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.factory.NewsModel" %>
<%@ page import="com.zhaopin.dao.factory.JobFairModel" %>
<%@ page import="org.apache.commons.beanutils.DynaBean" %>
<%@page import="com.zhaopin.Station"%>
<%@ page import="com.zhaopin.dao.factory.AdvertisementModel" %>
<%@ page import="cn.com.zhaopin.base.pub.cCharControl" %>
<%
	String base_dir =request.getContextPath()+"/";
	AdvertisementModel	AdM = new AdvertisementModel();
 %>
<div class="head_top">
<div class="container">

         	<div class="pull-left" >
<%=Station.getStat().get("time") %>,
企业&nbsp;<span style="color:#FF0000;font-weight:bold;"><%=Station.getStat().get("company_size") %></span>&nbsp;家.
高校&nbsp;<span style="color:#FF0000;font-weight:bold;"><%=Station.getStat().get("school_size") %></span>&nbsp;所.
招聘会&nbsp;<span style="color:#FF0000;font-weight:bold;"><%=Station.getStat().get("job_fair") %></span>&nbsp;场.
本月新增会员企业&nbsp;<span style="color:#FF0000;font-weight:bold;font-weight:bold;"><%=Station.getStat().get("today_company") %></span>&nbsp;家.
<%-- 
本月新增简历&nbsp;<span style="color:#FF0000;font-weight:bold;font-weight:bold;"><%=Station.getStat().get("month_student") %></span>&nbsp;份
--%>
            </div>
            <div class="pull-right" id="loginInfo">
			<span id="login_user_info">
            	[<a href="<%=base_dir%>">登陆</a>
                <span class="divider">|</span>
                <a href="<%=base_dir%>register.jsp" id="goto_reg_link">免费注册</a>]
            </span>
         	</div>
			<script type="text/javascript">
				$(function(){
						$.get( '<%=request.getContextPath()%>/login.do?check=true&date='+new Date(),function(data){
						if(data.login){
							var login = data.login;
							var user_id=(login.user_id.length>10)?login.user_id.substring(0,7)+'...':login.user_id;
							var str='<a title="'+login.user_id+'" style="text-decoration:none;">'+user_id+'</a>';
								 str+='&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/member/home.do" >'+login.user_type_name+'中心</a>';
								 str+='&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/loginOut.do?method=exitData">退出登录</a>';
						   $("#login_user_info").html(str);
						}
					});
				});
				</script>
        </div>
    </div>


<div class="head_logo">
    <script>
		$(function(){
			$('#site_select_btn').click(function(e){
				e.preventDefault();
				art.dialog({
					follow:"#site_select_btn",
					id: 'site_select_btn',
					title:false,
					content:'abc',
					fixed:true,
					close:function(){this.hide(); return false;},
					show:false,
					esc:true,
					padding:"2px 6px 10px 6px"
				});
				var url ='/service/select_site.jsp';
				var pageContentBody =$(art.dialog({id: 'site_select_btn'}).content());
				pageContentBody.parents(".aui_dialog").find(".aui_close").addClass("site_select_panel_close");

				$.post(url, {}, function (res) {
								pageContentBody.html(res);
								art.dialog({id: 'site_select_btn'}).show();
				});		
				
			});
		});
		</script>
    	<div class="container">
        	<div class="logo pull-left">
            	<a href="/">
        		<img src="<%=request.getContextPath()%>/statics/logo.jpg" width="210" height="105">
                </a>
            </div>
            <div class="station pull-left">
            	<div  class="switch">
                </div>
            </div>
            <div class="section_right pull-right" style="margin-top:20px;">
                <div class="banner" id="latest_log_container">
                <%
                    List latest_log = Station.queryLatestLog();
                    for(Iterator it=latest_log.iterator();it.hasNext();){
                    	HashMap row=(HashMap)it.next();
                    	%>
                    	<%=row.get("cdate") %>前，&nbsp;&nbsp;<%=row.get("content") %><br/>
                    	<%
                    }     
                %>
                </div>
                <script type="text/javascript"> 
                        var box=document.getElementById("latest_log_container"),can=true; 
                        box.innerHTML+=box.innerHTML; 
                        box.onmouseover=function(){can=false}; 
                        box.onmouseout=function(){can=true}; 
                        $(function (){ 
                            var stop=box.scrollTop%54==0&&!can; 
                            if(!stop)box.scrollTop==parseInt(box.scrollHeight/2)?box.scrollTop=0:box.scrollTop++; 
                            setTimeout(arguments.callee,box.scrollTop%54?10:2000); 
                        }); 
                </script>
                <div id="_site_nav" style="text-align:right;">
						<a href="/" style="height:20px; line-height:20px; background:url(<%=base_dir%>statics/css/img/home_icon.jpg);background-repeat:no-repeat;padding-left:25px;color:#646464;" >返回首页</a>
                </div>
            </div>
        </div>
    </div>
    <!-- logo -->
    <div class="head_hr_green">
    </div>