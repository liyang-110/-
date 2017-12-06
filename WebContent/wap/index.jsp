<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.zhaopin.dao.factory.BaseCodeModel" %>
<%@page import="com.zhaopin.dao.factory.AreaModel" %>
<% BaseCodeModel baseCodeM= new BaseCodeModel(); %>
<% AreaModel areaM= new AreaModel(); 
	  String job_fair_type=request.getParameter("job_fair_type")==null?"multiple":request.getParameter("job_fair_type");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<link rel="stylesheet" type="text/css" href="css/style.css" media="all" />
<title><%=com.zhaopin.Config.getSiteTitle() %></title>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type" />
<meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
<meta name="Keywords" content="<%=com.zhaopin.Config.getSiteKeywords() %>" />
<meta name="Description" content="<%=com.zhaopin.Config.getSiteDescription() %>" />
<!-- Mobile Devices Support @begin -->
<meta content="application/xhtml+xml;charset=UTF-8" http-equiv="Content-Type">
<meta content="no-cache,must-revalidate" http-equiv="Cache-Control">
<meta content="no-cache" http-equiv="pragma">
<meta content="0" http-equiv="expires">
<meta content="telephone=no, address=no" name="format-detection">
<meta name="apple-mobile-web-app-capable" content="yes" />
<!-- apple devices fullscreen -->
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
<!-- Mobile Devices Support @end -->
<link rel="shortcut icon" href="" />
<script src="js/jquery.js"></script>
<script src="js/layer/layer.min.js"></script>
<script type="text/javascript">
var querydata={"area_id":"","level":"","professional":"","job_fair_type":"<%=job_fair_type%>"};
$(function(){
	$("#city").click(function(){
		$("#TB_overlayBG").css({
			display:"block",height:$(document).height()
		});
		$("#city_content").css({
			left:($("body").width()-$(".box").width())/2+"px",
			top:($(window).height()-$(".box").height())/2+$(window).scrollTop()+"px",
			display:"block"
		});
	});
	$("#city_close").click(function(e){
		e.preventDefault();
		$("#TB_overlayBG").css("display","none");
		$("#city_content").css("display","none");
	});
	$("#ducation").click(function(){
		$("#TB_overlayBG").css({
			display:"block",height:$(document).height()
		});
		$("#ducation_content").css({
			left:($("body").width()-$(".box").width())/2+"px",
			top:($(window).height()-$(".box").height())/2+$(window).scrollTop()+"px",
			display:"block"
		});
	});
	$("#ducation_close").click(function(e){
		e.preventDefault();
		$("#TB_overlayBG").css("display","none");
		$("#ducation_content").css("display","none");
	});
	$("#specialty").click(function(){
		$("#TB_overlayBG").css({
			display:"block",height:$(document).height()
		});
		$("#specialty_content").css({
			left:($("body").width()-$(".box").width())/2+"px",
			top:($(window).height()-$(".box").height())/2+$(window).scrollTop()+"px",
			display:"block"
		});
	});
	$("#specialty_close").click(function(e){
		e.preventDefault();
		$("#TB_overlayBG").css("display","none");
		$("#specialty_content").css("display","none");
	});
	$(".mainlist.city a").live("click",function(e){
		e.preventDefault();
		querydata.area_id=$(this).attr("data");
		$('#city').text( $(this).text() );
		$("#city_close").trigger("click");
		Search();
	});
	$(".mainlist.ducation a").live("click",function(e){
		e.preventDefault();
		querydata.level=$(this).attr("data");
		$('#ducation').text( $(this).text() );
		$("#ducation_close").trigger("click");
		Search();
	});
	Search();
});
function queryStr()
{
	var querystr="area_id="+querydata.area_id+"&level="+querydata.level+"&professional="+querydata.professional+"&job_fair_type="+querydata.job_fair_type;
	return querystr;
}
function Search( url ){
	var querystr="";
	if(url==undefined || url=='' ){
		querystr=queryStr();
	}else{
		querystr=url;
	}
	$(".search_content").html( '' );
	$.ajax({
		url:"result.jsp?"+querystr,
		success:function(data){
			$(".search_content").html( data );
		},
		cache:false
	});
}
function goPage( pageNum ){
	var url=queryStr()+'&page='+pageNum;
	Search( url );
}
</script>

