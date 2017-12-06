<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.Station"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title> 网络招聘会</title>
 
	<link href="/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen"/>
	<link href="/static/css/common-element.css" rel="stylesheet" type="text/css"/>
    <link href="/static/css/wlzph.css" rel="stylesheet" type="text/css"/>
    <link href="/static/css/font-awesome.min.css" rel="stylesheet" media="screen"/>
    
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

<!--main架构开始-->
<div class="main">

     <div id="latest_log" class="news" style="overflow:hidden;margin-top:10px;">
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
                        box2.onmouseover=function(){can=false;}; 
                        box2.onmouseout=function(){can=true;}; 
                        $(function (){ 
                            var stop=box2.scrollTop%30==0&&!can; 
                            if(!stop)box2.scrollTop==parseInt(box2.scrollHeight/2)?box2.scrollTop=0:box2.scrollTop++; 
                            setTimeout(arguments.callee,box2.scrollTop%30?10:2000); 
                        }); 
                </script>
      </div>   
<!-- 
<div class="banner">
	<img src="/static/images/ad/smrc93.jpg" width="1024" height="274">
<div style="clear:both"></div>
</div>
-->
<div class="main_l">
	<div>
	 <c:forEach var="row" items="${netcongress }">
     <div class="box">
     <ul style="margin-bottom:0px;">
	     
	     <li>    
            <a href="/jobfair/detail.do?id=${row.job_fair_id }" target="_blank">
            <div class="box_l">
            	<img src="/${empty row.poster_path?'static/img/wlzph_moren.png':row.poster_path}" width="280" height="178">
            </div>
            </a>
             <div class="box_r">
             <a class="h1" href="/jobfair/detail.do?id=${row.job_fair_id }" target="_blank">
             	${row.job_fair_name }
             </a>
             <h2>开始时间：${row.job_fair_time }</h2>
             <h2>结束时间：${row.job_fair_overtime }</h2>
             <h2>
             <a class="an1" href="javascript:;" onclick="ComApply(${row.job_fair_id },${row.school_id })">企业订展</a>
             <a class="an2" href="/netcongress/start.do?id=${row.job_fair_id }" target="_blank">进入会场</a>
            <div style="clear:both"></div>
             </h2>
             
             <h2>
             大厅LIVE：${row.company_num} 家企业，${row.resume_size } 位求职者
            </h2>
             </div>  
			<div style="float:left;width:104px;height:178px;">
				<c:if test="${row.begin eq 1}">
            		<img src="/static/img/begin1.png" >
            	</c:if>
            	<c:if test="${row.begin eq 2}">
            		<img src="/static/img/begin2.png" >
            	</c:if>
            	<c:if test="${row.begin eq 3}">
            		<img src="/static/img/begin3.png" >
            	</c:if>
			</div>
          </li>
  		
        </ul>
     </div>
     </c:forEach>
     <div style="text-align:center;">
     	${pagination }
     </div>
     </div>
     
</div>
<div class="main_r">
<!--搜索  -->
	<div>
  		<form method="get">
	  		<input class="gjzss" type="text" name="keyword" value="${params.keyword }" placeholder="请输入关键字" />
	  		<input class="ss" type="submit" value="搜索"/>
  		</form>
  		<div style="clear:both"></div>
	</div>
<!--往期招聘会  -->
	<div class="hot_name">往期招聘会</div>
	<div class="hot">
  	<c:forEach var="row" items="${hotnetcongress }">
  	  
 		<ul class="hot_ul">
			<li>
            	<a href="/jobfair/detail.do?id=${row.job_fair_id }" target="_blank" style="line-height:80px;">
            		<div class="hot_l">
            		<img src="/${empty row.poster_path?'static/img/wlzph_moren.png':row.poster_path}" width="90" height="60">
            		</div>
            	</a>
            	<div class="hot_r">
             		<a href="/jobfair/detail.do?id=${row.job_fair_id }" target="_blank">
             		${row.rn }、${row.job_fair_name }
             		</a>
             		<p style="font-size:8px;color:#999;margin:10px 0 0 0;">开始时间：${row.job_fair_time}</p>
             		<p style="font-size:8px;color:#999;margin:0px;">结束时间：${row.job_fair_overtime}</p>
             		
             	</div>
            </li>
		</ul>
		<div style="clear:both"></div>
    </c:forEach>
	</div>
<!--广告  -->
	 <div class="ads">
		<!--<a  href="javascript:;"><img src="/static/images/ad/yrtz6.jpg" width="274" height="164"></a>-->        	
		<ul>
        	<c:forEach var="row" items="${wlzph_B_3}">
            	<li>
            		<a target="_blank" href="${row.ad_url}">
            			<img src="/${row.ad_pic_path}" width="306" height="98"/>
            		</a>
            	</li>
            </c:forEach>
          </ul>
	</div>
</div>
<div style="clear:both"></div>
</div>
<!--main架构结束-->

<!--footer区架构结束-->
<jsp:include page="include/footer.jsp" flush="true" ></jsp:include>
<!--footer区架构结束-->
</body>
</html>