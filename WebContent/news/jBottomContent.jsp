<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="org.apache.commons.beanutils.DynaBean" %>
<%@page import="com.zhaopin.dao.factory.BottomContentModel" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta name="Keywords" content="<%=com.zhaopin.Config.getSiteKeywords() %>" />
<meta name="Description" content="<%=com.zhaopin.Config.getSiteDescription() %>" />
<% DynaBean bean = (DynaBean) request.getAttribute("bean");%>
<title><%=bean.get("title") %> -- <%=com.zhaopin.Config.getSiteTitle() %></title>

<link rel="stylesheet" href="/statics/bootstrap/2.3.2/css/bootstrap.min.css"/>
<link rel="stylesheet" href="/statics/bootstrap/2.3.2/css/bootstrap-theme.min.css"/>
<link href="/static/css/common-element.css" rel="stylesheet" type="text/css">

<link rel="stylesheet" href="/statics/css/main4.css"/>
<link rel="stylesheet" href="/statics/css/site.css"/>

<link href="/news/css/index.css" rel="stylesheet" type="text/css" />

<script src="/statics/jquery/1.11.3/jquery.min.js"></script>
<script src="/statics/bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script> 
<script src="/statics/jquery/jquery.form.js" type="text/javascript" charset="utf-8"></script>
<script src="/statics/jquery/jquery.validate.min.js" type="text/javascript" charset="utf-8"></script> 
<script src="/statics/artDialog/artDialog.js?skin=aero" charset="utf-8"></script>
<script src="/statics/artDialog/plugins/iframeTools.js"></script>

</head>
	<body>
 	<jsp:include page="../include/headerAndTop.jsp"  flush="true" />
    <div class="container">
        <ul class="breadcrumb">
          <li>
            <a href="./">首页</a> <span class="divider">&gt;</span>
          </li>
          <li class="active"><%=bean.get("title") %></li>
        </ul>
    </div>

	<div class="container">
	<style type="text/css">
		.about_left_menu {
			width:232px;
			margin:0 18px 0 0;
			padding:0 0 0 0;
			border:none;
		}
		.about_right_content {
			width:600px;
		}
		.about_left_menu .menu {
			clear:both;
		}

		.about_left_menu .menu dl {
			margin-top:0;
			margin-bottom:0;
			width:232px;
		}
		.about_left_menu .menu dt,.about_left_menu .menu dd {
			border-bottom: 1px solid #e03919;
		}
		.about_left_menu .menu dt {
			line-height:32px;
			background: #e03919;
			/* padding-left:60px; */
			text-align:center;
			color: #FFF;
		}
		.about_left_menu .menu dd{ margin-left:0;}
		.about_left_menu .menu dd a {
			margin-bottom:0;
			padding:5px 0 5px 0;
			display:block;
			color:#e03919;
		}
	</style>
        
    	<div class="pull-left news_right_ad about_left_menu">
             
            <%
            BottomContentModel bcM=new BottomContentModel();
             %>
             <%= bcM.bottomContent( request.getContextPath() ) %>

        </div>
        
   	  <div class="pull-left news_content about_right_content">
        	<h3 class="title"><%=bean.get("title") %></h3>
            <div class="info" style="display:none;">
            	<span><%=bean.get("add_time") %></span>
            </div>
            <div class="content">
            	<%
            	com.zhaopin.dao.factory.BottomContentModel bcModel= 
            				new com.zhaopin.dao.factory.BottomContentModel();
            	out.println( bcModel.getContent( 
            						(String)bean.get("id") 
            						) ); //bean.get("content") %>
			
          </div><!-- /content -->
          
          
            <div class=" pull-right share">
                <label>分享到：</label>
                <div class="bdsharebuttonbox">
                <a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
                <a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
                <a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a>
                <a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
                </div>
                
            </div>
            
        </div>
        
    </div>
   

    <div style="height:30px; clear:both;"></div>
    
	<jsp:include  page="../include3/bottom.jsp" flush="true"/>

	<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdPic":"","bdStyle":"0","bdSize":"16"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
	</body>
</html>

