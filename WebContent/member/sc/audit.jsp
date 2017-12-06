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
	String q="?methodId=undo_com&in_URLEncoding=UTF-8&in_r=sc&in_pagenum=20&in_id="+school_id+"&in_user_id="+user_id;
	if(request.getParameter("id")!=null ){
		q+="&in_job_fair_id="+request.getParameter("id");
	}	
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

<title>审核企业申请</title>
<link type="text/css" rel="stylesheet" href="style/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="style/core.css" />
<link type="text/css" rel="stylesheet" href="style/all.css" />
<link type="text/css" rel="stylesheet" href="style/form.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/adddate.js" charset="utf-8"></script>

<script src="/assets/artDialog/artDialog.js?skin=green"></script>
<script src="/assets/artDialog/plugins/iframeTools.js"></script>

<script type="text/javascript" src="/js/select_data_js_array.js" charset="utf-8"></script>
<script type="text/javascript" src="../js/front.js" charset="utf-8"></script>
<script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script> 
<script type="text/javascript" src="../js/artDialog.notice.js?r=sc" charset="utf-8"></script>

<script type="text/javascript" src="js/audit.js" charset="utf-8"></script>

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
<div id="dlg_audit" style="display:none;">
 		<form>
 		<textarea name="content" cols="50" rows="5" style="width:320px;"></textarea>
 		<br/>
 		(不同意,请输入原因 )
 		</form>
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
                	<div class="list_alter fanhui">
						<div class="pull-left">
                         	<span style="color:#FFF; font-weight:bold; font-size:16px;">审核企业申请</span>
                        </div>
                        <div class="pull-right">
                         	<a href="manage.jsp"><img src="img/fanhui.png"></a>
                        </div>
                    </div>
                    <!----------------------------返回------------------------------------->
                    <%-- 
                    <form role="form">
                      <div class="form form_a">
                       <table class="table">
                           <tbody>
							  <tr>

                                 <td class="text_right">招聘会时间：</td>
                                 <td>
                                    <input type="text" value="" class="time" onclick="SelectDate(this,'yyyy-MM-dd hh:mm:ss')"/>
                                    <button type="submit" class="btn btn-default anniu_a sousuo">搜索</button>
                                 </td>
                           </tbody>
                        </table>
                      </div>
                     </form>
                     --%>
                     <!--form表单-->
                   	  <div class="tal" style="padding-top:0;">
                    	<table class="table">
                           <thead>	       	                 	                                         	
                              <tr class="active">	                                       	     				
                                 <th>序号</th>
                                 <th>申请时间</th>
                                 <th>企业名称</th> 
                                 <th>审核状态</th>                          	 	                               
                              </tr>
                           </thead>
                           <tbody>
                           	<c:set var="data" value="${res.queryresult}" />
					  	   	<c:forEach var="r" items="${data }">
                              <tr>                                                              
                                 <td>${r.rn }</td>
                                 <td>${r.add_time }</td>
                                 <td>
                                 
                                 <c:if test="${r.company_pic != 'no' }">
                                 <a title="组织机构代码证" href="jImage.jsp?file_id=${r.company_pic}" target="_blank"><span class="green">[代]</span></a>
                                 </c:if>
                                 <c:if test="${r.company_img != 'no' }">
								<a title="营业执照" href="jImage.jsp?file_id=${r.company_img}" target="_blank"><span class="red">[执]</span></a>
                                 </c:if>
                                 
                                 <a href="/company/info.do?id=${r.apply_personid }" target="_blank" class="dianji">${r.apply_person }</a>
                                 </td>
                                 <td>
                                 <c:choose>
                                 	<c:when test="${r.status == '未审核' }">
                                 	<button onClick="audit('${r.processid}','apply','0','${r.last_company_num }','${r.permit}','${r.apply_person } 申请  ${r.job_fair_name }');" 
                                 			type="button" class="btn btn-default green">
                                 	审核
                                 	</button>

                                 	</c:when>
                                 	<c:otherwise>
                                 	<span>${r.status }</span>
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
