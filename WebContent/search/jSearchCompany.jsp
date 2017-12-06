<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.beanutils.DynaBean" %>
<% 
String base_dir =request.getContextPath()+"/";
String area_id = (String)request.getAttribute("area_id");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="Keywords" content="<%=com.zhaopin.Config.getSiteKeywords() %>" />
<meta name="Description" content="<%=com.zhaopin.Config.getSiteDescription() %>" />
<title><%=com.zhaopin.Config.getSiteTitle() %></title>

<link href="assets2/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="assets2/styles/global.css" />
<link rel="stylesheet" type="text/css" href="assets2/styles/site.css" />


<script src="assets2/jquery/jquery.min.js" type="text/javascript"></script>
<script src="assets2/jquery/jquery.form.js" type="text/javascript"></script>
<script src="assets2/js/jquery.validate.min.js" type="text/javascript"></script> 

<script src="assets2/artDialog/artDialog.js?skin=green"></script>

<script type="text/javascript" src="assets2/scripts/front.js"></script>

	<script type="text/javascript">
		if (window!=top) // 判断当前的window对象是否是top对象
			top.location.href =window.location.href; 
	</script>
<script src="<%=request.getContextPath()%>/assets/artDialog/plugins/iframeTools.js"></script>

<script type="text/javascript">
var cur_path = "<%=request.getContextPath()%>";
$(function(){
	$(".nav-tabs").each(function() {
		$(this).find("a").each(function(i){
			$(this).click(function(){
				$(this).parents(".nav-tabs").find("a").removeClass("active");
				$(this).addClass("active");
				$(this).parents(".container").find(".info_card_container").hide();
				$($(this).parents(".container").find(".info_card_container")[i]).show();
			});
		});		
	});
});
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/flow.js" charset="utf-8"></script>
<style type="text/css">
.info_card_container {
	display: none
}
.current {
	display: block
}
</style>
</head>

<body>
<jsp:include  page="../include2/head.jsp" flush="true"/>

	<div class="container">
		<div  style="height:6px;"></div>
	</div>

    <div class="container">
    	<div class="section_title">
        	企业搜索
        </div>
    </div>
    
    <div class="container">
    	<table class="table table-bordered table-hover">
        	<thead style="background-color:#EDEBE9; height:42px;">
            <tr>
            <td>地区</td>
            <td>企业名称</td>
            <td>行业</td>
            <td>投简历</td>
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
                <td><%=row.get("areas") %></td>
                <td><a href="company/info.do?id=<%=row.get("company_id") %>" target="_blank"><%=row.get("company_name") %></a></td>
                <td><%=row.get("industry") %></td>
                <td>
                <a href="company/info.do?id=<%=row.get("company_id") %>&jobs=1" target="_blank" class="btn btn-warning btn-small ">
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
            
	<jsp:include  page="../include2/footer.jsp" flush="true"/>

	<script src="<%=request.getContextPath()%>/assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

</body>
</html>
