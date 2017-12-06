<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.Station"%>
<%@ page import="com.zhaopin.bean.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title> 校园招聘会</title>
 
	<link href="/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link href="/static/css/common-element.css" rel="stylesheet" type="text/css">
    <link href="/static/css/xyzph.css" rel="stylesheet" type="text/css">
    <link href="/static/css/font-awesome.min.css" rel="stylesheet" media="screen">
    
    <script src="/statics/jquery/1.11.3/jquery.min.js" charset="utf-8"></script>
    <script src="/static/bootstrap/js/bootstrap.min.js"></script>
    <script src="/statics/artDialog/artDialog.js?skin=aero" charset="utf-8"></script>
	<script src="/statics/artDialog/plugins/iframeTools.js"></script>
	<script src="/static/js/flow.js" type="text/javascript" charset="utf-8"></script>
	
	<script type="text/javascript">
  $(function(){
  	$("select[name='keyword']").change(function(){
     $(this).parents("form").submit();
	});  
  });  
  </script>
</head>
<body> 

<!--头部架构开始-->
<jsp:include page="include/header.jsp"></jsp:include>
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
<img src="/static/images/ad/xljy.jpg"  width="1024" height="274">
<div style="clear:both"></div>

</div>
-->
<div class="main_l">
	 <% ComUserBean companyUser = (ComUserBean)User.getUser("company", session);
	 	if( companyUser!=null && "member_type_01".equals( companyUser.getMemberType() ) ){ %>
     <div class="alert alert-warning" role="alert">
     	<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
     	<p>请联系211校招网招聘顾问，为您专业推荐最新最全的招聘会讯息！
     	</p>
     </div>
     <% }%>
	 <c:forEach var="row" items="${multiple }">
     <div class="box">
     	<div style="width:540px;height:168px;float:left">
      	  <a href="/jobfair/detail.do?id=${row.job_fair_id }" target="_blank">
      	  		<img src="/${empty row.school_poster_path?'static/img/xyzph_moren.jpg':row.school_poster_path }" width="540" height="168"></a>
		</div>
		<c:choose>
			<c:when test="${row.begin eq 1 }">
				<div style="width:156px;height:168px;float:left;">
					<img src="/static/img/wlxqbegin1.png" class="begin">
				</div>
     			<div style="clear:both;"></div>
     			<div style="padding:10px 0px;">  
	      			<div class="box_l">
	      			<a href="/jobfair/detail.do?id=${row.job_fair_id }" target="_blank">
             		${row.job_fair_name }</a>
	            	<h2>时间：${row.job_fair_time }</h2>
	            	<h2>地址：${row.job_fair_addr }</h2>                      
	      			</div>          
	      		<div class="box_m"> 
					<a class="an1" href="javascript:;" onclick="ComApply(${row.job_fair_id },${row.school_id })">企业订展</a>
					<div style="clear:both"></div>     
	       		</div>        
	       		<div class="box_r ">
	       			<h2>截止目前:</h2>
					<h2>入展企业 <span>${row.company_num }</span> 家</h2>
					<h2>发布岗位 <span>${row.position_num } </span>个</h2>          
	        	</div> 
	        	<div style="clear:both"></div>
				</div> 
			</c:when>
			<c:when test="${row.begin eq 2 }">
				<div style="width:156px;height:168px;float:left;">
					<img src="/static/img/wlxqbegin2.png" class="begin">
				</div>
     			<div style="clear:both;"></div>
     			<div style="padding:10px 0px;">  
	      		<div class="box_l">
	      			<a href="/jobfair/detail.do?id=${row.job_fair_id }" target="_blank">
             		${row.job_fair_name }</a>
	            	<h2>时间：${row.job_fair_time }</h2>
	            	<h2>地址：${row.job_fair_addr }</h2>                      
	      		</div>          
	      		<div class="box_m">
	      			<a class="an1" href="javascript:;" onclick="ComApply(${row.job_fair_id },${row.school_id })">企业订展</a>
					<div style="clear:both"></div> 
	       		</div>        
	       		<div class="box_r ">
	       			<h2>截止目前:</h2>
					<h2>入展企业 <span>${row.company_num }</span> 家</h2>
					<h2>发布岗位 <span>${row.position_num } </span>个</h2>          
	        	</div> 
	        	<div style="clear:both"></div>
				</div> 
			</c:when>		
			<c:otherwise>
				<div style="width:156px;height:168px;float:left;">
					<img src="/static/img/wlxqbegin3.png" width="88" height="74" class="begin">
				</div>
     			<div style="clear:both;"></div>
     			<div style="padding:10px 0px;">  
	      		<div class="box_l">
	      			<a href="/jobfair/detail.do?id=${row.job_fair_id }" target="_blank">
             		${row.job_fair_name }</a>
	            	<h2>时间：${row.job_fair_time }</h2>
	            	<h2>地址：${row.job_fair_addr }</h2>                      
	      		</div>          
	      		<div class="box_m"> 
	       		</div>        
	       		<div class="box_r ">
	       			<h2>截止目前:</h2>
					<h2>入展企业 <span>${row.company_num }</span> 家</h2>
					<h2>发布岗位 <span>${row.job_person_num } </span>个</h2>          
	        	</div> 
	        	<div style="clear:both"></div>
				</div> 
			</c:otherwise>
		</c:choose>
		 
     </div>
     </c:forEach>
     <div style="text-align:center;">
     	<% if( User.currentUser(session) !=null ){%>
     	${pagination }
     	<% }else{ %>
     	<div class="alert alert-danger" role="alert">
     	请<a href="javascript:;" onclick="open_login_layer();">登录211校招网</a>，查看更多招聘会   
     	</div>
     	<% } %>
     </div>
     <div style="clear:both"></div>

</div>

 <div class="main_r">
  <div>
  <form method="get">
	  <input class="gjzss" type="text" name="keyword" value="${params.keyword }" placeholder="请输入关键字" />
	  <input class="ss" type="submit" value="搜索"/>
  </form>
  <div style="clear:both"></div>
  </div>
  
  <div>
  <form><div class="xxss">筛选：</div></form>
  <form method="get">
  	<select name="keyword" style="width: 226px;margin-top: 14px;border: 1px solid #f0f0f9;line-height: 34px;
    height: 34px;">
    		<option value="">举办单位</option>
  		<c:forEach var="row" items="${jobfairdrop }">
			<option value="${row.school_name }">${row.school_name }</option>
    	</c:forEach>      
  	</select>
  </form>
  
  <div style="clear:both"></div>
  </div>
<!--往期招聘会  -->
  <div class="hot_name">往期招聘会</div>
  <div class="hot">
  	<c:forEach var="row" items="${hotmultiple }">   
 		<ul class="hot_ul">
			<li>
            	<a href="/jobfair/detail.do?id=${row.job_fair_id }" target="_blank" style="line-height:80px;">
            		<div class="hot_l">
            		<img src="/${empty row.logo_path?'static/img/wlzph_moren.png':row.logo_path}" width="70" height="70">
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
	<div class="ads">
		<!--<a href="javascript:;"><img src="/static/images/ad/xianfy-mt.jpg"  width="274" height="98"></a>-->    
		<ul>
        	<c:forEach var="row" items="${xyzph_B_3}">
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
<jsp:include page="include/footer.jsp" flush="true"></jsp:include>
<!--footer区架构结束-->


</body>
</html>