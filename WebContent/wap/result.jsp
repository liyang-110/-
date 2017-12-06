<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.zhaopin.mobile.JobfairQueryService"%>
<%
// System.out.println( request.getQueryString() );
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String area_id=request.getParameter("area_id");
String job_fair_level=request.getParameter("level");
String job_fair_type=request.getParameter("job_fair_type");

String pageNum= request.getParameter("page");
JobfairQueryService service=new JobfairQueryService();
service.setArea( area_id );
service.setLevel( job_fair_level );
service.setType( job_fair_type );

service.setPage( pageNum );
int rowsCount= service.getRowsCount();
List<HashMap> list = service.queryMap();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'result.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  <body>
  <%
  if(list!=null && list.size()>0){
	  for(HashMap map : list)
	  {
  %>
 <div class="info_card"><!-- info_card 招聘会卡片模板，可循环套用 -->
      <div class="title">
      <a class="btn-link" target="_blank" href="<%=request.getContextPath()%>/wap/info.jsp?id=<%=map.get("job_fair_id") %>">
      <%=map.get("job_fair_date") %>&nbsp;<%=map.get("job_fair_name") %>
      </a>
      <!-- 
      <a class="btn-link" target="_blank" href="<%=request.getContextPath()%>/wap/info.jsp?id=<%=map.get("job_fair_id") %>">查看&gt;&gt;</a>
       -->
       </div>
      <div class="line">主<span class="divider"></span>办：<%=map.get("job_fair_sponsor") %> </div>
      <div class="line">时<span class="divider"></span>间：<%=map.get("job_fair_time") %> </div>
      <div class="line">地<span class="divider"></span>点：<%=map.get("job_fair_addr") %></div>
      <div class="action" style="height:22px;">
      <a class="btn-link" target="_blank" href="<%=request.getContextPath()%>/wap/info.jsp?id=<%=map.get("job_fair_id") %>">查看详情&gt;&gt;</a>
      </div>
     
    </div>
 <%	}
 } %>
 <% if(rowsCount>0) {%>
    <div style=" clear:both;">
      <div class="pagination pagination-centered f">
      <span>总共<%=service.getPageCount() %>页&nbsp;当前第<%=service.getPageNum() %>页</span>
      <span>
      <a href="javascript:;" onclick="goPage(1)" class="first pager_btn">首页</a>
      <a href="javascript:;" onclick="goPage(<%=service.getPageNum()-1 %>)" class="pre pager_btn">上一页</a>
      <a href="javascript:;" onclick="goPage(<%=service.getPageNum()+1 %>)" class="next pager_btn">下一页</a>
      <a href="javascript:;" onclick="goPage(<%=service.getPageCount() %>)" class="last pager_btn">尾页</a>
      </span>
      </div>
    </div>
 <% } %>   
  </body>
</html>
