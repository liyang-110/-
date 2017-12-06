<%@ page language="java" import="java.util.*"  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.factory.HashMapFactory" %>
<%@ page import="com.zhaopin.bean.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
HashMap jobfairMap = (HashMap)request.getAttribute("jobfair");
HashMapFactory jobfair =new HashMapFactory(jobfairMap,"");
String job_fair_id = (String)jobfair.get("job_fair_id");


HashMap statisticsMap = (HashMap)request.getAttribute("statistics");
HashMapFactory statistics = new HashMapFactory(statisticsMap,"0");

HashMap schoolInfoMap = (HashMap)request.getAttribute("schoolInfo");
HashMapFactory schoolInfo = new HashMapFactory(schoolInfoMap,"");
%>
<div style='margin:0 auto;display:none;'>
	<img src='images/logo.jpg' />
</div>
<!--悬浮代码结束-->
<div class="main">
    <div class="banner">
        <p class="shuju">
        	截至<span class="time">
        	<%
        	java.text.SimpleDateFormat sf= new java.text.SimpleDateFormat();
        	sf.applyPattern("yyyy-MM-dd HH:mm");
        	Date job_fair_overtime = sf.parse( jobfair.get("job_fair_overtime").toString() );
        	
        	if( job_fair_overtime.after(new Date() ) ){ %>
        		<%=sf.format(new Date()) %> 
        	<%}else{ %>
        		<%=sf.format( job_fair_overtime ) %> 
        	<%}%>
        	</span>：
        	共有招聘单位<span><%=statistics.get("company_num") %></span>家， 
        	<%-- 
        	招聘职位<span><%=statistics.get("position_num") %></span>个，
        	--%>
        	提供就业岗位<span><%=statistics.get("job_person_num") %></span>个．
        	已有<span><%=statistics.get("resume_size") %></span>人进入会场．
        	
        </p>
        <!--轮播图-->
        <div id="myCarousel" class="carousel slide">
           <!-- 轮播（Carousel）指标 -->
           <ol class="carousel-indicators">
              <!-- <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
              <li data-target="#myCarousel" data-slide-to="1"></li>
              <li data-target="#myCarousel" data-slide-to="2"></li> -->
           </ol>   
           <!-- 轮播（Carousel）项目 -->
           <div class="carousel-inner" style="height:314px;width:950px;">
              <div class="item active">
                 <img src="img/banner.png" height="314" width="950" alt="First slide">
              </div>
              <div class="item">
                 <img src="img/banner.png" height="314" width="950" alt="Second slide">
              </div>
              <div class="item">
                 <img src="img/banner.png" height="314" width="950" alt="Third slide">
              </div>
           </div>
        </div> 
        <!--轮播图结束-->
        <%
       	List<HashMap> lastestLog = (List<HashMap>)request.getAttribute("lastestLog");
        %>
        <style>
        	.scroll-list div {height:80px;overflow:hidden;}
        	.scroll-list div ul li {line-height:20px;}
        </style>
        <div class="container scroll-list">
            <div class="pull-left" style="width:260px;">
                <ul class=" scroll-ul-a">
					<% for(HashMap row : lastestLog ){ 
	            			if("IN".equals(row.get("log_type") ) ){
	            	%>
	            			<li><a title="<%=row.get("diff")%>&nbsp;&nbsp;<%=row.get("content")%>">
	            			<%=row.get("diff")%>&nbsp;&nbsp;<%=row.get("content")%>
	            			</a></li>
	            	<% 	}
	            		} %>
                </ul>
            </div>
            <div class="pull-left" style="width:360px;">
            	<ul class="scroll-ul-b">
	            	<% for(HashMap row : lastestLog ){ 
	            			if("RESUME".equals(row.get("log_type") ) ){
	            	%>
	            			<li><a title="<%=row.get("diff")%>&nbsp;&nbsp;<%=row.get("content")%>">
	            			<%=row.get("diff")%>&nbsp;&nbsp;<%=row.get("content")%>
	            			</a></li>
	            	<% 	}
	            		} %>
                </ul>
            </div>
            <div class="pull-left" style="width:260px;">
            	<ul class="scroll-ul-c">
	            	<% for(HashMap row : lastestLog ){ 
	            			if("#INTERVIEW#,#REVIEW#,#OFFER#".indexOf( "#"+(String)row.get("log_type")+"#" )>=0 ){
	            	%>
	            			<li><a title="<%=row.get("diff")%>&nbsp;&nbsp;<%=row.get("content")%>">
	            			<%=row.get("diff")%>&nbsp;&nbsp;<%=row.get("content")%>
	            			</a></li>
	            	<% 	}
	            		} %>
                </ul>
            </div>
            <script>
              	$(".scroll-ul-a").scrollable({
					direction: "top",
					height: 78,
					scrollCount: 1,
					delay : 1000 
				});
              	$(".scroll-ul-b").scrollable({
					direction: "top",
					height: 78,
					scrollCount: 1,
					delay : 1000 
				});
              	$(".scroll-ul-c").scrollable({
					direction: "top",
					height:78,
					scrollCount: 1,
					delay : 1000 
				});
            </script>
    	</div>
        <div class="countdown">
    		<div class="title">
            	<ul class="daojishi down">
                	<li><span class="contdown_hose begin" style="display:none;">距招聘会开始:</span>
                		<span class="contdown_hose">距招聘会结束:</span>
                	</li>
                	<li><span class="days badge">00</span>天</li>
                    <li><span class="hours badge">00</span>小时</li>
                    <li><span class="minutes badge">00</span>分</li>
                    <li><span class="seconds badge">00</span>秒</li>
                </ul>
                <div class="daojishi closed" style="font-size:18px;text-align:center;color:red;font-weight:bold;display:none;">招聘会已结束</div>
                <div class="clear"></div>
            	<div class="xian"></div>
            </div>
            <script>
				$('.down').downCount({
					begin: '<%=jobfair.get("job_fair_time").toString()%>',  
					date: '<%=jobfair.get("job_fair_overtime").toString()%>',
					offset: +8 
				}, function () {
					jobfairOver();
					//alert('招聘会已结束!');
				});
			</script>
             <style type="text/css">
             	.list-unstyled {width:410px;clear:both;}
             	.list-unstyled dt {float:left;width:90px;}
             	.list-unstyled dd {float:left;width:320px;}
             	.list-unstyled dd { clear:right;}
             </style>
            <dl class="list-unstyled">
              <dt>主办单位：</dt><dd> <%=jobfair.get("job_fair_sponsor")%></dd>
              <dt>承办单位：</dt><dd> <%=jobfair.get("job_fair_organizer")%>.</dd>
              <dt>举办时间：</dt><dd><%=jobfair.get("job_fair_time")%> 至 <%=jobfair.get("job_fair_overtime")%></li>
              <dt>招聘会特色：</dt><dd><%=jobfair.get("job_fair_feature")%></dd>
              <dt>招聘会层次：</dt><dd><%=jobfair.get("job_fair_level")%></dd>
            </dl>
            <div style="clear:both;"></div>
            <div style="padding-left:50px;">
			<div class="bdsharebuttonbox">
			  <a style="float:left;background: none;font-size: 16px;cursor: default;">分享到：</span>
			  <a href="#" class="bds_more" data-cmd="more"></a>
			  <a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
			  <a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
			  <a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
			  <a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a>
			  <a href="#" class="bds_sqq" data-cmd="sqq" title="分享到QQ好友"></a>
			</div>
			</div>
			<!-- 分享代码结束 -->
         </div><!--countdown完成-->
         <div style="position:absolute;top:70px;right:30px;">
         	<img src="img/tishi_03.png" style="display:block;"/>
         	<a href="http://chrome.360.cn/" style="display:block;margin-top:-70px;margin-left:40px;" target="_blank">
         		<img src="img/360chrome.jpg"/>
         	</a>
         </div>
    </div><!-- //banner -->
</div><!--banner完成-->