<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.Station"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% HashMap jobfairInfo=(HashMap)request.getAttribute("jobfairInfo");
	if(jobfairInfo ==null){
		response.sendRedirect(request.getContentType()+"/");
		return;
	}
	String job_fair_id=(String)jobfairInfo.get("job_fair_id");
	String base_dir = request.getContextPath()+"/";
 %>
<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="keywords" content="<%=com.zhaopin.Config.getSiteKeywords() %>" />
<meta name="description" content="<%=com.zhaopin.Config.getSiteDescription() %>" />
<title>${jobfairInfo.job_fair_name } - <%=com.zhaopin.Config.getSiteTitle() %></title>

 
	<link href="/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen"/>
	<link href="/static/css/common-element.css" rel="stylesheet" type="text/css"/>
    	<link href="/static/css/wlzph-xiangqy.css" rel="stylesheet" type="text/css"/>
    <link href="/static/css/font-awesome.min.css" rel="stylesheet" media="screen"/>
    
    <script src="/statics/jquery/1.11.3/jquery.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.min.js"></script>
    <script src="/statics/artDialog/artDialog.js?skin=green" charset="utf-8"></script>
	<script src="/statics/artDialog/plugins/iframeTools.js"></script>
	<script src="/static/js/flow.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript" src="/static/js/jquery.downCount.js"></script>
</head>

<body> 

<!--头部架构开始-->
<jsp:include page="../include/header.jsp" flush="true"></jsp:include>
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
        <div style="clear:both"></div>
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

<div class="banner">
	<div id="carousel-generic" class="carousel slide" data-ride="carousel">
	  <!-- Indicators -->
	  <ol class="carousel-indicators">
	    <li class="active" data-target="#carousel-generic" data-slide-to="0"></li>
	    <li class="" data-target="#carousel-generic" data-slide-to="1"></li>
	  </ol>
	  <!-- Wrapper for slides -->
	  <div class="carousel-inner" role="listbox">
			<div class="item active">
				<a target="_blank" href="http://www.daqinrc.com/zk/">
					<img src="/static/images/ad/xljy.jpg" width="1024" height="274">
				</a>
			</div>
			<div class="item">
				<a target="_blank" href="http://www.daqinrc.com/lh/">
				<img src="/static/images/ad/xqybanner(luohu).png" width="1024" height="274">				
				</a>
			</div>
	  </div>
	  <!-- Controls -->
	   <a class="left carousel-control" href="#carousel-generic" role="button" data-slide="prev">
	    <span class="glyphicon glyphicon-chevron-left"></span>
	    <span class="sr-only">Previous</span>
	  </a>
	   <a class="right carousel-control" href="#carousel-generic" role="button" data-slide="next">
	    <span class="glyphicon glyphicon-chevron-right"></span>
	    <span class="sr-only">Next</span>
	  </a>
	</div>
</div>
<p class="position">当前所在位置：<a href="/jobfair/index.do?a=28">首页</a>&nbsp;&gt;&nbsp;<a href="/jobfair/wlzph.do"><%=jobfairInfo.get("job_fair_type_name") %></a>&nbsp;&gt;&nbsp;<%=jobfairInfo.get("job_fair_name") %></p>

<div class="main_mid"> 
	<p class="main_mid biaoti"><%=jobfairInfo.get("job_fair_name") %></p> 
	
	<div class="main_mid content">
		<div class="main_mid_l">
			<img src="/${empty jobfairInfo.poster_path?'static/img/wlzph_moren.png':jobfairInfo.poster_path}" width="287" height="184"/>
			<div class="main_mid_l_an">
 				<a class="an1" href="javascript:;" onclick="ComApply('<%=jobfairInfo.get("job_fair_id") %>','<%=jobfairInfo.get("school_id")%>')">企业订展</a>
 				<a class="an2" href="/netcongress/start.do?id=<%=jobfairInfo.get("job_fair_id") %>" target="_blank">进入会场</a>
 				<div style="clear:both"></div>
			</div>
		</div>
		<div class="main_mid_r">
			<p class="main_mid_r_message message1">
				举办单位：<a href="/jobfair/school.do?id=<%=jobfairInfo.get("school_id") %>" target="_blank"><%=jobfairInfo.get("school_name") %></a></p>
			<p class="main_mid_r_message">主办单位：<%=jobfairInfo.get("job_fair_sponsor") %></p>
			<p class="main_mid_r_message">承办单位：<%=jobfairInfo.get("job_fair_organizer") %></p>
			<p class="main_mid_r_message">时    间：<%=jobfairInfo.get("job_fair_time") %> 至 <%=jobfairInfo.get("job_fair_overtime") %></p>
			<p class="main_mid_r_message">招聘会规模：企业<%=jobfairInfo.get("job_fair_company_num") %>家 <!-- 求职者1800人 --></p>
			<p class="main_mid_r_message">招聘会层次：<%=jobfairInfo.get("job_fair_level") %></p>
			<p class="main_mid_r_message">招聘会特色：<%=jobfairInfo.get("job_fair_feature") %></p>
			<div class="main_mid_r djs">
				<ul class="daojishi down">
                	<li >
                		<span class="contdown_hose begin" style="display:none;">距招聘会开始:</span>
                		<span class="contdown_hose">距招聘会结束:</span>               		
                	</li>
                	<li ><span class="days">00</span>天</li>
                    <li ><span class="hours">00</span>小时</li>
                    <li ><span class="minutes">00</span>分</li>
                    <li ><span class="seconds">00</span>秒</li>
                </ul>
                <div class="daojishi closed" style="font-size:18px;text-align:center;color:red;font-weight:bold;display:none;">招聘会已结束</div>
                <div class="clear"></div>
            	<div class="xian"></div>
            	<script>
				$('.down').downCount({
					begin: '<%=jobfairInfo.get("job_fair_time").toString()%>',  
					date: '<%=jobfairInfo.get("job_fair_overtime").toString()%>',
					offset: +8 
				}, function () {
					jobfairOver();
					//alert('招聘会已结束!');
				});
			</script>
			</div>
		</div>
		<div style="clear:both"></div>
	</div>
