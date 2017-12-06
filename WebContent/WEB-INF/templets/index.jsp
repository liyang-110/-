<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.Station"%>
<%@ page import ="com.zhaopin.bean.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="keywords" content="<%=com.zhaopin.Config.getSiteKeywords() %>" />
<meta name="description" content="<%=com.zhaopin.Config.getSiteDescription() %>" />
<meta name="author" content="">
<title><%=com.zhaopin.Config.getSiteTitle() %></title>
<%
		StudentSessionBean userInfo = (StudentSessionBean)User.getUser("student", session);
		String head_logo = userInfo!=null?userInfo.getLogo():null;
		String name = userInfo!=null?userInfo.getUserName():null;
%> 
<%if(name!=null){ %>
	<style type="text/css">
		.denglu{
			display:none;
		}
	</style>
<%} else{%>
	<style type="text/css">
		.stucard{
			display:none;
		}
	</style>
<%} %>
	<link href="/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="/static/css/common-element.css" rel="stylesheet" type="text/css">
	<link href="/static/css/index-style.css" rel="stylesheet" type="text/css">
    <link href="/static/css/font-awesome.min.css" rel="stylesheet" media="screen">
    <script src="/static/jquery/1.11.3/jquery.min.js"></script>
</head>
<body>
<!--头部架构开始-->
<jsp:include page="include/header.jsp" flush="true"></jsp:include>
<!--头部架构结束-->
<img src="/images/zhaopin-211xiaozhaowang.jpg" style="display:none;"/>
<!--banner框架结构开始-->
<div class="banner" style="background:none;">
	<c:if test="${empty index_A_0 }">
	<div id="carousel-generic" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
		    <li class="active" data-target="#carousel-generic" data-slide-to="0"></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<div class="item active">
	 			<a style="background:url('/static/image/default_banner.png');" href="https://www.baidu.com/s?word=211校招网" target="_blank"></a>
			</div>
		</div>
			  <!-- Controls -->
	  <a class="left carousel-control" href="#carousel-generic" role="button" data-slide="prev">
	   <!--  <span class="glyphicon glyphicon-chevron-left"></span> 侧滑箭头-->
	    <span class="sr-only">Previous</span>
	  </a>
	  <a class="right carousel-control" href="#carousel-generic" role="button" data-slide="next">
	    <!-- <span class="glyphicon glyphicon-chevron-right"></span> 侧滑箭头-->
	    <span class="sr-only">Next</span>
	  </a>
	</div>
	</c:if>
	
	<c:if test="${not empty index_A_0 }">
	<div id="carousel-generic" class="carousel slide" data-ride="carousel">
	  <!-- Indicators -->
	  <ol class="carousel-indicators">
	  	<c:forEach var="vo" items="${index_A_0 }"  varStatus="status">
			<li class="${status.first?'active':'' }" data-target="#carousel-generic" data-slide-to="${status.index }"></li>
	  	</c:forEach>
	  </ol>
	  <!-- Wrapper for slides -->
	  <div class="carousel-inner" role="listbox">
		<c:forEach var="vo" items="${index_A_0 }" varStatus="status">
			<div class="item ${status.first?'active':'' }">
	 			<a style="background:url('/${vo.ad_pic_path}');" href="${vo.ad_url }" target="_blank">
				</a>
			</div>
		</c:forEach>
	  </div>
	  <!-- Controls -->
	  <a class="left carousel-control" href="#carousel-generic" role="button" data-slide="prev">
	   <!--  <span class="glyphicon glyphicon-chevron-left"></span> 侧滑箭头-->
	    <span class="sr-only">Previous</span>
	  </a>
	  <a class="right carousel-control" href="#carousel-generic" role="button" data-slide="next">
	    <!-- <span class="glyphicon glyphicon-chevron-right"></span> 侧滑箭头-->
	    <span class="sr-only">Next</span>
	  </a>
	</div>
	</c:if>
	

