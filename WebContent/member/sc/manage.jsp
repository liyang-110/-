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
	String q="?method=execProc&methodId=job_fair_01&in_URLEncoding=UTF-8&in_school_id="+school_id;
	//response.sendRedirect("/member/easyQuery.do"+q);
	String forward = "/member/easyQuery.do"+q;
	//System.out.println( request.getRequestURI() );
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

<title>管理招聘会</title>
<link type="text/css" rel="stylesheet" href="style/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="style/core.css" />
<link type="text/css" rel="stylesheet" href="style/all.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script src="/assets/artDialog/artDialog.js?skin=green"></script>
<script src="/assets/artDialog/plugins/iframeTools.js"></script>

<script type="text/javascript" src="/js/select_data_js_array.js" charset="utf-8"></script>
<script type="text/javascript" src="../js/front.js" charset="utf-8"></script>
<script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script> 
<script type="text/javascript" src="../js/artDialog.notice.js?r=sc" charset="utf-8"></script>

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
                <div class="text_h">
                    <span>管理招聘会</span>
                </div>
                <!--标题-->
                <div class="biankuang">
                	<div class="list_alter">
                    	<ul class="list-inline">
                          <li><a href="javascript:;" onclick="editItem();"><img src="img/alter.png">修改</a></li>
                          <li><a href="javascript:;" onclick="setShow( 'show' );"><img src="img/show.png">显示</a></li>
                          <li><a href="javascript:;" onclick="setShow( 'hide' );"><img src="img/shield.png">屏蔽</a></li>
                          <li><a href="javascript:;" onclick="inviteCompany();"><img src="img/invite.png">邀请企业参会</a></li>
                          <li><a href="javascript:;" onclick="auditCompany();"><img src="img/invite.png">审核企业申请</a></li>

                          <li><a href="javascript:;" onclick="companyList();"><img src="img/news.png">参会企业信息</a></li>
                          <!-- <li><a href="overdue.jsp"><img src="img/query.png">查询过期招聘会</a></li> -->
                        </ul>	
                    </div>
                    <!----------------------------------------------------------------->
                    <div class="tal">
                    	<table class="table datagrid">
                           <thead>
                              <tr class="active"> 
                              	 <th>&nbsp;</th>               					 
                                 <th>序号</th>
                                 <th>招聘会时间</th>
                                 <th>招聘会名称</th>
                                 <th>招聘会类型</th>
                                 <th>展位/预订</th>
                                 <th>招聘会状态</th>
                              </tr>
                           </thead>
                           <tbody>
                            	<c:set var="data" value="${res.queryresult}" />
					  	   		<c:forEach var="r" items="${data }">
                               <tr style="color:${r.flag eq 1?"#999":"#555" }">	                                                                    
                                 <td><input class="item_check" type="checkbox" 
                                 			value="${r.job_fair_id }" 
                                 			data-type="${r.jobfair_type}"
                                 			data-flag="${r.flag }" 
                                 			data-company_num="${r.company_num }"
                                 			data-job_fair_company_num="${r.job_fair_company_num }" 
                                 			data-is_end="${r.is_end }" /></td>  
                                 <td>${r.rn }</td>
                                 <td>${r.job_fair_time }</td>
                                 <td><div style="width: 320px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;">
                                 ${r.flag eq 1?"<span style=\"color:#f00\">[停]</span>":"" }
                                 <a href="/jobfairInfo.do?id=${r.job_fair_id }" target="_blank" class="dianji" style="height:20px;">${r.job_fair_name }</a></div></td>
                                 <td>${r.job_fair_type }</td>
                                 <td>${r.job_fair_company_num }（${r.company_num }）</td>
                                 <td>
                                 	<c:choose>
                                 		<c:when test="${r.begin eq 1}">
                                 			<a href="/jobfairInfo.do?id=${r.job_fair_id }" target="_blank" class="begin1">即将开始</a>
                                 		</c:when>
                                 		<c:when test="${r.begin eq 2}">
                                 			<a href="/jobfairInfo.do?id=${r.job_fair_id }" target="_blank" class="begin2">正在进行</a>
                                 		</c:when>
                                 		<c:otherwise>
                                 			<a href="/jobfairInfo.do?id=${r.job_fair_id }" target="_blank" class="begin3">已结束</a>
                                 		</c:otherwise>
                                 	</c:choose>
                                 </td>
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
