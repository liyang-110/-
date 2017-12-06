<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.beanutils.DynaBean" %>
<% 
String base_dir =request.getContextPath()+"/";
String area_id = (String)request.getAttribute("area_id");
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="Keywords" content="<%=com.zhaopin.Config.getSiteKeywords() %>" />
<meta name="Description" content="<%=com.zhaopin.Config.getSiteDescription() %>" />
<title><%=com.zhaopin.Config.getSiteTitle() %></title>
<link rel="stylesheet" href="../statics/bootstrap/2.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="../statics/bootstrap/2.3.2/css/bootstrap-theme.min.css">

<link rel="stylesheet" href="../statics/css/main.css">
<link rel="stylesheet" href="../statics/css/recruit.css">

<script src="../statics/jquery/1.11.3/jquery.min.js"></script>
<script src="../statics/bootstrap/2.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript" src="../statics/jquery/jquery.form.js"></script>
<script src="../statics/jquery/jquery.validate.min.js" type="text/javascript"></script> 
<script src="../statics/artDialog/artDialog.js?skin=green"></script>
<script type="text/javascript">
var cur_path = "<%=request.getContextPath()%>";
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/statics/js/login.js" charset="utf-8"></script>
<script src="<%=request.getContextPath()%>/assets/artDialog/plugins/iframeTools.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/flow.js" charset="utf-8"></script>
</head>
<body>
<jsp:include page="../include3/header.jsp" flush="true" />
<div style="clear:both;"></div>
<div class=" container">
		<ul class="breadcrumb">
		   <li>当前位置：
		   </li>
          <li>
            <a href="./">首页</a><span class="divider">&gt;</span>
          </li>
          <li class="active">招聘职位列表</li>
        </ul>
