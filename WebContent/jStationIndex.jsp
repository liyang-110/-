<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.factory.NewsModel" %>
<%@ page import="com.zhaopin.dao.factory.JobFairModel" %>
<%@ page import="org.apache.commons.beanutils.DynaBean" %>
<%@page import="com.zhaopin.Station"%>
<%@ page import="com.zhaopin.dao.factory.AdvertisementModel" %>
<%@ page import="cn.com.zhaopin.base.pub.cCharControl" %>
<%
String base_dir =request.getContextPath()+"/";
String area_id = (String)request.getAttribute("area_id");

AdvertisementModel	adModel = new AdvertisementModel();
List ad_980 = (List)request.getAttribute("ad_980");

 %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<script type="text/javascript" src="/statics/js/isPhone.js"></script>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="Keywords" content="<%=com.zhaopin.Config.getSiteKeywords() %>" />
<meta name="Description" content="<%=com.zhaopin.Config.getSiteDescription() %>" />
<title><%=com.zhaopin.Config.getSiteTitle() %></title>
<link rel="stylesheet" href="/statics/bootstrap/2.3.2/css/bootstrap.min.css"/>
<link rel="stylesheet" href="/statics/bootstrap/2.3.2/css/bootstrap-theme.min.css"/>

<link rel="stylesheet" href="/statics/css/main4.css"/>
<link rel="stylesheet" href="/statics/css/site.css"/>
<link type="text/css" rel="stylesheet" href="/jobFair/style/index.css" />

<script src="/statics/jquery/1.11.3/jquery.min.js"></script>
<script src="/statics/bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script> 
<script src="/statics/jquery/jquery.form.js" type="text/javascript" charset="utf-8"></script>
<script src="/statics/jquery/jquery.validate.min.js" type="text/javascript" charset="utf-8"></script> 
<script src="/statics/artDialog/artDialog.js?skin=green" charset="utf-8"></script>
<script src="/statics/artDialog/plugins/iframeTools.js"></script>

<script type="text/javascript" src="statics/jquery/jquery.jcarousellite.min.js"></script>
<script type="text/javascript">
var cur_path = "<%=request.getContextPath()%>";
</script>
<script type="text/javascript" src="/statics/js/login.js" charset="utf-8"></script>
<script type="text/javascript" src="/js/flow.js" charset="utf-8"></script>
<script type="text/javascript">
	if (window!=top) // 判断当前的window对象是否是top对象
		top.location.href =window.location.href; 
