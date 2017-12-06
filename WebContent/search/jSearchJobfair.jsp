<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.zhaopin.dao.factory.AdvertisementModel"%>
<%

AdvertisementModel AdM=new AdvertisementModel();
String base_dir =request.getContextPath()+"/";
List result = (List)(List)request.getAttribute("queryresult");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta name="Keywords" content="<%=com.zhaopin.Config.getSiteKeywords() %>" />
<meta name="Description" content="<%=com.zhaopin.Config.getSiteDescription() %>" />
<title>招聘会搜索-- <%=com.zhaopin.Config.getSiteTitle() %></title>

<link rel="stylesheet" href="statics/bootstrap/2.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="statics/bootstrap/2.3.2/css/bootstrap-theme.min.css">

<link rel="stylesheet" href="/statics/css/main4.css" type="text/css"/>
<link rel="stylesheet" href="/statics/css/site.css" type="text/css"/>

<link href="/statics/css/search.css" rel="stylesheet" type="text/css" />

<script src="/assets/jquery/jquery.min.js"></script>
<script src="/assets/artDialog/artDialog.js?skin=green"></script>
<script type="text/javascript" src="/assets/scripts/front.js"></script>
<script src="/assets/artDialog/plugins/iframeTools.js"></script>
<script type="text/javascript" src="/jobFair/js/laydate.js"></script>
<link rel="shortcut icon" href="media/image/favicon.ico" />
<script type="text/javascript">
		var cur_path = "<%=request.getContextPath()%>";
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/flow.js" charset="utf-8"></script>
    </head>

	<body>
 	<jsp:include page="../include/headerAndTop.jsp"  flush="true" />
	<div class="width"></div>
	<div class="container">
	        <ul class="breadcrumb">
	                  <li>
	                    <a href="./">首页</a> <span class="divider">&gt;</span>
	                  </li>
	                  <li class="active">招聘会</li>
	          </ul>
	
	</div>
	<div class="container">
		<style>
			#seacherForm .form {height:22px;padding:0 25px;margin:10px auto;}
			#seacherForm input{height:22px;display:inline;padding:0 3px;margin:0;margin-right:20px;}
			#seacherForm label.laydate-icon {margin-right:15px;border-radius:5px;display:inline-block; height: 22px; margin:0; vertical-align: middle; }
		</style>
        <form method="get" id="seacherForm" action="<%=request.getContextPath()%>/search.do">
        	<input type="hidden" value="search_jobfair"  name="type" />
        	<input type="hidden" value="9" name="in_pagenum" />
        	<input type="hidden" value="${seacher.in_area_id}" name="in_area_id" />
            <input type="hidden" name="in_begin_date"  value="${seacher.in_begin_date}" />
            <input type="hidden" name="in_end_date"  value="${seacher.in_end_date}"/>
            <div class="form">
                地区：
              <input style="width:100px;" type="text" name="arerName" id="selectArea" value="${seacher.arerName}" class="ipt_defa" size="10"   placeholder="请选择地区" />

                 时间：<label class="inline laydate-icon" id="start" placeholder="YYYY-MM-DD"  style="width:100px; height:22px; " value="${seacher.in_begin_date}">${seacher.in_begin_date}</label>
                 —<label class="inline laydate-icon" id="end"  placeholder="YYYY-MM-DD" style="width:100px; height:22px;" value="${seacher.in_end_date}">${seacher.in_end_date}</label>
				&nbsp;&nbsp;
              <input type="text" name="in_key" class="s" size="22"  placeholder="请输入招聘会或学校名称" value="${seacher.in_key}" />
              <input type="submit" value="搜索" class="btn btn-success">
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
            //min: laydate.now(), //设定最小日期为当前日期
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
            //min: laydate.now(),
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
	</div>
    <div class="container main">
        <div class="pull-left f_content">
         <div class="info_card_container">
       <%
	  	if( result !=null && result.size()>0)
	  	{
	  			 String job_fair_name;
			     for(Iterator it = result.iterator(); it.hasNext(); )
			     {
			     	Map row = (Map)it.next();
								job_fair_name = (String)row.get("job_fair_name");
					            
					            if("multiple".equals(row.get("job_fair_type"))
					            	 || "netcongress".equals(row.get("job_fair_type")) ) {
					%>
					<div class="info_card <%=row.get("pasted")%>">
						<!-- info_card 招聘会卡片模板，可循环套用 -->
						<div class="title"><!--   <%=row.get("job_fair_date") %>  -->
						<a title="<%=job_fair_name%>"><%=job_fair_name%>
							</a>
						</div>
						<div class="line">
							举办时间：<%=row.get("job_fair_time") %>
						</div>
						<div class="line last">
							剩余展位：<%=row.get("last_num") %>个
                            <span class="divider"></span>
                            <a href="<%=request.getContextPath()%>/jobfairInfo.do?id=<%=row.get("job_fair_id") %>" target="_blank" class="btn-link" target="_blank">查看详情&gt;&gt;</a>
						</div>
						<div class="action">
							<a href="javascript:;" onclick="ComApply('<%=row.get("job_fair_id")%>','<%=row.get("school_id")%>')" class="btn btn-warning btn-small">企业订展</a>
							<a href="javascript:;" onclick="openOrder('<%=row.get("job_fair_id")%>','<%=row.get("school_id")%>')" class="btn  btn-warning btn-small">投递简历</a>
						</div>
					</div> <!--  /info_card -->
					<%
								}else{
					%>
					<div class="info_card <%=row.get("pasted")%>">
						<!-- info_card 招聘会卡片模板，可循环套用 -->
						<div class="title"><%=row.get("job_fair_date") %>
							<a title="<%=row.get("job_fair_name") %>"><%=job_fair_name%></a>
						</div>
						<div class="line">
							时间：<%=row.get("job_fair_time") %>
						</div>
						<div class="line last">
							地点：<%=row.get("job_fair_addr") %>
						</div>
						<div class="action">
							<a href="javascript:;" onclick="openOrder('<%=row.get("job_fair_id")%>','<%=row.get("school_id")%>')" class="btn btn-warning btn-small">投递简历</a>
							<a href="<%=request.getContextPath()%>/jobfairInfo.do?id=<%=row.get("job_fair_id") %>" target="_blank" class="btn  btn-warning btn-small">查看详情</a>
						</div>
					</div> <!--  /info_card -->
					<%			}
	             	}
		}else{
	             	%>
	             
	             <div style="margin:auto;text-aglin:center;">	
	      <table style="margin:20px auto; ">
	      	<tr>
	      		<td rowspan="2">
	      			<img src="<%=request.getContextPath() %>/assets/images/nodata_03.png" />
	      		</td>
	      		<td valign="top" style="padding-left:30px;">对不起，没有查询到结果。</td>
	      	</tr>
	      	<tr>
	      		<td valign="bottom" style="padding-left:30px;color:#FD871F;">请修改搜索条件重新搜索。</td>
	      	</tr>
	      </table>
	      		</div>
	      
	             	<%
		}
	    %>
        
         
         </div>
         <div>
			<div style="clear:both;"></div>
            <div class=" pagination pagination-centered">
            <%=request.getAttribute("pagenation") %>
             </div>

         </div>
         </div><!-- / f_content  -->
         <div class="f_ad pull-right">
         	<ul>
         		<%= AdM.getLiWrappedHtml("news_252x108", "0",8,base_dir,false) %>
         		<!-- 
         		<li>
         			<img src="../statics/img/search_ad_1.jpg"></img>
         			<p><a >这是广告文本</a></p>
         		</li>
 				 -->
         	</ul>
         </div>
    </div>
    <div style="clear:both;"></div>
    
<jsp:include page="../include3/bottom.jsp" flush="true" />


<script src="<%=request.getContextPath()%>/assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script> 

	</body>
</html>

