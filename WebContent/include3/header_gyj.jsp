<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.factory.NewsModel" %>
<%@ page import="com.zhaopin.dao.factory.JobFairModel" %>
<%@ page import="org.apache.commons.beanutils.DynaBean" %>
<%@page import="com.zhaopin.Station"%>
<%@ page import="com.zhaopin.dao.factory.AdvertisementModel" %>
<%@ page import="cn.com.zhaopin.base.pub.cCharControl" %>
<%
	String base_dir =request.getContextPath()+"/";
 %>
 <style>
 #login_user_info a {color:#f9653c;}
.site_select_link {
  width: 500px;
}
.site_select_link a {
  float: left;
  display: block;
  padding: 6px 10px;
  text-align: center;
  font-size: 14px;
  line-height: 16px;
}
 </style>
<div class="heard">
    <div class="heard_top">
    <div style="float:left;">
        <p style="width:700px;">
<%=Station.getStat().get("time") %>,
企业<span style="font-weight:bold;font-style:italic;color:#FF5F00;"><%=Station.getStat().get("company_size") %></span>家.
高校<span style="font-weight:bold;font-style:italic;color:#FF5F00;"><%=Station.getStat().get("school_size") %></span>	所.
招聘会<span style="font-weight:bold;font-style:italic;color:#FF5F00;"><%=Station.getStat().get("job_fair") %></span>	场.
本月新增企业<span style="font-weight:bold;font-weight:bold;color:#FF5F00;"><%=Station.getStat().get("today_company") %></span>家.
本月新增简历<span style="font-weight:bold;font-weight:bold;color:#FF5F00;"><%=Station.getStat().get("month_student") %></span>份
        </p>
      </div>
     <div class="pull-right" id="loginInfo"  style="float:right;">
			<span id="login_user_info">
            	[<a href="javascript:;"  onclick="open_login_layer();">登陆</a>
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
        <div class="clear"></div>
     </div>
     <div class="clear"></div>
</div>
<!--heard完成-->
<div class="midder">
    <div class="midder_left">
        <div class="logo">
            <a href="http://www.211zph.com"><img src="/static/images/LOGO.png" height="83" width="234" /></a>
        </div>
        <div class="madder_m">
            <img src="img/qiye.png" height="70" width="8" />
        </div>
        <div class="midder_r">
        	<a href="javascript:;">
            <h1  id="site_select_btn" >
			<%
            	String area_id = (String)request.getAttribute("area_id");
				String area_name =area_name=com.zhaopin.Station.getStationName( area_id );
				if( "".equals(area_name) ){
						area_name="全国";
				}
             %>
             <%=area_name %>站
             <img src="img/sanjiao.jpg"/></h1></a>
            <p>创校园招聘会第一品牌</p>
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
    <div class="midder_right">
        <div  id="latest_log" style="height:60px;overflow:hidden;margin-bottom:10px;font-size:14px;font-family: 微软雅黑;">
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

        <div class="bg">
        	<img src="img/biankuang.png" height="56" width="390" />
            <ul>
                 <li><a href="/">首页</a><span>/</span></li>
                <li><a href="/jobfair.do?&a=<%=area_id %>">招聘会</a><span>/</span></li>
                <li><a href="/subStationJobs.do?a=<%=area_id %>">招聘职位</a></li>
            </ul>
            <div class="clear"></div>
        </div>
    </div>
    <div class="clear"></div>
</div>
<div class="width">
	
</div>