</script>
</head>
<body>
 	<jsp:include page="include/headerAndTop.jsp"  flush="true" />
	<div class="width"></div>
	<jsp:include page="include/index_includeqq.jsp"  flush="true" />
 <!-- xyzph -->
	<% if( ad_980!=null && ad_980.size()>0 ){
		for(int i=0;i<2 && i<ad_980.size();++i ){
			 	HashMap row = (HashMap)ad_980.get(i);
	%>
	<div class="container" style="width:980px;text-align:center;margin-top:10px;">
		<div style="padding: 6px 8px; border: 1px solid #D4D0CC;">
		<a target="_blank" href="<%=row.get("ad_url")%>">
				<img src="<%=row.get("ad_pic_path")%>" /></a>
		</div>
	</div>
	<%  } 
	}%>
	<%
	List jobfair=(List)request.getAttribute("jobfair0");
	if(jobfair!=null && jobfair.size()>0){
	%>
    <div class="container xyxjh">
    	<div class="pull-left title">
        	<!--
        	<img src="statics/css/xyxjh.jpg">
            -->
            <a class="green_round_title">校园招聘会</a>
        </div>
        <script type="text/javascript">
        	$(function(){
	        	$("#zph_search_area").bind("focus",function(){
	        		$("#select_area").show();
	        	});
				$("#select_area_close").bind("click",function(){
					$("#select_area").hide();
				});
				$("#select_area .content a").bind("click",function(){
					$("#zph_search_area").val( $(this).text() );
					$("#select_area").hide();
				});
        	});

        </script>
        <div class="pull-left search" >
        	
        	<div class="xyxjh_search">
<form class="form-search form-inline" action="/search.do" method="get">                
                <input type="hidden" name="type" value="search_jobfair">
                <input type="hidden" name="in_pagenum" value="9">
            	<input type="text"  id="zph_search_area" name="in_area" placeholder="请选择地区" />
                <input type="search" name="in_key" id="search_key"  placeholder="请输入关键字" />
                <input type="submit" value="" />
</form>
            </div>
            <div id="select_area_panel">
            <div id="select_area">
            	<div class="title">
            		<span>请选择地区</span><a class="pull-right close"  id="select_area_close">X</a>
            	</div>
            	<div class="content">
            		<dl class="dl-horizontal">
            			<dt>B.G.</dt><dd><a>北京</a><a>甘肃</a></dd>
            			<dt>H.</dt><dd><a>河南</a><a>河北</a><a>湖北</a></dd>
            			<dt>J.</dt><dd><a>江苏</a></dd>
            			<dt>S.</dt><dd><a>陕西</a><a>上海</a><a>四川</a><a>山西</a></dd>
            			<dt>Z.</dt><dd><a>浙江</a></dd>
            		</dl>
            	</div>
            </div><!-- select_area  -->
            </div>
        </div>
        <div class="pull-right more">
        	<div><a href="<%=base_dir%>jobfair.do?a=<%=area_id%>">更多&gt;&gt;</a></div>
        </div>
    </div>
    
	<div class="container" id="section_zhaopin" data-unuse="1">
<div class="info_card_container"><!-- 0-->
<%
							for(Iterator it=jobfair.iterator();it.hasNext();)
							{
								DynaBean temp=(DynaBean)it.next();
					%>
					<div class="info_card <%=("0".equals( temp.get("front_sign") ) ?"":"front_card" )%>">
						<!-- info_card 招聘会卡片模板，可循环套用 -->
						<div class="title">
						<a title="<%=temp.get("job_fair_name") %>"><%=temp.get("job_fair_name") %>
							</a>
						</div>
						<div class="line">
							<%--   
							预定截止：<%=temp.get("job_fair_endtime") %>
							--%>
							举办时间：<%=temp.get("job_fair_time") %>
						</div>
						<div class="line last">
							剩余展位：<%=temp.get("last_num") %>个
                            <span class="divider"></span>
                            <a href="<%=request.getContextPath()%>/jobfairInfo.do?id=<%=temp.get("job_fair_id") %>" target="_blank" class="btn-link" target="_blank">查看详情&gt;&gt;</a>
						</div>
						<div class="action">
							<a href="javascript:;" onclick="ComApply('<%=temp.get("job_fair_id")%>','<%=temp.get("school_id")%>')" class="btn btn-warning btn-small">企业订展</a>
							<a href="javascript:;" onclick="openOrder('<%=temp.get("job_fair_id")%>','<%=temp.get("school_id")%>')" class="btn  btn-warning btn-small">投递简历</a>
						</div>
					</div> <!--  /info_card -->

					<%		} // for		
					%>					
					<div class="clearfix"></div>						
				</div><!-- /info_card_container -->
    </div>
    <%
	}
    %>
     <!-- xyzph -->
     <%
     List  jobfair2=(List)request.getAttribute("jobfair2");
	 if(jobfair2!=null&&jobfair2.size()>0){
     %>
    <div class="container xyxjh">
    	<div class="pull-left title">
        	<!--
        	<img src="statics/css/xyxjh.jpg">
            -->
            <a class="green_round_title">网络招聘会</a>
        </div>
        <div class="pull-right more">
        	<div><a href="<%=base_dir%>jobfair.do?a=<%=area_id%>&jobfairType=netcongress">更多&gt;&gt;</a></div>
        </div>
    </div>
    
    <div class="container" id="section_zhaopin" data-unuse="1">
		<div class="info_card_container"><!-- 0-->
<%
							for(Iterator it=jobfair2.iterator();it.hasNext();)
							{
								DynaBean temp=(DynaBean)it.next();
					%>
					<div class="info_card <%=("0".equals( temp.get("front_sign") ) ?"":"front_card" )%>">
						<!-- info_card 招聘会卡片模板，可循环套用 -->
						<div class="title">
						<a title="<%=temp.get("job_fair_name") %>"><%=temp.get("job_fair_name") %>
							</a>
						</div>
						<div class="line">
							<!--  
							预定截止：<%=temp.get("job_fair_endtime") %>
							-->
							举办时间：<%=temp.get("job_fair_time") %>
						</div>
						<div class="line last">
							剩余展位：<%=temp.get("last_num") %>个
                            <span class="divider"></span>
                            <a href="<%=request.getContextPath()%>/jobfairInfo.do?id=<%=temp.get("job_fair_id") %>" target="_blank" class="btn-link" target="_blank">查看详情&gt;&gt;</a>
						</div>
						<div class="action">
							<a href="javascript:;" onclick="ComApply('<%=temp.get("job_fair_id")%>','<%=temp.get("school_id")%>')" class="btn btn-warning btn-small">企业订展</a>
							<%-- 
							<a href="javascript:;" onclick="openOrder('<%=temp.get("job_fair_id")%>','<%=temp.get("school_id")%>')" class="btn  btn-warning btn-small">进入会场</a>
							--%>
		    				<a href="/netcongress/start.do?id=<%=temp.get("job_fair_id")%>" style="color:#fff;" class="btn  btn-success btn-small" target="_blank">进入会场</a>

						</div>
					</div> <!--  /info_card -->
					<%
							} // for
					%>					
					<div class="clearfix"></div>						
				</div><!-- /info_card_container -->
    </div>
    <%} %>
        <!-- ad -->
        <div class="container" >
             <div  class="ad1-1">
            	 <ul>
			<% if( ad_980!=null && ad_980.size()>1 ){ 
					 int size=ad_980.size();
					 for(int i=2;i<size;i++){
					 	HashMap row = (HashMap)ad_980.get(i);
			%>
				<li>
				<a target="_blank" href="<%=row.get("ad_url")%>">
						<img src="<%=row.get("ad_pic_path")%>" /></a>
				</li>
			<% 	 }
				  } %>
                 </ul>
            </div>
            <div class="clearfix"></div>
           <div class="ad1-2">
            	<ul>
            		<%
            		List ad_4=(List)request.getAttribute("ad_4");
            		if(ad_4!=null && ad_4.size()>0 ){
            			for(Iterator it=ad_4.iterator();it.hasNext();){
            				HashMap row = (HashMap)it.next();
            		%>
            		<li>
            		<a target=\"_blank\" href="<%=row.get("ad_url") %>">
            		<img src="<%=row.get("ad_pic_path") %>" />
            		</a>
            		</li>
            		<%
            			}
            		}
            		%>
                </ul>
            </div>
            <div class="clearfix"></div>
            <div class="ad2-3">
            	<ul>
            		<%
            		List ad2_3=(List)request.getAttribute("ad2_3");
            		if(ad2_3!=null && ad2_3.size()>0 ){
            			for(Iterator it=ad2_3.iterator();it.hasNext();){
            				HashMap row = (HashMap)it.next();
            		%>
            		<li>
            		<a target=\"_blank\" href="<%=row.get("ad_url") %>">
            		<img src="<%=row.get("ad_pic_path") %>" />
            		</a>
            		</li>
            		<%
            			}
            		}
            		%>
                </ul>
            </div>
            <div class="clearfix"></div>
            <div class="ad1-3">
            	<ul>
            		<%
            		List ad_3=(List)request.getAttribute("ad_3");
            		if(ad_3!=null && ad_3.size()>0 ){
            			for(Iterator it=ad_3.iterator();it.hasNext();){
            				HashMap row = (HashMap)it.next();
            		%>
            		<li>
            		<a target=\"_blank\" href="<%=row.get("ad_url") %>">
            		<img src="<%=row.get("ad_pic_path") %>" />
            		</a>
            		</li>
            		<%
            			}
            		}
            		%>
                </ul>
            </div>
            <div class="clearfix"></div>
            <div class="ad1-4">
            	 <ul>
            		<%
            		List ad1_4=(List)request.getAttribute("ad1_4");
            		if(ad1_4!=null && ad1_4.size()>0 ){
            			for(Iterator it=ad1_4.iterator();it.hasNext();){
            				HashMap row = (HashMap)it.next();
            		%>
            		<li>
            		<a target=\"_blank\" href="<%=row.get("ad_url") %>">
            		<img src="<%=row.get("ad_pic_path") %>" />
            		</a>
            		</li>
            		<%
            			}
            		}
            		%>
                 </ul>
            </div>
            <div class="clearfix"></div>
            <div class="ad1-5">
            	 <ul>
            		<%
            		List ad_2=(List)request.getAttribute("ad_2");
            		if(ad_2!=null && ad_2.size()>0 ){
            			for(Iterator it=ad_2.iterator();it.hasNext();){
            				HashMap row = (HashMap)it.next();
            		%>
            		<li>
            		<a target=\"_blank\" href="<%=row.get("ad_url") %>">
            		<img src="<%=row.get("ad_pic_path") %>" />
            		</a>
            		</li>
            		<%
            			}
            		}
            		%>
                 </ul>
            </div>
        </div>
		<% 
		List training_com=(List)request.getAttribute("training_com");
		if( training_com!=null && training_com.size()>0 ){ %>
        <!-- training_com -->
		<div class="container xyxjh">
		    	<div class="pull-left title">
		            <a class="green_round_title">培训机构推荐</a>
		        </div>
		        <div class="pull-right more">
		        	<div></div>
		        </div>
		    </div>
        <div class="container">
            <div class="ad1-5">
            	 <ul>
            		<%
            			for(Iterator it=training_com.iterator();it.hasNext();){
            				HashMap row = (HashMap)it.next();
            		%>
            		<li>
            		<a target=\"_blank\" href="<%=row.get("ad_url") %>">
            		<img src="<%=row.get("ad_pic_path") %>" />
            		</a>
            		</li>
            		<%
            			}
            		%>
                 </ul>
            </div>
        </div>
        <% } %>
        <!-- news  -->
        <div class="container" id="tuijian_job" style="margin-top:10px;">
        	<div class="title">
                <div class="pull-left title">
					<a class="green_round_title">推荐校招企业</a>
                </div>
                <div class="pull-left search">
                    <div class="xyxjh_search">
