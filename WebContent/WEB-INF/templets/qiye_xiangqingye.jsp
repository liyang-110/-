<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.Station"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
HashMap companyInfo = (HashMap)request.getAttribute("companyInfo");
%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="keywords" content="<%=com.zhaopin.Config.getSiteKeywords() %>" />
<meta name="description" content="<%=com.zhaopin.Config.getSiteDescription() %>" />
<meta name="author" content="">
<title>${companyInfo.company_name } - <%=com.zhaopin.Config.getSiteTitle() %></title>
 
	<link href="/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="/static/css/common-element.css" rel="stylesheet" type="text/css">
	<link href="/static/css/qiye_xiangqingye-style.css" rel="stylesheet" type="text/css">
    <link href="/static/css/font-awesome.min.css" rel="stylesheet" media="screen">
    
    <script src="/statics/jquery/1.11.3/jquery.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.min.js"></script>
    <script src="/statics/artDialog/artDialog.js?skin=aero" charset="utf-8"></script>
	<script src="/statics/artDialog/plugins/iframeTools.js"></script>
	<script src="/static/js/flow.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<!--头部架构开始-->
<jsp:include page="include/header.jsp" flush="true"></jsp:include>
<!--头部架构结束-->
<!--main区架构开始-->
<div class="main">
     <div id="latest_log" class="news">
        <ul class="info">   
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
       <div style="clear:both">
       </div>
        <script type="text/javascript"> 
                        var box2=document.getElementById("latest_log"),can=true; 
                        box2.innerHTML+=box2.innerHTML; 
                        box2.onmouseover=function(){can=false}; 
                        box2.onmouseout=function(){can=true}; 
                        $(function (){ 
                            var stop=box2.scrollTop%30==0&&!can; 
                            if(!stop)box2.scrollTop==parseInt(box2.scrollHeight/2)?box2.scrollTop=0:box2.scrollTop++; 
                            setTimeout(arguments.callee,box2.scrollTop%30?10:2000); 
                        }); 
                </script>
</div>   
        
	<div class="banner">
		<p>
			${companyInfo.company_name } 
		<p>
		<div style="clear:both"></div>
	</div>  
     
    <p class="position">当前所在位置：<a href="/jobfair/index.do?a=28">首页</a>&nbsp;&gt;&nbsp;${companyInfo.company_name } </p>



    <div class="xuexiaojianjie">
          <div class="title">
                <img src="/static/images/iconfont-qiye.png" width="28" height="28">
                <p>企业简介</p>
                <div style="clear:both;"></div>
          </div> 
          <div class="introduction">
		<%=com.zhaopin.dao.factory.JobFairModel.textToHtml(
      				(String)companyInfo.get("company_info")
      			)  %>
      		<p>&nbsp;</p>
      		<% if( com.zhaopin.bean.User.currentUser(session)!=null) {%>
            <p>地址：${companyInfo.company_addr} </p>
            <p>电话：${companyInfo.company_tel} &nbsp;&nbsp;
            		${companyInfo.contact_tel} &nbsp;&nbsp;
            		${companyInfo.contact_person} &nbsp;&nbsp;
            </p>
            <p>网址：${companyInfo.website} </p>
            <p>邮箱：${companyInfo.email} </p>
            <% } %>
          </div>
    </div>
    <div class="zhiwei">
    
       <div class="title">
                <img src="/static/images/zhiwei_icon.png" width="28" height="28">
                <p>招聘职位</p>
                <div style="clear:both"></div>
                
	   </div>  
    
       <ul class="zhiwei_biaoqian">
            <li class="zhiwei_type">招聘类型</li>
            <li class="zhiwei_name">岗位名称</li>
            <li class="zhiwei_degree">学历要求</li>
            <li class="zhiwei_address">工作地址</li>
            <li class="zhiwei_salary">岗位薪资</li>
            <li class="send_resume1"><a href="#">投递简历</a></li>
            <div style="clear:both"></div>
		</ul>
        <c:forEach var="row" items="${recruitList }">
        <ul class="zhiwei_biaoqian">
            <li class="zhiwei_type">${row.job_type }</li>
            <li class="zhiwei_name">
            	<a target="_blank" href="/jobfair/job.do?id=${row.job_id }">
         		${row.job_name }</a>
            </li>
            <li class="zhiwei_degree">${row.education }</li>
            <li class="zhiwei_address">${row.areas }</li>
            <li class="zhiwei_salary">${empty row.money ?'面议':row.money }</li>
            <li class="send_resume">
            	<a  href="javascript:;" onclick="openOrderJob('${row.company_id }','${row.job_id }','${row.company_name }','${row.job_name }','${row.contact_tel }');" >
            	投递简历
            	</a>
            </li>
            <div style="clear:both"></div>
		</ul>
        </c:forEach>
        <%-- 
        <div style="text-align:center;">
        	${pagenation }
        </div>
        --%>
    </div>
    <div class="xianchangzph">
          <div class="title">
                <img src="/static/images/hire_icon.png" width="28" height="28">
                <p>现场招聘会</p>
                <div style="clear:both"></div>
                
		  </div>
          
          <br/>


