<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.factory.NewsModel" %>
<%@ page import="com.zhaopin.dao.factory.JobFairModel" %>
<%@ page import="org.apache.commons.beanutils.DynaBean" %>
<%@page import="com.zhaopin.Station"%>
<%@ page import="com.zhaopin.dao.factory.AdvertisementModel" %>
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
 		<span class="pull-left" style="line-height:26px;">
 		
<%=Station.getStat().get("time") %>,
企业<span style="font-weight:bold;font-style:italic;color:#FF5F00;"><%=Station.getStat().get("company_size") %></span>家.
高校<span style="font-weight:bold;font-style:italic;color:#FF5F00;"><%=Station.getStat().get("school_size") %></span>	所.
招聘会<span style="font-weight:bold;font-style:italic;color:#FF5F00;"><%=Station.getStat().get("job_fair") %></span>	场.
本月新增企业<span style="font-weight:bold;font-weight:bold;color:#FF5F00;"><%=Station.getStat().get("today_company") %></span>家.
本月新增简历<span style="font-weight:bold;font-weight:bold;color:#FF5F00;"><%=Station.getStat().get("month_student") %></span>份
 		
 		</span>
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
        		<img src="<%=base_dir %>statics/head4logo.gif" width="239" height="90">
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
					<a id="site_select_btn" href="javascript:;"><%=area_name %>站<i></i></a>
                </div>
                <div class="word">
                	创校园招聘会第一品牌
                </div>
            </div>
            <div class="section_right pull-right">
                <div class="banner" id="latest_log">
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
                                    <li class="divider-vertical"></li>
                                    <li><a href="jobfair.do?&a=<%=area_id %>">招聘会</a></li>
                                    <li class="divider-vertical"></li>
                                    <li><a href="/subStationJobs.do?a=<%=area_id %>">招聘职位</a></li>
                                  </ul>
                                  <div class="clearfix"></div>
                 </div>
            </div>
    </div>
</div>
<div class="blank_shadow">
</div>
<div class="banner4new" style="margin-top:-8px;z-index:0;position:relative;">
<div class="slide" style="text-align:center;width:980px;height:320px; overflow:hidden;overflow:-moz-hidden-unscrollable;margin:0 auto;">
<div id="myCarousel" class="carousel slide" style="width:980px; height:310px; margin:0;overflow:hidden;">
	<div class="carousel-inner">
<%
		List carousel0 =  AdM.getCarouselItems("play_496x319","0",3);
		List carousel =  AdM.getCarouselItems("play_496x319",area_id,8);
		boolean flag=false;
		for(Iterator it=carousel0.iterator();it.hasNext();){
			List row =(List)it.next();
				if( flag ){
	 %>
	 		<div class="item">
	 		<%}else{
	 				flag=true;
	 		 %>
	 		<div class="item active">
	 		<%} %>
			 	<a href="<%=row.get(0) %>" target="_blank">
			  	<img src="<%=base_dir+row.get(1) %>" >
			  	</a>
			</div>
	 <%
	 	}
		for(Iterator it=carousel.iterator();it.hasNext();){
			List row =(List)it.next();
				if( flag ){
	 %>
	 		<div class="item">
	 		<%}else{
	 				flag=true;
	 		 %>
	 		<div class="item active">
	 		<%} %>
			 	<a href="<%=row.get(0) %>" target="_blank">
			  	<img src="<%=base_dir+row.get(1) %>" >
			  	</a>
			</div>
	 <%
	 	}
	 %>
	</div>
	<a class="left carousel-control" href="#myCarousel" data-slide="prev">
		<i></i>
	</a>
	<a class="right carousel-control" href="#myCarousel" data-slide="next">
		<i></i>
	</a>
</div>
<script>
 $(function(){
 	$('#myCarousel').carousel({
  		interval: 3600
	});
	$(".carousel-control").css("display","none");
	$("#myCarousel").hover(function(){$(".carousel-control").css("display","block");},function(){$(".carousel-control").css("display","none");});
 });
</script>
                </div>
<!-- slide -->
	<div style="position:relative;width:1000px;margin:auto;">
		<div class="login4" style="position:absolute;top:-290px;left:680px;width:282px;">
				<!-- login -->
