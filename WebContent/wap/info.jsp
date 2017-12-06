<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.mobile.JobfairInfoService" %>
<%
	JobfairInfoService service = new JobfairInfoService();
	String id=request.getParameter("id");
	HashMap map = service.findMap(id);
	List <HashMap> list = service.ompanyList(id);
	String job_fair_type="";
	if(map==null){
		map=new HashMap();
	}
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
<style type="text/css">
img {
	max-width: 100%!important;
}
ul.nav li a {display:block;}
ul.nav li.active {background:rgb(19, 184, 58);}
ul.nav li:hover {background:rgb(19, 184, 58);}
</style>
</head>
<body>
<div class="body">
  <div id="main" role="main"> <img src="images/logo.png" width="680">
    <ul class="nav">
      <li><a href="<%=request.getContextPath() %>/wap/index.jsp?job_fair_type=multiple">双选会</a></li>
      <li><a href="<%=request.getContextPath() %>/wap/index.jsp?job_fair_type=special">专场会</a></li>
      <li><a href="<%=request.getContextPath() %>/wap/index.jsp?job_fair_type=organises">宣讲会</a></li>
    </ul>
    <div class="info_card"><!-- info_card 招聘会卡片模板，可循环套用 -->
      <div class="title"><%=map.get("job_fair_date") %> <%=map.get("job_fair_name") %></div>
      <div class="detail_body">
        <dl class="dl-horizontal">
          <dt>&gt;主办单位：</dt>
          <dd><%=map.get("job_fair_sponsor") %></dd>
          <dt>&gt;招聘会层次：</dt>
          <dd><%=map.get("job_fair_level") %></dd>
        </dl>
        <dl class="dl-horizontal ">
          <dt>&gt;举办时间：</dt>
          <dd><%=map.get("job_fair_time") %></dd>
          <dt>&gt;招聘会类型：</dt>
          <dd><%=map.get("jobfair_type") %></dd>
        </dl>
        <dl class="dl-horizontal">
          <dt>&gt;招聘会特色：</dt>
          <dd><%=map.get("job_fair_feature") %></dd>
          <dt>&gt;举办地址：</dt>
          <dd><%=map.get("job_fair_addr") %></dd>
        </dl>
        <div class="job_fair_brief">
          <dl style="padding-bottom : 0;" class="dl-horizontal ">
            <dt>&gt;招聘专业：</dt>
            <dd style="position:relative;">
              <div id="professional"> 
              		<%=map.get("professional") %>
               </div>
              <div style="border-radius: 10px;border:none;padding:4px 2px;position:absolute;right:-12px;bottom:6px;background:#FF965D;display:none;">
              <a style="display:block;" title="查看更多" id="professional_expand_btn" href="#">
              <span style="border-top: 5px solid #FFF;" class="caret"></span></a></div>
            </dd>
          </dl>
          <div style="clear:both;"></div>
        </div>
        <div class="job_fair_brief">
          <dl class="dl-horizontal ">
            <dt>&gt;邀请函：</dt>
            <dd style="min-height:20px;">
            <%=com.zhaopin.Help.textToHtml( (String)map.get("job_fair_invitation") )%>
            </dd>
          </dl>
          <div style="clear:both;"></div>
        </div>
        <a name="job_fair_company_list"></a> </div>
    </div>
    <div class="info_card">
      <div class="title">参会企业名单</div>
      <div class="top-border"></div>
      <table class="table table-striped table-hover table-bordered table-condensed">
        <thead>
          <tr>
            <th>序号</th>
            <th>地区</th>
            <th>企业名称</th>
          </tr>
        </thead>
        <tbody>
        <% if(list!=null && list.size()>0 ){ 
        	for( HashMap company : list ){ %>
          <tr>
            <td><%=company.get("rn") %></td>
            <td><%=company.get("area_id") %></td>
            <td style="padding-left:20px;text-align:left;">
            <a target="_blank" href="<%=request.getContextPath() %>/companyInfo.do?id=<%=company.get("company_id") %>">
             <%=company.get("company_name") %></a></td>
          </tr>
        <% }
        }else{ %>
          <tr>
            <td colspan="3">暂无参会企业</td>
          </tr>
        <% } %>
        </tbody>
      </table>
    </div>
    <div style=" clear:both;display:none;">
      <div class="pagination pagination-centered f"> <span>当前第1页</span> <span> <a href="/multiQueryAction.do?method=companySearch&amp;queryType=attendCom&amp;savesign=savesign&amp;job_fair_id=201409190001704&amp;flush=flush&amp;directflag=-2" class="first pager_btn">首页</a> <a href="/multiQueryAction.do?method=companySearch&amp;queryType=attendCom&amp;savesign=savesign&amp;job_fair_id=201409190001704&amp;flush=flush&amp;directflag=-1" class="pre pager_btn">上一页</a> <a href="/multiQueryAction.do?method=companySearch&amp;queryType=attendCom&amp;savesign=savesign&amp;job_fair_id=201409190001704&amp;flush=flush&amp;directflag=1" class="next pager_btn">下一页</a> <a href="/multiQueryAction.do?method=companySearch&amp;queryType=attendCom&amp;savesign=savesign&amp;job_fair_id=201409190001704&amp;flush=flush&amp;directflag=2" class="last pager_btn">尾页</a> </span> </div>
    </div>
    <!-- 
    <input type="button" value="求 职 报 名" style=" display:block; height:59px;width:300px; margin:10px auto 0; background:url(images/btn.gif); border:none; font: bold 20px '微软雅黑'; color:#FFF; cursor:pointer;">
   -->
  </div>
  <div class="f_foot_info"> <span>211校招网版权归西安大秦人力资源有限公司所有</span> <span>国家工信部网站备案号：陕ICP备13006138号-3</span> <span>西安市人力资源服务许可证编号：610100120105 </span> </div>
</div>
</body>
</html>