<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.Station"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="keywords"  content="<%=com.zhaopin.Config.getSiteKeywords()%>" />
	<meta name="description"  content="<%=com.zhaopin.Config.getSiteDescription()%>" />
	<title><%=com.zhaopin.Config.getSiteTitle()%></title>
 
	<link href="/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link href="/static/css/common-element.css" rel="stylesheet" type="text/css">
    <link href="/static/css/index-gaojiss.css" rel="stylesheet" type="text/css">
    <link href="/static/css/font-awesome.min.css" rel="stylesheet" media="screen">
    
    <script type="text/javascript" src="/statics/jquery/1.11.3/jquery.min.js"></script>
    <script  type="text/javascript" src="/static/bootstrap/js/bootstrap.min.js"></script>
    
	<script type="text/javascript" src="/statics/jquery/jquery.form.js"></script>
	<script type="text/javascript" src="/statics/jquery/jquery.validate.min.js"></script>
	<script type="text/javascript" src="/static/artDialog/artDialog.js?skin=aero"></script>
	<script type="text/javascript" src="/statics/artDialog/plugins/iframeTools.js"></script>
	<script type="text/javascript">
	var cur_path = "<%=request.getContextPath()%>";
	</script>
	<script type="text/javascript" src="/static/js/flow.js" charset="utf-8"></script>

	<script type="text/javascript" src="/js/layer/getprovince211.js" charset="utf-8"></script>
	<script type="text/javascript" src="/js/layer/getposition.js" charset="utf-8"></script>
	<script type="text/javascript" src="/js/layer/jobjss.js" charset="utf-8"></script>

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
		$("#fm").find("input[name='in_key']").val( $(this).text() );
		$("#fm").submit();
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
</head>
<body>
<!--头部架构开始-->
<jsp:include page="include/header.jsp" flush="true"></jsp:include>
<!--头部架构结束-->

