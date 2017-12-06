<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.Station"%>
<%@ page import ="com.zhaopin.bean.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% HashMap recruitInfo=(HashMap)request.getAttribute("recruitInfo");
	if(recruitInfo ==null){
		response.sendRedirect(request.getContentType()+"/");
		return;
	}
	String userType="";
	UserInterface user = User.currentUser(session);
	if(user!=null){
		userType=user.getUserType();
	}	
 %>
<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="keywords" content="211校招网,网络视频招聘会，网络招聘会，宣讲会，校园招聘会，应届生招聘会，高校招聘会，毕业生招聘会。" />
<meta name="description" content=" 211校招网是一个为高校和企业开展校园招聘，提供校园招聘会，宣讲会，网络视频招聘会服务的网站。在全国30个省市设立了分站，服务用人单位和大学生。" />
<meta name="author" content="">
<title>职位详情</title>
 
	<link href="/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="/static/css/common-element.css" rel="stylesheet" type="text/css">
	<link href="/static/css/zhiwei_xiangqingye-style.css" rel="stylesheet" type="text/css">
    <link href="/static/css/font-awesome.min.css" rel="stylesheet" media="screen">
    
    <script src="/static/jquery/1.11.3/jquery.min.js"></script>
    <script src="/static/js/jquery.easyui.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.min.js"></script>
    <script src="/static/artDialog/artDialog.js?skin=aero" charset="utf-8"></script>
	<script src="/static/artDialog/plugins/iframeTools.js"></script>
	<script src="/static/js/flow.js" type="text/javascript" charset="utf-8"></script>
	<script src="/static/js/favorite_zw.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
	var cur_path ="<%=request.getContextPath()%>";
	var job_id="<%=recruitInfo.get("job_id")%>";
	var user_type="<%=userType%>";
	</script>
	<script type="text/javascript">
             	$(function(){
             		$(".auto-height").each(function(){
             			var height=$(this)[0].scrollHeight;
             			if(height<30)height=30;
             			$(this).css( {height:height} );
             		});
             		$(".auto-height").on("propertychange",function(){
             			var height=$(this)[0].scrollHeight;
             			if(height<30)height=50;
             			$(this).css( {height:height} );
             		});
             		$(".auto-height").on("change",function(){
             			var height=$(this)[0].scrollHeight;
             			if(height<30)height=50;
             			$(this).css( {height:height} );
             		});
             		$(".auto-height").on("click",function(){
             			var height=$(this)[0].scrollHeight;
             			$(this).css( {height:height} );
             		});
             	});
             </script>
	
	<script type="text/javascript">
	var map;
	var point;
	var localSearch;
	function createMap(){ 
	      map = new BMap.Map("allmap"); 
	      point = new BMap.Point(109.098997, 34.350064);
	      map.centerAndZoom(point,11);
	    }	
	function createLocalSearch(){
		localSearch = new BMap.LocalSearch(map);
		localSearch.enableAutoViewport(); //允许自动调节窗体大小
		
		var keyword='${companyInfo.company_addr }';
		if(keyword == null || keyword == undefined || keyword == ''){
			keyword ="陕西省西安市雁塔区科技二路清华科技园A座";
		}
		localSearch.setSearchCompleteCallback(function (searchResult) {
		        var poi = searchResult.getPoi(0);
		        map.centerAndZoom(poi.point, 13);
		        var marker = new BMap.Marker(new BMap.Point(poi.point.lng, poi.point.lat));  // 创建标注，为要查询的地址对应的经纬度
		        map.addOverlay(marker);
		    });
		localSearch.search(keyword);
	}
	function setMapEvent(){
		 map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
	        map.enableScrollWheelZoom();//启用地图滚轮放大缩小
	        map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
	        map.enableKeyboard();//启用键盘上下左右键移动地图
	    }
	 function setMapClick(){
		 map.addEventListener("click",function(e){
				//alert(e.point.lng + "," + e.point.lat);
			});
	 }
	function initialize() {  			 
			createMap();//创建地图
			setMapEvent();//设置地图事件
			//向地图添加控件 addMapControl();
		    map.setCurrentCity("陕西省");// 设置地图显示的城市 此项是必须设置的
			createLocalSearch();//创建地址转坐标对象;
			setMapClick();//点击事件
	}  
	
	function loadScript() {  
			var script = document.createElement("script");  
			script.src = "http://api.map.baidu.com/api?v=2.0&ak=4oUjsvSYSHIBfI4TGf79eVGrmMU4k6TN&callback=initialize";//此为v2.0版本的引用方式  
			document.body.appendChild(script);  
	}  
	window.onload = loadScript;  
	</script>
