<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.Station"%>
<style>
	.main_nav ul{
		margin-left:50px;
	}
	.site {
		height:auto;
	}
	.site_main .area {
		border:none;
		width:auto;
		height:auto;
		line-height:1.5em;
		margin:5px 10px;
	}
	.site_main .area a {
		font-size:16px;
		letter-spacing:2px;
		line-height:20px;
	}
	.area.site5,.area.site28,.area.site17,.area.site24,.area.site23,.area.site29,.area.site19{
		font-weight:bolder;
	}
	.site_select_panel_close {
	    right: 30px !important;
	    top: 30px !important;
	    font-size: 39px !important;
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
			 <span id="login_qq_info" style="float:right;display:none;">
            	<a class="login_qq_info" href=""  style="max-width:115px;overflow:hidden;text-overflow:ellipsis;display:inline-block;white-space:nowrap;">
            	</a>
            	<a style="margin-left:10px;display: inline-block; vertical-align: top;" href="/loginOut.do?method=exitData">退出</a>
	        </span>
			<%-- } --%>
	        <ul id="login_user_info">
	        	
	            <li><a href="/member/accountLogin.do?users=geren" target="_blank">&nbsp;<span>登录</span>&nbsp;&nbsp;|</a></li>
	            
	            <li><a href="/member/accountRegister.do?users=student" target="_blank"><span>免费注册</span>&nbsp;</a></li>
	            <li>
	            <a style="color:#76746F;" target="_blank" href="http://www.211zph.com/auth/index.do">
	            		<img src="/auth/img/bt_white_76X24.png"></a>
	            <a style="color:#76746F;" target="_blank" href="http://www.211zph.com/auth/wxLogin.do">
	            		<img src="/auth/img/bt_white_wechat_76X24.png"></a>
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
                	<li><a class="nav_xyzph" href="/jobfair/xyzph.do" title="校园招聘会">
                		校园招聘会</a>
                	</li>
                	<li>|</li>
                	<li><a class="nav_app" href="/app" title="APP下载" target="_blank">
                		APP下载</a>
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
				    height: 230,
					id: 'site_select_btn',
					title:false,
					content:'<div style="width:490px;height:230px;">正在加载...</div>',
					lock:true,
					fixed:true,
					close:function(){this.hide(); return false;},
					show:true,
					esc:true,
					padding:0,
					opacity:0.3,
					background:'#333333'
				});
				var pageContentBody =$(art.dialog({id: 'site_select_btn'}).content());
				pageContentBody.parents(".aui_dialog").find(".aui_close").addClass("site_select_panel_close");				
				pageContentBody.html( $("#site_select_content").text() );
				art.dialog({id: 'site_select_btn'}).show();
			});
		});
</script>

<script id="site_select_content" type="text/plain">
<style>
	.site_main .site<%=area_id%>{display:none;}
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

		<div style="margin-left:25px;margin-bottom:15px;">
			<%--
			<a href="/shaanxi"><div class="area site28">陕西</div></a>
			<a href="/henan"><div class="area site17">河南</div></a>
			<a href="/sichuan"><div class="area site24">四川</div></a>
			<a href="/chongqing"><div class="area site23">重庆</div></a>
			<a href="/gansu"><div class="area site29">甘肃</div></a>
			<a href="/hunan"><div class="area site19">湖南</div></a>
			--%>
<div class="area site2"><a href="/site.do?a=2">北京</a></div>
<div class="area site3"><a href="/site.do?a=3">天津</a></div>
<div class="area site4"><a href="/site.do?a=4">河北</a></div>
<div class="area site5"><a href="/site.do?a=5">山西</a></div>
<div class="area site6"><a href="/site.do?a=6">内蒙古</a></div>
<div class="area site7"><a href="/site.do?a=7">辽宁</a></div>
<div class="area site8"><a href="/site.do?a=8">吉林</a></div>
<div class="area site9"><a href="/site.do?a=9">黑龙江</a></div>
<div class="area site10"><a href="/site.do?a=10">上海</a></div>
<div class="area site11"><a href="/site.do?a=11">江苏</a></div>
<div class="area site12"><a href="/site.do?a=12">浙江</a></div>
<div class="area site13"><a href="/site.do?a=13">安徽</a></div>
<div class="area site14"><a href="/site.do?a=14">福建</a></div>
<div class="area site15"><a href="/site.do?a=15">江西</a></div>
<div class="area site16"><a href="/site.do?a=16">山东</a></div>
<div class="area site17"><a href="/site.do?a=17">河南</a></div>
<div class="area site18"><a href="/site.do?a=18">湖北</a></div>
<div class="area site19"><a href="/site.do?a=19">湖南</a></div>
<div class="area site20"><a href="/site.do?a=20">广东</a></div>
<div class="area site21"><a href="/site.do?a=21">广西</a></div>
<div class="area site22"><a href="/site.do?a=22">海南</a></div>
<div class="area site23"><a href="/site.do?a=23">重庆</a></div>
<div class="area site24"><a href="/site.do?a=24">四川</a></div>
<div class="area site25"><a href="/site.do?a=25">贵州</a></div>
<div class="area site26"><a href="/site.do?a=26">云南</a></div>
<div class="area site27"><a href="/site.do?a=27">西藏</a></div>
<div class="area site28"><a href="/site.do?a=28">陕西</a></div>
<div class="area site29"><a href="/site.do?a=29">甘肃</a></div>
<div class="area site30"><a href="/site.do?a=30">青海</a></div>
<div class="area site31"><a href="/site.do?a=31">宁夏</a></div>
<div class="area site32"><a href="/site.do?a=32">新疆</a></div>
<div class="area site33"><a href="/site.do?a=33">香港</a></div>
<div class="area site34"><a href="/site.do?a=34">澳门</a></div>
<div class="area site35"><a href="/site.do?a=35">台湾省</a></div>
			<div style="clear:both;"></div>
		</div>
	</div>
</div>
</div>
</script>
<script type="text/javascript">
function fixedNav(){
	var t = $(document).scrollTop();
	if(t > 40 ){
		$('.top_nav').addClass("fixed");
		$('.top_nav .main_nav a').css("height","40px");
	}else{
		$('.top_nav').removeClass("fixed");
		$('.top_nav .main_nav a').css("height","60px");
	}
}
<% if( request.getAttribute("switchSite")!=null){ %>
$(function(){
	art.dialog({
	    width: 490,
	    height: 230,
		id: 'site_select_btn',
		title:false,
		content:'<div style="width:490px;height:230px;">正在加载...</div>',
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