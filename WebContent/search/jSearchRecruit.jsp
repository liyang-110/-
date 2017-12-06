<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.beanutils.DynaBean"%>
<%@page import="com.zhaopin.dao.factory.AdvertisementModel"%>
<%@page import="com.zhaopin.dao.factory.PicModel"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String base_dir = request.getContextPath() + "/";
	String area_id = (String) request.getAttribute("area_id");
	String ad_area_id=area_id==null?"0":area_id; 
	AdvertisementModel AdM=new AdvertisementModel();
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="Keywords"  content="<%=com.zhaopin.Config.getSiteKeywords()%>" />
<meta name="Description"  content="<%=com.zhaopin.Config.getSiteDescription()%>" />
<title><%=com.zhaopin.Config.getSiteTitle()%></title>
<link href="../js/layer/skins/default.css" rel="stylesheet" />
<link rel="stylesheet" 	href="../statics/bootstrap/2.3.2/css/bootstrap.min.css">
<link rel="stylesheet" 	href="../statics/bootstrap/2.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="../statics/css/main4.css">
<link rel="stylesheet" href="../statics/css/site.css">
<link rel="stylesheet" href="../statics/css/recruit.css">
<link rel="stylesheet" href="/search/style/core.css">

<script type="text/javascript" src="/statics/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="/statics/bootstrap/2.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript" src="/statics/jquery/jquery.form.js"></script>
<script type="text/javascript" src="/statics/jquery/jquery.validate.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/statics/artDialog/artDialog.js?skin=green"></script>
<script type="text/javascript" src="/statics/artDialog/plugins/iframeTools.js"></script>

<script type="text/javascript">
var cur_path = "<%=request.getContextPath()%>";
</script>
<script type="text/javascript" src="/statics/js/login.js" charset="utf-8"></script>
<script type="text/javascript" src="/js/flow.js" charset="utf-8"></script>