</div>
<div class="banner" style="height:auto;">
      <%-- <div class="banner_inner">
       <div class="denglu">
       	<div class="switch_login_control">
	       <a class="woshigeren active" href="javascript:;">我是个人</a>
	       <a class="woshidanwei" href="javascript:;">我是单位</a>
       	</div>
       	<script type="text/javascript">
       		$(".switch_login_control").find("a").bind("click",function(e){
       			e.preventDefault();
       			$(this).siblings().removeClass("active");
       			$(this).addClass("active");
       			$(".login_form .yonghuming").focus();
       		});
       	</script>
        <form class="login_form">
         <input class="yonghuming" type="text" name="user_id" placeholder="账号" errorcontent="请输入用户名！"/>
         <input class="mima" type="password" name="user_pass" placeholder="密码" errorcontent="请输入密码！"/>   
       <div class="jizhumima">
       		<label class="checkbox autologin" >
       		<input type="checkbox" name="rememberMe" value="on" value="记住密码">自动登录 
       		</label>
       </div>
       <a class="wangjimima" href="/forget.do" target="_blank">忘记密码？</a>
       <input class="denglu_button" type="submit" value="登录">
       <span>
       	没有账号？
       </span>
       <a href="/register.jsp" target="_blank">快速注册</a>
       <a class="qqdenglu" target="_blank" href="http://www.211zph.com/auth/index.do">
       		<img src="/static/images/qq_icon.png">
       	</a>
       <a class="qqdenglu" target="_blank" href="http://www.211zph.com/auth/wxLogin.do">
       		<img src="/static/images/weichat.png">
       </a>
       <div style="clear:both;"></div>
       </form>
       </div>
		<div class="stucard" >
			<div class="card_header">
				<div class="card_l">
					<img class="card_img" width="60" height="60"  src="<%=head_logo!=null?"/upload/headpic/"+head_logo:"/static/images/personal_center/user.png"%>" alt="<%=name %>" >
				</div>
				<div class="card_r">
					<p class="card_rp"><a href="/loginOut.do?method=exitData" ><i class="fa fa-power-off"></i> 退出</a></p>
					<p class="card_rn"><%=name %></p>
					<p><a href="/student/stuInform.do?action=mianshi">面试通知</a></p>
					<p><a href="/student/stuInform.do?action=luyong">录用通知</a></p>
				</div>
			</div>
			<div class="card_bottom">
				<div>
					<i class=" fa fa-pencil-square-o"></i></br>
					<a href="/student/sResumet.do">修改简历</a>
				</div>
				<div style="width:88px;border-left:2px solid #C7C2C2;border-right:2px solid #C7C2C2;">
					<i class=" fa fa-paper-plane"></i></br>
					<a href="/student/sMessage.do?type=resumeYes">投递记录</a>
				</div>
				<div style="border:none;">
					<i class=" fa fa-user"></i></br>
					<a href="/student/sCenter.do">个人中心</a>
				</div>
			</div>
		</div>
     	<script type="text/javascript">
			  $(function(){
				  Login.init();	
			  });
		</script>
       </div> --%>
