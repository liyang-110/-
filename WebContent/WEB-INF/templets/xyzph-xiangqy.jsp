<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.Station"%>
<%@ page import ="com.zhaopin.bean.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	HashMap jobfairInfo = (HashMap)request.getAttribute("jobfairInfo");
	if(jobfairInfo==null){
		response.sendRedirect( request.getContentType()+"/");
		return;
	}
	String job_fair_id=(String)jobfairInfo.get("job_fair_id");
	String base_dir = request.getContextPath()+"/";
	
	UserInterface user = User.currentUser(session);
	String userType="";
	if(user!=null){
		userType=user.getUserType();
	}
%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="keywords" content="<%=com.zhaopin.Config.getSiteKeywords() %>" />
<meta name="description" content="<%=com.zhaopin.Config.getSiteDescription() %>" />
<title><%=jobfairInfo.get("job_fair_name") %> - <%=com.zhaopin.Config.getSiteTitle() %></title>
	<jsp:include page="include/weixin_zphxqy.jsp" flush="true" />
	<link href="/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen"/>
	<link href="/static/css/common-element.css" rel="stylesheet" type="text/css"/>
    <link href="/static/css/xyzph-xiangqy.css" rel="stylesheet" type="text/css"/>
    <link href="/static/css/font-awesome.min.css" rel="stylesheet" media="screen"/>
    
    <script src="/statics/jquery/1.11.3/jquery.min.js"></script>
    <script src="/static/js/jquery.easyui.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.min.js"></script>
    <script src="/statics/artDialog/artDialog.js?skin=aero" charset="utf-8"></script>
	<script src="/statics/artDialog/plugins/iframeTools.js"></script>
	<script src="/static/js/flow.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript" src="/static/js/jquery.downCount.js"></script>
	<script>
		$(function(){
			//首页投递简历跳转 参数flag=1
			var flag=${empty flag?0:flag}
			if(flag==1){
				location.href = "#flag";      // firstAnchor为锚点名称
				window.location.hash = flag; // firstAnchor为锚点名称
				$(".companyList").trigger("click");
			}
		});
	</script>
	<script type="text/javascript">
	var cur_path ="<%=request.getContextPath()%>";
	var job_fair_id="<%=(String)jobfairInfo.get("job_fair_id")%>";
	var user_type="<%=userType%>";
	</script>
	<script src="/static/js/favorite_zph.js" type="text/javascript" charset="utf-8"></script>
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
		<c:choose> 
			<c:when test="${empty xyxq_A_0 }">
				<a href="javascript:;">
					<img src="/static/img/xiangqy_banner.png">
				</a>
			</c:when>
			<c:otherwise>
				<c:forEach var="row" items="${xyxq_A_0 }">
				<a href="${empty row.ad_url?"javascript:;":row.ad_url }">
					<img src="/${row.ad_pic_path }">
				</a>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>

	<p class="position">当前所在位置：<a href="/jobfair/index.do?a=28">首页</a>&nbsp;&gt;&nbsp;<a href="/jobfair/xyzph.do">${jobfairInfo.job_fair_type_name}</a>&nbsp;&gt;&nbsp;${jobfairInfo.job_fair_name}</p>

<div class="main_l">
	<div>
		<img src="/${empty jobfairInfo.logo_path?'static/img/moren_logo.png':jobfairInfo.logo_path }" width="226" height="226">
	</div>
	<div>
		<div class="biaoti"><span>高校简介</span></div>
		<div class="sch_info" >${jobfairInfo.school_info }</div>
		<p class="look"><a href="/jobfair/school.do?id=${jobfairInfo.school_id}" target="_blank" class="seeMore">查看更多&gt;&gt;</a></p>
	</div>
	<div>
		<div class="biaoti""><span>该校近期招聘会</span></div>
		<div class="jobfair_info">
		<c:if test="${empty jobfairlist }">
			<p>暂无招聘会！</p>
		</c:if>
		<c:forEach var="row" items="${jobfairlist }">
			<div ><a href="/jobfair/detail.do?id=${row.job_fair_id }" target="_blank" class="main_l_a">${row.job_fair_name }</a><p style="float:left;padding-left:5px;font-size:13px;line-height:24px;">${row.job_fair_time }</p></div>
		</c:forEach>
		</div>
	</div>
</div>