<!--main架构开始-->
<div class="main">
   <div class="main_l">
        <div class="main_l_top">
        <form id="fm" method="post" name="fm" action="/jobfair/search.do">
				<input type="hidden" name="type" value="search_recruit" />
				<input type="hidden" name="in_pagenum" value="20" />
				<div class="choices">
					<div class="choice1">
						<label><input type="radio" value="全职" name="in_job_type">全职</label>
					</div>
					<div class="choice1">
						<label><input type="radio" value="兼职" name="in_job_type">兼职</label>
					</div>
					<div class="choice1">
						<label><input type="radio" value="实习" name="in_job_type">实习</label>
					</div>
				</div>

				<!-- <div class="shaixuan1">
					
						<div class="choice2">行业类别</div>
						<select class="select1"  name='in_industry'>
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
						<div style="clear:both"></div>
				</div> -->
				<div class="shaixuan2">
					<div class="choice2">职位类别</div>
										<input type="hidden" name="in_position" id="in_position" value="${seacher.in_position}">
					<input name="in_position_name" type="hidden"  id="in_position_name" value="${seacher.in_position_name}"/>
					<c:if test="${!empty seacher.in_position_name}">
											<input type="button"
						class="select2" value="${seacher.in_position_name }" title="${seacher.in_position_name}" id="position" name="position" onclick="JumpSearchLayer(1,'fm','in_position','position',1);" />
					</c:if>
					<c:if test="${empty seacher.in_position_name}">
					<input type="button"
						class="select2" value="选择职位" title="选择职位" id="position" name="position" onclick="JumpSearchLayer(1,'fm','in_position','position',1);" />
					</c:if>
					<div style="clear:both"></div>
				</div>
				<div class="shaixuan3">
					<div class="choice2">学历要求</div>
					<select class="select3">
									<option value="-1">--请选择--</option>
									<option value="level_07">大专</option>
									<option value="level_03">高职</option>
									<option value="level_02">本科</option>
									<option value="level_01">研究生</option>
					</select>
					<div style="clear:both"></div>
				</div>
				<div class="shaixuan1">
					<div class="choice2">薪资范围</div>
					<select class="select1">
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

					</select>
					<div style="clear:both"></div>
				</div>

				<div class="shaixuan2">
					<div class="choice2">公司性质</div>
					<select class="select2">

						<option value="-1">--请选择--</option>
						<option value="nature_01">国企</option>
						<option value="nature_02">私企</option>
						<option value="nature_03">外企</option>
						<option value="nature_05">事业单位</option>
						<option value="nature_06">上市公司</option>

					</select>
					<div style="clear:both"></div>
				</div>
				<div class="shaixuan3">
					<div class="choice2">工作地点</div>
					
					<input name="in_area" type="hidden"  id="in_area" value="${seacher.in_area}"/>
					<input name="in_area_name" type="hidden"  id="in_area_name" value="${seacher.in_area_name}"/>
					<c:if test="${empty seacher.in_area_name}">
					<input class="select3" type="button" id="areas" name="areas" 
					 placeholder="选择工作地点" value="选择工作地点" title="选择工作地点" onclick="JumpSearchLayer(2,'fm','in_area','areas',1);" />
					</c:if>
					<c:if test="${!empty seacher.in_area_name}">
					<input class="select3" type="button" id="areas" name="areas" 
					 placeholder="${seacher.in_area_name}" value="${seacher.in_area_name}" title="${seacher.in_area_name}" onclick="JumpSearchLayer(2,'fm','in_area','areas',1);" />
					</c:if>
					
					
					<div style="clear:both"></div>
				</div>
				<div class="main_l ss">
					<input class=" ss gjzss" type="text" placeholder="请输入关键字" value="${seacher.in_key}"  name="in_key" />
					<input class=" ss sou" type="submit" value="搜索"/>
					<div style="clear:both"></div>
				</div>
				<p class="main_l text">搜索结果显示：共有${counts }条</p>
        </form>
        </div>
        
        <div class="remengw">
			<div  class=" remengw text" id="hotSearch">
				<p class="main_r_biaoti">热门岗位：</p>
				<a href="#">销售</a><a href="#">会计</a><a href="#">助理</a><a href="#">司机</a>
				<a href="#">行政</a><a href="#">采购</a><a href="#">物流</a><a href="#">文员</a>
				<a href="#">简历指导</a><a href="#">造价</a><a href="#">招商</a>
				<a href="#">猎头</a><a href="#">人事主管</a><a href="#">资料员</a>
				<a href="#">公关</a><a href="#">销售总监</a><a href="#">销售主管</a>
				<a href="#">餐饮</a><a href="#">文案</a><a href="#">商务</a><a href="#">船务</a>
				<a href="#">采购助理</a><a href="#">纺织</a><a href="#">收银员</a>
				
			</div>
		</div>
   </div>
	<div class="main_r">
	 <div class="main_l form">
        <div class="main_l checkboxes">
          <ul class="main_l checkboxes options">
          	  <!--  
              <li class="checkbox1">
              <input type="checkbox"/>全选 
              </li>
              -->
              <li class="zhiwei">职位</li>
              <li class="companyname">公司名称</li>
               <li class="salarywage">薪资</li>
               <li class="workposition">工作地点</li>
               <li class="date">发布日期</li>
               <li class="yesorno">投递简历</li> 
          </ul>
        </div>
          <div class="main_l form content">
        <%
        	List queryresult=(List)request.getAttribute("queryresult");
           	if(queryresult!=null && queryresult.size()>0 ){
           	for(Iterator it = queryresult.iterator(); it.hasNext(); ){
           	Map row = (Map)it.next();
        %>
					<ul class="content_in">
						<!-- 
						<li class="checkbox1"><input type="checkbox" /></li>
						 -->
						<li class="zhiwei">
							<%if("a".equals(row.get("is_hurry"))){%>
								<img style="margin-top:5px" width="42" height="20" src="/static/img/hurry.png">
							<% } %>
						  	<a href="/jobfair/job.do?id=<%=row.get("job_id")%>" target="_blank">
							<%=row.get("job_name")%>
							</a>
							
						</li>
						<li class="companyname">
							<a href="/jobfair/company.do?id=<%=row.get("company_id") %>&jobs=1" target="_blank"><%=row.get("company_name") %></a>
						</li>
						<li class="salarywage"><%=row.get("money")==null?"面议":row.get("money") %></li>
						<li class="workposition"><%=row.get("areas") %></li>
						<li class="date"><%=row.get("add_time") %></li>
						<li class="yesorno"><a href="javascript:;" onclick="openOrderJob('<%=row.get("company_id") %>','<%=row.get("job_id") %>','<%=row.get("company_name") %>','<%=row.get("job_name") %>','<%=row.get("contact_tel") %>');" class="toudi">投递简历</a>
						</li>
						<div style="clear:both"></div>
					</ul>
		<%
			}
			}
		%> 

          </div>
		  <div class="main_l form content" style="text-align:center;">
				 <%=request.getAttribute("pagenation") %>
		  </div>
        </div>	
	</div>
   
	<div style="clear:both"></div>  
</div>
<!--main架构结束-->
<!--footer区架构结束-->
<jsp:include page="include/footer.jsp" flush="true"></jsp:include>
<!--footer区架构结束-->
</body>
</html>