<form class="form-search form-inline" action="/search.do" method="get">
                <input type="hidden" name="type" value="search_recruit">
                <input type="hidden" name="in_pagenum" value="20">
                        <input type="search" name="in_key" id="search_key"  placeholder="请输入关键字" />
                        <input type="submit" value="" />
</form>
                    </div>
                </div>
                <div class="pull-right more">
                    <div><a href="<%=request.getContextPath() %>/subStationJobs.do?a=<%=area_id %>" target="_blank" >更多&gt;&gt;</a></div>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="content">
		<%
			List recommendRecruit =(List)request.getAttribute("recommendRecruit");
		%>
			
<%if(recommendRecruit!=null && recommendRecruit.size()>0 ){ 
				                 			for(Iterator it=recommendRecruit.iterator();it.hasNext();){
				                 				HashMap row = (HashMap)it.next();
				                 %>
				                 <ul>
				                 	<li>
				                 	 <a href="<%=request.getContextPath() %>/company/info.do?id=<%=row.get("company_id") %>" target="_blank" title="<%=row.get("ad_title") %>">
				                 	<img src="<%=row.get("ad_pic_path") %>"  />
				                 	</a>
				                 	</li>
	                    			<li class="comlisttit">
				                        <a href="<%=request.getContextPath() %>/company/info.do?id=<%=row.get("company_id") %>" target="_blank" title="<%=row.get("ad_title") %>">
				                        	<%=row.get("ad_title") %></a>
				                     </li>
				                     <li class="divider"></li>
				                    <li class="comlisthire">
				                    <span>诚聘：</span>
				                    <% List jobs= (List)row.get("jobs"); %>
				                    <% if(jobs!=null && jobs.size()>0){ 
				                    			for(Iterator jt=jobs.iterator();jt.hasNext();){
				                    				HashMap job=(HashMap)jt.next();
				                    %>
	            						<a title="<%=job.get("job_name") %>" href="<%=base_dir %>company/jobDetail.do?id=<%=job.get("job_id") %>" target="_blank">
	            							<%=job.get("job_name") %>
	            						</a>
				                    <% 		}
				                    		}else{%>
				                    			无
				                    <%	}%>
				                     </li>
				                </ul>
				                 <%		}//for
				                 	}//if %>			
            <div class="clearfix"></div>
            </div><!-- content -->
         </div><!-- tuijian_job  -->
         
        <div class="container" id="zuixin_job">
        	<div class="title">
                <div class="pull-left title">
                    <a class="green_round_title">最新校招职位</a>
                </div>
                <div class="pull-left search">
                    <div class="xyxjh_search">