<div class="main_r">
	<div class="main_mid"> 
		<div class="main_mid content">
			<div class="main_mid_l">
				<p class="main_mid_l_message biaoti">${jobfairInfo.job_fair_name}</p>

				<p class="main_mid_l_message message1">
				<span class="main_l_span">主办单位</span>：<a href="/jobfair/school.do?id=${jobfairInfo.school_id}" target="_blank">${jobfairInfo.job_fair_sponsor}</a></p>

				<p class="main_mid_l_message">
				<span class="main_l_span">承办单位</span>：${jobfairInfo.job_fair_organizer}</p>
				<c:if test="${not empty jobfairInfo.cooperate_organizer }">
				<p class="main_mid_l_message">
				<span class="main_l_span">协办单位</span>：${jobfairInfo.cooperate_organizer}</p>
				</c:if>
				<p class="main_mid_l_message"><span class="main_l_span">举办时间</span>：${jobfairInfo.job_fair_time} 至 ${jobfairInfo.job_fair_overtime} </p>
				<p class="main_mid_l_message"><span>招聘会规模</span>：企业${jobfairInfo.job_fair_company_num}家 <!-- 求职者1800人 --></p>
				<p class="main_mid_l_message" id="flag" ><span>招聘会层次</span>：${jobfairInfo.job_fair_level}</p>
				<p class="main_mid_l_message"><span>招聘会特色</span>：${jobfairInfo.job_fair_feature}</p>
				<div class="main_mid_r">
					<ul class="daojishi down djscss">
                		<li >
                			<span class="contdown_hose">距招聘会结束:</span>
                			<span class="contdown_hose begin" style="display:none;">距招聘会开始:</span>
                		</li>
                		<li ><span class="days begin1">00</span>天</li>
                    	<li ><span class="hours begin1">00</span>小时</li>
                    	<li ><span class="minutes begin1">00</span>分</li>
                    	<li ><span class="seconds begin1">00</span>秒</li>
                	</ul>
                	<div class="daojishi closed" style="font-size:18px;text-align:center;color:red;font-weight:bold;display:none;">招聘会已结束</div>
                	<div class="clear"></div>
            		<div class="xian"></div>  
            		<script>
						$('.down').downCount({
							begin: '${jobfairInfo.job_fair_time}',  
							date: '${jobfairInfo.job_fair_overtime}',
							offset: +8 
						}, function () {
							jobfairOver();
							//alert('招聘会已结束!');
						});
					</script>
				</div>
				<div style="clear:both"></div>
			</div>			
			<c:choose>
				<c:when test="${jobfairInfo.begin eq 1 }">
					<div class="main_mid_ll">
						<img src="/static/img/wlxqbegin1.png" class="begin">
						<div>
							<a class="main_mid_ll_qiyedingzhan" href="javascript:;" onclick="ComApply(${jobfairInfo.job_fair_id },${jobfairInfo.school_id})">企业订展</a>
							<a class="an3" id="open_favorite_btn" href="javascript:;">点击收藏</a>
						</div>
					</div>
				</c:when>
				<c:when test="${jobfairInfo.begin eq 2 }">
					<div class="main_mid_ll">
						<img src="/static/img/wlxqbegin2.png" class="begin">
						<div>
							<a class="main_mid_ll_qiyedingzhan" href="javascript:;" onclick="ComApply(${jobfairInfo.job_fair_id },${jobfairInfo.school_id})">企业订展</a>
							<a class="an3" id="open_favorite_btn" href="javascript:;">点击收藏</a>
						</div>
					</div>
					<script>
					$(function(){
						$(".daojishi").removeClass("djscss");
						$(".daojishi").addClass("djscss1");
						$(".begin1").addClass("begin2");
						$(".begin1").removeClass("begin1");
					});	
					</script>
				</c:when>
				<c:otherwise>
					<img src="/static/img/wlxqbegin3.png" width="88" height="74" style="margin:80px 0 49px 0">
				</c:otherwise>
			</c:choose>
			
			<div style="clear:both"></div>
		</div>
	</div>

<div class="main_but">
	<div class="content">
		<div class="main_but_nav">
		<!--分享开始  -->
			<div style="float:right;">
			<span style="float:left;margin:6px 0 0 -56px;">分享到：</span>
				<div class="bdsharebuttonbox">
  					<a href="#" class="bds_more" data-cmd="more"></a>
  					<a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
  					<a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
  					<a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
  					<a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a>
				</div>
				<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"24"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
			</div>
<!--分享结束  -->
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active">
	      			<a  class="yaoqinghan"  href="#yaoqinghan" aria-controls="profile" role="tab" data-toggle="tab">
	      				邀请函
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
		 <!--参会企业列表开始 -->
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
	             	<ul class="main_but_qiye1"><li style="cursor:default;">只有登陆用户才可以查看参会企业列表！<a href="<%=request.getContextPath() %>/register.jsp" target="_top">注册</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath() %>/" target="_top">登录</a></li></ul>
					<%
	  	}else if(companyList!=null &&companyList.size()>0){
	          	    int i=0;
	            	for(Iterator iter=companyList.iterator();iter.hasNext();){
	            		HashMap row=(HashMap)iter.next();
	            	%>
	            		<ul class="main_but_qiye1" style="cursor:default;">
	            		<li class="xuhao"><%=row.get("rn") %></li>
	            		<li class="gongsimingchen"><a href="/jobfair/company.do?id=<%=row.get("company_id")%>" target="_blank"><%=row.get("company_name")%></a>	</li>
	            		<li class="gongsidizhi"><%=row.get("company_addr")==null?"暂无地址！":row.get("company_addr")%></li>
	            		<li class="toudijianli"><a href="/jobfair/company.do?id=<%=row.get("company_id").toString() %>&jobs=1" target="_blank">投递简历</a></li>
						</ul>
						<%
	             	}
	    }else{ %>
	             	<ul class="main_but_qiye1"><li class="xuhao" style="width:730px;">还没有企业申请参会！</li></ul>
	             	<% 

		}
	    %>
	    
		</div>
		<!--分页div开始 -->
		<div style="text-align:center;">
			<ul class="main_but_qiye1" style="cursor:default;">
	    		<li class="xuhao" style="width:730px;">${pagenation}</li>
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
	
	</div><!-- tabcontent -->
  </div> 
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