</div>
<!--banner框架结构结束-->
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
     <!--搜索框构架开始-->
     <div class="search">
     <div class="search_left">
     <form id="fm" method="post" name="fm" action="/jobfair/search.do">
     		<input type="hidden" name="in_pagenum" value="20" />
     		<input type="hidden" name="in_r" value="co" />
     <ul>
     <li>
     		<div class="zph_b">
     			<div style="height:12px;"></div>
     			<div class="arrow"></div>
     		</div>
     		<select class="zph" name="type" >
      			<option value="search_recruit">
      				职位
      			</option>
     			<option value="search_jobfair">
     				招聘会
     			</option>
     		</select>
     </li>
     <li>
     		<input class="xjzph" type="text" value="" name="in_key" placeholder="请输入职位关键词：如人事专员等"/>
     </li>
     <li>
     		<input class="ss" type="submit" value="&nbsp;&nbsp;&nbsp;"/>
     	
     </li>   
     </ul>
     </form>
     <div style="clear:both"></div>
     </div>    
     <div class="search_right">
     <a href="/jobfair/search.do?type=search_recruit" class="gjss">高级搜索</a>
     
     </div>
     <div style="clear:both"></div>
     <p id="hotSearch">热门职位：
     			<a href="javascript:;">java</a>
     			<a href="javascript:;">市场总监</a>
     			<a href="javascript:;">会计</a>
     			<a href="javascript:;">新媒体运营</a>
     			<a href="javascript:;">采购经理</a>
     			<a href="javascript:;">助理</a>
     			<a href="javascript:;">行政人事</a>
     </p>
     </div>
     <div class="wlzph">
     	  <div class="zphcaption">
     	  	  <div class="title_c">
		          <div class="title">
		          		<img src="/static/images/wlzph_icon.png" width="28" height="28">
                        <p>网络招聘会</p>
                        <a class="more" href="/jobfair/wlzph.do">会员查看更多(${jobfairCount.net_all_count }场)</a>
		          </div>
		      </div>
          </div>
          <div class="wl_top">
          <ul>
          <c:forEach var="row" items="${requestScope.netcongress }">
          <li>
            	<div class="pic" >
            		<a href="/jobfair/detail.do?id=${ row.get('job_fair_id') }" target="_blank" style="display:block;width:230px;height:145px;">
            			<img id="img" src="/${empty row.get('poster_path')?'static/img/wlzph_moren.png':row.get('poster_path') }"/>
            		</a>
            	</div> 
            	<h1>
            	<a href="/jobfair/detail.do?id=${ row.get('job_fair_id') }" target="_blank">
            	<c:if test="${row.get('begin')>0}">
            				<img src="/static/img/going.gif">
            			</c:if>
            			${row.get("job_fair_name")}
            	</a>
            	</h1>
            	<h2>时间：${row.get("job_fair_date") }</h2> 
				<a class="toudijianli" href="/netcongress/start.do?id=${row.get('job_fair_id') }" target="_blank">进入会场</a>
				<a class="qiyedingzhan" href="javascript:;" onclick="ComApply(${row.get('job_fair_id') },${row.get('school_id') })">企业订展</a>
           </li>
           </c:forEach>      
          </ul>
          </div>
           <div style="clear:both"></div>
     
     </div>
      <!--网络招聘会构架结束-->
      
      <!--广告构架开始--> 
   <div class="ad_c">
    	<div class="ad1-1">
        	<ul>
            		<c:forEach var="row" items="${index_B_1 }">
            		<li>
            			<a target="_blank" href="${row.ad_url}">
            				<img src="/${row.ad_pic_path}" />
            			</a>
            		</li>
            		</c:forEach>
            </ul>
		</div>
		<div style="clear:both;"></div>
    	<div class="ad1-2">
            	<ul>
            		<c:forEach var="row" items="${index_B_2 }">
            		<li>
            			<a target="_blank" href="${row.ad_url}">
            				<img src="/${row.ad_pic_path}" />
            			</a>
            		</li>
            		</c:forEach>
                </ul>
         </div>
         <div style="clear:both;"></div>
         <div class="ad1-3">
            	<ul>
            		<c:forEach var="row" items="${index_B_3 }">
            		<li>
            			<a target="_blank" href="${row.ad_url}">
            				<img src="/${row.ad_pic_path}" />
            			</a>
            		</li>
            		</c:forEach>
                </ul>
         </div>
         <div style="clear:both;"></div>
    </div>
      <!--广告构架结束--> 
    <!--校园招聘会构架开始-->        
    <div class="xyzph">
     	  <div class="zphcaption">
     	  	  <div class="title_c">
		          <div class="title">
                  		<img src="/static/images/xyzph_icon.png" width="28" height="28">
		          		<p>校园招聘会</p>
		          		<% if( User.currentUser(session)!=null){ %>
	          			<a class="more" href="/jobfair/xyzph.do">会员查看更多(${jobfairCount.sch_all_count }场)</a>
	            		<% }else{ %>
	         			<a class="more" href="javascript:;" onclick="open_login_layer();">会员查看更多(${jobfairCount.sch_all_count }场)</a>   
	           	 		<% } %>
		          </div>
		      </div>
          </div>
          <div class="xy_top">
          <ul>
          <c:forEach var="row" items="${requestScope.multiple }">
          <li>
            
            <div class="xy_top_l">
            	<a href="/jobfair/detail.do?id=${ row.get('job_fair_id') }" target="_blank">
            		<img src="/${empty row.get('logo_path')?'static/img/moren_logo.png':row.get('logo_path') }" width="116" height="116">
            	 	<c:if test="${row.get('begin')>0}">
            			<img src="/static/img/beginning2.png" class="beginning2">
            		</c:if>
            	 </a> 
            </div> 
             <div class="xy_top_r">
             <h1>
             <a href="/jobfair/detail.do?id=${ row.get('job_fair_id') }" target="_blank">
             ${row.get("job_fair_name") }
              </a> 
             </h1>
             <h2>时间：${row.get("job_fair_date") }</h2>
             <h2>地址：${row.get("job_fair_addr") }</h2> 
             </div>
            
             <div class="ckxq">
                <a class="toudijianli" href="/jobfair/detail.do?id=${ row.get('job_fair_id') }&flag=1" target="_blank" >投递简历</a>
             	<a class="qiyedingzhan" href="javascript:;" onclick="ComApply(${row.get('job_fair_id') },${row.get('school_id') })">企业订展</a>            	
             </div>
          </li>
          </c:forEach>
      </ul>
                    
          </div>
          <div style="clear:both"></div>
    </div>
       <!--校园招聘会构架结束-->
      <!--广告构架开始-->   

    <div class="ad_c">
    	<div class="ad1-1">
        	<ul>
            	<c:forEach var="row" items="${index_C_1 }">
            		<li>
            			<a target="_blank" href="${row.ad_url}">
            				<img src="/${row.ad_pic_path}" />
            			</a>
            		</li>
            	</c:forEach>
            </ul>
		</div>
		<div style="clear:both;"></div>
		<div class="ad1-2">
            	<ul>
            	<c:forEach var="row" items="${index_C_2 }">
            		<li>
            			<a target="_blank" href="${row.ad_url}">
            				<img src="/${row.ad_pic_path}" />
            			</a>
            		</li>
            	</c:forEach>
                </ul>
         </div>
         <div style="clear:both;"></div>
    	<div class="ad1-3">
            	<ul>
            	<c:forEach var="row" items="${index_C_3 }">
            		<li>
            			<a target="_blank" href="${row.ad_url}">
            				<img src="/${row.ad_pic_path}" />
            			</a>
            		</li>
            	</c:forEach>
                </ul>
         </div>
         <div style="clear:both;"></div>
    </div>
    <!--广告构架结束--> 
   
     <!--合作单位构架开始-->
     <div class="hezuojg">
          <div class="hzjg_nav">
            <ul class="nav nav-tabs" role="tablist">
            	<li role="presentation" class="active">
               		<a href="#zxdt" aria-controls="profile" role="tab" data-toggle="tab">
               			<p>最近动态</p>
               		</a>
               	</li>
               <li role="presentation" >
               		<a href="#hzjg" aria-controls="profile" role="tab" data-toggle="tab">
               			<p>合作机构</p>
               		</a>
               </li>
               <li role="presentation">
               		<a href="#hzgx" aria-controls="profile" role="tab" data-toggle="tab">
               			<p>合作高校</p>
               		</a>
               </li>
               <li role="presentation">
               		<a href="#lxwm" aria-controls="profile" role="tab" data-toggle="tab">
               			<p>联系我们</p>
               		</a>
               	</li>
            </ul>

          </div>
          <div class="tab-content">
          <!--最新动态  -->
     	  <div role="tabpanel" class="zxdt_content tab-pane active" id="zxdt">
     	  	<ul class="content1">
            	<c:forEach var="row" items="${requestScope.newslist}">
           		<li>${row.get("add_time")}&nbsp;<a href="/newsDetail.do?id=${row.get('news_id')}" target="_blank">${row.get("news_title")}</a></li>
          	  </c:forEach>
            </ul>
            <ul>
            	<li style="float:right;padding-left:400px;"><a style="color:#e0381a;" href="/list.do?t=gonggao&a=28">更多&gt;&gt;</a>
            </ul>
            <!-- <div><a href="/list.do?t=gonggao&a='28'">更多&gt;&gt;</a></div> -->
     	  </div>
          <!--合作机构  -->
          <div role="tabpanel" class="hzjg_content tab-pane " id="hzjg">
           <ul class="content1">
             <li><a target="_blank" href="http://chesicc.moe.edu.cn" title="全国高等学校学生信息咨询与就业指导中心"><span>全国高等学校学生信息咨询与就业指导中心</span></a></li>
             <li><a target="_blank" href="http://www.snedu.gov.cn" title="陕西省教育厅"><span>陕西省教育厅</span></a></li>
             <li><a target="_blank" href="http://www.snhr.gov.cn" title="陕西省人才交流中心"><span>陕西省人才交流中心</span></a></li>
             <li><a target="_blank" href="http://www.sxgxbys.com" title="陕西省高等学校毕业生就业服务中心"><span>陕西省高等学校毕业生就业服务中心</span></a></li>
             
            <li><a target="_blank" href="http://www.haedu.gov.cn" title="河南省教育厅"><span>河南省教育厅</span></a></li>
            <li><a target="_blank" href="http://www.hnbys.gov.cn" title="河南省大中专学生就业服务中心"><span>河南省大中专学生就业服务中心</span></a></li>
            <li><a target="_blank" href="http://www.sczljjdhr.com" title="陕西省中小企业服务中心"><span>陕西省中小企业服务中心</span></a></li>
            <li><a target="_blank" href="http://www.xasrc.com" title="西安市人才交流中心"><span>西安市人才交流中心</span></a></li>
            
             <li><a target="_blank" href="http://www.xetdz.com.cn" title="西安经开区人才交流中心"><span>西安经开区人才交流中心</span></a></li>
             <li><a target="_blank" href="http://www.xaqjrc.com" title="西安曲江人才交流中心"><span>西安曲江人才交流中心</span></a></li>
             <li><a target="_blank" href="http://www.sczljjdhr.com" title="西安市人力资源产业园碑林园区"><span>西安市人力资源产业园碑林园区</span></a></li>
             <li><a target="_blank" href="http://www.xyjob.com" title="咸阳市秦都区人才交流中心"><span>咸阳市秦都区人才交流中心</span></a></li>
             
              <li><a target="_blank" href="http://www.lzanning.gov.cn/rlzyhshbzj/" title="兰州市安宁区人力资源和社会保障局"><span>兰州市安宁区人力资源和社会保障局</span></a></li>
              <li><a target="_blank" href="http://www.thspxa.com.cn" title="清华科技园（陕西）"><span>清华科技园（陕西）</span></a></li>
              <li><a target="_blank" href="http://www.xasoftpark.com" title="西安高新区软件园"><span>西安高新区软件园</span></a></li>
              <li><a target="_blank" href="http://www.sxslh.org.cn" title="西安市商联会"><span>西安市商联会</span></a></li>
              
              <li><a target="_blank" href="http://www.xixianxinqu.gov.cn" title="西咸新区西部云谷创业基地"><span>西咸新区西部云谷创业基地</span></a></li>
              <li><a target="_blank" href="http://www.ncss.org.cn" title=">新职业"><span>新职业</span></a></li>
              <li><a target="_blank" href="http://www.cnxincai.com.cn" title="中华新才网"><span>中华新才网</span></a></li>
              <li><a target="_blank" href="http://www.daqinrc.com" title="大秦人才网"><span>大秦人才网</span></a></li>

           </ul>
           <div style="clear:both"></div>
          </div>
	   	  <!--合作高校  -->
          <div role="tabpanel" class="hzgx_content tab-pane " id="hzgx">
           <ul class="content1">    
              <c:forEach var="row" items="${requestScope.school}">
           		<li>
           			<a href="/jobfair/school.do?id=${row.school_id }" target="_blank">${row.school_name }</a>
           		</li>
          	  </c:forEach>
           </ul>
           <ul>
            	<li style="float:right;padding-left:150px;" ><a style="color:#e0381a;" href="/list.do?t=gonggao&a=28">更多&gt;&gt;</a>
            </ul>
          </div>
     	  <!--联系我们  -->
     	  <div role="tabpanel" class="lxwm_content tab-pane  " id="lxwm">
     	  	<div class="content" style="text-align:center;">
            	<dl>
					<dt>集团总部</dt>
					<dd>地址：中国陕西省西安高新技术开发区科技二路65号清华科技园清扬国际大厦A座410   电话：400-6606125</dd>
					<dd>合作：唐经理  18829037628  &nbsp;&nbsp;&nbsp;&nbsp;（欢迎各高校，人才中心，人力资源，教育培训，投资机构洽谈合作。）</dd>

					<dt>陕西分公司</dt>
					<dd>地址：西安高新区科技二路65号清华科技园清扬国际大厦A410</dd>
					<dd>联系人：孙经理   029-88662468&nbsp;&nbsp;&nbsp;&nbsp;   客服QQ：2283642202&nbsp;&nbsp;&nbsp;&nbsp;  邮箱：xajob456@163.com </dd>

					<dt>陕西咸阳公司</dt>
					<dd>地址：陕西西咸新区沣西新城西部云谷创新创业中心E3号楼302</dd>
					<dd>联系人：史总   13892088805&nbsp;&nbsp;&nbsp;&nbsp;邮箱：254540086@qq.com</dd>

					<dt>河南分公司</dt>
					<dd>地址：河南省郑州市管城区紫荆山路与陇海路方圆创世B座1228/1229室</dd>
					<dd>联系人：漆经理   15389229099&nbsp;&nbsp;&nbsp;&nbsp;邮箱：2863435298@qq.com</dd>

					<dt>重庆分公司</dt>
					<dd>地址：重庆市江北区观音桥街道嘉陵一村COSMO大厦1幢16-9</dd>
					<dd>联系人：王总　18523840263 &nbsp;&nbsp;&nbsp;&nbsp;  邮箱：cqyucai@211zph.com</dd>

					<dt>四川分公司</dt>
					<dd>地址：成都市高新区天府大道中段500号东方希望天祥广场写字楼1栋1713号</dd>
					<dd>联系人： 曹总 　028-88612911&nbsp;&nbsp;&nbsp;&nbsp; 13550243318&nbsp;&nbsp;&nbsp;&nbsp;邮箱：yicai@211zph.com</dd>

					<dt>甘肃分公司</dt>
					<dd>地址：甘肃省兰州市安宁区高新科技产业孵化园f202</dd>
					<dd>联系人：张老师  18693576779&nbsp;&nbsp;&nbsp;&nbsp; 邮箱：2877881886@qq.com</dd>

					<dt>湖南分公司</dt>
					<dd>地址：湖南省长沙市雨花亭新建西路77号</dd>
					<dd>联系人：鲁总   15580199888&nbsp;&nbsp;&nbsp;&nbsp; 0731-85210311&nbsp;&nbsp;&nbsp;&nbsp;邮箱：guode@211zph.com</dd>

					<dt>山西分公司</dt>
					<dd>地址：山西省太原市万柏林区迎泽西大街119号公元时代城A座1001号</dd>
					<dd>联系人：卫总   18614267656&nbsp;&nbsp;&nbsp;&nbsp; 邮箱：wepulan@qq.com</dd>

				</dl>
          	</div>
     	  </div>
     	  </div>
     	  <div style="clear:both"></div>
     </div>  
       
       <!--合作单位架构结束-->

