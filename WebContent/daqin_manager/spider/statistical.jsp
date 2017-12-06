<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../include/checkLogin.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>index.jsp</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="/js/jquery-easyui/themes/bootstrap/easyui.css">
<link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css" type="text/css">

 <script type="text/javascript" src="/assets/jquery/jquery.min.js"></script>
 <script type="text/javascript" src="/js/jquery-easyui/jquery.easyui.min.js"></script>
 <script type="text/javascript" src="statistical.js"></script>
 <style type="text/css">
 .btn:focus {
	outline: thin dotted #333;
	outline: 0px auto -webkit-focus-ring-color;
	outline-offset: 0px;
}
.btn-mini {
	font-size:14px;
}
.nav-tabs>li>a, .nav-pills>li>a {
	padding-right: 8px;
	padding-left: 8px;
	margin-right: 0px;
	line-height: 14px;
}
 </style>
 <script type="text/javascript">
 $(function(){
 /*
 	loadCompanyStat();
 	loadcompanyStatMonth();
 	loadJobFairStat();
 	loadJobFairStatMonth();
 */

                 	var loading={tab1:1,tab2:1,tab3:1,tab4:1,tab5:1};
                    $('.ajaxTabs a').click(function (e) { //切换学历，异步加载招聘会卡片信息
                       e.preventDefault();
						switch( $(this).attr("href") )
						{
							case "#tab1":
								if(loading.tab1){
									loadCompanyStat();
									loading.tab1=0;
								}
								break;
							case "#tab2":
								if(loading.tab2){
									loadcompanyStatMonth();
									loading.tab2=0;
								}
								;break;
							case "#tab3":
								if(loading.tab3){
									loadJobFairStat();
									loading.tab3=0;
								}
								break;
							case "#tab4":
								if(loading.tab4){
									loadJobFairStatMonth();
									loading.tab4=0;
								}
								break;
							case "#tab5":
								if(loading.tab4){
									loadCompositeStat();
									loading.tab5=0;
								}
								break;
						}
						 $('.ajaxTabs .btn').removeClass("btn-warning");
						$(this).tab('show');
						$(this).find("button").addClass("btn-warning");
                    });
					$('.ajaxTabs a:first').trigger("click");

 });
 </script>
</head>
 <body>
 <div class="container f_panel_title">
        <ul class="nav nav-tabs ajaxTabs">
        	  <li><a href="#tab5">
        	  <button class="btn btn-warning btn-mini">综合统计</button></a></li>
              <li><a href="#tab1">
              <button class="btn btn-mini">全国企业会员和职位统计</button></a></li>
              <li><a href="#tab2">
        	 <button class="btn btn-mini">本月新增企业会员和职位统计</button></a></li>
              <li><a href="#tab3">
        	 <button class="btn btn-mini">全国发布招聘会以及学校统计</button></a></li>
              <li><a href="#tab4">
             <button class="btn btn-mini">本月新增招聘会以及学校统计</button></a></li>
      </ul>
</div>
    <div class=" container tab-content">
 <div title="综合统计"  class="tab-pane" id="tab5">
  <table id="compositeStatTable" data-options="singleSelect:true,collapsible:true">
  </table>
 </div>
 <div title="全国企业会员统计"  class="tab-pane" id="tab1">
  <table id="companyStatTable" data-options="singleSelect:true,collapsible:true">
  </table>
 </div>
 <div title="本月新增企业会员统计"  class="tab-pane" id="tab2">
    <table id="companyStatMonthTable" data-options="singleSelect:true,collapsible:true">
  </table>
</div>
 <div title="全国发布招聘会统计"  class="tab-pane" id="tab3">
  <table id="jobfairStatTable" data-options="singleSelect:true,collapsible:true">
  </table>
 </div>
 <div title="本月新增招聘会统计"  class="tab-pane" id="tab4">
    <table id="jobfairStatMonthTable" data-options="singleSelect:true,collapsible:true">
  </table>
</div>
 
  <script type="text/html" id="companyStat">
</script>
  <script type="text/html" id="companyStatMonth">
</script>
  <script type="text/html" id="jobfairStat">
</script>
  <script type="text/html" id="jobfairStatMonth">
</script>
  <script type="text/html" id="compositeStat">
</script>
  </body>
  <script type="text/javascript" src="/assets/bootstrap/js/bootstrap.min.js"></script>
</html>
