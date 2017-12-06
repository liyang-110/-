<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>无标题文档</title>
<link rel="stylesheet" href="../statics/bootstrap/2.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="../statics/bootstrap/2.3.2/css/bootstrap-theme.min.css">

<link rel="stylesheet" href="../statics/css/main.css">
<link rel="stylesheet" href="../statics/css/recruit.css">

<script src="../statics/jquery/1.11.3/jquery.min.js"></script>
<script src="../statics/bootstrap/2.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript" src="../statics/jquery/jquery.form.js"></script>
<script src="../statics/jquery/jquery.validate.min.js" type="text/javascript"></script> 
<script src="../statics/artDialog/artDialog.js?skin=green"></script>

<script type="text/javascript" src="../statics/jquery/jquery.jcarousellite.min.js"></script>
<script type="text/javascript" src="../statics/js/login.js"></script>

</head>
<body>
<div  class="head_logo">
<div class="container">
        	<div class="logo pull-left">
            	<a href="/">
        		<img src="../statics/logo.jpg" width="210" height="105">
                </a>
            </div>
  <div class="pull-right contact">
             	<div class="phone ">客服热线：400&nbsp;6606&nbsp;125</div>
                <div class="btn-group">
                    <a class="btn btn-warning btn-mini">登录</a>
                    <a class="btn btn-warning btn-mini">注册</a>
             </div>
         </div>

</div>
<div class="navbar navbar-green">
  <div class="navbar-inner">
  	<!-- 
    <a class="brand" href="#">Title</a>
    -->
    <ul class="nav">
      <li><a href="#">招聘会</a></li>
      <li class="divider-vertical"></li>
      <li><a href="#">招聘职位</a></li>
      <li class="divider-vertical"></li>
      <li><a href="#">机关事业</a></li>
      <li class="divider-vertical"></li>
      <li><a href="#">名企招聘</a></li>
      <li class="divider-vertical"></li>
      <li><a href="#">国企招聘</a></li>
      <li class="divider-vertical"></li>
      <li><a href="#">就业资讯</a></li>
      <li class="divider-vertical"></li>
      <li><a href="#">返回首页</a></li>
    </ul>
  </div>
</div>
<!-- logo --><!-- xyzph --><!-- ad --><!-- news  -->
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
					$("input[name='"+param+"']").val( $(this).text() );
					$("#search_form").submit();
			});
		});
	</script>
	<form method="get"  id="search_form" action="<%=request.getContextPath()%>/search.do">
		<input type="hidden" name="type" value="search_recruit">
		<input type="hidden" name="in_pagenum" value="20">
		
		<input type="hidden"  name="in_areas"  value=""/>
		<input type="hidden"  name="in_edu"  value=""/>
		<input type="hidden"  name="in_job_nature"  value=""/>
		<input type="hidden"  name="in_scale"  value=""/>
	</form>
	<ul class="select-condition">
    <li  class="line">
    	<ul><li class=" item">工作地点：</li>
    	<li class=" options">
    	<a data-param="in_areas">陕西</a>
    	<a data-param="in_areas">上海</a>
		<a data-param="in_areas">河南</a>
		<a data-param="in_areas">湖北</a>
		<a data-param="in_areas">浙江</a>
		<a data-param="in_areas">四川</a>
    	<a data-param="in_areas">北京</a>
		<a data-param="in_areas">河北</a>
		<a data-param="in_areas">陕西</a>
		<a data-param="in_areas">江苏</a>
		<a data-param="in_areas">甘肃</a>
		    	 <br/>
		<a data-param="in_areas">北京</a>
    	</li>
    	<li class="more">
    	<a href="javascript:;" class="pull-right">更多<i class="caret"></i></a></li>
        </ul>
        <ul class="clear"></ul>
    </li>
    <li class="divider"></li>
    <li  class="line">
    	<ul><li class=" item">学历要求：</li>
    	<li class=" options">
    	<a data-param="in_edu">大专</a>
		<a data-param="in_edu">高职</a>
		<a data-param="in_edu">本科</a>
		<a data-param="in_edu">研究生</a></li>
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
    		<a data-param="in_job_nature">全职</a> 
    		<a data-param="in_job_nature">兼职</a> 
    		<a data-param="in_job_nature">实习</a>
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
    		<a data-param="in_scale">10-50人</a>
    		<a data-param="in_scale">50-100人</a>
    		<a data-param="in_scale">100-300人</a>
    		<a data-param="in_scale">300-500人</a>
    		<a data-param="in_scale">500人以上</a>
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

