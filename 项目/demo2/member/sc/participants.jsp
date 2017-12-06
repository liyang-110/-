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
	String q="?methodId=jobfair_company_query&in_r=sc&in_school_id="+school_id;
	if(request.getParameter("id")!=null ){
		q+="&in_job_fair_id="+request.getParameter("id");
	}
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

<title>参会企业信息</title>
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


<script type="text/javascript" src="js/blanklist.js" charset="utf-8"></script>

<script type="text/javascript">
	var school_id ="<%=user.getId()%>";
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
                	<div class="list_alter fanhui">
						<div class="pull-left">
						<a target="_blank" href="/esbServer.do?method=execProc&methodId=jobfair_company_xls&in_school_id=<%=user.getId() %>&in_job_fair_id=${params.in_job_fair_id[0]}">
                         	<img src="img/export.png" style=" height:16px;vertical-align: baseline;" />
                         	<span style="color:#FFF; font-weight:bold; font-size:16px;">导出参会企业信息</span>
                        </a>
                        </div>
                        <div class="pull-right">
                         	<a href="manage.jsp"><img src="img/fanhui.png"></a>
                        </div>
                    </div>
                    <!----------------------------标题------------------------------------->
                    <!--  form role="form">
                      <div class="form form_a">
                       <table class="table">
                           <tbody>
							  <tr>
                                 <td class="text_right">企业名称：</td>
                                 <td>
                                 	<input type="text" class="form-control width" placeholder="">
                                 </td>
                                 <td class="text_right">地区：</td>
                                 <td class="text_left">
                                   <select class="form-control width">
                                   </select>
                                 </td>
                                 <td class="text_right">
                                    <input type="text" class="form-control width" placeholder="请输入关键字">
                                 </td>
                                 <td><button type="submit" class="btn btn-default anniu_a sousuo">搜索</button></td>
                              </tr>
                           </tbody>
                        </table>
                      </div>
                     </form -->
                     <!--form表单-->
                     <div class="tal" style="padding-top:0;">
                    	<table class="table">
                           <thead>	       	                 	                                         	
                              <tr class="active">              	                       
                                 <th>序号</th>
                                 <th>所在地区</th>
                                 <th>企业名称</th>	 	          	          	         	                    	
                                 <th>招聘简章</th>
                                 <th>联系人</th> 
                                 <th>手机</th>
                                 <th>&nbsp;</th>                          	 	                               
                              </tr>                                                               
                           </thead>
                           <tbody>
                           <c:set var="data" value="${res.queryresult}" />
					  	   <c:forEach var="r" items="${data }">
                              <tr>                                                                
                                 <td>${r.rn }</td>
                                 <td>${r.area_id }</td> 
                                 <td>${r.company_name }</td>
                                 <td>
                                 <c:choose>
                                 	<c:when test="${empty r.doc }">无</c:when>
                                 	<c:otherwise>
										<a target="_blank" href="/upload/download.jsp?path=${r.doc }&name=${r.company_name}">下载</a>

                                 	</c:otherwise>
                                 </c:choose>
                                 
                                 </td> 
                                 <td>${r.contact_person }</td> 
                                 <td>${r.contact_tel }</td>
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