<script type="text/javascript" src="/js/layer/getprovince211.js" charset="utf-8"></script>
<script type="text/javascript" src="/js/layer/getposition.js" charset="utf-8"></script>
<script type="text/javascript" src="/js/layer/jobjss.js" charset="utf-8"></script>
</head>
<body style="padding:0px;">
	<jsp:include  page="../include/headerAndTop.jsp" flush="true"/>
	<div class="width"></div>
	<div style="clear:both;"></div>
	<div class=" container">
		<ul class="breadcrumb">
			<li>当前位置：</li>
			<li><a href="/">首页</a><span class="divider">&gt;</span></li>
			<li class="active">招聘职位列表</li>
		</ul>
	</div>
	<div class="container">
		<div class="left">
			<div class="cont_top">
				<h1>
					高级搜索 <span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						Advanced Search</span>
				</h1>
				<form id="fm" method="post"  name="fm" action="/search.do">
				<input type="hidden" name="type" value="search_recruit" />
				<input type="hidden" name="in_pagenum" value="20" />
 				<div class="sousuo">
					<div class="industry">
						<span style="color:#333;">职位类别:</span> 
						<input type="hidden" name="in_position" id="in_position" value="${seacher.in_position}">
						<input name="in_position_name" type="hidden"  id="in_position_name" value="${seacher.in_position_name}"/>
						<c:if test="${!empty seacher.in_position_name}">
												<input type="button"
							class="but" value="${seacher.in_position_name }" title="${seacher.in_position_name}" id="position" name="position" onclick="JumpSearchLayer(1,'fm','in_position','position',1);" />
						</c:if>
						<c:if test="${empty seacher.in_position_name}">
						<input type="button"
							class="but" value="选择职位" title="选择职位" id="position" name="position" onclick="JumpSearchLayer(1,'fm','in_position','position',1);" />
						</c:if>
					</div>
					<div class="job">
						<span style="color:#333;">行业类别:</span> <select name='in_industry'
								style="width:244px;margin-bottom:0px;padding:0px;height:25px;line-height:25px;">
									<option value="-1">--请选择--</option>
									<option value="big1">IT|通信|电子|互联网</option>
									<option value="big2">金融业</option>
									<option value="big3">房地产|建筑业</option>
									<option value="big4">商业服务</option>
									<option value="big5">贸易|批发|零售|租赁业</option>
									<option value="big5">文体教育|工艺美术</option>
									<option value="big7">生产|加工|制造</option>
									<option value="big8">交通|运输|物流|仓储</option>
									<option value="big9">服务业</option>
									<option value="big10">文化|传媒|娱乐|体育</option>
									<option value="big11">能源|矿产|环保</option>
									<option value="big12">政府|非盈利机构</option>
									<option value="big13">农|林|牧|渔|其他</option>
							</select>
					</div>
					<div class="clear"></div>
					<table class="tbl">
						<tr>
							<td>发布日期:</td>
							<td><select name="in_add_time_1"
								style="width:120px;margin-bottom:0px;padding:0px;height:25px;line-height:25px;">
									<option value="-1">--请选择--</option>
									<c:if test="${!empty dateArea}">
									  <c:forEach items="${dateArea}" var="node">
									  <option value="${node.key}">${node.value}</option>
									  </c:forEach>
									</c:if>
									
							</select></td>
							<td>学历要求:</td>
							<td><select name="in_edu"
								style="width:120px;margin-bottom:0px;padding:0px;height:25px;line-height:25px;">
									<option value="-1">--请选择--</option>
									<option value="level_07">大专</option>
									<option value="level_03">高职</option>
									<option value="level_02">本科</option>
									<option value="level_01">研究生</option>
							</select></td>
							<td>月薪范围:</td>
							<td><select name="in_money"
								style="width:120px;margin-bottom:0px;padding:0px;height:25px;line-height:25px;">
									<option value="-1">--请选择--</option>
									<option value="money_01">1500-2000</option>
									<option value="money_02">2000-2500</option>
									<option value="money_03">2500-3000</option>
									<option value="money_04">3000-3500</option>
									<option value="money_05">3500-4000</option>
									<option value="money_06">4000-5000</option>
									<option value="money_07">5000-6000</option>
									<option value="money_08">6000-7000</option>
									<option value="money_09">7000-8000</option>
									<option value="money_10">8000以上</option>
							</select></td>
						</tr>
						<tr>
							<td>公司性质:</td>
							<td><select name="in_nature"
								style="width:120px;margin-bottom:0px;padding:0px;height:25px;line-height:25px;">
									<option value="-1">--请选择--</option>
									<option value="nature_01">国企</option>
									<option value="nature_02">私企</option>
									<option value="nature_03">外企</option>
									<option value="nature_05">事业单位</option>
									<option value="nature_06">上市公司</option>
							</select></td>
							<td>公司规模:</td>
							<td><select name="in_scale"
								style="width:120px;margin-bottom:0px;padding:0px;height:25px;line-height:25px;">
									<option value="-1">--请选择--</option>
									<option value="person_num_01">少于50人</option>
									<option value="person_num_02">50-100人</option>
									<option value="person_num_03">100-300人</option>
									<option value="person_num_04">300-500人</option>
									<option value="person_num_05">500人以上</option>
							</select></td>
							<td>工作类型:</td>
							<td><select name="in_job_type"
								style="width:120px;margin-bottom:0px;padding:0px;height:25px;line-height:25px;">
									<option value="-1">--请选择--</option>
									<option value="全职">全职</option>
									<option value="兼职">兼职</option>
									<option value="实习">实习</option>
							</select></td>
						</tr>
						<tr>
							<td>工作地点:</td>
							<td>
							<input name="in_area" type="hidden"  id="in_area" value="${seacher.in_area}"/>
							<input name="in_area_name" type="hidden"  id="in_area_name" value="${seacher.in_area_name}"/>
							<c:if test="${empty seacher.in_area_name}">
							<input type="button" id="areas" name="areas" style="width:120px;margin-bottom:0px;padding:0px;"
							 placeholder="选择工作地点" value="选择工作地点" title="选择工作地点" onclick="JumpSearchLayer(2,'fm','in_area','areas',1);" />
							</c:if>
							<c:if test="${!empty seacher.in_area_name}">
							<input type="button" id="areas" name="areas" style="width:120px;margin-bottom:0px;padding:0px;"
							 placeholder="${seacher.in_area_name}" value="${seacher.in_area_name}" title="${seacher.in_area_name}" onclick="JumpSearchLayer(2,'fm','in_area','areas',1);" />
							</c:if>
		
							</td>
							 <td colspan="4"><div class="search">
						<input type="text" placeholder="请输入关键字" value="${seacher.in_key}" class="zi" name="in_key"/> <input
							type="button" value="搜索" class="suo" onclick="javascript:searchForm();"/>
					</div></td>
						</tr>
					</table>
					
				</div>
				</form>
			</div>
			<!--表单完成-->
			<div class="cont_bottom">
				<table width="728" border="0" cellpadding="5" cellspacing="0">
					<tr>
						<td>企业名称</td>
						<td>岗位名称</td>
						<td>工作地区</td>
						<td>薪资待遇</td>
						<td>更新日期</td>
						<td>投递简历</td>
					</tr>
					<tr class="xian">
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					 <%
          		List queryresult=(List)request.getAttribute("queryresult");
             	if(queryresult!=null && queryresult.size()>0 ){
             	for(Iterator it = queryresult.iterator(); it.hasNext(); ){
             	Map row = (Map)it.next();
             %>
					<tr>
						<td><a style="color:#08c;" href="company/info.do?id=<%=row.get("company_id") %>&jobs=1" target="_blank"><%=row.get("company_name") %></a></td>
						<td><a style="color:#08c;" href="company/jobDetail.do?id=<%=row.get("job_id") %>" target="_blank"><%=row.get("job_name") %></a></td>
						<td><%=row.get("areas") %></td>
						<td><%=row.get("money")==null?"面议":row.get("money") %></td>
						<td><%=row.get("add_time") %></td>
						<td class="bag"><a href="javascript:;" onclick="openOrderJob('<%=row.get("company_id") %>','<%=row.get("job_id") %>');" class="btn btn-info btn-small ">
                投简历
                </a></td>
					</tr>
					<% }
             	}
             %> 
				</table>
				<div class="pagelist">
					<ul class="pages1">
						 <%=request.getAttribute("pagenation") %>
					</ul>
				</div>
			</div>
		</div>
		<!--left-->
		<div class="right">
			<div class="right_top">
				<h1>热门职位搜索</h1>
				<div class="list" id="hotSearch">
					<a href="#">销售</a><a href="#">会计</a><a href="#">助理</a><a href="#">司机</a><a
						href="#">行政</a><a href="#">采购</a><a href="#">物流</a><a href="#">文员</a><a
						href="#">简历指导</a><a href="#">简历翻译</a><a href="#">造价</a><a href="#">招商</a><a
						href="#">园林</a><a href="#">猎头</a><a href="#">人事主管</a><a href="#">资料员</a><a
						href="#">设备</a><a href="#">公关</a><a href="#">销售总监</a><a href="#">销售主管</a><a
						href="#">餐饮</a><a href="#">文案</a><a href="#">商务</a><a href="#">船务</a><a
						href="#">采购助理</a><a href="#">纺织</a><a href="#">收银员</a><a href="#">人才服务</a><a
						href="#">数据分析</a><a href="#">船务</a>
				</div>
			</div>
			<style>
				.right_bottom img {
					width:235px;
					margin-top:5px;
					margin-bottom:5px;
				}
			</style>
			<div class="right_bottom">
				<%= AdM.getAdLinkHtml("news_500x132",ad_area_id,6,base_dir,false) %>
				<a href="http://www.daqinrc.com" target="_blank">
					<img src="/ad/daqinrc/three.jpg" />
				</a>
				
			</div>
		</div>
		<!--right-->
		<div class="clear"></div>
	</div>
	<!--container完成-->
	<jsp:include page="../include3/bottom.jsp" flush="true" />
