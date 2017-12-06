<%@page import="com.zhaopin.bean.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.factory.NewsModel" %>
<%@ page import="com.zhaopin.dao.factory.JobFairModel" %>
<%@ page import="org.apache.commons.beanutils.DynaBean" %>
<%@page import="com.zhaopin.Station"%>
<%@ page import="com.zhaopin.dao.factory.AdvertisementModel" %>
<%@ page import="cn.com.zhaopin.base.pub.cCharControl" %>
<%@page import="com.qq.connect.javabeans.qzone.UserInfoBean"%>

<%
String base_dir =request.getContextPath()+"/";
AdvertisementModel	AdM = new AdvertisementModel();
 %>
 <style>
 	.heard {cursor:default;}
 	.head a:hover { text-decoration: underline; }
 </style>
 <div class="heard">
    <div class="heard_top">
        <p><%=Station.getStat().get("time") %>,
企业<span style="font-weight:bold;font-style:italic;color:#FF5F00;"><%=Station.getStat().get("company_size") %></span>家.
高校<span style="font-weight:bold;font-style:italic;color:#FF5F00;"><%=Station.getStat().get("school_size") %></span>	所.
招聘会<span style="font-weight:bold;font-style:italic;color:#FF5F00;"><%=Station.getStat().get("job_fair") %></span>	场.
本月新增企业<span style="font-weight:bold;font-weight:bold;color:#FF5F00;"><%=Station.getStat().get("today_company") %></span>家.
本月新增简历<span style="font-weight:bold;font-weight:bold;color:#FF5F00;"><%=Station.getStat().get("month_student") %></span>份
		</p>
        <span id="login_qq_info" style="float:right;display:none;">
            	<a class="login_qq_info" href=""  style="max-width:115px;overflow:hidden;text-overflow:ellipsis;display:inline-block;white-space:nowrap;">

            	</a>
            	<a style="margin-left:10px;display: inline-block; vertical-align: top;" href="/loginOut.do?method=exitData">退出</a>
        </span>
        <ul id="login_user_info">
            <li><a href="javascript:;"  onclick="open_login_layer();">[&nbsp;<span>登录</span>&nbsp;|</a></li>
            <li><a href="/register.jsp">&nbsp;<span>免费注册</span>&nbsp;]</a></li>
            <li>
            <a style="color:#76746F;" target="_blank" href="http://www.211zph.com/auth/index.do">
            		<img src="/auth/img/connect_logo_7.png"></a>
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
<!--heard完成-->
<div class="midder">
    <div class="midder_left">
        <div class="logo">
            <img src="/jobFair/img/logo.png" height="83" width="234" style="cursor: pointer;" onclick="javascript:location.href='/';"/>
        </div>
        <div class="madder_m">
            <img src="/jobFair/img/qiye.png" height="70" width="8" />
        </div>
        <div class="midder_r">
        
           <%
            	String area_id = (String)request.getAttribute("area_id");
				String area_name =area_name=com.zhaopin.Station.getStationName( area_id );
				if( "".equals(area_name) ){
						area_name="全国";
				}
             %>
            <h1 id="site_select_btn"><%=area_name %><img src="/jobFair/img/sanjiao.jpg"/></h1>
            <p>创校园招聘会第一品牌</p>
        </div>
        <div class="clear"></div>
    </div>
    <div class="midder_right">
        <div  id="latest_log" style="height:60px;overflow:hidden;margin-bottom:10px;">
        <ul>   
       			 <%
                    List latest_log = Station.queryLatestLog();
                    for(Iterator it=latest_log.iterator();it.hasNext();){
                    	HashMap row=(HashMap)it.next();
                    	%>
                    	  <li><%=row.get("cdate") %>前，&nbsp;&nbsp;<%=row.get("content") %></li>   
                    	<%
                    }     
                %>
           	
        </ul>
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

        <div class="bg">
        	<img src="/jobFair/img/biankuang.png"   />
            <ul>
                <li><a href="<%=base_dir %>">首页</a><span>/</span></li>
                <li><a href="<%=base_dir %>jobfair.do?&a=<%=area_id %>">招聘会</a><span>/</span></li>
                <li><a href="/subStationJobs.do?a=<%=area_id %>">招聘职位</a><span>/</span></li>
                <li><a href="http://www.211zph.com/newsDetail.do?id=201511160026144" target="_blank">广告招商</a></li>
            </ul>
            <div class="clear"></div>
        </div>
    </div>
    <div class="clear"></div>
</div>
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
<!--midder完成-->