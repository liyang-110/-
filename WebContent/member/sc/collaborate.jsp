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
	String user_code= user.getUserCode();
	String user_id=user.getUserId();
	String apply_type="school";
	String q="?methodId=jobfair_company_query&in_r=sc&in_pagenum=20&in_filter=white&in_school_id="+school_id+"&in_job_fair_id=";
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

<title>合作企业库</title>
<link type="text/css" rel="stylesheet" href="style/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="style/core.css" />
<link type="text/css" rel="stylesheet" href="style/all.css" />
<link type="text/css" rel="stylesheet" href="style/form.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<script src="/assets/artDialog/artDialog.js?skin=green"></script>
<script src="/assets/artDialog/plugins/iframeTools.js"></script>

<script type="text/javascript" src="/js/select_data_js_array.js" charset="utf-8"></script>
<script type="text/javascript" src="../js/front.js" charset="utf-8"></script>
<script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script> 
<script type="text/javascript" src="../js/artDialog.notice.js?r=sc" charset="utf-8"></script>


<script type="text/javascript" src="js/blanklist.js" charset="utf-8"></script>
<script type="text/javascript">
	var school_id ="<%=user.getId()%>";
	var job_fair_id='';
	$(function(){
		$(".pagenation a").bind("click",function(e){
			e.preventDefault();
			//var in_page = $(this).text();
			var in_page =$(this).attr("data-page");
			$("#pagerForm input[name='in_page']").val(in_page);
			$("#pagerForm").submit();
		});
	});
</script>
<style type="text/css">
.tal .table tbody tr td.content {
    white-space: normal;
}
</style>
</head>
<body>
<div id="dlg_check" style="display:none">
				
				<input type="hidden" name="in_send_type" id="in_send_type" value="user"/>
				<div>
					<ul>
					<li><label><input type="radio" value="不按规定时间参加招聘会。" name="reason_type" />不按规定时间参加招聘会</label></li>
					<li><label><input type="radio" value="夸大宣传。" name="reason_type" />夸大宣传</label></li>
					<li><label><input type="radio" value="有收取学生费用行为。" name="reason_type" />有收取学生费用行为</label></li>
					<li><label><input type="radio" value="其他。" name="reason_type" />其他</label></li>
					</ul>
				</div>
				<div style="text-align:center; margin-bottom:12px;">
					<div style="text-align:left;width:290px;margin:auto;">备注：</div>
				 	 <textarea name="mem" id="mem" cols="45" rows="5"></textarea>
				</div>
</div>
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
                	<div class="list_alter">
                    	<span style="color:#FFF; font-weight:bold; font-size:16px;">合作企业库</span>
                    </div>
                    <!----------------------------标题------------------------------------->
                     <div class="tal">
                    	<table class="table">
                           <thead>	       	                 	                                         	
                              <tr class="active">              					 
                                 <th>序号</th>
                                 <th>招聘会</th>
                                 <th>企业名称</th> 
                                 <th>联系人</th> 
                                 <th>联系电话</th>                   	 	                               
                              </tr>                                                               
                           </thead>
                           <tbody>
                           <c:set var="data" value="${res.querycount>0?res.queryresult:null}" />
					  	   	<c:forEach var="r" items="${data }">
                               <tr>                                                      
                                 <td>${r.rn }</td>
                                 <td class="content">${r.job_fair_name }</td>
                                 <td class="content"><a href="/company/info.do?id=${r.company_id }" target="_blank" class="dianji">${r.company_name }</a></td>
                                 <td>${r.contact_person }</td>
                                 <td>${r.contact_tel }</td>
                                 <!-- 
                                 <td>
                                 <c:choose>
                                 	<c:when test="${r.flag eq 1 }">
                                  <button type="button" onclick="blacklist('${r.company_id }',false);" class="btn btn-default gry">移出黑名单</button>
                                 	
                                 	</c:when>
                                 	<c:otherwise>
                                  <button type="button" onclick="blacklist('${r.company_id }',true );" class="btn btn-default yellow">加入黑名单</button>
                                 	
                                 	</c:otherwise>
                                 </c:choose>
                                 
                                 </td> 
                                  -->
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