</div>
<!--main区架构结束-->

<!--footer区架构结束-->
<jsp:include page="include/footer.jsp" flush="true"></jsp:include>
<!--footer区架构结束-->
<!--返回顶部，反馈-->
<!-- <div style="width:1024px;margin:0 auto;">
	<div style="float: right;margin-right:-10px;">
	<div style="position:fixed;bottom:50px;">
	<a class="returnTop" href="javascript:scroll(0,0)"></a></br>
	<a class="opinion" href="javascript:;" onclick="opinion();"></a>
	</div>
	</div>
</div> -->
<script type="text/javascript">
	function opinion(){
		opinion_edit_btn = art.dialog({
		    width:350 ,
		    height:350,
			id: 'opinion_edit_btn',
			title:false,
			content:'<div style="width:350px;height:350px;">正在加载...</div>',
			lock:true,
			fixed:true,
			close:function(){this.hide(); return false;},
			show:true,
			esc:true,
			padding:0,
			opacity:0.7,
			background:'#333333',
		});
		var pageContentBody1 =$(art.dialog({id: 'opinion_edit_btn'}).content());//自定义添加内容
		pageContentBody1.parents(".aui_dialog").find(".aui_close").addClass("opinion_panel_close");//自定义关闭按钮				
		pageContentBody1.html( $("#opinion_content").text() );//向弹窗加载内容
		art.dialog({id: 'opinion_edit_btn'}).show();
	}
	
	function save(){
	var info=$(".opinion_info").val();
	var tel=$(".opinion_tel").val();
	if(info==''){
		msg_alert('提示信息','请填写建议！','warning');
		return null;
	}
		$.ajax({
	        url: "/jobfair/opinion.do",
	        data:{info:info,tel:tel},
	        type: "post",
	        dataType: "text",
	        success: function(data) {
	            if (!data) return;
	            if(data=='yes'){
	            	msg_alert('提示信息','感谢您的建议！','succeed');
	            	art.dialog({id: 'opinion_edit_btn'}).close();
	            	return null;
	            }else if(data=='no'){
	            	msg_alert('提示信息','系统更新中！','error');
	            	art.dialog({id: 'opinion_edit_btn'}).close();
	            	return null;
	            }
	            return;
	        },
		contentType:"application/x-www-form-urlencoded; charset=utf-8"
	    });
	}
	
