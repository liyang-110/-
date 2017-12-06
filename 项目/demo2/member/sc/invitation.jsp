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
	String q="?methodId=company_06&in_URLEncoding=UTF-8&in_r=sc&in_pagenum=20";
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

<title>邀请企业参会</title>
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

<script type="text/javascript" src="js/invitation.js" charset="utf-8"></script>

<script type="text/javascript">
	var job_fair_id = '${params.in_job_fair_id[0] }';
	var area_id='${params.in_area_id[0] }';
	var company_nature='${params.in_company_nature[0] }';
	var company_person_num='${params.in_company_person_num[0] }';
	var company_registered_capital='${params.in_company_registered_capital[0] }';
	var job_fair_level='${params.in_job_fair_level[0] }';
	var money='${params.in_money[0] }';
	var industry='${params.in_industry[0] }';
	$(function(){
		$(".pagination a").bind("click",function(e){
			e.preventDefault();
			//var in_page = $(this).text();
			var in_page =$(this).attr("data-page");
			$("#pagerForm input[name='in_page']").val(in_page);
			$("#pagerForm").submit();
		});
 		$("input.checkall").bind("click",function(){
 			  var check = $(this).prop("checked");
 			  $("input.checkall").prop("checked",check);
 			  $("input[name="+$(this).val()+"]").prop("checked",check);
 		});
 	});
	function searchForm()
	{
		$("#pagerForm input[name='in_page']").val(1);
		$("#pagerForm").submit();
	}
</script>
<style type="text/css">
	.form .width {
    	width: 160px;
	}
	.datagrid td {white-space:nowrap;}
	.datagrid td.content {white-space: normal;}
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
                	<div class="list_alter fanhui">
						<div class="pull-left">
                         	<span style="color:#FFF; font-weight:bold; font-size:16px;">邀请企业参会</span>
                        </div>
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
		<c:when test="${p.key eq 'in_area_id' }"></c:when>
		<c:when test="${p.key eq 'in_company_nature' }"></c:when>
		<c:when test="${p.key eq 'in_company_person_num' }"></c:when>
		<c:when test="${p.key eq 'in_company_registered_capital' }"></c:when>
		<c:when test="${p.key eq 'in_job_fair_level' }"></c:when>
		<c:when test="${p.key eq 'in_money' }"></c:when>
		<c:when test="${p.key eq 'in_industry' }"></c:when>
		<c:when test="${p.key eq 'in_company_name' }"></c:when>
		<c:otherwise>
		<input type="hidden" name="${p.key }" value="${fn:trim( p.value[0] ) }" />
		</c:otherwise>
		</c:choose>
	</c:forEach>
		<input type="hidden" name="in_pagenum" value="20" />
		<input type="hidden" name="in_page" value="" />

                      <div class="form form_a">
                       <table class="table">
                           <tbody>
							  <tr>
							  <td class="text_right">单位性质:
                                 </td>
                                 <td>
                                 	<select id="in_company_nature" name="in_company_nature"  class="form-control width" >
                                 	</select>
                                 </td>
                               <td  class="text_right">注册资金:
                                 </td>
                                 <td>
                                 	<select id="in_company_registered_capital" name="in_company_registered_capital"  class="form-control width" >
                                 	</select>
                                 </td>
                               <td  class="text_right">单位人数:
                                 </td>
                                 <td>
                                 	<select id="in_company_person_num" name="in_company_person_num" class="form-control width" >
                                 	</select>
                                 </td>
                              </tr>
							  <tr>
							  <td  class="text_right">薪资待遇:
                                 </td>
                                 <td>
                                 	<select id="in_money" name="in_money" class="form-control width" >
                                 	</select>
                                 </td>
                               <td  class="text_right">招聘学历:
                                 </td>
                                 <td>
                                 	<select id="in_job_fair_level" name="in_job_fair_level" class="form-control width" >
                                 	</select>
                                 </td>
                               <td  class="text_right">工作地区:
                                 </td>
                                 <td>
                                 	<select id="in_area_id" name="in_area_id" class="form-control width" >
                                 	</select>
                                 </td>
                              </tr>
                              
							  <tr>
							  <td  class="text_right">所属行业:
                                 </td>
                                 <td>
                                 	<select id="in_industry" name="in_industry" class="form-control width" >
                                 	</select>
                                 </td>
                               <td  class="text_right">企业名称:
                                 </td>
                                 <td colspan="3">
                                 	<input value="${params.in_company_name[0] }" name="in_company_name" class="form-control width" style="float:left;margin-right:15px;width:260px;" /> 
                                 
                                 	<button type="button" onclick="searchForm();" class="btn btn-default anniu_a sousuo">搜索</button></td>
                              </tr>
                           </tbody>
                        </table>
                      </div>
</form>
                     
                     <!--form表单-->
                     <div class="tal" style="padding-top:0;">
                    	<table class="table datagrid">
                           <thead>	       	                 	                                         	
                              <tr class="active">              	                       
                                 <th><input type="checkbox" class="checkall" value="company_id"></th>
                                 <th>序号</th>          	          	         	                    	
                                 <th>地区</th>
                                 <th>企业名称</th>
                                 <th>企业类型</th> 
                                 <th>单位人数</th>
                                 <!-- 
                                 <th>注册资金</th>
                                  -->
                                 <th>所属行业</th>                    	 	                               
                              </tr>                                                               
                           </thead>
                           <tbody>
                           		<c:set var="data" value="${res.queryresult}" />
					  	   		<c:forEach var="r" items="${data }">
                               <tr>                                                                
                                 <td><input type="checkbox"  name="company_id" value="${r.company_id }" /> 
                                 </td>
                                 <td>${r.rn }</td>
                                 <td>${r.area_id }</td> 
                                 <td class="content">
                                 <c:if test="${r.company_pic != 'no' }">
                                 <a title="组织机构代码证" href="jImage.jsp?file_id=${r.company_pic}" target="_blank"><span class="green">[代]</span></a>
                                 </c:if>
                                 <c:if test="${r.company_img != 'no' }">
								<a title="营业执照" href="jImage.jsp?file_id=${r.company_img}" target="_blank"><span class="red">[执]</span></a>
                                 </c:if>
                                 
                                 <a href="/company/info.do?id=${r.company_id }" target="_blank" class="dianji">${r.company_name }</a>
                                 
                                 
                                 
                                 </td>
                                 <td>${r.company_nature }</td> 
                                 <td>${r.company_person_num }</td>
                                 <!-- 
                                 <td>${r.company_registered_capital }</td>
                                  -->
                                 <td  class="content">${r.industry }</td>
                              </tr>
                              
                              </c:forEach>
                              <tr> 
                                 <td><input type="checkbox" class="checkall" value="company_id"></td>                                                     
                                 <td colspan="7">
                                 <button type="button"  onclick="invite('company_id');"
                                 class="btn btn-default green" style="border-radius:3px;padding:3px 15px;">邀请选中企业</button></td> 
                              </tr>
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
