<%@ page language="java" import="java.util.*"  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.factory.HashMapFactory" %>
<%@ page import="com.zhaopin.bean.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
HashMap jobfairMap = (HashMap)request.getAttribute("jobfair");
HashMapFactory jobfair =new HashMapFactory(jobfairMap,"");

UserInterface user = (UserInterface)request.getAttribute("currentUser");
HashMap statisticsMap = (HashMap)request.getAttribute("statistics");
HashMapFactory statistics = new HashMapFactory(statisticsMap,"0");

HashMap schoolInfoMap = (HashMap)request.getAttribute("schoolInfo");
HashMapFactory schoolInfo = new HashMapFactory(schoolInfoMap,"");

%>
<div class="head">
    <div class="head_top">
    	<div class="head_left">
    		<p>欢迎会员<span style="color:#e15759;"><%=user!=null? user.getUserId():"" %></span>
    		<a href="/loginOut.do?method=exitData">退出</a>
			<span style="color:#666;">|</span>
	<%if( user instanceof AdUserBean){ %>	
			<a target="_blank" href="/daqin_manager/">后台管理</a>
	<%}else if( user instanceof ComUserBean ){ %>	
			<a  target="_blank" href="/member/home.do">会员中心</a>
	<%	}else if( user instanceof SchUserBean ){ %>
			<a  target="_blank" href="/member/home.do">会员中心</a>
	<% 	}else if( user instanceof StudentSessionBean ){%>
			<a  target="_blank" href="/member/home.do">会员中心</a>
	<%  } %>

		</p>
        </div>
        <div class="head_search" style="float:left;width:250px;">
        	<form name="head_search" onsubmit="return findInPage(this.string.value);">
            	<input name="string" type="text" size=15 onchange="n = 0;" placeholder="请输入企业名称或应聘职位" class="zp" />
                <input type="submit" value="搜索" class="s" />
                <span id="head_search_result"></span>
            </form>
        </div>
        <div class="head_right">
            <p style="color:#e15759;"><span style="color:#e15759; font-weight:bold;">温馨提示</span>：除合法中介外，收取求职者的押金，服装费，培训费，保证金等行为都是违法的，请谨慎对待!</p>
        </div>
        <div class="clear"></div>
    </div>
</div>
<!--head完成-->
<div class="container">
	<div class="top_a">
    	<img src="/netcongress/img/top.png" width="1210" height="798" />
        <div class="top_text" >
        	<h1 style="overflow:hidden;text-overflow: ellipsis; white-space: nowrap;">
        	<%=jobfair.get("job_fair_name") %></h1>
            <p style="color:#ffe496; font-size:15px; position:absolute; top:468px; left:530px;  width: 150px; text-align:center;">
              结束倒计时<br />
           <span id="daojishi"></span>
           <script>
           function timer( datestr ) 
			{  
				var html=daojishi( datestr );
				document.getElementById("daojishi").innerHTML = html;  
			}  
           $(function(){
           		setInterval("timer('<%=jobfair.get("job_fair_overtime")%>')",1000);  
           });
           </script>
           </p>
        </div>
    </div> 