<div class="content">
  <div class="zph_daohang">
     <ul class="nav nav-tabs" role="tablist">
	      <li role="presentation" class="active">
	      		<a class="jinqizph" href="#jinqizph" aria-controls="profile" role="tab" data-toggle="tab" >
	      			近期招聘会
	      		</a>
	      </li>
	      <li role="presentation" >
	      		<a class="yijieshuzph companyList" href="#yijieshuzph" aria-controls="profile" role="tab" data-toggle="tab" >
	      			已结束招聘会
	      		</a>
	      </li>
           <div style="clear:both"></div>
     </ul>
    </div>
     <div class="tab-content">
          <!--近期招聘会开始  -->
          <div role="tabpanel" class="tab-pane active" id="jinqizph">
  		  
            <div class="zph_nav">
				<ul class="zph_nav_zph1">
			 		<li class="xuhao">序号</li>
			 		<li class="zphmingchen">招聘会名称</li>
			 		<li class="time">时间</li>
			 		<li class="address">地址</li>
			 	</ul>
			 	<c:forEach var="row" items="${jobfairCalendar }">
			 		<c:if test="${row.job_fair_type eq 'multiple' }">		
	            		<ul class="zph_nav_zph1" style="cursor:default;">
	            		<li class="xuhao"></li>
	            		<li class="zphmingchen">
	            			<a href="/jobfair/detail.do?id=${row.job_fair_id }" target="_blank">${row.job_fair_name }</a>	</li>
	            		<li class="time">${row.job_fair_date }</li>
	            		<li class="address">${row.job_fair_addr }</li>
						</ul>
					</c:if>	
                </c:forEach>        
				 <div style="clear:both"></div>		
			</div>
		</div>
		  <!--已结束招聘会开始  -->
		  <div role="tabpane1" class="tab-pane " id="yijieshuzph">
			<div class="zph_nav">
				<ul class="zph_nav_zph1">
                        <li class="xuhao">序号</li>
                        <li class="zphmingchen">招聘会名称</li>
                        <li class="time">时间</li>
                        <li class="address">地址</li>
			 	</ul>
			 	<c:forEach var="row" items="${pastJobfairList }">
			 		<c:if test="${row.job_fair_type eq 'multiple' }">		
	            		<ul class="zph_nav_zph1" style="cursor:default;">
	            		<li class="xuhao"></li>
	            		<li class="zphmingchen">
	            			<a href="/jobfair/detail.do?id=${row.job_fair_id }" target="_blank">${row.job_fair_name }</a>	</li>
	            		<li class="time">${row.job_fair_date }</li>
	            		<li class="address">${row.job_fair_addr }</li>
						</ul>
					</c:if>	
                </c:forEach>
                 <div style="clear:both"></div>	        
			</div>			  
	    				
		  </div>
		  <!--分页div开始  -->
		  <%--
		  <div style="text-align:center;">
		  	<ul class="zph_nav_zph1" style="cursor:default;">
	    		<li class="xuhao" style="width:960px;"><ul class="pagination"><li class="disabled"><span>上一页</span></li><li class="disabled active"><span>1</span></li><li><a href="?id=201608240009202&amp;page=2">2</a></li><li><a href="?id=201608240009202&amp;page=2">下一页</a></li></ul></li>
       		</ul>
		  </div>
		   --%>
	</div>
  </div>


    
    </div>


    <div class="wangluozph">
          <div class="title">
                <img src="/static/images/wlzph_icon.png" width="28" height="28">
                <p>网络招聘会</p>
                <div style="clear:both"></div>
                
		  </div>
          
          <br/>