<script type="text/javascript">
//页面数据初始化
$(function(){
	//行业，in_industry
	   if("${seacher.in_industry}"){
		$('select[name="in_industry"]').val("${seacher.in_industry}");  
	   }
	//发布日期 in_add_time_1
	   if("${seacher.in_add_time_1}"){
			$('select[name="in_add_time_1"]').val("${seacher.in_add_time_1}");  
		   }
	//学历要求in_edu
	   if("${seacher.in_edu}"){
			$('select[name="in_edu"]').val("${seacher.in_edu}");  
		   }
	//月薪范围in_money
	   if("${seacher.in_money}"){
			$('select[name="in_money"]').val("${seacher.in_money}");  
		   }
	//公司性质in_nature
	   if("${seacher.in_nature}"){
			$('select[name="in_nature"]').val("${seacher.in_nature}");  
		   }
	//公司规模in_scale
	   if("${seacher.in_scale}"){
			$('select[name="in_scale"]').val("${seacher.in_scale}");  
		   }
	//工作类型in_job_type
	   if("${seacher.in_job_type}"){
			$('select[name="in_job_type"]').val("${seacher.in_job_type}");  
		   }
	
	//绑定翻页
	/*
	$(".pages1 li").on('click','a',function(i){
		$(this).removeAttr('href');
		$('input[name="in_page"]').val($(this).data('page'));
		searchForm();
	});
	*/
	$("#hotSearch").on('click','a',function(i){
		window.top.location.href='/search.do?type=search_recruit&in_job_name='+$(this).text();
	});
	
});
//搜索提交
function searchForm(){
	if($.trim($('#in_area').val()).length>0){
		$('#in_area_name').val($('#areas').val());
	}
	if($.trim($('#in_position').val()).length>0){
		$('#in_position_name').val($('#position').val());
	}
	
	$('#fm').submit();
}

//搜索


</script>
</body>
</html>