<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.bean.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
SchUserBean user=(SchUserBean)User.getUser("school",session);
if( user ==null ){
	response.sendRedirect( request.getContextPath()+"/");
	return;
}else if( request.getAttribute("res")==null ){
	String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	String q="?methodId=student_query&in_r=sc&in_pagenum=20&in_URLEncoding=UTF-8&in_school_id="+user.getId();
	// &in_last_zero=on
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

<title>注册统计</title>
<link type="text/css" rel="stylesheet" href="style/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="style/core.css" />
<link type="text/css" rel="stylesheet" href="style/all.css" />
<link type="text/css" rel="stylesheet" href="style/form.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/adddate.js"></script>
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
                    	<span style="color:#FFF; font-weight:bold; font-size:16px;">注册统计</span>
                    </div>
                    <!----------------------------标题------------------------------------->
                    <%-- 
                    <form role="form">
                      <div class="form form_a">
                       <table class="table">
                           <tbody>
							  <tr>
                                 <td class="text_right">姓名：</td>
                                 <td>
                                 	<input type="text" class="form-control width" placeholder="">
                                 	<!--<input type="number" class="bg" name="points" min="0" max="500" step="1"/>-->
                                 </td>
                                 <td class="text_right">时间：</td>
                                 <td colspan="3">
                                    <input type="text" value="" class="time" onclick="SelectDate(this,'yyyy-MM-dd hh:mm:ss')"/>
                                    --
                                    <input type="text" value="" class="time" onclick="SelectDate(this,'yyyy-MM-dd hh:mm:ss')"/>
                                 </td>
                              </tr>
                              <tr>
                                <td class="text_right">学历：</td>
                                 <td>
                                   <select class="form-control width">
                                     <option>不限</option>
                                     <option>高职</option>
                                     <option>大专</option>
                                     <option>本科</option>
                                     <option>研究生</option>
                                     <option>硕士</option>
                                     <option>博士</option>
                                     <option>其他</option>
                                   </select>
                                 </td>
                                 <td class="text_right">专业：</td>
                                 <td>
                                 	<input type="text" class="form-control width" placeholder="">
                                 	<!--<input type="number" class="bg" name="points" min="0" max="500" step="1"/>-->
                                 </td>
								 <td class="text_right">
                                    <input type="text" class="form-control width" placeholder="请输入关键字">
                                 </td>
                                 <td> <button type="submit" class="btn btn-default anniu_a sousuo">搜索</button></td>
                              </tr>
                           </tbody>
                        </table>
                      </div>
                     </form>
                     --%>
                     <!--form表单-->
                     <div class="tal" style="padding-top:0;">
                     	<style type="text/css">
		                table.datagrid {border-collapse: collapse;}
		                table.datagrid tbody td { 
		               		text-align:left;
		               		vertical-align:top;
		               		border:1px solid #ccc;
		               		border-collapse:collapse;
		               	}
		               	table.datagrid tbody td.nowrap {white-space:nowrap;}
		               	table.datagrid tbody td.content {white-space: normal;}
		               	table.datagrid tbody td.content a:hover{text-decoration:underline;}
		            </style>
                    	<table class="table datagrid">
                           <thead>	       	                 	                                         	
                              <tr class="active"> 
                                 <th>序号</th>
                                 <th>注册日期</th>	 	          	          	         	                    	
                                 <th>姓名</th>
                                 <th>性别</th>
                                 <th>毕业</th> 
                                 <th>专业</th> 
                                 <th>求职意向</th> 
                                 <th>期望薪资</th>                           	 	                               
                              </tr>                                                               
                           </thead>
                           <tbody>
                          <c:if test="${empty res.queryresult }">
		                  <tr>
		                  	<td colspan="6">暂无数据</td>
		                  </tr>
		                  </c:if>
		                  <c:set var="data" value="${res.queryresult}" />
						  <c:forEach var="r" items="${data }">
                               <tr>
                                 <td>${r.rn }</td>
                                 <td>${r.add_time }</td>                                   
                                 <td><a href="#" class="dianji"></a>${r.in_user_name }</td>
                                 <td>${r.in_sex }</td>
                                 <td>${r.grad_year }</td>
                                 <td>${r.in_profession }</td>
                                 <td class="content">${r.hope_positions }</td>
                                 <td>${r.in_hope_salary }</td>
                              </tr>
                           </c:forEach>
                             
                              <%-- 
                              <tr> 
                                 <td><input type="checkbox"></td>                                                     
                                 <td colspan="7"><button type="submit" class="btn btn-default green">删除选中</button></td> 
                              </tr>
                              --%>
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