<style type="text/css">
/* box */
.box{position:absolute;width:100%;left:50%;z-index:100;background-color:#fff;border:1px #8FA4F5 solid;padding:1px;}
.box h2{height:35px;font-size:14px;background-color:#eafdbe;position:relative;padding-left:10px;line-height:35px;color:#688e52;}
.box h2 a{position:absolute;right:5px;font-size:12px;color:#688e52;}
.box .mainlist{padding:10px;}
.box .mainlist li {height:24px;line-height:24px;}
.box .mainlist li a {display:block;text-align:center;}
.box .mainlist li a:hover {background:#F1F1F1;}
.box .mainlist li span{margin:0 5px 0 0;font-family:"宋体";font-size:14px;font-weight:400;color:#ddd;}
.box .mainlist.city li { float:left;width:100px;} 
#TB_overlayBG{background-color:#666;position:absolute;z-index:99;left:0;top:0;display:none;width:100%;height:100%;opacity:0.5;filter: alpha(opacity=50);-moz-opacity: 0.5;}
img {
	max-width: 100%!important;
}
.info_card .title a {float:left;padding-left:3px;}
ul.nav li a {display:block;}
ul.nav li.active {background:rgb(19, 184, 58);}
ul.nav li:hover {background:rgb(19, 184, 58);}
</style>
</head>
<body>
<div class="box" style="display: none; left: 400px; top: 299px;" id="city_content">
		<h2>选择地区<a href="#" class="close" id="city_close">关闭</a></h2>
		<div class="mainlist city">
			<ul>
					<li><a href="" data="">不限</a></li>
                    <%
                    List areaList = areaM.getProvionce();
                    for( Iterator it=areaList.iterator();it.hasNext();)
                    {
                    	List row =(List)it.next();
                     %>
                     <li><a href="" data="<%=row.get(0) %>"><%=row.get(1) %></a></li>
                     <%
                     }
                      %>
			</ul>
		</div>
	</div>
    <div class="box" style="display: none; left: 400px; top: 299px;" id="ducation_content">
		<h2>选择学历<a href="#" class="close" id="ducation_close">关闭</a></h2>
		<div class="mainlist ducation">
			<ul>
                    <li><a href="" data="">不限</a></li>
                    <%
                    List job_fair_level = baseCodeM.codeArray("job_fair_level");
                    for( Iterator it=job_fair_level.iterator();it.hasNext();)
                    {
                    	List row =(List)it.next();
                     %>
					<li>
						<a href="#" data="<%=row.get(0) %>"><%=row.get(1) %></a>
					</li>
                     <%
                     }
                      %>
			</ul>
		</div>
	</div>
     <div class="box" style="display: none; left: 400px; top: 299px;" id="specialty_content">
		<h2>选择专业<a href="#" class="close" id="specialty_close">关闭</a></h2>
		<div class="mainlist specialty">
			<ul>
				<li><a href="#" title="jquery 制作鼠标点击描点a标签返回顶部">jquery 制作鼠标点击描点a标签返回顶部</a></li>
                <li><a href="#" title="jquery 制作鼠标点击描点a标签返回顶部">jquery 制作鼠标点击描点a标签返回顶部</a></li>
			</ul>
		</div>
	</div>
<div class="body">
  <div id="main" role="main"> <img src="images/logo.png" width="680">
    <ul class="nav">
      <li class="<%="multiple".equals(job_fair_type)?"active":"" %>"><a href="<%=request.getContextPath() %>/wap/index.jsp?job_fair_type=multiple">双选会</a></li>
      <li class="<%="special".equals(job_fair_type)?"active":"" %>"><a href="<%=request.getContextPath() %>/wap/index.jsp?job_fair_type=special">专场会</a></li>
      <li class="<%="organises".equals(job_fair_type)?"active":"" %>"><a href="<%=request.getContextPath() %>/wap/index.jsp?job_fair_type=organises">宣讲会</a></li>

    </ul>
    <div class="search_panel">
    <table class="search">
      <tr>
        <td class="td1"><a href="javascript:;" id="city">选择地区</a></td>
      </tr>
      <tr>
        <td class="td2"><a href="javascript:;" id="ducation">选择学历</a></td>
      </tr>
      <!--  
      <tr>
        <td class="td3"><a href="javascript:;" id="specialty">选择专业</a></td>
      </tr>
      <tr>
        <td style="text-indent:0; text-align:center; font-size:16px;">搜索招聘会</td>
      </tr>
      -->
    </table>
    </div>
    <div class="search_content">
    
    </div>
  </div>
  <div class="f_foot_info"> <span>211校招网版权归西安大秦人力资源有限公司所有</span> <span>国家工信部网站备案号：陕ICP备13006138号-3</span> <span>西安市人力资源服务许可证编号：610100120105 </span> </div>
</div>
<div id="TB_overlayBG"></div>
</body>
</html>