<form class="form-search form-inline" action="/search.do" method="get">
                <input type="hidden" name="type" value="search_recruit">
                <input type="hidden" name="in_pagenum" value="20">
                        <input type="search" name="in_key" id="search_key"  placeholder="请输入关键字" />
                        <input type="submit" value="" />
</form>
                    </div>
                </div>
                <div class="pull-right more">
                    <div><a href="<%=request.getContextPath() %>/subStationJobs.do?a=<%=area_id %>" target="_blank" >更多&gt;&gt;</a></div>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="content">
		<%
			List newRecruit =(List)request.getAttribute("newRecruit");
		%>
			
<%if(newRecruit!=null && newRecruit.size()>0 ){ 
				                 			for(Iterator it=newRecruit.iterator();it.hasNext();){
				                 				HashMap row = (HashMap)it.next();
				                 %>
				                 <ul>
	                    			<li class="comlisttit">
				                        <a href="<%=request.getContextPath() %>/company/info.do?id=<%=row.get("company_id") %>" target="_blank" title="<%=row.get("company_name") %>">
				                        	<%=row.get("company_name") %></a>
				                     </li>
				                    <li class="comlisthire">
				                    <span>诚聘：</span>
				                    <% List jobs= (List)row.get("jobs"); %>
				                    <% if(jobs!=null && jobs.size()>0){ 
				                    			for(Iterator jt=jobs.iterator();jt.hasNext();){
				                    				HashMap job=(HashMap)jt.next();
				                    %>
	            						<a title="<%=job.get("job_name") %>" href="<%=base_dir %>company/jobDetail.do?id=<%=job.get("job_id") %>" target="_blank">
	            							<%=job.get("job_name") %>
	            						</a>
				                    <% 		}
				                    		}else{%>
				                    			无
				                    <%	}%>
				                     </li>
				                </ul>
				                 <%		}//for
				                 	}//if %>			
            <div class="clearfix"></div>
            </div><!-- content -->
         </div><!-- zuixin_job -->
        

	    <div class="container xyxjh">
	    	<div class="pull-left title">
	            <a class="green_round_title">校园招聘会现场</a>
	        </div>
	        <div class="pull-left search">
	        </div>
	        <div class="pull-right more">
	        	<div><a href="/list.do?&t=xianchang&a=<%=area_id %>">更多&gt;&gt;</a></div>
	        </div>
	    </div>
        <div class="container" id="zph_xc" style="margin-top:10px; height:250px;">
            <div class="slide">
                <div class="carousel">
                                 
                    <div class="jCarouselLite" id="demo-01">
                        <ul>
                        <%
                        	List jobfairNews = (List)request.getAttribute("jobfairNews");
                        	if( jobfairNews!=null && jobfairNews.size()>0 ){
                        		for(Iterator it=jobfairNews.iterator();it.hasNext();){
                        			HashMap row = (HashMap)it.next();
                        			String pic_path =(String)row.get("pic_path");
                        			if(pic_path==null)pic_path="statics/img/12.jpg";
                         %>
                            <li>
                            <a href="/newsDetail.do?id=<%=row.get("news_id") %>" target="_blank"><img height="150" width="150" alt="<%=row.get("news_title") %>" src="<%=pic_path %>" /></a>
                            <a href="/newsDetail.do?id=<%=row.get("news_id") %>" target="_blank"><%=row.get("news_title") %></a>
                            </li>
                         <% 
                         		}
                            }
                          %>
                             </ul>
                             <!-- 
							<div id="goback1" class="o-control" style="display: block;"><a class="control"></a></div>
							<div id="forward1" class="o-control" style="display: block;"><a class="control"></a></div>
                    		 -->
                    </div>
                    <div class="o-control">
                    <a href="javascript:void(0);" class="prev" id="prev-01">&nbsp </a>
                    </div>
                    <div class="o-control right">
                    <a href="javascript:void(0);" class="next" id="next-01">&nbsp </a>
                    </div>
                    <div class="clear"></div>   
                </div><!--carousel end-->
                <div style="clear:both;"></div>
                <script type="text/javascript">
                $(document).ready(function(){
                    $('#demo-01').jCarouselLite({
                        btnPrev: '#prev-01',
                        btnNext: '#next-01',
                        visible:4
                    });		
                });
                </script>
            </div>
        </div>
        <div style="clear:both;"></div>
        <%
	        		HashMap oneJobfair =(HashMap)request.getAttribute("OneJobfair");
	        		if(oneJobfair!=null ){
	        			String daojishi=oneJobfair.get("daojishi").toString();
	    %>
        <div class="container oneJobfair">
        <div style="border: 1px solid #749F4D;">
         	<div style="background:url(/statics/img5/network.jpg);width:958px;height:158px;margin:10px auto;">
         		 <div class="title">
                    		<%=oneJobfair.get("job_fair_name") %>
                 </div>
                 <div class="detail">
	                                  举办时间：<%=oneJobfair.get("timestr") %><br/>
	               <% if( oneJobfair.get("job_fair_addr")!=null ){ %>                   
	                                 举办地点：<%=oneJobfair.get("job_fair_addr") %>
	               <% } %><br/>
                </div>
                <div class="detail-btn">
                	<a href="<%=request.getContextPath()%>/jobfairInfo.do?id=<%=oneJobfair.get("job_fair_id") %>" target="_blank" >查看详情&gt;&gt;</a>
                </div>
                <%--
                <div class="daojishi">
                            	  <h1><%="0".equals(daojishi)?"今":daojishi%><small>天</small></h1>
                 </div>
                 --%>
         	</div>
        </div>
        </div>
		<%
	        		}
		%>
		<%-- 
		<div class="container newsList">
			<div class="pull-left left">
				<div class="caption">
				最新名企招聘
				<a class=" pull-right more" href="/list.do?t=news&a=<%=area_id %>">更多&gt;&gt;</a>
				</div>
				<div class="content">
					<div class="picture">
						<img src="/statics/img5/join.jpg"/>
					</div>
	                <div class="item">
	                	<ul>
	                	<%  List newslist4 = (List)request.getAttribute("newslist4");
	                		if(newslist4 !=null && newslist4.size()>1 ){ 
	              				for(int i =0; i<newslist4.size()&& i<=6;i++){
									HashMap row = (HashMap)newslist4.get(i);
									if( row.get("news_title")==null )continue;
	                	%>
	                    	<li><a href="/newsDetail.do?id=<%=row.get("news_id") %>" target="_blank">
	                    		 <%=cCharControl.strip_tags(row.get("news_title").toString(),"utf-8",0) %>
	                    		</a></li>
	                    <% }
	                    }
	                     %>
	                     </ul>
	                </div>
				</div>
			</div>
			<div class="pull-right right">
				<div class="caption">
				最新招聘会
				<a href="<%=base_dir %>jobfair.do?&a=<%=area_id %>" class=" pull-right more">更多&gt;&gt;</a>
				</div>
				<div class="content">
				<div class="picture">
						<img src="/statics/img5/meet.jpg"/>
				</div>
				<div class="item">
				<ul>
					<%
						List jobfair1=(List)request.getAttribute("jobfair1");
						if(jobfair1!=null && jobfair1.size()>0){
							for(Iterator it=jobfair1.iterator();it.hasNext();)
							{
								DynaBean row=(DynaBean)it.next();
					%>
                    	<li><a href="<%=request.getContextPath()%>/jobfairInfo.do?id=<%=row.get("job_fair_id") %>"  target="_blank"><%=row.get("job_fair_date") %>&nbsp;<%=row.get("job_fair_name") %></a></li>
                   <%	}
                   		}
                    %> 	
                </ul>
                </div>
				</div>
			</div>
		</div>
		--%>
        <!-- friend link -->
	   	<%
		   	List friendlink = adModel.getAdList("friendlink", area_id,100 );
		   	if( friendlink!=null && friendlink.size()>0 ){
	   	%>
		<div class="container xyxjh">
	    	<div class="pull-left title">
	            <a class="green_round_title">友情链接</a>
	        </div>
	    </div>
        <div class="container" id="friend-link" style="margin:auto;width:970px;">
            <%--
            <div class="caption">
                <div class="pull-left" style="color:#FE6E2B; font-size:14px;font-familiy:黑体;">
                    友情链接
                </div>
                <div class="pull-right">
                    <a href="" style="font-size:14px;font-familiy:黑体;"">申请友情链接</a>
                </div>
                <div style="clear:both;"></div>
            </div>
            --%>
            <div class="content">
            	<ul>
	    	<% for(Iterator it=friendlink.iterator();it.hasNext();){ 
	    		List row = (List)it.next(); %>
				<li><a target="_blank" href="<%=row.get(0) %>">
					<%=row.get(3) %></a></li>
	    	<% } %>

                 </ul>
            </div>
       </div>
	 <% } %>
 	<jsp:include page="include3/bottom.jsp" flush="true" />
 	 <%--
 	<script type="text/javascript">
 		$(function(){
 			if( $.cookie("todayNetcongress")==undefined ){
 				
 	 			$(document).click(function(){
 	 				if(  $.cookie("todayNetcongress")==undefined ){
 	 					$.cookie("todayNetcongress",true );
 	 	 	 			window.open("http://www.211zph.com/netcongress/start.do?id=201607010008942");
 	 				}else{
 	 					
 	 				}
 	 			});
 			}
 		});
 	</script>
 	--%>
</body>
</html>