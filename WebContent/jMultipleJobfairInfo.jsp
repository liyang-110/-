<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.zhaopin.dao.factory.AreaModel" %>
<%@ page import ="com.zhaopin.dao.factory.SchoolGraduationModel" %>
<%
	HashMap jobfairInfo = (HashMap)request.getAttribute("jobfairInfo");
	if(jobfairInfo==null){
		response.sendRedirect( request.getContentType()+"/");
		return;
	}
	String job_fair_id=(String)jobfairInfo.get("job_fair_id");
	String base_dir = request.getContextPath()+"/";
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="Keywords" content="<%=com.zhaopin.Config.getSiteKeywords() %>" />
<meta name="Description" content="<%=com.zhaopin.Config.getSiteDescription() %>" />
<title><%=jobfairInfo.get("job_fair_name") %> - <%=com.zhaopin.Config.getSiteTitle() %></title>

<link rel="stylesheet" href="/statics/bootstrap/2.3.2/css/bootstrap.min.css"/>
<link rel="stylesheet" href="/statics/bootstrap/2.3.2/css/bootstrap-theme.min.css"/>

<link rel="stylesheet" href="/statics/css/main4.css"/>
<link rel="stylesheet" href="/statics/css/site.css"/>


<script src="statics/js/isPhoneSet.js"></script>
<script type="text/javascript">
//是否跳转手机页面
mobile_device_detect('http://h5.211zph.com/mobile/jobFair/fairPage?id=<%=job_fair_id%>');
</script>
<link type="text/css" rel="stylesheet" href="/jobFair/style/jobfairInfo.css" />

<script src="/statics/jquery/1.11.3/jquery.min.js"></script>
<script src="/statics/bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script> 
<script src="/statics/jquery/jquery.form.js" type="text/javascript" charset="utf-8"></script>
<script src="/statics/jquery/jquery.validate.min.js" type="text/javascript" charset="utf-8"></script> 
<script src="/statics/artDialog/artDialog.js?skin=green" charset="utf-8"></script>
<script src="/statics/artDialog/plugins/iframeTools.js"></script>

<script type="text/javascript">
	var cur_path = "<%=request.getContextPath()%>";