</div>
<div class="container">
	<style>
		.select-condition li.line{ display:block; clear:both; position:relative;}
		.select-condition li.line ul {position:relative;clear:both;}
		.select-condition li.divider { border-bottom:1px dashed #000;}
		.select-condition .line li { float:left;line-height: 30px;}
		.select-condition .line li.item { width:10%;}
		.select-condition .line li.options { width:75%;height:30px;overflow:hidden;}
		.select-condition .line li.options a { margin-right:20px;cursor:pointer;}
		.select-condition .line li.more { width:10%; clear:right;}
	</style>
	<script>
		$(function(){
			$(".select-condition .more a").bind("click",function(){
					$(this).parents(".line").find(".options").css("height","auto");
			});
			$(".select-condition .options a").bind("click",function(){
					var param = $(this).attr("data-param");
					$("input[name='"+param+"']").val( $(this).attr("data-value") );
					$("#search_form").submit();
			});
		});
	</script>
	<%
		String in_area=request.getAttribute("in_area")==null?"":(String)request.getAttribute("in_area");
		String in_edu=request.getAttribute("in_edu")==null?"":(String)request.getAttribute("in_edu");
		String in_job_type=request.getAttribute("in_job_type")==null?"":(String)request.getAttribute("in_job_type");
		String in_scale=request.getAttribute("in_scale")==null?"":(String)request.getAttribute("in_scale");
	%>
	<style>
		#search_condition a{
			margin-left:15px;
			line-height:20px;
			font-size:14px;
			height:20px;
			display:inline-block;
			cursor:pointer;
		}
		#search_condition a { border:1px solid #DFDCD8;padding-left:3px;}
		#search_condition a i {margin-left:3px;color:#FFF; background-color:#FB7A00;padding:0 6px;}
	</style>
	<div id="search_condition">
		
	</div>
	<script type="text/javascript">
		$(function(){
			var conditon = $("#search_condition");
			var in_area=$("input[name=in_area]").val();
			var in_edu=$("input[name=in_edu]").val();
			var in_job_type=$("input[name=in_job_type]").val();
			var in_scale=$("input[name=in_scale]").val();
			var text="";
			if(in_area!=''){
				text = $("a[data-value='"+in_area+"']").text();
				conditon.append( '<a data-dest="in_area">'+text+'<i>X</i></a>' );
			}
			if(in_edu!=''){
				text = $("a[data-value='"+in_edu+"']").text();
				conditon.append(  '<a data-dest="in_edu">'+text+'<i>X</i></a>' );
			}
			if(in_job_type!=''){
				text =  $("a[data-value='"+in_job_type+"']").text();
				conditon.append(  '<a data-dest="in_job_type">'+text+'<i>X</i></a>'  );
			}
			if(in_scale!=''){
				text = $("a[data-value='"+in_scale+"']").text();
				conditon.append(  '<a data-dest="in_scale">'+text+'<i>X</i></a>'   );
			}
			$("a[data-dest]").on("click",function(){
				var dest =  $(this).attr("data-dest");
				$("input[name='"+dest+"']").val("");
				$("#search_form").submit();
			});
		});
	</script>
	<form method="get"  id="search_form" action="<%=request.getContextPath()%>/search.do">
		<input type="hidden" name="type" value="search_recruit">
		<input type="hidden" name="in_pagenum" value="20">
		
		<input type="hidden"  name="in_area"  value="<%=in_area%>"/>
		<input type="hidden"  name="in_edu"  value="<%=in_edu%>"/>
		<input type="hidden"  name="in_job_type"  value="<%=in_job_type%>"/>
		<input type="hidden"  name="in_scale"  value="<%=in_scale%>"/>
	</form>
	<ul class="select-condition">
    <li  class="line">
    	<ul><li class=" item">工作地点：</li>
    	<li class=" options">
    	<a data-param="in_area" data-value="28">陕西</a>
    	<a  data-param="in_area" data-value="2">北京</a>
		<a data-param="in_area" data-value="3">天津</a>
    	<a data-param="in_area" data-value="10">上海</a>
		<a data-param="in_area" data-value="12">浙江</a>
		<a data-param="in_area" data-value="11">江苏</a>
		<a data-param="in_area" data-value="18">湖北</a>
		<a data-param="in_area" data-value="5">山西</a>
		<a data-param="in_area" data-value="17">河南</a>
		<a data-param="in_area" data-value="29">甘肃</a>
		<a data-param="in_area" data-value="4">湖南</a>
		<a data-param="in_area" data-value="4">河北</a>
		<a data-param="in_area" data-value="24">四川</a>
		    	 <br/>
		<a data-param="in_area" data-value="7">辽宁</a>
		<a data-param="in_area" data-value="6">内蒙古</a>
		<a data-param="in_area" data-value="8">吉林</a>
		<a data-param="in_area" data-value="9">黑龙江</a>
		<a data-param="in_area" data-value="13">安徽</a>
		<a data-param="in_area" data-value="14">福建</a>
		<a data-param="in_area" data-value="15">江西</a>
		<a data-param="in_area" data-value="16">山东</a>
		<a data-param="in_area" data-value="20">广东</a>
		<a data-param="in_area" data-value="21">广西</a>
		<a data-param="in_area" data-value="26">云南</a>
		<a data-param="in_area" data-value="23">重庆</a>
		    	 <br/>
		<a data-param="in_area" data-value="25">贵州</a>
		<a data-param="in_area" data-value="22">海南</a>
		<a data-param="in_area" data-value="31">宁夏</a>
		<a data-param="in_area" data-value="30">青海</a>
		<a data-param="in_area" data-value="27">西藏</a>
		<a data-param="in_area" data-value="32">新疆</a>
    	</li>
    	<li class="more">
    	<a href="javascript:;" class="pull-right">更多<i class="caret"></i></a>
    	</li>
        </ul>
        <ul class="clear"></ul>
    </li>
    <li class="divider"></li>
    <li  class="line">
    	<ul><li class=" item">学历要求：</li>
    	<li class=" options">
    	<a data-param="in_edu"  data-value="level_07">大专</a>
		<a data-param="in_edu"  data-value="level_03">高职</a>
		<a data-param="in_edu"  data-value="level_02">本科</a>
		<a data-param="in_edu"  data-value="level_01">研究生</a></li>
        <li class="more">
        <!-- 
        <a href="javascript:;"  class="pull-right">更多<i class="caret"></i></a>
         -->
        </li>
        </ul>
         <ul class="clear"></ul>
    </li>
    <li class="divider"></li>
    <li  class="line">
    	<ul><li class=" item">工作性质：</li>
    	<li class=" options">
    		<a data-param="in_job_type" data-value="全职">全职</a> 
    		<a data-param="in_job_type" data-value="兼职">兼职</a> 
    		<a data-param="in_job_type" data-value="实习">实习</a>
    	</li>
        <li class="more">
         <!-- 
        <a href="javascript:;"  class="pull-right">更多<i class="caret"></i></a>
         -->
        </li>
        </ul>
         <ul class="clear"></ul>
    </li>
    <li class="divider"></li>
    <li  class="line">
    	<ul><li class=" item">企业规模：</li>
    	<li class=" options">
    		<a data-param="in_scale"  data-value="person_num_01">10-50人</a>
    		<a data-param="in_scale"  data-value="person_num_02">50-100人</a>
    		<a data-param="in_scale"  data-value="person_num_03">100-300人</a>
    		<a data-param="in_scale"  data-value="person_num_04">300-500人</a>
    		<a data-param="in_scale"  data-value="person_num_05">500人以上</a>
    	</li>
        <li class="more">
        <!-- 
        <a href="javascript:;"  class="pull-right">更多<i class="caret"></i></a>
         -->
        </li>
        </ul>
         <ul class="clear"></ul>
    </li>
    </ul>
