<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.bean.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
SchUserBean user=(SchUserBean)User.getUser("school",session);
String default_end_date=null;
if( user ==null ){
	response.sendRedirect( request.getContextPath()+"/");
	return;
}else if( request.getAttribute("res")==null ){
	String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	String q="?methodId=school_interview_query&in_r=sc&in_pagenum=20&in_status=2,4,5&in_URLEncoding=UTF-8";
	// &in_last_zero=on
	default_end_date = request.getParameter("in_add_time_2");
	if( default_end_date==null ){
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.DAY_OF_MONTH, 0 );
		calendar.set(Calendar.HOUR_OF_DAY , 23 );
		calendar.set(Calendar.MINUTE, 59 );
		default_end_date=new java.text.SimpleDateFormat("yyyy-MM-dd").format( calendar.getTime() );
		q+="&in_add_time_2="+default_end_date;	
	}
	String forward = "/member/easyQuery.do"+q;
	request.setAttribute("forward", request.getRequestURI() );
	request.getRequestDispatcher(
						request.getContextPath() + "/" + forward).forward(
						request, response);
	return;
}else{
	default_end_date = request.getParameter("in_add_time_2");
}
%>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>录用通知</title>
<link type="text/css" rel="stylesheet" href="style/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="style/core.css" />
<link type="text/css" rel="stylesheet" href="style/all.css" />
<link type="text/css" rel="stylesheet" href="style/form.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/adddate.js" charset="utf-8"></script>

<script src="/statics/artDialog/artDialog.js?skin=green" charset="utf-8"></script>
<script type="text/javascript" src="/statics/artDialog/plugins/iframeTools.js" charset="utf-8"></script>
<script type="text/javascript" src="../js/front.js" charset="utf-8"></script>
<script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script> 
<script type="text/javascript">
	$(function(){
		$(".view-status").bind("click",function(e){
			e.preventDefault();
			var title = $(this).text();
			var content = '<div style="width:260px;">'+$(this).attr("data-remark")+'</div>';
			msg_alert(title,content);
		});
	});
</script>
<script type="text/javascript">
	$(function(){
		$(".pagination a").bind("click",function(e){
			e.preventDefault();
			//var in_page = $(this).text();
			var in_page =$(this).attr("data-page");
			$("#pagerForm input[name='in_page']").val(in_page);
			$("#pagerForm").submit();
		});
	});
	function searchForm()
	{
		$("#pagerForm input[name='in_page']").val(1);
		$("#pagerForm").submit();
	}
	function exportForm()
	{
		var exp_url='/esbServer.do?method=execProc&methodId=school_interview_query&in_action=export';
		window.open( exp_url+'&'+$("#pagerForm").serialize() );
	}
	function downForm()
	{
		var exp_url='/esbServer.do?method=execProc&methodId=school_interview_query&in_action=licence';
		window.open( exp_url+'&'+$("#pagerForm").serialize() );
	}
</script>
  <style type="text/css">
		                table.datagrid {border-collapse: collapse;}
		                table.datagrid tbody tr:hover {
		                	background-color:#eee;
		                }
		                table.datagrid tbody td { 
		               		text-align:left;
		               		vertical-align:top;
		               		border:1px solid #ccc;
		               		border-collapse:collapse;
		               	}
		               	table.datagrid tbody td.nowrap {white-space:nowrap;}
		               	table.datagrid tbody td.content a:hover{text-decoration:underline;}
 </style>
</head>

<body>
<jsp:include page="include/head.jsp" flush="true"/>

<!--menu完成-->
<div class="hy">
	<p>当前位置：首页 &gt; <a href="/member/sc/home.do" style="color:#5a9707;">会员中心</a> </p>
</div>
<!--当前位置-->
<div class="header_main">
	<div class="clearfix">
        <div class="pull-left">
            <div class="pull_left">
                <!--折叠-->
             
                <jsp:include page="include/menu.jsp" flush="true"/>

            </div>
        </div>
    	<!--pull-left结束-->
        <div class="pull-right">
            <div class="pull_right">
                <div class="biankuang">
                	<div class="list_alter">
                    	<span style="color:#FFF; font-weight:bold; font-size:16px;">面试记录</span>
                    </div>
                    <!----------------------------标题------------------------------------->
