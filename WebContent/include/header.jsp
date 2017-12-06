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
 <div class="quick_go_site">
<div class="container navbar ">
    <div class="navbar-inner">
    	<!-- 
        <a class="brand" href="#">分站：</a>
         -->
       <ul class="nav">
            <li><a href="<%=base_dir%>shaanxi">陕西</a></li>
            <li><a href="<%=base_dir%>beijing">北京</a></li>
            <li><a href="<%=base_dir%>shanghai">上海</a></li>
            <li><a href="<%=base_dir%>zhejiang">浙江</a></li>
            <li><a href="<%=base_dir%>jiangsu">江苏</a></li>
            <li><a href="<%=base_dir%>hubei">湖北</a></li>
            <li><a href="<%=base_dir%>shanxi">山西</a></li>
            <li><a href="<%=base_dir%>henan">河南</a></li>
            <li><a href="<%=base_dir%>gansu">甘肃</a></li>
            <li><a href="<%=base_dir%>henan">湖南</a></li>
            <li><a href="<%=base_dir%>hebei">河北</a></li>
            <li><a href="<%=base_dir%>sichuan">四川</a></li>
      </ul>
       <div class="pull-right" id="loginInfo">
			<span id="login_user_info">
            	[<a href="<%=base_dir%>">登录</a>
                <span class="divider">|</span>
                <a href="<%=base_dir%>register.jsp" id="goto_reg_link">免费注册</a>]
            </span>
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
</div>
</div>

<div class="head_menu">
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
		
	<div class="container head">
        	<div class="logo pull-left">
            	<a href="/">
        		<img src="statics/logo.png" width="222" height="80">
                </a>
            </div>
            <div class="station pull-left">
            <%
            	String area_id = (String)request.getAttribute("area_id");
				String area_name =area_name=com.zhaopin.Station.getStationName( area_id );
				if( "".equals(area_name) ){
						area_name="全国";
				}
             %>
            	<div  class="switch">
					[&nbsp;<a id="site_select_btn" href="javascript:;"><%=area_name %><i></i></a>]
                </div>
            </div>
            <div class="section_right pull-right">
                <div class="banner" id="latest_log" sytle="width:520px;">
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
				<div class="site_nav navbar" style="clear: both;">
                                    <ul class="nav">
                                    <li><a href="/">首页</a></li>
                                    <li class="divider-vertical">/</li>
                                    <li><a href="jobfair.do?&a=<%=area_id %>">招聘会</a></li>
                                    <li class="divider-vertical">/</li>
                                    <li><a href="/subStationJobs.do?a=<%=area_id %>">招聘职位</a></li>
                                  </ul>
                                  <div class="clearfix"></div>
                 </div>
            </div>
    </div>
</div>
<div class="orange_hr"></div>
    <!-- logo -->