</div>
<style>
.job_search_list  td{
	overflow:hidden;white-space:nowrap;word-break:keep-all;text-overflow: ellipsis;
}
.job_search_list  td.col1 {width:220px;}
.job_search_list  td.col2 {width:220px;}
.job_search_list  td.col3 {width:80px;}
.job_search_list  td.col4 {width:80px;}
.job_search_list  td.col5 {width:120px;}
.job_search_list  td.col6 {width:70px; text-align:center;}
</style>
<div class="container">
<div class="orange_hr"></div>
    	<table class="table table-bordered table-hover job_search_list"   style="table-layout:fixed;">
        	<thead style="background-color:#EDEBE9; height:42px;">
            <tr>
            <td class="col2">企业名称</td>
            <td class="col1">岗位名称</td>
            <td class="col3">工作地区</td>
            <td class="col4">薪资待遇</td>
            <td class="col5">更新日期</td>
            <td class="col6">投简历</td>
            </tr>
            </thead>
            <tbody>
            <%
          		List queryresult=(List)request.getAttribute("queryresult");
             	if(queryresult!=null && queryresult.size()>0 ){
             	for(Iterator it = queryresult.iterator(); it.hasNext(); ){
             	Map row = (Map)it.next();
             %>
            	<tr>
                <td class="col2"><a href="company/info.do?id=<%=row.get("company_id") %>&jobs=1" target="_blank"><%=row.get("company_name") %></a></td>
                <td class="col1"><a href="company/jobDetail.do?id=<%=row.get("job_id") %>" target="_blank"><%=row.get("job_name") %></a></td>
                <td class="col3"><%=row.get("areas") %></td>
                <td class="col4"><%=row.get("money")==null?"":row.get("money") %></td>
                <td class="col5"><%=row.get("add_time") %></td>
                <td class="col6">
                <a href="javascript:;" onclick="openOrderJob('<%=row.get("company_id") %>','<%=row.get("job_id") %>');" class="btn btn-info btn-small ">
                投简历
                </a>
                </td>
                </tr>
             <% }//for
             	}//if
             %>   
           </tbody>
         </table>
     </div>

     <div class=" pagination pagination-centered">
     <%=request.getAttribute("pagenation") %>
      <!-- 
      <ul><li class="disabled"><span>上一页</span></li><li class="disabled active"><span>1</span></li><li><a href="/subStationJobs.do?area_id=3&amp;page=2">2</a></li><li><a href="/subStationJobs.do?area_id=3&amp;page=3">3</a></li><li class="disabled"><span>···</span></li><li><a href="/subStationJobs.do?area_id=3&amp;page=19">19</a></li><li><a href="/subStationJobs.do?area_id=3&amp;page=2">下一页</a></li></ul>
       -->
      </div>

<jsp:include  page="../include3/bottom.jsp" flush="true"/> 
        
</body>
</html>