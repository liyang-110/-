<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.factory.AdvertisementModel"%>
<%@ page import="com.zhaopin.Station"%>
<%
AdvertisementModel AdM=new AdvertisementModel();
String base_dir =request.getContextPath()+"/";
String area_id=(String)request.getAttribute("area_id");
%>
    <div class="container"  id="banner">
    	<div class="pull-left" id="login">
        	<div class="title">
            	用户登陆
            </div>
			<div id="login_form" style="margin-top:20px;">
                  <form class="company_login" name="login1" action="" method="post" onsubmit="return checkLogin(this);">
                  <div class="control-group">
                  		<label>账号:</label>
                        <input type="text" name="user_id">
                  </div>
                  <div class="control-group">
                  		<label>密码:</label>
                        <input type="password" name="user_pass">
                 </div>
                <div class="input-block-level" style=" margin-top:-10px;">
						<label class="checkbox" style="display:inline; padding-left:5px;">
                        	<input class="checkbox" name="remember" type="checkbox" style="margin:0 0 0 20px;">保存密码
                        </label>
                        <label class="checkbox" style="display:inline;padding-left:15px;">
                         <a href="<%=request.getContextPath() %>/forget.do" target="_blank">忘记密码？</a></label>
                         <label style="display:inline;padding-left:15px;">
                         <a href="<%=request.getContextPath() %>/register.jsp" target="_blank">注册</a>
                         </label>
                  </div>
                  <div class="input-block-level">
                        <input type="submit" value="登&nbsp;&nbsp;&nbsp;陆">
                  </div>
                  
                  <div class="input-block-level" style="margin-top:8px;overflow:hidden;">
                  	<table><tr><td width="44">
                  	<label style="display:inline;padding:15px 0;">
                  	<a target="_blank" href="<%=request.getContextPath() %>/list.do?t=gonggao" style="color:#F67604;">公告</a>：
                  	</label></td><td width="200">
                  	<marquee id="affiche" align="top" behavior="scroll" bgcolor="#FFFFFF" direction="left" height="20" hspace="0" vspace="0" loop="-1" scrollamount="3" scrolldelay="0" onMouseOut="this.start()" onMouseOver="this.stop()" style="display:inline;padding:8px 0px; white-space: nowrap;">
                    <%
                    List gonggao = Station.queryProc("gonggao");
                    for(Iterator it=gonggao.iterator();it.hasNext();){
                    	HashMap row=(HashMap)it.next();
                    	%>
                    	<a style="margin-right:10px;" href="<%=request.getContextPath() %>/newsDetail.do?id=<%=row.get("news_id") %>" target="_blank">
                    	<%=row.get("add_date") %>&nbsp;&nbsp;
                    	<%=row.get("news_title") %>
                    	</a>
                    	<%
                    }
                    
                     %>
                  	</marquee></tr></table>
                  	
                  </div>
                  
                  <div class="input-block-level" style="margin-top:20px;display:none;">
                    &nbsp;&nbsp;还没有注册会员，<a href="<%=request.getContextPath() %>/register.jsp" target="_blank">点击注册</a>
                  </div>
                  </form>
              </div>
            <script type="text/javascript">
            var cur_path="<%=request.getContextPath()%>";
			jQuery(document).ready(function() {     
					Login.init();
			  });
			</script>
        </div>
        <div class="pull-right">
        	<div class="slide">
                    <div id="slide" style="position: relative;"></div>
                                    <script type="text/javascript">
                                    $("#slide").jdSlide(
                                    {width:705,
                                    height:212,
                                    pics:	[
			<%= AdM.getAdPlayHtml("play_496x319",area_id,8,base_dir) %>
                                    ]
                                    })
                                    </script>
            </div>
            <div class=" search-query row-fluid">
            	<form id="J_TSearchForm" class="form-search form-inline" action="<%=request.getContextPath() %>/search.do" method="get">
                
                <input type="hidden" name="type" value="search_jobfair"/>
                <input type="hidden" name="in_pagenum" value="9"/>
                
                <div class="span2" style="width:100px;">
                
<div class="search-triggers">
                    <ul class="ks-switchable-nav">
                            <li class="J_SearchTab selected" data-pagesize="9" data-searchtype="search_jobfair" style="display: list-item;">
                            <a href="javascript:;">搜招聘会<i class="icon-chevron-dow"></i></a></li>
							<li class="J_SearchTab" data-pagesize="9" data-searchtype="search_organises" style="display: none;">
                            <a href="javascript:;">搜宣讲会<i class="icon-chevron-dow"></i></a></li>
                            <li class="J_SearchTab" data-pagesize="20" data-searchtype="search_recruit" style="display: none;">
                            <a href="javascript:;">搜职位<i class="icon-chevron-dow"></i></a></li>
                            <li class="J_SearchTab" data-pagesize="20" data-searchtype="search_company" style="display: none;">
                            <a href="javascript:;">搜企业<i class="icon-chevron-dow"></i></a></li>
                            <li class="J_SearchTab" data-pagesize="20" data-searchtype="search_school" style="display: none;">
                            <a href="javascript:;">搜学校<i class="icon-chevron-dow"></i></a></li>
                            
                            <li style="clear: both; display: none;"></li>
                    </ul>
                    <div style="clear:both;"></div>
                </div><!-- search-triggers -->
                
                </div>
                <div class="span8 offset-fix"  style="width:500px;">
	            	<input class="span12" type="search" name="in_key" id="search_key" placeholder="请输入关键字"/>
                </div>
                <div class="span2 offset-fix"  style="width:90px;">
    	            <input type="submit" value="搜索" id="search_btn"/>
                </div>
                </form>
                <script>
$("document").ready(function(){
	$(".J_SearchTab").bind('click',J_SearchTab_Click);
	$(".search-triggers").bind('mouseenter',J_SearchTab_MouseEnter);
	$(".search-triggers").bind('mouseleave',J_SearchTab_MouseLeave);
});
J_SearchTab_Click =function(){
		$(".J_SearchTab").each(function(){
				$(this).removeClass("selected");
		})
		$(this).addClass("selected");
		$(this).remove().insertBefore($(".J_SearchTab:first"));
		$(this).bind('mouseenter',J_SearchTab_Mouse);
		$(this).bind('click',J_SearchTab_Click);
		$(".search-triggers").trigger("mouseleave");
		$("#J_TSearchForm input[name='type']").val( $(this).attr("data-searchType") );
		$("#J_TSearchForm input[name='in_pagenum']").val( $(this).attr("data-pagesize") );
	}
J_SearchTab_Mouse = function() {
		$('.search-triggers li').each(function(){
			$(this).show();
		})
		$(".search-triggers").mouseleave(function(){ 
					$('.search-triggers li').each(function(){$(this).hide();});
					$('.search-triggers li.selected').show();
		});
	}
J_SearchTab_MouseEnter = function() {
		$('.search-triggers li').each(function(){
			$(this).show();
		})
}
J_SearchTab_MouseLeave = function() {
		$('.search-triggers li').each(function(){$(this).hide();});
		$('.search-triggers li.selected').show();
}
</script>
            </div>
        </div>
    </div>