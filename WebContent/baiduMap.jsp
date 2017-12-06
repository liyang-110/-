<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="zh-CN">
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="keywords" content="211校招网,网络视频招聘会，网络招聘会，宣讲会，校园招聘会，应届生招聘会，高校招聘会，毕业生招聘会。" />
	<meta name="description" content=" 211校招网是一个为高校和企业开展校园招聘，提供校园招聘会，宣讲会，网络视频招聘会服务的网站。在全国30个省市设立了分站，服务用人单位和大学生。" />
	<meta name="author" content="">
	<style type="text/css">
        body, html {width: 100%;height: 100%;margin:0;font-family:"微软雅黑";font-size:14px;}
        #l-map{height:600px;width:100%;}
        #r-result,#r-result table{width:100%; clear:both;}
        #routePanel p{float:left;}
        #start,#end{
        	width:300px;
        }
    </style>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=DDd05fcba9fea5b83bf648515e04fc4c"></script>
    <script src="/static/jquery/1.11.3/jquery.min.js"></script>
    <title>百度地图</title>
</head>
<body>
    <div id="l-map" style="height:570px;"></div>
    <input type="button" style="position:fixed;margin-top: -560px;margin-left: 1290px;color:#fff;height: 30px;background:black;border: 1px solid black;width: 60px;" onclick="javascript:history.back(-1);" value="返回">
    <div id="routePanel">
        <p style="margin-right:10px;">起点：<span>
        	<input type="text" id="start" placeholder='请输入起始位置'></input></span></p>
        <p>终点：<span id="B_PointName1">
        	<input type="text" id="end"  value="${company_addr }"></input></span></span>
        <button onclick="search()">查询公交路线</button>
    </div>
    <div id="r-result" style="display:none;"></div>
</body>
</html>
<script type="text/javascript">
    var map = new BMap.Map("l-map");
    map.centerAndZoom(new BMap.Point(116.404, 39.915), 12);
    map.enableScrollWheelZoom();
    
    //比例尺
    var scaleControl = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT});
   	map.addControl(scaleControl);
    //导航操作
    var navControl = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
    map.addControl(navControl);
    //地图缩略图
    var overviewControl = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:true});
    map.addControl(overviewControl);
  	
    //定位控件
 	map.addControl(new BMap.GeolocationControl());
 	 
	//目标地址
    localSearch = new BMap.LocalSearch(map);
	localSearch.enableAutoViewport(); //允许自动调节窗体大小
	
	var keyword='${companyInfo.company_addr }';
	if(keyword !== null || keyword !== undefined || keyword !== ''){
		keyword ="陕西省西安市雁塔区科技二路清华科技园A座";
	}
	localSearch.setSearchCompleteCallback(function (searchResult) {
	        var poi = searchResult.getPoi(0);
	        map.centerAndZoom(poi.point, 13);
	        var marker = new BMap.Marker(new BMap.Point(poi.point.lng, poi.point.lat));  // 创建标注，为要查询的地址对应的经纬度
	        map.addOverlay(marker);
	    });
	localSearch.search(keyword);
	//公交系统
    var transit = new BMap.TransitRoute(map, {
        renderOptions: {map: map, panel: "r-result"}, 
        onResultsHtmlSet : function(){$("#r-result").show()}   
    });  
    function search()
    {
        var start = $("#start").val() ,end = $("#end").val();
			transit.search(start,end);
    }
</script>