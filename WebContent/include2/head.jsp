<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.zhaopin.Station"%>

	<div class="head_top">
<div class="container">
        	<div class="pull-left">您好，欢迎光临！</div>
            <div class="pull-left" id="loginInfo">
			<span id="login_user_info">
            	[<a href="<%=request.getContextPath()%>/">登陆</a>
                <span class="divider">|</span>
                <a href="<%=request.getContextPath()%>/register.jsp" id="goto_reg_link">免费注册</a>]
            </span>
         	</div>
         	<div class="pull-right">
截至<%=Station.getStat().get("time") %>,
企业<span style="color:#266844;font-weight:bold;font-style:italic;text-decoration: underline;"><%=Station.getStat().get("company_size") %></span>家.
高校<span style="color:#266844;font-weight:bold;font-style:italic;text-decoration: underline;"><%=Station.getStat().get("school_size") %></span>	所.
招聘会<span style="color:#266844;font-weight:bold;font-style:italic;text-decoration: underline;"><%=Station.getStat().get("job_fair") %></span>	场.
本月新增企业<span style="color:#266844;font-weight:bold;font-weight:bold;text-decoration: underline;"><%=Station.getStat().get("today_company") %></span>家.
本月新增简历<span style="color:#266844;font-weight:bold;font-weight:bold;text-decoration: underline;"><%=Station.getStat().get("month_student") %></span>份
            </div>

            <!--  div class="pull-right" id="brower360tip">
            	<div>
<%// =com.zhaopin.Config.getSiteTop() %>                </div>
            </div-->
            
			<script type="text/javascript">
				$(function(){
						$.get( '<%=request.getContextPath()%>/login.do?check=true&date='+new Date(),function(data){
						if(data.login){
							var login = data.login;
							var user_id=(login.user_id.length>10)?login.user_id.substring(0,10)+'...':login.user_id;
							var str='<a title="'+login.user_id+'" style="text-decoration:none;">'+user_id+'</a>';
								 str+='&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/member/home.do" >'+login.user_type_name+'中心</a>';
								 str+='&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/loginOut.do?method=exitData">退出登录</a>';
						   $("#login_user_info").html(str);
						   $("#brower360tip").hide();
						}
					});
				});
				</script>
        </div>
    </div>
    <div class="head_logo">
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
				var url ='<%=request.getContextPath()%>/service/select_site.jsp';
				var pageContentBody =$(art.dialog({id: 'site_select_btn'}).content());
				pageContentBody.parents(".aui_dialog").find(".aui_close").addClass("site_select_panel_close");

				$.post(url, {}, function (res) {
								pageContentBody.html(res);
								art.dialog({id: 'site_select_btn'}).show();
				});		
				
			});
		});
		</script>
    	<div class="container">
        	<div class="logo pull-left">
            	<a href="<%=request.getContextPath() %>/">
        		<img src="<%=request.getContextPath() %>/assets2/images/logo.jpg" width="215" height="78"/>
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
				<div><%=area_name %>&nbsp;<a id="site_select_btn" href="javascript:;"><small>[切换]</small></a></div>
            </div>
		  <style type="text/css">
		    #latest_log_container { height:60px; overflow:hidden; width:629px; margin:25px auto 0 auto; } 
		    #latest_log_container a {display:block;line-height:18px;text-decoration:none;}
		    </style>
            <div class="banner pull-right" id="latest_log_container" >
            	<!--
               <marquee id="latest_log" align="top" behavior="scroll" bgcolor="#FFFFFF" direction="up" height="81" width="629" hspace="0" vspace="0" loop="-1" scrollamount="1" scrolldelay="0" onMouseOut="this.start()" onMouseOver="this.stop()" style="font-size:12px;margin:15px 0px 0pt 0;">
				-->
               <%
                    List latest_log = Station.queryLatestLog();
                    for(Iterator it=latest_log.iterator();it.hasNext();){
                    	HashMap row=(HashMap)it.next();
                    	%>
                    	<%=row.get("cdate") %>前，&nbsp;&nbsp;<%=row.get("content") %><br/>
                    	<%
                    }     
                %>
                <!--  
            	</marquee>
            	 
            		<img src="<%=request.getContextPath() %>/assets2/images/topbanner.jpg" width="529" height="81"  style="margin:10px 5px;"/>
            	 -->
            </div>
			<script type="text/javascript"> 
					var box=document.getElementById("latest_log_container"),can=true; 
					box.innerHTML+=box.innerHTML; 
					box.onmouseover=function(){can=false}; 
					box.onmouseout=function(){can=true}; 
					$(function (){ 
						var stop=box.scrollTop%60==0&&!can; 
						if(!stop)box.scrollTop==parseInt(box.scrollHeight/2)?box.scrollTop=0:box.scrollTop++; 
						setTimeout(arguments.callee,box.scrollTop%60?10:2000); 
					}); 
			</script>
        </div>
    </div>
    <div class="head_menu">
    	<div class="container">
        	<div class="pull-left navbar">
            	<ul class="nav">
               <li><a href="<%=request.getContextPath() %>/">首页</a></li>
                <li><a href="<%=request.getContextPath() %>/jobfair.do?t=multiple">招聘会讯</a></li>
                
                <li><a href="<%=request.getContextPath() %>/subStationJobs.do">招聘职位</a></li>
                <!-- 
                <li><a href="<%=request.getContextPath() %>/jobfair.do?t=organises">宣讲会讯</a></li>
                <li><a href="<%=request.getContextPath() %>/list.do?t=kaoshi">招聘信息</a></li>
                
                <li><a href="<%=request.getContextPath() %>/list.do?t=chuangye">创业</a></li>
				 -->

              </ul>
            </div>
            <style type="text/css">
            	#quick_switch {
            		line-height:26px;
            		padding-left:42px;
            		width:150px;
            	}
            	#quick_switch a {
            		margin:0 3px;
            	}
            </style>
            <div class="pull-right nav-pills" id="quick_switch">
				<a href="/shaanxi">陕西</a>
				<a href="/shanghai">上海</a>
				<a href="/henan">河南</a>
				<br/>
				<a href="/hubei">湖北</a>
				<a href="/zhejiang">浙江</a>
				<a href="/sichuan">四川</a>
				<!-- 
            	<a href="<%=request.getContextPath() %>/register.jsp" target="_blank">注册</a>
                <a href="<%=request.getContextPath()%>/list.do?t=gonggao">公告</a>
            	 -->
            </div>
            
        </div>
    </div>