<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.Station"%>
<style>
	.main_nav ul{
		margin-left:50px;
	}
</style>
<div class="header">
	 <!--sub_nav结构开始  -->
     <div class="sub_nav">
         <div class="sub_nav_inner">
            <p style="float:left;line-height:30px;">
            <%=Station.getStat().get("time") %>,
			企业<span style="font-weight:bold;font-style:italic;color:#FF5F00;"><%=Station.getStat().get("company_size") %></span>家.
			高校<span style="font-weight:bold;font-style:italic;color:#FF5F00;"><%=Station.getStat().get("school_size") %></span>所.
			招聘会<span style="font-weight:bold;font-style:italic;color:#FF5F00;"><%=Station.getStat().get("job_fair") %></span>场.
			本月新增会员企业<span style="font-weight:bold;font-weight:bold;color:#FF5F00;"><%=Station.getStat().get("today_company") %></span>家.
			<%-- 
			本月新增简历<span style="font-weight:bold;font-weight:bold;color:#FF5F00;"><%=Station.getStat().get("month_student") %></span>份
			--%>
			</p>
         
         	<%--
             <ul>
				<li><a href="javascript:;"  onclick="open_login_layer();">登录</a></li>
                <li>/</li>
				<li><a href="siteSignup.do">注册</a> </li>
				<li class="myrecord"><a href="#">投递记录</a></li>
                <li class="myresume"><a href="#">我的简历</a></li>
                <li class="myresume"><a href="#">会员中心</a></li>
			 </ul>
			 --%>
			 <span id="login_qq_info" style="float:right;display:none;">
            	<a class="login_qq_info" href=""  style="max-width:115px;overflow:hidden;text-overflow:ellipsis;display:inline-block;white-space:nowrap;">
            	</a>
            	<a style="margin-left:10px;display: inline-block; vertical-align: top;" href="/loginOut.do?method=exitData">退出</a>
	        </span>
			<%-- } --%>
	        <ul id="login_user_info">
	        	<!--
	            <li><a href="/jobfair/login.do">[&nbsp;<span>登录</span>&nbsp;|</a></li>
	            -->
	            <li><a href="/register.jsp">&nbsp;<span>免费注册</span>&nbsp;</a></li>
	            <li>
	            <a style="color:#76746F;" target="_blank" href="http://www.211zph.com/auth/index.do">
	            		<img src="/auth/img/bt_white_76X24.png"></a>
	            </li>
	        </ul>
	         <script type="text/javascript">
				$(function(){
						$.get( '<%=request.getContextPath()%>/login.do?check=true&date='+new Date(),function(data){
						if(data.login){
							var login = data.login;
							if( login.nickname ){
								var path="/auth/bind_qq.jsp";
								if( login.user_id ){
									path="/member/home.do";
								}
								var link = $("#login_qq_info").find(".login_qq_info");
								link.attr("href",path );
								var str='<img style="width:20px;height:20px;" src="'+login.avatar+'"  />'+login.nickname;
								link.html( str );
								$("#login_user_info").hide();
								$("#login_qq_info").show();
							}else{
								var user_id=(login.user_id.length>10)?login.user_id.substring(0,7)+'...':login.user_id;
								var str='<li>'+'<a title="'+login.user_id+'" style="text-decoration:none;">'+user_id+'</a>';
									 str+='&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/member/home.do" >'+login.user_type_name+'中心</a>';
									 str+="</li><li>";
									 str+='&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/loginOut.do?method=exitData">退出</a>';
									 str+="</li>";
							   $("#login_user_info").html(str);
							}
						}
					});
				});
				</script>
				<div class="clear"></div>
          </div>
          <div class="clear"></div> 
      </div>
      <div class="clear"></div> 
      <!--sub_nav结构结束  -->
      <!--nav结构开始  -->
      <div class="top_nav">
          <div class="nav_inner">
              <div class="logo">
              	<a href="/" title="211校招网">
              	<img src="/static/images/LOGO.png"/>
              	</a>
                   
              </div>              
              <div><a class="province switch" href="javascript:;" id="site_select_btn">
              		<%
		           		String area_id=new com.zhaopin.StationSwitch(request,response).getSiteId();
		           		//String area_id =request.getAttribute("area_id")==null?"":(String)request.getAttribute("area_id");
						String area_name=com.zhaopin.Station.getStationName( area_id );
						if( "".equals(area_name) ){
								area_name="全国";
						}
		             %>
		             <%=area_name%>
              		<span><i class="arrow"></i></span>
              		</a>
              </div>
              <div class="main_nav">
              	<ul >
					<li><a  class="nav_shouye" href="/" title="首页">
						首页</a>
					</li>
                	<li>|</li>
					<li><a class="nav_wlzph" href="/jobfair/wlzph.do" title="网络招聘会">
						网络招聘会</a>
					</li>
                	<li>|</li>
					<%-- 
					<li ><a class="nav_zcxjh" href="zcxjh.html">专场宣讲会</a></li>
                	<li>|</li>
                	--%>
                	<li><a class="nav_xyzph" href="/jobfair/xyzph.do" title="校园招聘会">
                		校园招聘会</a>
                	</li>
				</ul>                 
              </div>                                                          
           </div>
      </div> 
       <!--nav结构结束  --> 
      <div style="clear:both"></div>    
</div>

 <script type="text/javascript">
		$(function(){
			$('#site_select_btn').click(function(e){
				e.preventDefault();
				e.stopPropagation();
				site_select_btn = art.dialog({
				    width: 490,
				    height: 400,
					id: 'site_select_btn',
					title:false,
					content:'<div style="width:490px;height:400px;">正在加载...</div>',
					lock:true,
					fixed:true,
					close:function(){this.hide(); return false;},
					show:true,
					esc:true,
					padding:0,
					opacity:0.3,
					background:'#333333'
				});
				var url ='/service/select_site.jsp';
				var pageContentBody =$(art.dialog({id: 'site_select_btn'}).content());
				pageContentBody.parents(".aui_dialog").find(".aui_close").addClass("site_select_panel_close");				
				pageContentBody.html( $("#site_select_content").text() );
				art.dialog({id: 'site_select_btn'}).show();
			});
		});
</script>

<script id="site_select_content" type="text/plain">
<style>
	.site_main .site<%=area_id%>{
	display:none;
}
</style>	
<div style="border:15px solid rgba(0,0,0, 0.4);">
<div class="site">
	<div class="site_top">分站切换</div>

	<div class="site_main">
		<div style="margin:20px 0px 10px 18px;">
			<div style="float:left;"><img src="/static/images/location.png" style="margin-left:15px;"><div>当前位置</div></div>
			<div class="curr_area"><%=area_name%><img src="/static/img/duihao.png" style="float:right;"></div>
			<div style="clear:both;"></div>
		</div>

		<div class="xian"></div>

		<p>或切换至以下分站</p>

		<div style="margin-left:25px;">
			<a href="/shaanxi"><div class="area site28">陕西</div></a>
			<a href="/henan"><div class="area site17">河南</div></a>
			<a href="/sichuan"><div class="area site24">四川</div></a>
			<a href="/chongqing"><div class="area site23">重庆</div></a>
			<a href="/gansu"><div class="area site29">甘肃</div></a>
			<a href="/hunan"><div class="area site19">湖南</div></a>
			<div style="clear:both;"></div>
		</div>

		<p style="margin-top:20px;">其他省份分站正在开通中，敬请期待...</p>
	</div>
</div>
</div>
</script>
<script type="text/javascript">
function fixedNav(){
	var t = $(document).scrollTop();
	if(t > 40 ){
		$('.top_nav').addClass("fixed");
	}else{
		$('.top_nav').removeClass("fixed");
	}
}
<% if( request.getParameter("site")!=null){ %>
$(function(){
	art.dialog({
	    width: 490,
	    height: 400,
		id: 'site_select_btn',
		title:false,
		content:'<div style="width:490px;height:400px;">正在加载...</div>',
		lock:true,
		fixed:true,
		close:function(){this.hide(); return false;},
		show:true,
		esc:true,
		padding:0,
		opacity:0.3,
		background:'#333333'
	});
	var url ='/service/select_site.jsp';
	var pageContentBody =$(art.dialog({id: 'site_select_btn'}).content());
	pageContentBody.parents(".aui_dialog").find(".aui_close").addClass("site_select_panel_close");				
	pageContentBody.html( $("#site_select_content").text() );
	art.dialog({id: 'site_select_btn'}).show();
});

<% }else {%>
$(function(){
	$(window).scroll(function(e){
		fixedNav();
		var list = art.dialog.list;
		if( list['site_select_btn'] ){
			 list['site_select_btn'].close();
		}
		//art.dialog({id:'site_select_btn'}).close();
	});
	$(document).click(function(){
		var list = art.dialog.list;
		if( list['site_select_btn'] ){
			 list['site_select_btn'].close();
		}
	});
});
<% } %>
</script>