<div class="container">
<div class="orange_hr"></div>
<table class="table table-bordered table-hover">
        	<thead style="background-color:#EDEBE9; height:42px;">
            <tr>
            <td>职位名称</td>
            <td>企业名称</td>
            <td>工作地点</td>
            <td>薪资待遇</td>
            <td>更新日期</td>
            <td>申请职位</td>
            </tr>
            </thead>
            <tbody>

            	<tr>
                <td><a href="company/info.do?id=201502100006722&amp;jobs=1" target="_blank">营销人员</a></td>
                <td>陕西新才网络技术有限公司</td>
                <td>西安</td>
                <td>7000-8000</td>
                <td>2015-06-06</td>
                <td>
                <a href="javascript:;" onclick="openOrderJob('201502100006722','201502100005424');" class="btn btn-warning btn-small ">
                投简历
                </a>
                </td>
                </tr>
             
            	<tr>
                <td><a href="company/info.do?id=201502100006722&amp;jobs=1" target="_blank">营销人员</a></td>
                <td>陕西新才网络技术有限公司</td>
                <td>西安</td>
                <td>7000-8000</td>
                <td>2015-06-06</td>
                <td>
                <a href="javascript:;" onclick="openOrderJob('201502100006722','201502100005424');" class="btn btn-warning btn-small ">
                投简历
                </a>
                </td>
                </tr>
                
           </tbody>
         </table>
</div>

<div class=" pagination pagination-centered">
     <ul><li class="disabled"><span>上一页</span></li><li class="disabled active"><span>1</span></li><li><a href="/search.do?&amp;in_pagenum=20&amp;in_key=&amp;type=search_recruit&amp;in_page=2">2</a></li><li><a href="/search.do?&amp;in_pagenum=20&amp;in_key=&amp;type=search_recruit&amp;in_page=3">3</a></li><li class="disabled"><span>···</span></li><li><a href="/search.do?&amp;in_pagenum=20&amp;in_key=&amp;type=search_recruit&amp;in_page=144">144</a></li><li><a href="/search.do?&amp;in_pagenum=20&amp;in_key=&amp;type=search_recruit&amp;in_page=2">下一页</a></li></ul>
      <!-- 
      <ul><li class="disabled"><span>上一页</span></li><li class="disabled active"><span>1</span></li><li><a href="/subStationJobs.do?area_id=3&amp;page=2">2</a></li><li><a href="/subStationJobs.do?area_id=3&amp;page=3">3</a></li><li class="disabled"><span>···</span></li><li><a href="/subStationJobs.do?area_id=3&amp;page=19">19</a></li><li><a href="/subStationJobs.do?area_id=3&amp;page=2">下一页</a></li></ul>
       -->
      </div>

<div id="bottom_contact">
        <div class="container">
                    <div class="pull-left" style="margin-top:15px;">
                    	<img src="../statics/img/tel_400.png" />
                    </div>
                    <div class="pull-left" style="margin-top:15px; padding-left:30px;">
                            <div class="navbar" style="clear: both;">
                                    <ul class="nav">
                                    <li><a href="/page.do?id=201407210000321">关于我们</a></li>
                                    <li class="divider-vertical"></li>
                                    <li><a href="/page.do?id=201407210000326">广告投放</a></li>
                                    <li class="divider-vertical"></li>
                                    <li><a href="/page.do?id=201407210000328">法律声明</a></li>
                                    <li class="divider-vertical"></li>
                                    <li><a href="/page.do?id=201407210000329">人才招聘</a></li>
                                    <li class="divider-vertical"></li>
                                    <li><a href="/page.do?id=201407210000327">联系方式</a></li>
                                  </ul>
                             </div>
                             <div style="clear:both;"></div>
                             <div style="padding-left:15px;">
地址：西安高新区科技二路65号清华科技园清扬国际大厦A座410<br>
工信部备案号：陕ICP备13006138号-3  西安市人力资源服务许可证编号：610100120105  西安大秦人力资源有限公司 版权所有。
                             </div>

                    </div>
                    <div style="clear:both;"></div>
                </div>
        </div>
		<div id="bottom_declare">
        	<img src="../statics/img/110.jpg" style="margin:auto; margin-top:12px;"/>
        </div>
        
        
</body>
</html>