</head>
<body>
<!--头部架构开始-->
<jsp:include page="include/header.jsp"></jsp:include>
<!--头部架构结束-->


<!--职位名称，公司名称 薪资，投递简历 收藏简历 地点，工作类型，学历，人数  -->
	<div style="background: #efefef;">
    	<div class="zwmingchen" >
    		<dl>
    		<dd><a class="company-name" href="/jobfair/company.do?id=<%=recruitInfo.get("company_id")%>&jobs=1" target="_blank"><%=recruitInfo.get("company_name") %></a></dd>
    		<dd class="job-name">
    			<%=recruitInfo.get("job_name") %>
    			<a class="zwsc" id="open_favorite_btn" href="javascript:;"><i class="fa fa-star-o sc" aria-hidden="true"></i>收藏</a>
    			<a class="send_resume" href="javascript:;" onclick="openOrderJob('<%=recruitInfo.get("company_id") %>','<%=recruitInfo.get("job_id")%>','<%=recruitInfo.get("company_name") %>','<%=recruitInfo.get("job_name") %>','<%=recruitInfo.get("contact_tel") %>' )"><i class="fa fa-paper-plane-o sc" aria-hidden="true"></i>投递简历</a>
    		</dd>
    		<dd class="job-info">
    			<span class="money"><%=recruitInfo.get("money")==null?"面议":recruitInfo.get("money") %>/月</span>
    			<%=recruitInfo.get("areas") %> | 
    			<%=recruitInfo.get("job_type") %>&nbsp;|&nbsp;<%=recruitInfo.get("education") %>&nbsp;|&nbsp;招<%=recruitInfo.get("job_person_num") %>人
    		</dd>
    		<dd class="add-time">发布时间：<%=recruitInfo.get("add_time") %>
    			<span style="float: right;">
    				<!--分享开始  -->
					<div style="float:right;">
					<span style="float:left;margin:0 0 0 -56px;">分享到：</span>
					<div class="bdsharebuttonbox">
  						<a href="#" class="bds_more" data-cmd="more"></a>
  						<a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
  						<a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
  						<a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
  						<a href="#" class="bds_sqq" data-cmd="sqq" title="分享到腾讯微博"></a>
					</div>
					<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"24"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
					</div>
					<!--分享结束  -->
    			</span>
    		</dd>  
    	</dl>
    	</div> 
    </div>