</div>
<style type="text/css">
.main_but_nav li a {

    width: 329px;
}
#tongzhi img{
	width:100%;
}    
</style>
<div class="main_but">
  <div class="content">
  <div class="main_but_nav">
     <ul class="nav nav-tabs" role="tablist">
	      <li role="presentation" class="active">
	      		<a  class="yaoqinghan"  href="#yaoqinghan" aria-controls="profile" role="tab" data-toggle="tab">
	      			邀请函
	      		</a>
	      </li>
	      <li role="presentation">
	      		<a  class="tongzhi"  href="#tongzhi" aria-controls="profile" role="tab" data-toggle="tab">
	      			通知文件
	      		</a>
	      </li>
	      <li role="presentation">
	      		<a class="canhiuqiye companyList" href="#canhiuqiye" aria-controls="profile" role="tab" data-toggle="tab">
	      			参会企业
	      		</a>
	      </li>
	      
     </ul>
    </div>
     <div class="tab-content">
          <!--邀请函列表开始  -->
          <div role="tabpanel" class="tab-pane active" id="yaoqinghan">
  		  	<div class="text" >
 				<%
					String content=(String)jobfairInfo.get("job_fair_invitation");
					if( content==null ){
						content=new com.zhaopin.dao.factory.JobFairModel().getRecommend(job_fair_id);
						out.println( content );
					}else{
						out.println( com.zhaopin.Help.textToHtml( content ) );
					}
 				%>
			</div>
		</div>
		<div role="tabpanel" class="tab-pane" id="tongzhi">
			<div style="width:988px;">
				<ul>
					<li><img src="/upfiles/201609080009418/1.jpg" /></li>
					<li><img src="/upfiles/201609080009418/2.jpg" /></li>
					<li><img src="/upfiles/201609080009418/3.jpg" /></li>
					<li><img src="/upfiles/201609080009418/4.jpg" /></li>
					<li><img src="/upfiles/201609080009418/5.jpg" /></li>
					<li><img src="/upfiles/201609080009418/6.jpg" /></li>
				</ul>
			
			</div>
		</div>
		  <!--参会企业列表开始  -->
		  <div role="tabpanel" class="tab-pane" id="canhiuqiye">
			<div class="main_but_qiye">
				<ul class="main_but_qiye1" >
			 		<li class="xuhao">序号</li>
			 		<li class="gongsimingchen">公司名称</li>
			 		<li class="gongsidizhi">公司地址</li>
			 		<li class="toudijianli">投递简历</li>
			 	</ul>
			 	<%
					List companyList = (List)request.getAttribute("companyList") ;
					boolean isLogin= true;// session.getAttribute("userInfo") instanceof HashMap;
				%>				
				<%
    				if(!isLogin){
				%>
	             	<ul style="cursor:default;"><li>只有登陆用户才可以查看参会企业列表！<a href="<%=request.getContextPath() %>/register.jsp" target="_top">注册</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath() %>/" target="_top">登录</a></li></ul>
					<%
	  				}else if(companyList!=null &&companyList.size()>0){
	          	    	int i=0;
	            		for(Iterator iter=companyList.iterator();iter.hasNext();){
	            			HashMap row=(HashMap)iter.next();
	            	%>
	            		<ul class="main_but_qiye1" style="cursor:default;">
	            		<li class="xuhao"><%=row.get("rn") %></li>
	            		<li class="gongsimingchen"><a href="/jobfair/company.do?id=<%=row.get("company_id")%>" target="_blank"><%=row.get("company_name")%></a>	</li>
	            		<li class="gongsidizhi"><%=row.get("company_addr")==null?"":row.get("company_addr")%></li>
	            		<li class="toudijianli"><a href="/jobfair/company.do?id=<%=row.get("company_id").toString() %>&jobs=1" target="_blank">投递简历</a></li>
						</ul>
						<%
	             	}
	    	}else{ %>
	             		<ul class="main_but_qiye1" style="cursor:default;"><li class="xuhao" style="width:960px;">还没有企业申请参会！</li></ul>
	             	<% 

				}
	    			%>  
	    				
		  </div>
		  <!--分页div开始  -->
		  <div style="text-align:center;">
		  	<ul class="main_but_qiye1" style="cursor:default;">
	    		<li class="xuhao" style="width:960px;">${pagenation}</li>
       		</ul>
		  </div>
		  <% if(  request.getParameter("page")!=null ) {%>
			<script type="text/javascript">
				$(function(){
					$(".companyList").trigger("click");
				});
			</script>
		  <% } %>
	    </div>
	</div>
  </div> 
</div>

	<div style="clear:both"></div>
</div>
<!--main架构结束-->

<!--footer区架构结束-->
<jsp:include page="../include/footer.jsp" flush="true" ></jsp:include>
<!--footer区架构结束-->
</body>
</html>