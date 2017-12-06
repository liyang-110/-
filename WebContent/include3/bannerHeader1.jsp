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
                                    <li><a href="/">高校</a></li>
                                    <li class="divider-vertical">/</li>
                                    <li><a href="jobfair.do?&a=<%=area_id %>">招聘会</a></li>
                                    <li class="divider-vertical">/</li>
                                    <li><a href="/subStationJobs.do?a=<%=area_id %>">招聘职位</a></li>
                                  </ul>
                 </div>
            </div>
    </div>
</div>
<div class="container navbar quick_go_site">
    <div class="navbar-inner">
        <a class="brand" href="#">分站：</a>
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
    </div>
</div>
    <!-- logo -->
    <div class="container section_login">
    	<div class="pull-left"  id="login">
        	<div class="title" >
            	用户登录
            </div>
			<div id="login_form" style="margin-top:20px;" >
                  <form class="company_login" name="login1" action="" method="post" onsubmit="return checkLogin(this);" novalidate>
                  <div class="control-group" >
                  		<div class="input-prepend">
                        <i class="add-on"> </i>
                        <input type="text" name="user_id">
                        </div>
                  </div>
                  <div class="control-group" >
                  		<div class="input-prepend second">
                        <i class="add-on"> </i>
                        <input type="password" name="user_pass">
                        </div>
                 </div>
                <div class="input-block-level" style=" margin-top:-10px;" >
						<label class="checkbox" style="display:inline; padding-left:5px;">
                        	<input class="checkbox" name="remember" type="checkbox" style="margin:0 0 0 15px;">保存密码
                        </label>
                        <label class="checkbox" style="display:inline;padding-left:10px;">
                         <a href="/forget.do" target="_blank">忘记密码？</a></label>
                         <label style="display:inline;padding-left:10px;">
                         <a href="/register.jsp" target="_blank">注册</a>
                         </label>
                  </div>
                  <div class="input-block-level"  style="padding-left:110px;">
                        <input class="btn btn-info" type="submit" value="登&nbsp;&nbsp;&nbsp;录">
                  </div>
                  
                  <div class="input-block-level" style="margin-top:8px;overflow:hidden;" >

                  	
                  </div>
                  
                  <div class="input-block-level" style="margin-top:20px;display:none;" >
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
        <div class=" pull-right login_right">
        	<div class="zhaopin pull-left" style="width:160px;">
            	 <div class="title">
                 	紧急招聘
                 </div>
                 <div class="content">
                 	<ul>
                 	<% 
                 		List recruitHurryList= (List)request.getAttribute("recruitHurry");
                 		if( recruitHurryList!=null && recruitHurryList.size()>0 ){ 
                 		  for(Iterator it = recruitHurryList.iterator();it.hasNext(); ){
                 		  	HashMap row = (HashMap)it.next();
                 	%>
                    	<li><a class="p" href="<%= base_dir%>company/jobDetail.do?id=<%=row.get("job_id") %>" target="_blank"><%=row.get("job_name") %></a>&nbsp;&nbsp;
                    	<a class="c" href="<%= base_dir%>company/info.do?id=<%=row.get("company_id") %>"  target="_blank"><%=row.get("company_name") %></a></li>
                 	<% }
                 		} %>
                      </ul>
                 </div>
            </div>
            <div class="center pull-left" style="width:458px;">
			  	<%
				  //  	String base_dir =request.getContextPath()+"/";
				  // 	AdvertisementModel	AdM = new AdvertisementModel();
				   	List text_ad = AdM.getAdList("text_ad", "-1", 12 );
				   	int text_ad_size=0;
				   	if( text_ad!=null){
				   		text_ad_size=text_ad.size();
				   	}
			   	%>

            	<div class="top" style="height:50px;">
                	<ul>
				    	<% for(int i=0;i<6&&i<text_ad_size;i++){ 
				    		List row = (List)text_ad.get(i); %>
							<li><a target="_blank" href="<%=row.get(0) %>">
								<%=row.get(3) %></a></li>
				    	<% } %>
						<!--
                        <li><a href="">陕西新才网络技术有限公司</a></li>
                    	-->
                    </ul>
                </div>
                <div class="slide" style="height:130px; text-align:center;">
                	<!--
                	<img src="statics/css/slide.jpg" width="425"  height="128" />
                	-->
<div id="myCarousel" class="carousel slide" style="width:450px; height:128px; margin:0;overflow:hidden;">
<div class="carousel-inner">
<%
	List carousel =  AdM.getCarouselItems("play_496x319","0",8);
	boolean flag=false;
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
<!-- 
	<a class="left carousel-control" href="#myCarousel" data-slide="prev">&lt;</a>
	<a class="right carousel-control" href="#myCarousel" data-slide="next">&gt;</a>
 -->
</div>
<script>
 $(function(){
 	$('#myCarousel').carousel({
  		interval: 2000
	});
	$(".carousel-control").css("display","none");
	$("#myCarousel").hover(function(){$(".carousel-control").css("display","block");},function(){$(".carousel-control").css("display","none");});
 });
</script>
                </div>
                <div class="bottom" style="height:50px;">
                	<ul>
				    	<% for(int i=6;i<12&&i<text_ad_size;i++){ 
				    		List row = (List)text_ad.get(i); %>
							<li><a target="_blank" href="<%=row.get(0) %>">
								<%=row.get(3) %></a></li>
				    	<% } %>
                    </ul>
                </div>
            </div>
            <div class="news pull-right" style="width:160px;">
            	 <div class="title">
                 	最新动态
                 </div>
                 <div class="content">
                 	<ul>
                   <%
                    List gonggao = Station.queryProcCached("gonggao");
                    for(Iterator it=gonggao.iterator();it.hasNext();){
                    	HashMap row=(HashMap)it.next();
                    	%>
<li><a class="c" href="<%=request.getContextPath() %>/newsDetail.do?id=<%=row.get("news_id") %>"  target="_blank">
<%=row.get("add_date") %>&nbsp;<%=row.get("news_title") %>
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