</script>
<script id="opinion_content" type="text/plain">
	<div style="width:350px;height:350px;outline: 2px solid #e03919;">
		<div class="opinion_top">我要反馈</div>
		<from>
			<textarea class="opinion_info" name="opinion_info" placeholder="填写意见反馈..."></textarea> 
			<input class="opinion_tel" type="text" name="opinion_tel" placeholder="方便留下您的电话吗？(可不填)"></input>
			<input class="opinion_btn" onclick="save();" type="submit" value="提交">
		</from>
	</div>
</script>
<script src="/static/js/index.js" type="text/javascript" charset="utf-8"></script>
</body>
 	
    <script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script>    
    <script src="/statics/jquery/jquery.form.js" type="text/javascript" charset="utf-8"></script>   
    <script src="/statics/jquery/jquery.validate.min.js" type="text/javascript" charset="utf-8"></script> 
    <script src="/static/bootstrap/js/bootstrap.min.js"></script>
    <script src="/static/artDialog/artDialog.js?skin=aero" charset="utf-8"></script>
	<script src="/static/artDialog/plugins/iframeTools.js"></script>
	<script src="/static/js/flow.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript" src="/static/service/login.js" charset="utf-8"></script>
	<script type="text/javascript">
		$(function(){
			$("#hotSearch").on('click','a',function(i){
				$("#fm").find("input[name='in_key']").val( $(this).text() );
				$("#fm").submit();
			});
		});
	
	</script>	
</html>