</div>
<!--container-->
<!--cont开始-->
<div class="cont">
    <div class="left_suspend"> 
        <h2>城市频道</h2>
        <div class="left_nav">
        <div>
		<% HashMap jobfairTree= (HashMap)request.getAttribute("jobfairTree"); 
			
			  if(jobfairTree!=null){
			  		int rownum=0;
			  		int rowcount = jobfairTree.size();
			  		Iterator it = jobfairTree.entrySet().iterator();
			  for(int i=0;i< (rowcount/9)+1 ; i++ ){
		 %>
		<dl  page="<%=i %>"  class="list  <%=(i==0)?"current":"" %>"  style="min-height:270px;<%=(i==0)?"":"display:none;" %>">
        <% 
				 for(;it.hasNext(); ){ 
						Map.Entry entry = (Map.Entry)it.next();
						String area_id = (String)entry.getKey();
						HashMap data = (HashMap)entry.getValue();
						String area_name = (String)data.get("area_name");
						List  jobfairList = (List)data.get("jobfairList");
				%>
		    <dd num="<%=rownum%>">
				<a href="javascript:" class="nav_left"><%=area_name %></a>
				<div class="nav_right">
					<!--  <h1>211高校</h1>  -->
					<ul>
					<%	if(jobfairList!=null && jobfairList.size()>0 ){ 
								for(Iterator jit = jobfairList.iterator();jit.hasNext();){
									HashMap jf = (HashMap)jit.next();
					%>
						<li style="display:block;" online="<%=jf.get("isonline")%>"><a href="#"><%=jf.get("school_name") %></a>
								<a href="#"><span class="school_a"><%=jf.get("job_fair_name") %></span></a>
								<% if( "1".equals( jf.get("isonline") ) ){ %>
								<a href="/netcongress/start.do?id=<%=jf.get("job_fair_id") %>" target="_blank"><span class="school_b">进入</span></a>
								<% } %>
						</li>
					<%		}
							} // end if jofair %>
					</ul>
				</div>
			</dd>
				<%  rownum++;
						if( rownum%9 == 0 ){
				 			break;
				 		}
				 		
					}  // end for dd 
		      %>
		  </dl>
		<% }} %>
		  </div>
		  <dl class="control" style="margin-top: 5px;">
            <dd><a href="javascript:" onclick="showNextDL();" class="last" style="color:#e05859;">更多>></a></dd>
		  </dl>
		  <script>
		  	function showNextDL()
		  	{
		  		var dom= $("dl.list.current");
		  		var next = dom.next();
		  		console.info(next);
		  		if( next.attr("page") ){
		  			next.show() 
		  			next.addClass("current");
		  			dom.removeClass("current");
		  			dom.hide();
		  		}else{
		  			next=dom.parent().children().eq(0);
		  			next.show() 
		  			next.addClass("current");
		  			dom.removeClass("current");
		  			dom.hide();
		  		}
		  	}
		  	
		  </script>
	</div>
    </div>
    <!--con-->
    <div class="con">
       <div class="con_text">
       	   <p>本会场共有企业<span><%=statistics.get("company_num") %></span>家
       	   &nbsp;&nbsp;&nbsp;&nbsp;
       	   招聘职位<span><%=statistics.get("position_num") %></span>个
       	   &nbsp;&nbsp;&nbsp;&nbsp;
       	   招聘人数<span><%=statistics.get("job_person_num") %></span>人
       	   &nbsp;&nbsp;&nbsp;&nbsp;
       	   入场求职人员<span><%=statistics.get("resume_size") %></span>人</p>
       </div>
       <%
       List<HashMap> lastestLog = (List<HashMap>)request.getAttribute("lastestLog");
        %>
       <div class="contan">
       		<div class="contan_left">
            	<ul id="contan_left">
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
            <div class="contan_lefta">
            	<ul id="contan_lefta">
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
            <div class="contan_right">
            	<ul id="contan_right">
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
              	$("#contan_left").scrollable({
					direction: "top",
					height: "112",
					scrollCount: 1,
					delay : 1000 
				});
              	$("#contan_lefta").scrollable({
					direction: "top",
					height: "112",
					scrollCount: 1,
					delay : 1000 
				});
              	$("#contan_right").scrollable({
					direction: "top",
					height: "112",
					scrollCount: 1,
					delay : 1000 
				});
            </script>
            <div class="clear"></div>
       </div>
       <div class="ren">
       		<div class="ren_left">
            <img src="/netcongress/img/ren1.png" width="227" height="158" /><br />
            	<a href="#">查看主办方</a>
            </div>
            <div class="yincang1" style="overflow-y:scroll;overflow-x:hidden;padding:10px;">
                <%= com.zhaopin.Help.textToHtml( (String)schoolInfo.get("school_info") )%>

            </div>
            
            <div class="ren_lefta">
            <img src="/netcongress/img/ren_a.png" width="227" height="158" /><br />
            	<a href="/student/" target="_blank">完善简历</a>
            </div>
            
            <div class="anniu">
                <img src="/netcongress/img/ren_b.png" width="227" height="158" /><br />
            	<a href="#">操作指南</a>
            </div>
          	<div class="yincang" style="overflow-y:scroll;overflow-x:hidden;padding:10px;">
                <%= com.zhaopin.Help.textToHtml( (String)jobfair.get("job_fair_invitation") )%>
            </div>
            <div class="clear"></div>
       </div>      
    </div>
    <!--right_suspend-->
    <div class="right_suspend"> 
    	<p><a href="javascript:;" onclick="location.reload();" style="color:#FFF; font-weight:bold;">刷新</a></p>
        <dl class="list">
            <dt><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=25651887&Site=211校招网&Menu=yes" style=" font-weight:bold; font-size:14px;">招聘会客服</a></dt>
            <dt><a target="_blank"href="http://wpa.qq.com/msgrd?v=3&uin=25651887&Site=211校招网&Menu=yes">400-6606125</a></dt>
            <dt><a target="_blank"href="http://wpa.qq.com/msgrd?v=3&uin=25651887&Site=211校招网&Menu=yes">029-88662468</a></dt>
            <dt><a target="_blank"href="http://wpa.qq.com/msgrd?v=3&uin=25651887&Site=211校招网&Menu=yes"><img src="/netcongress/img/qq.png" /></a></dt>
            <dt><a target="_blank"href="http://wpa.qq.com/msgrd?v=3&uin=25651887&Site=211校招网&Menu=yes">25651887</a></dt>
        </dl>
    </div>
</div>
<!---------------------------->