</script>
<script type="text/javascript" src="/statics/js/login.js" charset="utf-8"></script>
<script type="text/javascript" src="/js/flow.js" charset="utf-8"></script>
<style type="text/css">
	#typ1.content table td {border:1px solid #666;border-collapse:collapse;}
	
	.typ #typ2 thead tr td {border-bottom:none;line-height:2em;}
	.typ #typ2 tbody tr:hover {background: #ddd;}
	.typ #typ2 tbody tr td a {color:#494949;}
	.typ #typ2 tbody tr td a:hover {text-decoration:underline;}
	.typ #typ2 {width:920px; margin:auto;overflow:hidden;}
	.typ #typ2 td{border: 1px solid #ddd;line-height:2em!important;}
	.typ #typ2 .xian td{border:none;}
	.typ #typ2 tr td div {white-space:nowrap;padding-left:15px; padding-right:15px; text-overflow:ellipsis; overflow:hidden;}

    .pagination li.disabled { background-color:#dcdcdc;cursor: text;}
    .pagination li a { color:#494949!important;} 
	
	.menu2 ul li { width: 324px; }
</style>
</head>
<body>
	<jsp:include  page="include/headerAndTop.jsp" flush="true"/>
	<div class="width">
		
	</div>
    <div class="container">
        <ul class="breadcrumb">
                  <li>
                    <a href="./">首页</a> <span class="divider">&gt;</span>
                  </li>
                  <li class="active">招聘会</li>
          </ul>

    </div>
	
	<div class="container f_content">
		
		<div class="cont">
		<h1><%=jobfairInfo.get("job_fair_name") %></h1>
		<table width="800" border="0" cellpadding="5" cellspacing="0">
		  <tr>
          	<td>举办单位： <a href="<%=request.getContextPath() %>/school/info.do?id=<%=jobfairInfo.get("school_id") %>" target="_blank">
			<%=jobfairInfo.get("school_name") %>
			</a> </td>
			<td>举办时间：<%=jobfairInfo.get("job_fair_time") %> 至 <%=jobfairInfo.get("job_fair_overtime") %> </td>
		  </tr>
		  <tr>
          	<td>预定截止：<%=jobfairInfo.get("job_fair_endtime") %></td>
			<td>举办地点：<%=jobfairInfo.get("job_fair_addr") %> </td>
		  </tr>
		  <tr>
			<td>招聘会层次：<%=jobfairInfo.get("job_fair_level") %> </td>
			<td>招聘会特色：<%=jobfairInfo.get("job_fair_feature") %> </td>
		  </tr>
		</table>
		
		<div style="width:100%;height:30px;">
			<div  style="float:left;color:#fff;">
		<a href="javascript:;"  style="color:#fff;" onclick="ComApply('<%=jobfairInfo.get("job_fair_id")%>','<%=jobfairInfo.get("school_id")%>')" class="btn btn-warning">企业订展</a>
	    <a href="javascript:;"  style="color:#fff;" onclick="openOrder('<%=jobfairInfo.get("job_fair_id")%>','<%=jobfairInfo.get("school_id")%>')" class="btn  btn-warning">投递简历</a>
	      </div>
	      <div class="fenxiang" style="float:right;width:262px;">
                    <a class="fen" style="right:210px;line-height: 45px;padding-right: 10px;">分享到</a>
                 <div style="width:205px;float:right;">
					<div class="bdsharebuttonbox">
					<a href="#" class="bds_more" data-cmd="more">
					</a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
					<a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
					<a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a>
					<a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a>
					<a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
					</div>
					</div>
           	</div>
           	<div style="clear:both;"></div>
    	</div>
	</div>
	<div style="clear:both;"></div>
	<!--上半部分完成-->
	<div class="title1">	
			<div class="box">
			<div class="menu2">
				<ul class="three">
					<li data-target="#typ1" class="hotel">邀请函</li>
					<li data-target="#typ2" class="companyList">参会企业</li>
					<!-- <li> 毕业生信息 </li>-->
                    <li data-target="#typ4">交通路线</li>
				</ul>
				<div class="clear"></div>
			</div>
			<div class="typ">
			  
			  <div id="typ1" class="content">
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
				<div id="typ2" class="content" style="display:none;">
					<table width="900" border="0" cellpadding="5" cellspacing="0">
					<thead>
					  <tr style="cursor:default;">
					  	<td width="80" >序号</td>
						<td width="300">企业名称</td>
						<td width="350" >公司地址</td>
						<td width="100" ></td>
					  </tr>
					  <tr class="xian"   style="cursor:default;">
						<td></td>
						<td></td>
						<td></td>
						<td></td>                    
					  </tr>
					  </thead>
					  <tbody>
		<%
						List companyList = (List)request.getAttribute("companyList") ;
						boolean isLogin= true;// session.getAttribute("userInfo") instanceof HashMap;
		%>
				
				 <%
    	if(!isLogin){
					%>
	             	<tr style="cursor:default;"><td colspan='4'>只有登陆用户才可以查看参会企业列表！<a href="<%=request.getContextPath() %>/register.jsp" target="_top">注册</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath() %>/" target="_top">登录</a></td></tr>
					<%
	  	}else if(companyList!=null &&companyList.size()>0){
	          	    int i=0;
	            	for(Iterator iter=companyList.iterator();iter.hasNext();){
	            		HashMap row=(HashMap)iter.next();
	            	%>
	            		<tr   style="cursor:default;">
	            		<td><%=row.get("rn") %></td>
	            		<td style="text-align:left;">
	            			<div  style="width:300px;">
	            				<a href="/company/info.do?id=<%=row.get("company_id")%>" target="_blank">
	            				<%=row.get("company_name")%>
	            				</a>
	            			</div>
	            		</td>
	            		<td style="text-align:left;">
	            			<div  style="width:350px;">
	            			<%=row.get("company_addr")==null?"":row.get("company_addr")%>
	            			</div>
	            		</td>
	            		<td  class="bag">
	            		<a href="<%=request.getContextPath()%>/company/info.do?id=<%=row.get("company_id").toString() %>&jobs=1" target="_blank"  style="font-size:12px;">投递简历</a>

	            		</td>

						</tr>
						<%
	             	}
	    }else{ %>
	             	<tr><td colspan='3'>还没有企业申请参会！</td></tr>
	             	<% 

		}
	    %>
                </tbody>
            </table>
			<div class=" pagination pagination-centered">
         			        <%=request.getAttribute("pagenation")==null?"":request.getAttribute("pagenation") %>
         	</div>

					  
				</div>
				<!--  
				<div id="typ3" class="content" style="display:none;">
				<%--
				String g_id = (String)jobfairInfo.get("grad_info_id") ;
				if(g_id != null ){
					 SchoolGraduationModel model = new SchoolGraduationModel();
					 out.println( model.getContent(g_id)  );
				 }
				--%>
				</div>
                -->
                <!--map-->
				<div id="typ4" class="content" style="display:none;">
					<div class="map">
						<div class="main-container">
                            <div class="search-form">
                                <form id="form1">
                                <input type="text" id="SearchKey" style="width: 400px;padding:7px;" value="<%=jobfairInfo.get("job_fair_addr") %>"/>
                                <input type="button" id="btn_Search" value="搜索地址" style="padding:5px;margin-bottom:10px;" onclick="placeSearch();" />
                                </form>
                            </div>
                            <div id="mapContainer"></div>
    					</div>
                      </div>
				</div>
                
			</div>
		</div>
	</div>
	<script type="text/Javascript">
	$(function(){
		$(".menu2 li").hover(function(){
				if(!$(this).hasClass("hotel")){
					$(this).addClass("on");
				}
			},function(){
				if(!$(this).hasClass("hotel")){
					$(this).removeClass("on");
				}
		});
		$(".menu2 li").click(function(){
				if(!$(this).hasClass("hotel")){
					$(this).stop();
					$(".menu2 li").removeClass("hotel");
					$(this).addClass("hotel");   /* on sel */
					var target=$(this).attr("data-target");
					$(".content").slideUp(0,function(){
						if($(".content:visible").size()==0){
							$( target ).fadeIn(0);
						}
					});
				}
		});
	});
	</script>	
	
	</div>
                    
	<jsp:include page="include3/bottom.jsp" flush="true" />
	<script src="<%=request.getContextPath()%>/assets2/bootstrap/js/bootstrap.min.js" type="text/javascript"></script> 
	<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"24"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/assets/scripts/vlstat.js"></script>
	<script type="text/javascript">
		$(function(){
			vlstatInitLE("jobfair",'<%=request.getParameter("job_fair_id")%>'); 
			placeSearch();
		});
	</script>
	<% if(  request.getParameter("page")!=null ) {%>
	<script type="text/javascript">
		$(function(){
			$(".companyList").trigger("click");
		});
	</script>
	<% } %>
<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=1994ba35a603f806df16000f3799b1da"></script>
	<script type="text/javascript">
		var marker;
		var windowsArr;
		var toolBar = null;
		var overView;
		var editorTool;
		var map = new AMap.Map("mapContainer", {
			resizeEnable : true,
			zoom : 12
		});
		map.plugin([ "AMap.ToolBar" ], function() {
			toolBar = new AMap.ToolBar();
			map.addControl(toolBar);
		});
		//在地图中添加鹰眼插件
		map.plugin([ "AMap.OverView" ], function() {
			//加载鹰眼
			//初始化隐藏鹰眼
			overView = new AMap.OverView({
				visible : true
			});
			map.addControl(overView);
		});
		//添加地图类型切换插件
		map.plugin([ "AMap.MapType" ], function() {
			//地图类型切换
			var mapType = new AMap.MapType({
				defaultType : 0, //默认显示卫星图
				showRoad : true
			//叠加路网图层
			});
			map.addControl(mapType);
		});
		//加载比例尺插件
		map.plugin([ "AMap.Scale" ], function() {
			scale = new AMap.Scale();
			map.addControl(scale);
		});
		//基本地图加载
		function placeSearch() {
			map = new AMap.Map("mapContainer", {
				resizeEnable : true
			});
			map.plugin([ "AMap.ToolBar" ], function() {
				toolBar = new AMap.ToolBar();
				map.addControl(toolBar);
			});
			//在地图中添加鹰眼插件
			map.plugin([ "AMap.OverView" ], function() {
				//加载鹰眼
				//初始化隐藏鹰眼
				overView = new AMap.OverView({
					visible : true
				});
				map.addControl(overView);
			});
			//添加地图类型切换插件
			map.plugin([ "AMap.MapType" ], function() {
				//地图类型切换
				var mapType = new AMap.MapType({
					defaultType : 0, //默认显示卫星图
					showRoad : true
				//叠加路网图层
				});
				map.addControl(mapType);
			});
			//加载比例尺插件
			map.plugin([ "AMap.Scale" ], function() {
				scale = new AMap.Scale();
				map.addControl(scale);
			});
			//设置多边形的属性
			var polygonOption = {
				strokeColor : "#0000ff",
				strokeOpacity : 1,
				strokeWeight : 3
			};
			var polygonArr;
			//在地图中添加MouseTool插件
			map.plugin([ "AMap.MouseTool" ], function() {
				var mouseTool = new AMap.MouseTool(map);
				//使用鼠标工具绘制多边形
				mouseTool.polygon(polygonOption);
				AMap.event.addListener(mouseTool, "draw", function(e) {
					//obj属性就是绘制完成的覆盖物对象
					var drawObj = e.obj;
					//获取节点个数
					var pointsCount = e.obj.getPath().length;

					polygonArr = new Array(); //构建多边形经纬度坐标数组
					for ( var i = 0; i < pointsCount; i++) {
						polygonArr.push(new AMap.LngLat(e.obj.getPath()[i].lng,
								e.obj.getPath()[i].lat));
					}
					var polygon = new AMap.Polygon({
						map : map,
						path : polygonArr,
						fillColor : "#f5deb3",
						fillOpacity : 0.35
					});
					//添加编辑控件
					map.plugin([ "AMap.PolyEditor" ], function() {
						editorTool = new AMap.PolyEditor(map, polygon);
					});
				});
			});

			marker = new Array();
			windowsArr = new Array();
			var searchKey = document.getElementById("SearchKey").value;
			var MSearch;
			AMap.service([ "AMap.PlaceSearch" ], function() {
				MSearch = new AMap.PlaceSearch({ //构造地点查询类
					pageSize : 10,
					pageIndex : 1,
					city : "021" //城市
				});
				//关键字查询
				MSearch.search(searchKey, function(status, result) {
					if (status === 'complete' && result.info === 'OK') {
						keywordSearch_CallBack(result);
					}
				});
			});
		}
		function edditpolygon() {
			editorTool.open();
		}
		function endEddit() {
			editorTool.close();
		}
		//添加marker&infowindow   
		function addmarker(i, d) {
			var lngX = d.location.getLng();
			var latY = d.location.getLat();
			var markerOption = {
				map : map,
				icon : "http://webapi.amap.com/images/" + (i + 1) + ".png",
				position : new AMap.LngLat(lngX, latY),
				topWhenMouseOver : true

			};
			var mar = new AMap.Marker(markerOption);
			marker.push(new AMap.LngLat(lngX, latY));

			var infoWindow = new AMap.InfoWindow({
				content : "<h3><font color=\"#00a6ac\">  " + (i + 1) + ". "
						+ d.name + "</font></h3>"
						+ TipContents(d.type, d.address, d.tel),
				size : new AMap.Size(300, 0),
				autoMove : true,
				offset : new AMap.Pixel(0, -20)
			});
			windowsArr.push(infoWindow);
			var aa = function(e) {
				infoWindow.open(map, mar.getPosition());
			};
			AMap.event.addListener(mar, "mouseover", aa);
		}
		//回调函数
		function keywordSearch_CallBack(data) {
			var resultStr = "";
			var poiArr = data.poiList.pois;
			var resultCount = poiArr.length;
			for ( var i = 0; i < resultCount; i++) {
				resultStr += "<div id='divid"
						+ (i + 1)
						+ "' onmouseover='openMarkerTipById1("
						+ i
						+ ",this)' onmouseout='onmouseout_MarkerStyle("
						+ (i + 1)
						+ ",this)' style=\"font-size: 12px;cursor:pointer;padding:0px 0 4px 2px; border-bottom:1px solid #C1FFC1;\"><table><tr><td><img src=\"http://webapi.amap.com/images/"
						+ (i + 1) + ".png\"></td>"
						+ "<td><h3><font color=\"#00a6ac\">名称: "
						+ poiArr[i].name + "</font></h3>";
				resultStr += TipContents(poiArr[i].type, poiArr[i].address,
						poiArr[i].tel)
						+ "</td></tr></table></div>";
				addmarker(i, poiArr[i]);
			}
			map.setFitView();
		}
		function TipContents(type, address, tel) { //窗体内容
			if (type == "" || type == "undefined" || type == null
					|| type == " undefined" || typeof type == "undefined") {
				type = "暂无";
			}
			if (address == "" || address == "undefined" || address == null
					|| address == " undefined" || typeof address == "undefined") {
				address = "暂无";
			}
			if (tel == "" || tel == "undefined" || tel == null
					|| tel == " undefined" || typeof address == "tel") {
				tel = "暂无";
			}
			var str = "  地址：" + address + "<br />  电话：" + tel + " <br />  类型："
					+ type;
			return str;
		}
		function openMarkerTipById1(pointid, thiss) { //根据id 打开搜索结果点tip
			thiss.style.background = '#CAE1FF';
			windowsArr[pointid].open(map, marker[pointid]);
		}
		function onmouseout_MarkerStyle(pointid, thiss) { //鼠标移开后点样式恢复
			thiss.style.background = "";
		}
	</script>
</body>
</html>
