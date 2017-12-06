<%@page import="com.zhaopin.Station"%>
<%@page import="com.zhaopin.dao.factory.AdvertisementModel"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String base_dir =request.getContextPath()+"/";
AdvertisementModel	AdM = new AdvertisementModel();
String area_id = (String)request.getAttribute("area_id");
%>

<div class="banner4new" style="">
<div class="slide" style="text-align:center;width:980px;height:320px; overflow:hidden;overflow:-moz-hidden-unscrollable;margin:0 auto;">
<div id="myCarousel" class="carousel slide" style="width:980px; height:310px; margin:0;">
	<div class="clearfix"></div>
	<div class="carousel-inner" top:10px;">
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
			  	  	<img src="<%=row.get(1) %>" >
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
