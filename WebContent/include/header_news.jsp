<%@ page language="java" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("GBK");
String area_name=""; 
area_name=request.getParameter("area_name");
if(area_name.equals("")){
	area_name="全国";
}
 %>


    <div class="f_logo">
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
		
		function query(){
			var search_type=document.getElementById("search_type").value
			var search_key=document.getElementById("search_key").value.trim();
			if (search_key==""){
				alert("请输入查询关键字！");
				document.getElementById("search_key").value="";
				document.getElementById("search_key").focus();
				return false;
			}
			if(search_type=="company"){
				window.location.href="<%=request.getContextPath()%>/multiQueryAction.do?method=companysSearch&queryType=companysSearch&savesign=savesign&search_key="+search_key;
			}else if(search_type=="jobfair"){	
				window.location.href="<%=request.getContextPath()%>/multiQueryAction.do?method=jobfairSearch&queryType=allmoreJobfair&savesign=savesign&search_key="+search_key;
			}else{
				window.location.href="<%=request.getContextPath()%>/multiQueryAction.do?method=schoolSearch&queryType=schoolSearch&savesign=savesign&search_key="+search_key;
			}
			
		}
		</script>
    	<div class="container">
        	<div class="row f_sec_1 pull-left">
            		<%@page import="com.zhaopin.dao.factory.PicModel" %>
        	<% PicModel picM=new PicModel(); %>
            		<a href="<%=request.getContextPath()%>/"><img src="<%=request.getContextPath()%>/<%=picM.getLogo() %>"  /></a>
            </div>
            <div class="row f_sec_2  pull-left">
            	<div><%=area_name %>站&nbsp;<a id="site_select_btn" href="javascript:;"><small>[切换]</small></a></div>
            </div>
			<jsp:include  page="f_sec_x.jsp" flush="true"/>


        </div>
    </div>
    <div style="clear:both;"></div>
    <div class="f_nav">
    	<div class="container navbar">
            <div>
              <ul class='nav'>
              	<% if (!area_name.equals("全国") && area_name!=null){
              	 %>
                <li><a href="<%=request.getContextPath()%>/substation.do?method=subindex&area_id=<%=request.getParameter("area_id") %>"><%=area_name %>站首页</a></li>
                <li><a href="<%=request.getContextPath()%>/multiQueryAction.do?method=jobfairSearch&queryType=moreJobfair&savesign=savesign&area_id=<%=request.getParameter("area_id") %>&job_fair_type=multiple">双选招聘会</a></li>
                <li><a href="<%=request.getContextPath()%>/multiQueryAction.do?method=jobfairSearch&queryType=moreJobfair&savesign=savesign&area_id=<%=request.getParameter("area_id") %>&job_fair_type=organises">专场招聘会</a></li>
                <li><a href="<%=request.getContextPath()%>/multiQueryAction.do?method=jobfairSearch&queryType=moreJobfair&savesign=savesign&area_id=<%=request.getParameter("area_id") %>&job_fair_type=cooperate">企业宣讲会</a></li>
                <!-- 
                <li><a href="<%=request.getContextPath()%>/multiQueryAction.do?method=jobfairSearch&queryType=moreJobfair&savesign=savesign&area_id=<%=request.getParameter("area_id") %>&job_fair_type=cooperate">校企合作会</a></li>
               --> 
                <% }else{%>
                	<li><a href="<%=request.getContextPath()%>/"><%=area_name %>站首页</a></li>
                	<li><a href="<%=request.getContextPath()%>/multiQueryAction.do?method=jobfairSearch&queryType=allmoreJobfair&savesign=savesign&job_fair_type=multiple">双选招聘会</a></li>
                	<li><a href="<%=request.getContextPath()%>/multiQueryAction.do?method=jobfairSearch&queryType=allmoreJobfair&savesign=savesign&job_fair_type=special">专场招聘会</a></li>
                	<li><a href="<%=request.getContextPath()%>/multiQueryAction.do?method=jobfairSearch&queryType=allmoreJobfair&savesign=savesign&job_fair_type=organises">企业宣讲会</a></li>
                	<!-- 
                	<li><a href="<%=request.getContextPath()%>/multiQueryAction.do?method=jobfairSearch&queryType=allmoreJobfair&savesign=savesign&job_fair_type=cooperate">校企合作会</a></li>
                	 -->
                <% }%>
                
              </ul> 
            </div>
            
        </div>

    </div>
    <div style="clear:both;"></div>