<div class="content">
  <div class="zph_daohang">
     <ul class="nav nav-tabs" role="tablist">
	      <li role="presentation" class="active">
	      		<a class="jinqizph" href="#wl_jinqizph" aria-controls="profile" role="tab" data-toggle="tab" >
	      			近期招聘会
	      		</a>
	      </li>
	      <li role="presentation" >
	      		<a class="yijieshuzph companyList" href="#wl_yijieshuzph" aria-controls="profile" role="tab" data-toggle="tab" >
	      			已结束招聘会
	      		</a>
	      </li>
           <div style="clear:both"></div>
     </ul>
    </div>
     <div class="tab-content">
          <!--近期招聘会开始  -->
          <div role="tabpanel" class="tab-pane active" id="wl_jinqizph">
  		  
            <div class="zph_nav">
				<ul class="zph_nav_zph1">
			 		<li class="xuhao">序号</li>
			 		<li class="zphmingchen">招聘会名称</li>
			 		<li class="time">时间</li>
			 		<li class="address">地址</li>
			 	</ul>		
			 	<c:forEach var="row" items="${jobfairCalendar }">
			 		<c:if test="${row.job_fair_type eq 'netcongress' }">		
	            		<ul class="zph_nav_zph1" style="cursor:default;">
	            		<li class="xuhao"></li>
	            		<li class="zphmingchen">
	            			<a href="/jobfair/detail.do?id=${row.job_fair_id }" target="_blank">${row.job_fair_name }</a>	</li>
	            		<li class="time">${row.job_fair_date }</li>
	            		<li class="address">
	            			<a href="/netcongress/start.do?id=${row.job_fair_id }" target="_blank">进入会场</a>
	            		</li>
						</ul>
					</c:if>	
                </c:forEach>
				 <div style="clear:both"></div>		

			</div>
		</div>
		  <!--已结束招聘会开始  -->
		  <div role="tabpane1" class="tab-pane " id="wl_yijieshuzph">
			<div class="zph_nav">
				<ul class="zph_nav_zph1">
                        <li class="xuhao">序号</li>
                        <li class="zphmingchen">招聘会名称</li>
                        <li class="time">时间</li>
                        <li class="address">地址</li>
			 	</ul>
			 	<c:forEach var="row" items="${pastJobfairList }">
			 		<c:if test="${row.job_fair_type eq 'netcongress' }">		
	            		<ul class="zph_nav_zph1" style="cursor:default;">
	            		<li class="xuhao"></li>
	            		<li class="zphmingchen">
	            			<a href="/jobfair/detail.do?id=${row.job_fair_id }" target="_blank">${row.job_fair_name }</a>	</li>
	            		<li class="time">${row.job_fair_date }</li>
	            		<li class="address">
	            			<a href="/netcongress/start.do?id=${row.job_fair_id }" target="_blank">进入会场</a>
	            		</li>
						</ul>
					</c:if>	
                </c:forEach>
                <div style="clear:both"></div>		
			</div>			  
	    				
		  </div>
		  <!--分页div开始  -->
		  <%-- 
		  <div style="text-align:center;">
		  	<ul class="main_but_qiye1" style="cursor:default;">
	    		<li class="xuhao" style="width:960px;"><ul class="pagination"><li class="disabled"><span>上一页</span></li><li class="disabled active"><span>1</span></li><li><a href="?id=201608240009202&amp;page=2">2</a></li><li><a href="?id=201608240009202&amp;page=2">下一页</a></li></ul></li>
       		</ul>
		  </div>
		  --%>
	</div>
  </div>


    
    </div>





</div>







<!--footer区架构结束-->
<jsp:include page="include/footer.jsp" flush="true"></jsp:include>
<!--footer区架构结束-->

</body>

</html>
