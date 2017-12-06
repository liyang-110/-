<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.bean.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
SchUserBean user=(SchUserBean)User.getUser("school",session);
if( user ==null ){
	response.sendRedirect( request.getContextPath()+"/");
	return;
}else if( request.getAttribute("res")==null ){
	String school_id= user.getId();
	String user_id = user.getUserId();
	String q="?methodId=message_01&in_r=sc&in_pagenum=20&in_URLEncoding=UTF-8&in_id="+school_id;

	//response.sendRedirect("/member/easyQuery.do"+q);
	String forward = "/member/easyQuery.do"+q;
	request.setAttribute("forward", request.getRequestURI() );
	request.getRequestDispatcher(
						request.getContextPath() + "/" + forward).forward(
						request, response);
	return;					
}
%>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>系统消息</title>
<link type="text/css" rel="stylesheet" href="style/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="style/core.css" />
<link type="text/css" rel="stylesheet" href="style/all.css" />
<link type="text/css" rel="stylesheet" href="style/form.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/adddate.js"></script>

<script type="text/javascript">
	var job_fair_id = '${params.in_job_fair_id[0] }';
	$(function(){
		$(".pagination a").bind("click",function(e){
			e.preventDefault();
			//var in_page = $(this).text();
			var in_page =$(this).attr("data-page");
			$("#pagerForm input[name='in_page']").val(in_page);
			$("#pagerForm").submit();
		});
 	});
</script>
</head>

<body>
<form  id="pagerForm" method="post" action="">
	<c:forEach var="p" items="${requestScope.params }"> 
		<input type="hidden" name="${p.key }" value="${fn:trim( p.value[0] ) }" />
	</c:forEach>
		<input type="hidden" name="in_pagenum" value="20" />
		<input type="hidden" name="in_page" value="" />
</form>

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
                	<div class="list_alter fanhui">
						<div class="pull-left">
                         	<span style="color:#FFF; font-weight:bold; font-size:16px;">系统消息</span>
                        </div>
                        <div class="pull-right">
                         	<a href="/member/sc/home.do"><img src="img/fanhui.png"></a>
                        </div>
                    </div>
                    <!----------------------------标题------------------------------------->
                     <div class="tal">
                    	<table class="table">
                           <thead>	       	                 	                                         	
                              <tr class="active">
                              	 <th class="time_a">序号</th>		 
                                 <th class="time_a">时间</th> 
                                 <th class="time_a">企业名称</th>
                                 <th class="time_a">招聘会名称</th>
                                 <th class="time_a">反馈内容</th>                       	 	                               
                              </tr>
                           </thead>
                           <tbody>
                           <c:set var="data" value="${res.queryresult}" />
					  	   	<c:forEach var="r" items="${data }">
                              <tr> 
                                 <td class="time_a">${r.rn }</td>
                                 <td class="time_a">${r.add_time }</td>
                                 <td class="companyflow">${r.company_name}</td>    
                                 <td class="jobfairflow">
									<c:if test="${r.job_fair_name!='no' }">
										<a title="${r.job_fair_name}" href="/jobfairInfo.do?id=${r.job_fair_id}" target="_blank">${r.job_fair_name}</a>
									</c:if>
								</td>
								<td class="companyflow">${r.message_content }</td>  
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
<jsp:include page="include/foot.jsp" flush="true" />

</body>
</html>
