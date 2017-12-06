<%@page import="net.sf.json.JSONArray"%>
<%@page import="com.zhaopin.admin.action.JsonAction"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.zhaopin.dao.factory.AdvertisementModel"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.zhaopin.dao.factory.AreaModel" %>
<%
	String area_id=(String)request.getAttribute("area_id");
	String contextPath=request.getContextPath();
	
 	String aParam = area_id==null?"28":"&a="+area_id;
 	
	AdvertisementModel AdM=new AdvertisementModel();
	 AreaModel areaModel =new AreaModel();
	    String areaName="";
	    Map<String,Object> map=( Map<String,Object>)request.getAttribute("seacher");
	    if(map!=null&&map.get("areaId")!=null){
	    	String areaId=map.get("areaId")+"";
	    	areaName = com.zhaopin.Station.getStationName( area_id );
	    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="Keywords" content="<%=com.zhaopin.Config.getSiteKeywords() %>" />
<meta name="Description" content="<%=com.zhaopin.Config.getSiteDescription() %>" />
<title><%=com.zhaopin.Config.getSiteTitle() %></title>
<link rel="stylesheet" href="/statics/bootstrap/2.3.2/css/bootstrap.min.css"/>
<link rel="stylesheet" href="/statics/bootstrap/2.3.2/css/bootstrap-theme.min.css"/>

<link rel="stylesheet" href="/statics/css/main4.css"/>
<link rel="stylesheet" href="/statics/css/site.css"/>

<link type="text/css" type="text/css"  rel="stylesheet" href="/jobFair/style/index.css" />

<script src="/statics/jquery/1.11.3/jquery.min.js"></script>
<script src="/statics/bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script> 
<script src="/statics/jquery/jquery.form.js" type="text/javascript" charset="utf-8"></script>
<script src="/statics/jquery/jquery.validate.min.js" type="text/javascript" charset="utf-8"></script> 
<script src="/statics/artDialog/artDialog.js?skin=green" charset="utf-8"></script>
<script src="/statics/artDialog/plugins/iframeTools.js"></script>

<script type="text/javascript" src="/jobFair/js/laydate.js"></script>
<script type="text/javascript">
	var cur_path = "<%=request.getContextPath()%>";
</script>
<script type="text/javascript" src="/statics/js/login.js" charset="utf-8"></script>
<script type="text/javascript" src="/js/flow.js" charset="utf-8"></script>

</head>
<body>

<jsp:include  page="include/headerAndTop.jsp" flush="true"/>

<div class="width">
	
</div>
<!--hengxian-->
<div class="container">
	<div class="menu">
        <p>当前位置：<a href="/">首页</a>>招聘会</p>
        <!-- banner -->
        <div class="banner">
           <a href="http://www.daqinrc.com/article/info.php?id=2027" target="_blank">
           <img src="/jobFair/img/banner_two.jpg" height="240" width="980" />
           </a>
        </div>
        <!-- banner end -->
        <div style="position:relative;">
        <style>
        	.container ul.menu_a li {width:226px;}
        </style>
        <ul class="menu_a" style="position:relative;top:auto;left:auto;margin:-50px auto auto auto; ">
            <li class="sel">校园招聘会</li>
            <li>网络招聘会</li>
            <!--
            <li>专场招聘会</li>
            <li>宣讲会</li>
            -->
        </ul>
        </div>
        <div class="clear"></div>
    </div>
    <!--标签页-->
    <div class="left">
        <div class="left_a"><!-- 搜索招聘会 -->
        <form target="_blank" method="get" id="seacherForm" action="<%=request.getContextPath()%>/search.do">
        	<input type="hidden" value="search_jobfair"  name="type" />
        	<input type="hidden" value="9" name="in_pagenum" />
        	<input type="hidden" value="" name="in_area_id" />
            <input type="hidden" name="in_begin_date"  value="" />
            <input type="hidden" name="in_end_date"  value=""/>
            <h1>搜索招聘会</h1>
            <div class="form">
                地区：
              <input type="text" name="arerName" id="selectArea" value="<%=areaName %>" class="ipt_defa" size="25"   placeholder="请输入地区" />
            </div>
            <div class="box">		
                <div class="demo3">
                    <ul class="inline">
                    <li> 开始日：</li>
                   <li class="inline laydate-icon" id="start" placeholder="YYYY-MM-DD"  style="width:205px; height:28px; margin-right:10px;" value="">${seacher.startTime}</li>
                    <li>  结束日：</li>
                    <li class="inline laydate-icon" id="end"  placeholder="YYYY-MM-DD" style="width:205px; height:28px;" value="">${seacher.endTime}</li>
                    </ul>
                </div>        
            </div>
            <div class="sousuo">
            	<input type="text" name="in_key" class="s" size="22"  placeholder="关键字" value="${seacher.keyWords}" />
                <a href="javascript:submitForm('#seacherForm');">搜索</a>
            </div>
            </form>
          <script>
			function selectArea(areaId,areaName){
				$("input[name='in_area_id']").val(areaId);
				$("#selectArea").val(areaName);
				art.dialog({id:'selectArea'}).close();
			}
 			function submitForm( obj ){
				$( obj ).submit();
			} 
          $(function(){
				$('#selectArea').click(function(e){
						e.preventDefault();
						art.dialog({
							follow:"#selectArea",
							id: 'selectArea',
							title:false,
							content:'加载中... ...',
							fixed:true,
							close:function(){this.hide(); return false;},
							show:false,
							esc:true,
							padding:"2px 6px 10px 6px"
						});
						var url ='/service/selectArea.jsp';
						var pageContentBody =$(art.dialog({id: 'selectArea'}).content());
						pageContentBody.parents(".aui_dialog").find(".aui_close").addClass("site_select_panel_close");
				
						$.post(url, {}, function (res) {
										pageContentBody.html(res);
										art.dialog({id: 'selectArea'}).show();
						});		
						
					});
          });
        !function(){
            laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
            // laydate({elem: '#demo'});//绑定元素
        }();
        //日期范围限制
        var start = {
            elem: '#start',
            format: 'YYYY-MM-DD',
            // min: laydate.now(), //设定最小日期为当前日期
            max: '2099-06-16', //最大日期
            istime: false,
            istoday: true,
            choose: function(datas){
                 end.min = datas; //开始日选好后，重置结束日的最小日期
                 end.start = datas //将结束日的初始值设定为开始日
                 $("input[name='in_begin_date']").val( datas );
            }
        };
        var end = {
            elem: '#end',
            format: 'YYYY-MM-DD',
            // min: laydate.now(),
            max: '2099-06-16',
            istime: false,
            istoday: true,
            choose: function(datas){
                start.max = datas; //结束日选好后，充值开始日的最大日期
                $("input[name='in_end_date']").val( datas );
            }
        };
        laydate(start);
        laydate(end);
          </script>
        </div><!-- 搜索招聘会 -->
        <div class="left_b">
        	<h1>全国招聘会</h1>
        	<style>
        	.container .left .left_b .list  {padding:6px 10px;}
        	.container .left .left_b .list p {overflow:hidden;width:100%;padding:0;text-overflow:ellipsis;}
        	.container .left .left_b .list p a {color:#333;}
        	</style>
        	<div class="list" style="text-overflow:ellipsis;overflow:hidden;">
        	<%
        	List<HashMap> latestJobfair = (List<HashMap>)request.getAttribute("latestJobfair");
        	if( latestJobfair!=null && latestJobfair.size()>0 ){
        		for(HashMap row : latestJobfair ){
        	%>
	       <p style="white-space:nowrap;">
	       [<a href="/site.do?a=<%=row.get("area_id")%>"><%=row.get("area_name") %></a>]
	       <a target='_blank' href="/jobfairInfo.do?id=<%=row.get("job_fair_id")%>">
	       <%=row.get("job_fair_name") %>
	       </a>
	       </p>
        	<%
        		}
        	}
        	 %>
        	 </div>
        	 <%--
           <div class="list">
	                <h2><%=row.get("area_name") %></h2>
	                <p><%=row.get("job_fair_name") %></p>
	                <div class="duo">
	                	<a target='_blank' href="/jobfairInfo.do?id=<%=row.get("job_fair_id")%>">更多>></a>	
	                </div>
	                <div class="clear"></div>
	        </div>
	         --%>
        </div>
        <div class="left_b" style="border:none;">
        	<a href="http://www.daqinrc.com" target="_blank">
        		<img src="/ad/daqinrc/five.jpg" style="width:308px;">
        	</a>
        </div>
    </div>
    <!--right开始-->
    <div class="right">
    	<div class="maincont">
    			<% List list= AdM.getAdList("sub_ad2-3",area_id, 5); 
    			if(list!=null&&list.size()>0){
    				%>
    					<div class="guanggao">
            		<div id="owl-demo" class="owl-carousel">
            		   <%for(int i=0;i<list.size();i++){
            			   JSONArray json=JSONArray.fromObject(list.get(i));
            			   %>
            			   <a class="item" href="<%=json.get(0)%>" target="_blank"><img src="<%=json.get(1) %>" height="135" width="620" /></a>
            			   <%
            		   } %>
                    	
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
				});
				</script>
    				<%
    			}
    			%>
    <%-- 		
    			<c:if test="${empty jobfairType}">
    			
        	          <%
	List jobfairList =(List)request.getAttribute("jobfairList");

	if(jobfairList!=null && jobfairList.size()>0){
			String job_fair_name;
			String job_fair_type;
			int i=1;
   			for(Iterator it=jobfairList.iterator();it.hasNext();){
				HashMap row = (HashMap)it.next(); 
				job_fair_name = (String)row.get("job_fair_name");
	            job_fair_type = (String)row.get("job_fair_type");
	            if(i%2==1){%>
	            	<div class="job left_a">
	                <%
		            	}else{%>    <div class="job right_a"> <%  }
	            if("multiple".equals(job_fair_type) 
	            		|| "netcongress".equals(job_fair_type)  ){
 						%>		
                	<h1><a title="<%=row.get("job_fair_name") %>"><%=job_fair_name%></a></h1>
                    <p>举办时间：<%=row.get("job_fair_time") %></p>
                    <p>剩余展位：<%=row.get("last_num") %>个  <a href="<%=request.getContextPath()%>/jobfairInfo.do?id=<%=row.get("job_fair_id")%>" target="_blank" >查看详情>></a></p>
                    <ul>
                    	<li><a href="javascript:;" onclick="ComApply('<%=row.get("job_fair_id")%>','<%=row.get("school_id")%>')" >企业订展</a></li>
                        <li><a href="javascript:;" onclick="openOrder('<%=row.get("job_fair_id")%>','<%=row.get("school_id")%>')">投递简历</a></li>
                        <div class="clear"></div>
                    </ul>
                </div>
                <%
                    }else{
                     %>
                	<h1><a title="<%=row.get("job_fair_name") %>"><%=row.get("job_fair_name") %></a></h1>
                    <p>举办时间：<%=row.get("job_fair_time") %></p>
                    <p>举办地点：<%=row.get("job_fair_addr") %></p>
                    <ul>
                    	<li><a href="javascript:;" onclick="openOrder('<%=row.get("job_fair_id")%>','<%=row.get("school_id")%>')">立即参加</a></li>
                    	<li><a href="<%=request.getContextPath()%>/jobfairInfo.do?id=<%=row.get("job_fair_id") %>" target="_blank">查看详情>></a></li>
                    	<!-- 
                        <li class="one"><a href="javascript:;">分享到<img src="<%=request.getContextPath()%>/jobFair/img/sj.png"></a></li>
                         -->
                        <div class="clear"></div>
                    </ul>
                	</div>
                     <%}
	            i++;
   					}
   			     %>
   			        <div class="pagelist">
					<ul class="pages1">
						<%=request.getAttribute("pagenation") %>
					</ul>
				</div>
   			     <%
	              }else{
                 %>
                    	  <div class="job left_a" style="width:96%;">
                		<h1>暂无数据</h1>
                		</div>
                    	 <%
                 } %>
                    </c:if>
            --%>	
            <div class="clear"></div>
        	
            <div class="cont" id="school" >
            	  <!--校园招聘会--> 
            </div>
                    
            <div class="cont" style="display:none" id="netcongress">
                
                <!--网络招聘会-->
            </div>
              <div class="cont" style="display:none" id="specialcom">
                
                <!--专场招聘会-->
            </div>
          	<div class="cont" style="display:none" id="organises">
               
               <!-- 宣讲会 -->
			</div>
			<div id="organisesList" style="display:none;">
                 <div class="list" >
                	<p>热门宣讲会  <span>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Hot talk</span></p>
                </div> 
                <div class="title1">
                    <div class="box">
                        <div class="menu2">
                            <ul>
                                <li class="hotel" data="2">北京</li>
                                <li data="10">上海</li>
                                <li data="20">广州</li>
                                <li data="18">武汉</li>
                                <li data="12">杭州</li>
                                <li data="28">西安</li>
                                <li data="11">南京</li>
                                <li data="24">成都</li>
                                <li>其他</li>
                            </ul>
                            <div class="clear"></div>
                        </div>
                        <div class="typ">
                            <div id="typ1" class="content">
                             
                            </div>
                            <!--er-->
                            <div id="typ2" class="content">
                             
                            </div>
                            <!--er-->
                            <div id="typ3" class="content">
                             
                            </div>
                            <!--er-->
                            <div id="typ4" class="content">
                             
                            </div>
                            <!--er-->
                            <div id="typ5" class="content">
                             
                            </div>
                            <!--er-->
                            <div id="typ6" class="content">
                             
                            </div>
                            <!--er-->
                            <div id="typ7" class="content">
                             
                            </div>
                            <!--er-->
                            <div id="typ8" class="content">
                             
                            </div>
                             <div id="typ9" class="content">
                             
                            </div>
                            <!--er-->
                        
                    </div>
                </div>
                <script type="text/Javascript">
				$(function(){
					$(".menu2 li").each(function(i){
						$(this).hover(function(){
							if(!$(this).hasClass("hotel")){
								$(this).addClass("on")
							}
						},function(){
							if(!$(this).hasClass("hotel")){
								$(this).removeClass("on")
							}
						}).click(function(){
							if(!$(this).hasClass("hotel")){
								$(this).stop()
								$(".menu2 li").removeClass()
								$("#typ"+(i+1)).load("/organisesList.do?&a="+$(".menu2 li").eq(i).attr("data"));
								$(this).addClass("hotel")   /* on sel */
								$(".content").slideUp(0,function(){
									if($(".content:visible").size()==0){
										$("#typ"+(i+1)).fadeIn(0);
										
									}
								})
							}
						})
					})
				})
				</script>
            </div> 
            </div> 
            <!--宣讲会-->
    	</div>
    </div>
   <div class="clear"></div>