<!--main架构开始-->
<div class="main">  
    <p class="position">当前所在位置：<a href="/jobfair/index.do?a=28">首页</a>&nbsp;&gt;&nbsp;<a href="/company/info.do?id=<%=recruitInfo.get("company_id")%>"><%=recruitInfo.get("company_name")%></a>&nbsp;&gt;&nbsp;职位详情</p>
	<div class="left">
    	<div class="zhiwei_introduction">  
    
    	<!--岗位描述开始  -->
    	<div class="title"><p>岗位描述</p></div>     
		<dl>
			<dt>一、岗位职责：</dt>
			<textarea class="auto-height text-area" ><%=recruitInfo.get("introduction")==null?"该企业还未上传相关资料!":recruitInfo.get("introduction") %></textarea>
		</dl>
		<dl>
			<dt>二、任职资格：</dt>
			<textarea class="auto-height text-area" ><%=recruitInfo.get("requirement")==null?"该企业还未上传相关资料!":recruitInfo.get("requirement") %></textarea>
		</dl><div style="clear:both"></div>
		<!--岗位描述结束  -->
		</div>
		<div class="tishi">
			<dl>
				<dd style="font-size:14px;color:#555;">211校招网温馨提示!</dd>
				<dd style="font-size:12px;color:#999;">如在投递或面试过程中遇到招聘方的任何收费行为（如培训费，体验费，资料费，置装费，押金等），则存在欺诈风险，请您务必提高警惕。
					<span style="float:right;"><a class="jubao-a" href="http://wwww.54kefu.net/" target="_blank">举报</a></span></dd>
				
			</dl>
		</div>
		<div style="clear:both;"></div>
		<!--我的招聘职位  -->
		<div class="zhiwei">
			<div class="title"><p>推荐职位</p></div><div style="clear:both;"></div>  
    		
    		<c:forEach var="row" items="${requestScope.relevantRecruit}"> 
    		<ul>   
            <li><a class="company-name" href="/jobfair/company.do?id=${row.get('company_id')}&jobs=1" target="_blank">${row.get("company_name")}</a></li>
            <li class="zhiwei_name">
            	<a class="job-a" href="/jobfair/job.do?id=${row.get('job_id') }" target="_blank">${row.get("job_name") }</a>
            	<a class="send-a" href="javascript:;" onclick="openOrderJob('${row.get("company_id")}','${row.get("job_id")}','${row.get("company_name")}','${row.get("job_name")}','${row.get("contact_tel")}')"><i class="fa fa-paper-plane-o sc" aria-hidden="true"></i>投递简历</a>
            </li>
            <li><span class="money">${ empty row.get('money') ? '面议': row.get('money')}</span> | ${row.get("areas") } | ${row.get("job_type") } | ${row.get("education") } | 招${row.get("job_person_num") }人</li>
            <li>发布时间：${row.get("add_time") }</li>
           
            <div style="clear:both"></div>
			</ul>
    		</c:forEach>
       				    
    	</div>
 	</div>
 	
 	<div class="right">
 		<div class="company-info">
 			<ul>
 				<li><a class="company-name" href="/jobfair/company.do?id=${companyInfo.company_id}&jobs=1" target="_blank">${companyInfo.company_name}</a></li>
 				<li><img src="/statics/img/check.png">  : <c:if test="${companyInfo.status ne 1 }">未认证</c:if><c:if test="${companyInfo.status eq 1 }">已认证</c:if></li>
 				<li><img src="/statics/img/company.png"> : ${companyInfo.industry}</li>
 				<li><img src="/statics/img/persons.png"> : 规模${companyInfo.company_person_num }</li>
 				<li><img src="/statics/img/register.png"> : 注册资金${companyInfo.company_registered_capital }</li>
 				<li><img src="/statics/img/net.png"> : 网址${companyInfo.website }</li>
 				<li id="company_addr"><img src="/statics/img/addr.png"> : ${companyInfo.company_addr }</li>
 				
 			</ul>
 		</div>
 		<div id="allmap" style="height:280px;">
 		</div>
 		<a href="/jobfair/baiduMap.do" style="margin: 5px 0 20px 148px;display: block;color: blue;">点击查看地图大图>></a>
 		<div>
 			<c:forEach var="row" items="${requestScope.otherRecruit}"> 
    		<ul class="otherRecruit">   
            <li><a class="job-a" href="/jobfair/job.do?id=${row.get('job_id') }" target="_blank">${row.get("job_name") }</a></li>
            <li><span class="money">${ empty row.get('money') ? '面议': row.get('money')}</span> | ${row.get("educations") } | 招${row.get("job_person_num") }人</li>
            <div style="clear:both"></div>
			</ul>
    		</c:forEach>
    		<p class="more"><a href="/jobfair/search.do?type=search_recruit">查看更多>></a></p>
 		</div>
 	</div>
 	<div style="clear:both"></div>
</div>
<!--main架构结束-->
<div style="clear:both"></div>
<!--footer区架构开始-->
<jsp:include page="include/footer.jsp" flush="true"></jsp:include>
<!--footer区架构结束-->

</body>
</html>
