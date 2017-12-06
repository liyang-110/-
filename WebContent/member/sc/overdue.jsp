<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.bean.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
SchUserBean user=(SchUserBean)User.getUser("school",session);
String default_end_date=null;
if( user ==null ){
	response.sendRedirect( request.getContextPath()+"/");
	return;
}else if( request.getAttribute("res")==null ){
	String school_id= user.getId();
	/*
	String begin = request.getParameter("in_job_fair_time_1");
	if( begin==null ){
		begin="&in_job_fair_time_1=today";
	}
	*/
	String q="?methodId=sch_JobfairQuickFrm&in_URLEncoding=UTF-8&in_order=desc&in_job_fair_type=all&in_school_id="+school_id;
	default_end_date = request.getParameter("in_job_fair_time_2");
	if( default_end_date==null ){
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.DAY_OF_MONTH, -1 );
		calendar.set(Calendar.HOUR_OF_DAY , 23 );
		calendar.set(Calendar.MINUTE, 59 );
		default_end_date=new java.text.SimpleDateFormat("yyyy-MM-dd").format( calendar.getTime() );
		q+="&in_job_fair_time_2="+default_end_date;
		//System.out.println( q );
	}
	//response.sendRedirect("/member/easyQuery.do"+q);
	String forward = "/member/easyQuery.do"+q;
	//System.out.println( forward );
	request.setAttribute("forward", request.getRequestURI() );
	request.getRequestDispatcher(
						request.getContextPath() + "/" + forward).forward(
						request, response);
	return;					
}else{
	default_end_date = request.getParameter("in_job_fair_time_2");
}
%>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>过期招聘会</title>
<link type="text/css" rel="stylesheet" href="style/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="style/core.css" />
<link type="text/css" rel="stylesheet" href="style/all.css" />
<link type="text/css" rel="stylesheet" href="style/form.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script src="/assets/artDialog/artDialog.js?skin=green"></script>
<script src="/assets/artDialog/plugins/iframeTools.js"></script>
<script type="text/javascript" src="../js/front.js" charset="utf-8"></script>

<script type="text/javascript" src="js/adddate.js" charset="utf-8"></script>
<script type="text/javascript" src="js/manage.js" charset="utf-8"></script>

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
</script>
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
            	<div class="text_h">
                    <span>过期招聘会</span>
                </div>
                <div class="biankuang">
                	<div class="list_alter fanhui">
	                	<div class="list_alter pull-left">
	                    	<ul class="list-inline">
	                          <li><a href="javascript:;" onclick="companyList();"><img src="img/news.png">参会企业信息</a></li>
	                        </ul>	
	                    </div>
	                    <%-- 
						<div class="pull-left">
	                    	<ul class="list-inline">
	                          <li><a href="javascript:;" onclick="companyList();"><img src="img/news.png">参会企业信息</a></li>
	                        </ul>	
                         	<span style="color:#FFF; font-weight:bold; font-size:16px;">过期招聘会</span>
                        </div>
                        --%>
                        <div class="pull-right">
                         	<a href="manage.jsp"><img src="img/fanhui.png"></a>
                        </div>
                    </div>
                    <!----------------------------标题------------------------------------->
<form  id="pagerForm" method="post" action="">
	<c:forEach var="p" items="${requestScope.params }"> 
	<c:choose>
		<c:when test="${p.key eq 'in_page' }"></c:when>
		<c:when test="${p.key eq 'in_pagenum' }"></c:when>
		
		<c:when test="${p.key eq 'in_job_fair_time_1' }"></c:when>
		<c:when test="${p.key eq 'in_job_fair_time_2' }"></c:when>
		<c:when test="${p.key eq 'in_job_fair_name' }"></c:when>

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
                                    <input type="text" name="in_job_fair_time_1" value="${params.in_job_fair_time_1[0] }" class="time" onclick="SelectDate(this,'yyyy-MM-dd')"/>
                                    --
                                    <input type="text" name="in_job_fair_time_2" value="<%=default_end_date %>" class="time" onclick="SelectDate(this,'yyyy-MM-dd')"/>
                                 </td>
                                  <td class="text_right">
                                    <input type="text" value="${params.in_job_fair_name[0] }" class="form-control width" placeholder="招聘会名称"  name="in_job_fair_name" />
                                 </td>
                                 <td>
                                 <button type="button" onclick="searchForm();"  class="btn btn-default anniu_a sousuo">搜索</button></td>
                              </tr>
                           </tbody>
                        </table>
                      </div>
</form>
                     <!--form表单-->
                     <div class="tal  " style="padding-top:0;">
                    	<table class="table datagrid">
                           <thead>	       	                 	                                         	
                              <tr class="active">
                              	 <th>&nbsp;</th>       
                                 <th>序号</th>	 	          	          	         	                    	
                                 <th>招聘会时间</th>
                                 <th>招聘会名称</th> 
                                 <th>招聘会类型</th>
                                 <th>总展位/已预定</th>                           	 	                               
                              </tr>                                                               
                           </thead>
                           <tbody>
                           		<c:set var="data" value="${res.queryresult}" />
					  	   		<c:forEach var="r" items="${data }">
                               <tr>
                                 <td><input class="item_check" type="checkbox" 
                                 			value="${r.job_fair_id }" 
                                 			data-type="${r.jobfair_type}"
                                 			data-flag="${r.flag }" 
                                 			data-company_num="${r.company_num }"
                                 			data-job_fair_company_num="${r.job_fair_company_num }" 
                                 			data-is_end="${r.is_end }" /></td>                                                                  
                                 <td>${r.rn }</td>
                                 <td>${r.job_fair_time }</td>
                                 <td><a href="/jobfairInfo.do?id=${r.job_fair_id }" target="_blank" class="dianji">${r.job_fair_name }</a></td>
                                 <td>${r.job_fair_type }</td>
                                 <td>${r.job_fair_company_num }（${r.company_num }）</td>
                              </tr>
                              </c:forEach>
                           </tbody>
                        </table>
                    </div>
                    <!--------->
                    <!--分页-->
                    <div class="fenye">
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
<div class="foot">
	<div class="footer">
        <div class="foot">
            <p>地址：西安高新区科技二路65号清华科技园清扬国际大厦A410 电话：029-88662468 / 87240519</p>
            <p>工信部备案号：陕ICP备13006138号-3 西安市人力资源服务许可证编号：610100120105029-88662468 </p>
            <p>西安大秦人力资源有限公司 版权所有</p>
            <p> 
                <a title="站长统计" target="_blank" href="http://www.cnzz.com/stat/website.php?web_id=1253006258">
                 <img vspace="0" hspace="0" border="0" src="http://icon.cnzz.com/img/pic.gif">
                </a>
            </p>
        </div>
    </div>
</div>
</body>
</html>
