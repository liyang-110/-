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
         
			 <span id="login_qq_info" style="float:right;display:none;">
            	<a class="login_qq_info" href=""  style="max-width:115px;overflow:hidden;text-overflow:ellipsis;display:inline-block;white-space:nowrap;">
            	</a>
            	<a style="margin-left:10px;display: inline-block; vertical-align: top;" href="/loginOut.do?method=exitData">退出</a>
	        </span>
			<%-- } --%>
	        <ul id="login_user_info">
	        	
	            <li><a href="javascript:;" onclick="open_login_layer();" target="_blank">&nbsp;<span>登录</span>&nbsp;&nbsp;|</a></li>
	            
	            <li><a href="/register.jsp"><span>免费注册</span>&nbsp;</a></li>
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
              <div>
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
function fixedNav(){
	var t = $(document).scrollTop();
	if(t > 40 ){
		$('.top_nav').addClass("fixed");
	}else{
		$('.top_nav').removeClass("fixed");
	}
}
</script>