<div class="pull-left" id="login4">
        	<div class="title">
            	用户登录
            </div>
			<div id="login_form" style="margin-top:20px;">
                  <form class="company_login" name="login1" action="" method="post" onsubmit="return checkLogin(this);" novalidate="novalidate">
                  <div class="control-group">
                  		<div class="input-prepend">
                        <i class="add-on user"> </i>
                        <input type="text" name="user_id">
                        </div>
                  </div>
                  <div class="control-group">
                  		<div class="input-prepend second">
                        <i class="add-on pass"> </i>
                        <input type="password" name="user_pass">
                        </div>
                 </div>
                <div class="input-block-level" style=" margin-top:-10px;">
						<label class="checkbox" style="display:inline; padding-left:5px;">
                        	<input class="checkbox" name="remember" type="checkbox" style="margin:0 0 0 15px;">保存密码
                        </label>
                        <label class="checkbox" style="display:inline;padding-left:10px;">
                         <a href="/forget.do" target="_blank">忘记密码？</a></label>
                         <label style="display:inline;padding-left:10px;">
                         <a href="/register.jsp" target="_blank">快速注册</a>
                         </label>
                  </div>
                  <div class="input-block-level" style="padding:0 15px;text-align:center;">
                        <input style="margin:auto;" class="btn btn-warning btn-block" type="submit" value="登&nbsp;&nbsp;&nbsp;录">
                  </div>
                  
                  <div class="input-block-level" style="margin-top:8px;overflow:hidden;">
                  </div>
                  
                  <div class="input-block-level" style="margin-top:20px;display:none;">
                    &nbsp;&nbsp;还没有注册会员，<a href="/register.jsp" target="_blank">点击注册</a>
                  </div>
                  </form>
              </div>
            <script type="text/javascript">
            var cur_path="";
			jQuery(document).ready(function() {     
					Login.init();
			  });
			</script>
        </div>
				<!-- login -->
		</div>
	</div>
</div>

<div class="container section_login">
		<!-- 
    	<div class="pull-left"  id="login">

        </div>
         -->
		<div class=" login_right pull-right">
       	<div class="zhaopin pull-left" >
            	 <div class="title">
                 	<span class="pull-left">企业急聘</span><a href="/hurryRecruitList.do" class="pull-right more hidden">更多&gt;&gt;</a>
                 </div>
                 <div class="content">
                 	<ul>
                 	<% 
                 		List recruitHurryList= (List)request.getAttribute("recruitHurry");
                 		if( recruitHurryList!=null && recruitHurryList.size()>0 ){ 
                 		  for(Iterator it = recruitHurryList.iterator();it.hasNext(); ){
                 		  	HashMap row = (HashMap)it.next();
                 		  	String begin_date = (String)row.get("add_time");
                 		  	if(begin_date!=null) begin_date=begin_date.substring(5, 10);
                 	%>
                    	<li>
                    	<%=begin_date%>
                    	&nbsp;
                    	<a class="p" href="<%= base_dir%>company/jobDetail.do?id=<%=row.get("job_id") %>" target="_blank"><%=row.get("job_name") %></a>
                    	&nbsp;
                    	<a class="c" href="<%= base_dir%>company/info.do?id=<%=row.get("company_id") %>"  target="_blank"><%=row.get("company_name") %></a>
                    	</li>
                 	<% }
                 		} %>
                      </ul>
                 </div>
            </div>
            <!--  -->
           <div class="news pull-right" >
            	 <div class="title">
                 	<span class="pull-left">最新动态</span><a class="pull-right more"  href="/list.do?t=gonggao&a=<%=area_id%>">更多&gt;&gt;</a>
                 </div>
                 <div class="content">
                 	<ul>
                   <%
                    List gonggao = Station.queryProcCached("gonggao");
                    for(Iterator it=gonggao.iterator();it.hasNext();){
                    	HashMap row=(HashMap)it.next();
                    	%>
<li><a class="c" href="<%=request.getContextPath() %>/newsDetail.do?id=<%=row.get("news_id") %>"  target="_blank">
<%=row.get("add_date") %>&nbsp;&nbsp;<%=row.get("news_title") %>
</a></li>
                    	<%
                    }
                     %>
                     <!-- 
                    	<li><a class="c" href="">陕西新才网络技术有限公司</a></li>
					  -->
                     </ul>

                 </div>
            </div>
		</div>
</div>