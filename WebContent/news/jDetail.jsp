<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String base_dir =request.getContextPath()+"/";
 %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="Keywords" content=" ${bean.get("news_title") },<%=com.zhaopin.Config.getSiteKeywords() %>" />
<meta name="Description" content="<%=com.zhaopin.Config.getSiteDescription() %>" />
<title>${bean.get("news_title")}-- <%=com.zhaopin.Config.getSiteTitle() %></title>
<link rel="stylesheet" href="/statics/bootstrap/2.3.2/css/bootstrap.min.css"/>
<link rel="stylesheet" href="/statics/bootstrap/2.3.2/css/bootstrap-theme.min.css"/>

<link href="/static/css/common-element.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/statics/css/main4.css"/>
<link rel="stylesheet" href="/statics/css/site.css"/>

<script src="statics/js/isPhoneSet.js"></script>
<script type="text/javascript">
//是否跳转手机页面
// mobile_device_detect('http://h5.211zph.com/mobile/news/newsPageById?id=${bean.get("news_id") }');
var cur_path = "<%=request.getContextPath()%>";
</script>
<script src="/statics/jquery/1.11.3/jquery.min.js"></script>
<script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script> 
<script src="/statics/bootstrap/2.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript" src="statics/jquery/jquery.form.js" charset="utf-8"></script>
<script src="statics/jquery/jquery.validate.min.js" type="text/javascript" charset="utf-8"></script> 
<script src="/statics/artDialog/artDialog.js?skin=aero" charset="utf-8"></script>
<script src="/statics/artDialog/plugins/iframeTools.js"></script>
<script type="text/javascript" src="/js/flow.js" charset="utf-8"></script>

<script type="text/javascript" src="statics/jquery/jquery.jcarousellite.min.js"></script>

<style type="text/css">
.cont_c .right #owl-demo{position:relative;max-width:500px;margin:20px auto 25px;}
.cont_c .right #owl-demo .item{ position:relative;display:block;}
.cont_c .right #owl-demo img{display:block;max-width:500px; border:1px #999999 solid;}

.owl-pagination{position:absolute;left:0;bottom:10px;width:100%;height:22px;text-align:center;}
.owl-page{display:inline-block;width:10px;height:10px;margin:0 5px; background:url("/news/img/bg15.png");*display:inline;*zoom:1;}
.owl-pagination .active{width:25px;background:url("/news/img/bg16.png");}
.owl-buttons{display:none;}
.owl-buttons div{position:absolute;top:50%;width:40px;height:80px;margin-top:-40px;text-indent:-9999px;}
.owl-prev{left:0;background:url("/news/img/bg19.png");}
.owl-next{right:0;background:url("/news/img/bg20.png");}
.owl-prev:hover{background:url("/news/img/bg17.png");}
.owl-next:hover{background:url("/news/img/bg18.png");}
.xinwen { margin-top:10px; border: 1px solid #ddd; }
.xinwen a { }
.xinwen .img-thumbnail {
    border-radius: 0;
    padding: 10px;
}

</style>

<link rel="stylesheet" href="/news/style/owl.carousel.css" />
<link type="text/css" rel="stylesheet" href="/news/style/core.css" />
<script type="text/javascript" src="/news/js/owl.carousel.js"></script>
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
	});
	</script>
<script type="text/javascript">
	if (window!=top) // 判断当前的window对象是否是top对象
		top.location.href =window.location.href; 
</script>
    
</head>
	<body>