</div>

<!--标签页-->
<script type="text/javascript">
$(".menu ul li").each(function(i){
	$(this).hover(function(){
		if($(this).attr("class")!="sel"){
			$(this).attr("class","hover")
		}
	},function(){
		$(this).removeClass("hover")
	}).click(function(){
		$("#organisesList").hide();
		$(".sel").each(function(i){
			
			$(this).removeClass("sel");
		});
		
		$(this).attr("class","sel")
		$(".cont").eq(i).show()
		$(".cont").eq(i).siblings().hide()
		$(".guanggao").css('display',"block");
		if(i==3){
			$("#organisesList").show();
		}
		
	})
});
/**
 * 初始化数据
 */
$(function(){
	if("<%=request.getParameter("jobfairType")%>"=='netcongress')
	{
		$(".menu ul li").eq(1).trigger("click");
	}
	/*
	* 初始化校园招聘数据
	*/
	//$("#school").hide();
	/*
	if("${jobfairType}"=='multiple')
	{
		$("#school").show();
		$(".menu ul li").eq(0).attr("class","sel");
	}else if("${jobfairType}"=='netcongress'){
		$("#netcongress").show();
		$(".menu ul li").eq(1).attr("class","sel");
	}else if("${jobfairType}"=='organises'){
		$("#organises").show();
		$(".menu ul li").eq(2).attr("class","sel");
	}else if("${jobfairType}"=='specialcom'){
		$("#specialcom").show();
		$(".menu ul li").eq(3).attr("class","sel");
	}
	*/	
	$("#school").load("/jobfairList.do?t=schoolJobFairList&a=<%=area_id==null?"":area_id %>");
	//专场招聘会
	//$("#specialcom").load("/jobfairList.do?t=specialcom&a=<%=area_id==null?"":area_id %>");
	//网络招聘
	$("#netcongress").load("/jobfairList.do?t=netWorkJobFairList&a=<%=area_id==null?"":area_id %>");
	//宣讲会
	//$("#organises").load("/jobfairList.do?t=careerTalkList&a=<%=area_id==null?"":area_id %>");
	
	//热点宣讲会
	//$("#typ1").load("/organisesList.do?&a=2");
	//$("#organisesList").hide();
	/**
	选择地区
	**/
	
	$("#pages1 a").live('click',function(){
		var url=$(this).attr("href");
		$(this).removeAttr("href");
		$(this).parents(".cont").load(url);
		var _targetTop=$(this).parents(".cont").offset().top;//获取位置
		$("html,body").animate({scrollTop:_targetTop-300},300);
		return;
	});
})
</script>
<!--container完成-->
<jsp:include page="include3/bottom.jsp" flush="true" />    
<!--footer完成-->
</body>
</html>
