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
	String q="?methodId=school_grad_01&in_URLEncoding=UTF-8&in_school_id="+school_id;
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

<title>上传毕业生统计表</title>
<link type="text/css" rel="stylesheet" href="style/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="style/core.css" />
<link type="text/css" rel="stylesheet" href="style/all.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<link rel="stylesheet" href="/js/jquery-easyui/themes/metro/validatebox.css" type="text/css"></link>
<script type="text/javascript" src="/js/jquery-easyui/jquery.easyui.min.js"></script>

<script src="/assets/artDialog/artDialog.js?skin=green"></script>
<script src="/assets/artDialog/plugins/iframeTools.js"></script>

<script type="text/javascript" src="/js/select_data_js_array.js" charset="utf-8"></script>
<script type="text/javascript" src="../js/front.js" charset="utf-8"></script>
<script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script> 
<script type="text/javascript" src="../js/artDialog.notice.js?r=sc" charset="utf-8"></script>


<script type="text/javascript" src="js/profession.js" charset="utf-8"></script>
<script type="text/javascript">
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
                    <span>院系专业设置</span>
                </div>
                <!--标题-->
                <div class="biankuang">
                	<div class="list_alter">
                    	<ul class="list-inline">
                          <li><a href="javascript:;" onclick="addItem();"><img src="img/add.png">添加</a></li>
                          <li><a href="javascript:;" onclick="editItem();"><img src="img/alter.png">修改</a></li>
                          <li><a href="javascript:;" onclick="deleteItem();"><img src="img/del.png">删除</a></li>
                          <!--
                          <li><a href="#"><img src="img/query.png">查看</a></li>
                          -->
                        </ul>	
                    </div>
                    <!----------------------------------------------------------------->
                    <div class="tal">
                    	<table class="table datagrid">
                           <thead>
                              <tr class="active"> 
                              	 <th>&nbsp;</th>               					 
                                 <th>序号</th>
                                 <th>院系</th>                                                               
                                 <th>专业</th>
                                 <th>学历</th>                             	 	                               
                              </tr>
                           </thead>
                           <tbody>
                           <c:set var="data" value="${res.queryresult}" />
					  	   <c:forEach var="r" items="${data }">
                              <tr>	                                                                    
                                 <td><input class="item_check" type="checkbox" value="${r.id }"></td>  
                                 <td>${r.rn }</td>                                  
                                 <td>${r.department }</td>
                                 <td>${r.specialty }</td>
                                 <td>${r.edu }</td>
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

<div id="professionForm" style="display:none;">
<form class="form-horizontal" action="/login.do" style="width:320px;" method="post" onsubmit="return false;">
	<input type="hidden" name="in_r" value="sc"/>
	<input type="hidden" name="in_school_id" value="<%=user.getId() %>" />
	<input type="hidden" name="in_id" value=""/>
	<div class="form-group">
	    <label for="in_department" class="col-sm-2 control-label">院系</label>
	    <div class="col-sm-10">
	      <input type="text" name="in_department" class="form-control" id="in_department" placeholder="院系">
	    </div>
	</div>
	<div class="form-group">
	    <label for="in_specialty" class="col-sm-2 control-label">专业</label>
	    <div class="col-sm-10">
	      <input type="text" name="in_specialty" class="form-control" id="in_specialty" placeholder="专业名称">
	    </div>
	</div>
	<div class="form-group">
	    <label for="in_edu" class="col-sm-2 control-label">学历</label>
	    <div class="col-sm-10">
	      <input type="text" name="in_edu" class="form-control" id="in_edu" placeholder="学历">
	    </div>
	</div>
</form>
</div>




<!--footer-->
<jsp:include page="include/foot.jsp" flush="true" />
</body>
</html>