<!--heard完成-->
<jsp:include  page="/include/headerAndTop.jsp" flush="true"/>
	<div class="ad">
		<c:if test="${ not empty requestScope.ad_980 }">
		 	<a target="_blank" href="${ad_980.ad_url }">
				<img src="${ad_980.ad_pic_path }" class="img-thumbnail" />
			</a>
		</c:if>
	</div>
	<div class="container">
		<p>当前位置：<a href="/">首页</a>&gt;${bean.get("news_title") }</p>
		
    	<!--cont开始-->
		<div class="cont">
    		<div class="cont_b">
    			<div class="cont_c">
            		<div class="left">
                	<div class="left_top">
                    	<h1>最新资讯 <a style="color:#fff;font-size:14px;margin-left:110px;" href="/list.do?t=gonggao&amp;a=28">更多&gt;&gt;</a></h1>
                    	<ul>
						<c:forEach var="row" items="${requestScope.news_type02 }">
							<li>
								<a href="/newsDetail.do?id=${row.news_id }" 
								   title="${row.news_title }">
								   ${row.add_time }&nbsp;&nbsp;${row.news_title } </a></li>	
						</c:forEach>
                    	</ul>
                	</div>
                	<div class='left_ad' style="padding:20px;">
                		<a href="http://www.daqinrc.com" target="_blank">
                			<img src="/ad/daqinrc/four.jpg"/>
                		</a>
                	</div>
            		</div><!--left end-->
            
            <div class="right">
                <h2>${bean.get("news_title") }</h2>
              	<p class="list" style="display:block;">
              	    ${bean.get("add_time") } &nbsp;&nbsp;
              	   	作者：${ empty bean.get("news_author") ?"管理员":bean.get("news_author")} &nbsp;&nbsp; 
              	   <!-- 
              	   	来源：${bean.get("news_source")}&nbsp;&nbsp;
              	  	阅读：${bean.get("click_stat") }
              	  	 -->
              	</p>
				<div class="bdsharebuttonbox" style="text-align:center">
						<a href="#" class="bds_more" data-cmd="more" style="float:none;">
						</a><a href="#" class="bds_qzone"  style="float:none;" data-cmd="qzone" title="分享到QQ空间"></a>
						<a href="#" class="bds_tsina" style="float:none;" data-cmd="tsina" title="分享到新浪微博"></a>
						<a href="#" class="bds_tqq" style="float:none;" data-cmd="tqq" title="分享到腾讯微博"></a>
						<a href="#" class="bds_renren" style="float:none;" data-cmd="renren" title="分享到人人网"></a>
						<a href="#" class="bds_weixin"style="float:none;"  data-cmd="weixin" title="分享到微信"></a>
				</div>
                
                <c:if test="${not empty picList }">
	                <div id="owl-demo" class="owl-carousel">
					<c:forEach var="row" items="${requestScope.picList }">
						 <a class="item"><img src="/${row.get(0) }" alt=""></a>
					</c:forEach>
					</div>
				</c:if>

                <div class="text">
                 	${requestScope.content }
                </div>
				<div style="padding:20px;">
            <p><i>上一条：</i>
            	<c:choose>
            		<c:when test="${ empty preBean}">
            			<a>已经没有了</a>
            		</c:when>
            		<c:otherwise>
            			<a href="/newsDetail.do?id=${preBean.get("news_id") }">
            				${preBean.get("news_title") }
            			</a>
            		</c:otherwise>
            	</c:choose>
            </p>
            <p><i>下一条：</i>
            	<c:choose>
            		<c:when test="${ empty nextBean}">
            			<a>已经没有了</a>
            		</c:when>
            		<c:otherwise>
            			<a href="/newsDetail.do?id=${nextBean.get("news_id") }">
            				${nextBean.get("news_title") }
            			</a>
            		</c:otherwise>
            	</c:choose>
            </p>
        		</div>
        	 	<div class="clear"></div>
        	</div>
        <!--right结束-->
        <div class="clear" style="clear:both;"></div>
    			</div><!--cont_c  end  -->
    		</div><!--cont_b  end  -->	
		</div><!--cont  end  -->	
	</div><!--container end  -->
	
<div style="height:25px;"></div>
<!--container完成-->
<jsp:include page="/include3/bottom.jsp" flush="true" />   
<!--footer完成-->
<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"24"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
<script type="text/javascript" src="/assets/scripts/vlstat.js"></script>
<script type="text/javascript">
	$(function(){
		vlstatInitLE("news",'${param.id}'); 
		$(".text table").width(640);
	});
</script>
	</body>
</html>

