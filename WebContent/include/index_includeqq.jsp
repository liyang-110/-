<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.zhaopin.Station"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String base_dir =request.getContextPath()+"/";
String area_id = (String)request.getAttribute("area_id");
%>

<div class="banner4new" style="">
<div class="slide" style="text-align:center;width:980px;height:320px; overflow:hidden;overflow:-moz-hidden-unscrollable;margin:0 auto;">
<div id="myCarousel" class="carousel slide" style="width:980px; height:310px; margin:0;">
	<div class="clearfix"></div>
	<div class="carousel-inner" top:10px;">
<%
		List carousel = (List)request.getAttribute("carousel");
		boolean flag=false;
		for(Iterator it=carousel.iterator();it.hasNext();){
			HashMap row =(HashMap)it.next();
				if( flag ){
	 %>
	 		<div class="item">
	 		<%}else{
	 				flag=true;
	 		 %>
	 		<div class="item active">
	 		<%} %>
			 	<a href="<%=row.get("ad_url") %>" target="_blank">
			  	  	<img src="/<%=row.get("ad_pic_path") %>" >
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
            	<p>
            	会员登陆
            	<!--
            	<a style="margin-left:39px;" href="<%=request.getContextPath() %>/auth/index.do"  target="_blank"><img src="<%=request.getContextPath() %>/auth/img/qq_logo_2.png"></a>
            	-->
            	</p>
            </div>
			<div id="login_form" style="margin-top:12px;">
                  <form class="company_login" name="login1" action="" method="post" onsubmit="return checkLogin(this);" novalidate="novalidate">
                  <div class="control-group" style="margin-bottom:5px;">
                  		<div class="input-prepend">
                        <i class="add-on user"> </i>
                        <input type="text" name="user_id">
                        </div>
                  </div>
                  <div class="control-group" style="margin-bottom:5px;">
                  		<div class="input-prepend second">
                        <i class="add-on pass"> </i>
                        <input type="password" name="user_pass">
                        </div>
                 </div>
                <div class="input-block-level" style=" margin-top:-10px;">
						<label class="checkbox" style="display:inline; padding-left:5px;">
                        	<input class="checkbox" name="rememberMe" value="on" type="checkbox" style="margin:0 0 0 15px;">保存密码
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
                  <div class="input-block-level" style="padding:0 15px;text-align:left;">
				  		<p style="line-height:50px;color:#76746F;">使用其他帐号登录：<a style="color:#76746F;" target="_blank" href="http://www.211zph.com/auth/index.do"><img src="/auth/img/logo_1.png"/>QQ登录</a></p>
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
                 			if( row.get("hurry_id") !=null ){
                 	%>
                    		<li>
		                    	<%=begin_date%>
		                    	&nbsp;
		                    	<a class="p" href="<%= base_dir%>company/jobDetail.do?id=<%=row.get("job_id") %>" target="_blank"><%=row.get("job_name") %></a>
		                    	&nbsp;
		                    	<a class="c" href="<%= base_dir%>company/info.do?id=<%=row.get("company_id") %>"  target="_blank"><%=row.get("company_name") %></a>
                    		</li>
                 	<%		} 
                 		  } // for 
                 		} // if %>
                      </ul>
                 </div>
            </div>
            <!--  -->
           <div class="news pull-right" >
            	 <div class="title">
                 	<span class="pull-left">新闻资讯</span><a class="pull-right more"  href="/list.do?t=gonggao&a=<%=area_id%>">更多&gt;&gt;</a>
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