<form  id="pagerForm" method="post" action="">
	<c:forEach var="p" items="${requestScope.params }"> 
	<c:choose>
		<c:when test="${p.key eq 'in_page' }"></c:when>
		<c:when test="${p.key eq 'in_pagenum' }"></c:when>
		
		<c:when test="${p.key eq 'in_add_time_1' }"></c:when>
		<c:when test="${p.key eq 'in_add_time_2' }"></c:when>

		<c:otherwise>
		<input type="hidden" name="${p.key }" value="${fn:trim( p.value[0] ) }" />
		</c:otherwise>
		</c:choose>
	</c:forEach>
		<input type="hidden" name="in_pagenum" value="20" />
		<input type="hidden" name="in_page" value="1" />

                      <div class="form form_a">
                       <table class="table">
                           <tbody>
							  <tr>
                                 <td class="text_right">招聘会时间：</td>
                                 <td colspan="3">
                                    <input type="text" name="in_add_time_1" value="${params.in_add_time_1[0] }" class="time" onclick="SelectDate(this,'yyyy-MM-dd')"/>
                                    --
                                    <input type="text" name="in_add_time_2" value="<%=default_end_date %>" class="time" onclick="SelectDate(this,'yyyy-MM-dd')"/>
                                 </td>
                                 <td>
                                 <button type="button" onclick="searchForm();"  class="btn btn-default anniu_a sousuo">搜索</button>
                                 <%
                             	AdUserBean admin=(AdUserBean)User.getUser("admin",session);
                             	if( admin !=null &&
                             			( "qianbin".equals( admin.getUserId() )  
                             			 || "manager".equals( admin.getUserId() )
                             			|| "tangbo".equals( admin.getUserId() )  )
                             			
                             		){
                                 %>
                                 <button type="button" onclick="exportForm();"  class="btn btn-default anniu_a sousuo">导出</button>

                                 <button type="button" 
                                 		 onclick="downForm();"  
                                 		 class="btn btn-default anniu_a sousuo" 
                                 		 style="width:110px;">下载企业资质</button>
								<%
                                 }
								%>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                      </div>
</form>
                     <!--form表单-->
                     
                     <div class="tal">
                   
                    	<table class="table datagrid">
                           <thead>	       	                 	                                         	
                              <tr class="active">		        	                      					 
                                 <th>序号</th>
                                 <th>日期</th>
                                 <th>姓名</th> 
                                 <th>企业名称</th>
                                 <th>状态</th>
                              </tr>
                           </thead>
                           <tbody>
                           <c:if test="${res.querycount lt 1 }">
		                  <tr>
		                  	<td colspan="6">暂无数据</td>
		                  </tr>
		                  </c:if>
		                  <c:if test="${res.querycount gt 0 }">
		                  <c:set var="data" value="${res.queryresult}" />
						  <c:forEach var="r" items="${data }">
                              <tr>                                   
                                 <td>${r.rn }</td>
                                 <td>${r.add_time }</td>
                                 <td>
                                 <a href="javascript:;" class="dianji" onclick="open_layer('/company/resumeDetail.do?callback=reload&id=${r.student_id}');">
                                 ${r.name }</a></td>
                                 <td>
                                 <a target="_blank" href="/company/info.do?id=${r.company_id }" class="dianji">
                                 ${r.company_name }
                                 </a></td>
                                 <td>
                                 <a data-remark="${r.remark }" class="view-status btn btn-default yellow">
                                 	${r.status }
                                 </a>
                                 </td> 
                              </tr>
                            </c:forEach>
                            </c:if>
                           </tbody>
                        </table>
                    </div>
                    <!--------->
                    <!--分页-->
                    <div class="fenye pagenation">
						${requestScope.pagenation }
                	</div>
                    <!--分页-->
                </div>
            </div>
            <!--pull-right结束-->
        </div>
	</div>	
</div>
<!--footer-->
<jsp:include page="include/foot.jsp" flush="true" />

</body>
</html>
