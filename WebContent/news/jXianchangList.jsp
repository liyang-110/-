<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="com.zhaopin.Station"%>
<%@page import="com.zhaopin.dao.factory.NewsModel"%>
<%@page import="com.zhaopin.database.cDataControlA"%>
<%@page import="org.apache.commons.beanutils.DynaBean" %>
<%@page import="com.zhaopin.dao.factory.AdvertisementModel"%>
<%@page import="com.zhaopin.dao.factory.PicModel"%>
<%
	String area_id=(String)request.getAttribute("area_id");
	
	String aParam = area_id==null?"":area_id;
	String tParam = request.getAttribute("news_type")==null?"":(String)request.getAttribute("news_type");

	AdvertisementModel	adModel = new AdvertisementModel();
	List ad_980 =adModel.queryAdMapList("sub4_195x93", area_id, 5);
 %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="Keywords" content="<%=com.zhaopin.Config.getSiteKeywords() %>" />
<meta name="Description" content="<%=com.zhaopin.Config.getSiteDescription() %>" />
<title> <%=com.zhaopin.Config.getSiteTitle() %></title>
<link rel="stylesheet" href="statics/bootstrap/2.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="statics/bootstrap/2.3.2/css/bootstrap-theme.min.css">

<link rel="stylesheet" href="/statics/css/main4.css">
<link rel="stylesheet" href="/statics/css/site.css">

<script src="/statics/jquery/1.11.3/jquery.min.js"></script>
<script src="/statics/bootstrap/2.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript" src="/statics/jquery/jquery.form.js" charset="utf-8"></script>
<script src="/statics/jquery/jquery.validate.min.js" type="text/javascript" charset="utf-8"></script> 
<script src="/statics/artDialog/artDialog.js?skin=green" charset="utf-8"></script>

<script type="text/javascript" src="/statics/jquery/jquery.jcarousellite.min.js"></script>
<script type="text/javascript">
var cur_path = "<%=request.getContextPath()%>";
</script>
<script src="/statics/artDialog/plugins/iframeTools.js"></script>
<script type="text/javascript" src="/js/flow.js" charset="utf-8"></script>


<link rel="stylesheet" href="/news/style/owl.carousel.css" />
<link type="text/css" rel="stylesheet" href="/news/style/xianchang.css" />
<script type="text/javascript" src="/news/js/owl.carousel.js"></script>
	
<script type="text/javascript">
	if (window!=top) // 判断当前的window对象是否是top对象
		top.location.href =window.location.href; 
</script>
</head>
<body>
<!--heard完成-->
<jsp:include  page="/include/headerAndTop.jsp" flush="true"/>
<div class="width">
</div>
<!--container完成-->
	<div class="container">
    <p>当前位置：<a href="/">首页</a>>招聘会现场</p>
    <div class="left">
        <div class="left_top">
        	<h1>新闻资讯</h1>
            <ul>
            		<%List extList2= (List)request.getAttribute("extList2");
                     int i=0;
                    for(Iterator it=extList2.iterator();it.hasNext();){
                    	HashMap row=(HashMap)it.next();
                    	%>
	            	<li>
	            	<a href="/newsDetail.do?id=<%=row.get("news_id") %>"  target="_blank" alt="<%=row.get("news_title") %> " title="<%=row.get("news_title") %> ">
					<%=row.get("news_title") %>
					</a>
					</li>
            	
					<% i++;if(i>9)break;
					}%>
            </ul>
        </div>
        <div class="left_top" id="left_bottom">
        	<h1>招聘信息</h1>
            <ul>
            	  <%
            	  	List extList1= (List)request.getAttribute("extList1");
                    for(i=0;i<extList1.size();i++){
                    	HashMap row=(HashMap)extList1.get(i);
                    	if(i>10)break;
                    	%>
                    	 <li>
                    	 <a href="/newsDetail.do?id=<%=row.get("news_id") %>"  target="_blank" alt="<%=row.get("news_title") %>" title="<%=row.get("news_title") %>">
							<%=row.get("news_title") %>
						</a>
						</li>
				<% }%>
            </ul>
        </div>
    </div>
    <!--right开始-->
    <div class="right">
    	<% if( ad_980!=null && ad_980.size()>0 ){ 
    		%>
    	<div class="maincont">

        		<div class="guanggao" style="height:100px;">
            		<div id="owl-demo" class="owl-carousel" style="height:100px;">
            	<%	
			 	for( i=0;i<ad_980.size();i++){
			 		HashMap row = (HashMap)ad_980.get(i);
			 	%>
			 	<a class="item"  target="_blank" href="<%=row.get("ad_url")%>"><img src="<%=row.get("ad_pic_path")%>" height="100" width="690" style="height:100px;" /></a>
			 	<%}%>
                    </div>
                </div>
         </div>
                         <script type="text/javascript">
				$(function(){
					$('#owl-demo').owlCarousel({
						items: 1,
						navigation: true,
						navigationText: ["上一个","下一个"],
						autoPlay: true,
						stopOnHover: true
					}).hover(function(){
						$('.owl-buttons').show();
					}, function(){
						$('.owl-buttons').hide();
					});
					$("#pages1 a").off('click');
					$("#pages1").on('click','a',function(){
						var url=$(this).attr("href");
						if(url){
							$(this).attr("href","javascript:;");
							$("#searchForm").attr("action",url);
							$("#searchForm").submit();
						}
					
						return;
					});
				});
				</script>
    	<%} %>
    	    	<div class="maincont">

				
            <div class="search">
				<form action="/list.do" method="get" id="searchForm">
				    <input type="hidden" name="t" value="<%=tParam%>"/>
                   	<input type="hidden" name="a" value="<%=aParam%>"/>
                	<input type="text" name="keywords" value="${keywords}" placeholder="请输入关键字"  class="on" style="margin-bottom:0px;"/>
                    <input type="submit" value="" class="two" style="margin-bottom:0px;padding:0px;" />
              </form>
            </div> 
                          <%
	 List newsList =(List)request.getAttribute("newsList");
     i=1;
	if(newsList!=null && newsList.size()>0){
   			for(Iterator it=newsList.iterator();it.hasNext();){
				HashMap row = (HashMap)it.next();
				String pic_path =(String)row.get("pic_path");
    			if(pic_path==null)pic_path="/statics/img/12.jpg";
    			
    			if(i%3==1||i%3==0){
    				%><div class="left_a"><%
    			}else{
    				%><div id="left_b" class="left_a"><%
    			}
 %>
				<a title="<%=row.get("news_title")%>" href="<%=request.getContextPath()%>/newsDetail.do?id=<%=row.get("news_id")%>&area_id=<%=area_id%>" target="_blank"><img src="<%=pic_path %>" style="height:155px;" height="155" width="206"><span style="width:210px;height:25px;display:block;overflow:hidden;"><%=row.get("news_title")%></span></a>
			</div>
			<%
			i++;
 			}
 	}
  %>
			<div class="clear"></div>
			<div class="pagelist">
					  <ul class="pages1">
                <%=request.getAttribute("pagenation") %>
                </ul>
				</div>
    	</div>
    </div>
    <!--right完成-->
   <div class="clear"></div>
</div>
	
	
	
 	<jsp:include page="/include3/bottom.jsp" flush="true" />   
<!--footer完成-->
<script>// window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdPic":"","bdStyle":"0","bdSize":"16"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"24"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
	</body>
</html>

