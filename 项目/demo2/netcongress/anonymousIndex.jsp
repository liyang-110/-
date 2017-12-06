<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="include/initdata_anonymous.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title><%=jobfairMap.get("job_fair_name") %> - <%=com.zhaopin.Config.getSiteTitle() %></title>

<link type="text/css" rel="stylesheet" href="style/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="style/core.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script> 

<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript"  src="js/carousel.js"></script>
<script type="text/javascript" src="js/jquery.downCount.js"></script>

<script type="text/javascript">
	if (window!=top) // 判断当前的window对象是否是top对象
		top.location.href =window.location.href; 
	var cur_path = "<%=request.getContextPath()%>";
</script>
<script src="<%=request.getContextPath()%>/assets2/artDialog/artDialog.js?skin=green"></script>
<script src="<%=request.getContextPath()%>/assets/artDialog/plugins/iframeTools.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets2/scripts/front.js" charset="utf-8"></script>

<script type="text/javascript" src="js/jquery-scrollable.js" charset="utf-8"></script>
<script type="text/javascript" src="js/jquery.textSearch-1.0.js" charset="utf-8"></script>

<script type="text/javascript" src="js/flow.js" charset="utf-8"></script>
<script type="text/javascript">
	$(function(){
		$(".nav-pills>li:eq(0)").addClass("activ_one");
	});
</script>
<style type="text/css">
	.lightNode {
		background:#ccff66;
		color:#6600ff;
	}
	.container .cont_pull .text_b p span.lightNode{
		color:#6600ff;
	}
</style>
<% if( ( userI instanceof SchUserBean ) ){ %>
<script type="text/javascript" src="js/studentNotice.js?r=sc" charset="utf-8"></script>
<% } else if( ( userI instanceof ComUserBean ) ){ %>
<script type="text/javascript" src="js/studentNotice.js?r=co" charset="utf-8"></script>
<% } else {  %>
<script type="text/javascript">
	$(function(){
		// open_login_layer();
		/*
		$(window).bind("scroll",function(e){
			open_login_layer();
			var bodyScrollTop = $(document).scrollTop();
			if (bodyScrollTop > 100){
				$("body,html").animate({scrollTop:0},800);
			}
		});
		*/
	}); 
</script>
<% } %>
<jsp:include page="include/weixin.jsp" flush="true" />
</head>
<body>
<jsp:include page="include/header_anonymous.jsp" flush="true"/>
<jsp:include page="include/banner.jsp" flush="true"/>

<div id="inner" style="width:100%;background-color:#0fad8c;">
<div class="job">
    <h1>招聘大厅</h1>
    <form name="head_search" action="?id=<%=request.getParameter("id") %>" method="post" onsubmit="return ajaxFindInPage(this.string.value);" class="form-inline" role="form">
       <div class="form-group">
          <input type="text" class="form-control control" id="name" name="string" placeholder="请输入企业名称或应聘职位"/>
       </div>
       <input type="submit" class="btn btn-default" value="搜索"/>
       <span id="head_search_result"></span>
    </form>
</div>
</div>
<script language="javascript">
/*
(function(){
	var obj = document.getElementById("inner");
	var top = getTop(obj);
	var isIE6 = /msie 6/i.test(navigator.userAgent);
	window.onscroll = function(){
		var bodyScrollTop = document.documentElement.scrollTop || document.body.scrollTop;
		if (bodyScrollTop > top){
			obj.style.position = (isIE6) ? "absolute" : "fixed";
			obj.style.top = (isIE6) ? bodyScrollTop + "px" : "0px";
		} else {
			obj.style.position = "static";
		}
	}
	function getTop(e){
		var offset = e.offsetTop;
		if(e.offsetParent != null) offset += getTop(e.offsetParent);
		return offset;
	}
})()
*/
</script>
<!--job完成-->
<div class="container" style="width:980px;">
	<div id="job_fair_company_list_result" style="margin:0 -18px;">
		<div style="clear:both;"></div>
	</div>
	<div style="clear:both;"></div>
	<div id="job_fair_company_list" style="margin:0 -18px;">
		<% List<HashMap> companyList = (List<HashMap>)request.getAttribute("companyList");
    		for(HashMap row : companyList){
    			%>
       	<div  class="pull-left cont_pull" style="margin:18px;width:210px;">
	        <ul class="list-inline">
	          <li><img src="img/ren_b.png"/></li>
	          <li class="bg"><%=row.get("rn") %></li>
	          <li><img src="img/ren_c.png" /></li>
	        </ul>
            <div class="clear"></div>
        	<div class="text_a">
        		<a style="color:#d6e4d5;" title="<%=row.get("company_name") %>" href="/company/info.do?id=<%=row.get("company_id") %>" target="_blank">
        			<%=row.get("company_name") %>
        		</a>
        	</div>
  			<% 	   List jobs= (List)row.get("jobs");
	               if(jobs!=null && jobs.size()>0){ 
	               		%>
	        <div class="text_b">
            
	               		<%
	                    for(Iterator jt=jobs.iterator();jt.hasNext();){
	                    	HashMap job=(HashMap)jt.next();
	                    %>
	                    <p>
	                    <a title="<%=job.get("job_name") %>" href="/company/jobDetail.do?id=<%=job.get("job_id") %>" target="_blank">
	                    <%=job.get("job_name") %></a>
	                    <span>（简历<%=job.get("resumecount") %>份）</span>
	                    </p>
	        <% 		    } %>
	        
	        </div>
	        <form class="form-inline" role="form" style="text-align:center;">
	        <button type="button" class="btn btn-default appview" onclick="$('#wellcomeModalDiialog').modal({});">手机面试</button>	
 				<button type="button" class="btn btn-default contact" onclick="open_login_layer();">一键面试</button>	      
	        </form>
	        			<%
	                }else{%>
	        <div class="text_b">
            <p> 好像没有发布职位哦！
            </p>
            </div>
            <div class="text_c">
            </div>
	        <%	    } %>
        </div>
    			<%
    		} 
    	 %>
   </div>
</div>
<jsp:include page="include/footer_anonymous.jsp" flush="true"/>
<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"24"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
</body>
</html>
