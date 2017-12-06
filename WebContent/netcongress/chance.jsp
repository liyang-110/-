<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="include/initdata.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>面试机会 - <%=jobfairMap.get("job_fair_name") %> - <%=com.zhaopin.Config.getSiteTitle() %></title>
<link type="text/css" rel="stylesheet" href="/static/css/font-awesome.min.css" />
<link type="text/css" rel="stylesheet" href="style/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="style/already.css" />
<link type="text/css" rel="stylesheet" href="style/core.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script> 

<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript"  src="js/carousel.js"></script>
<script type="text/javascript" src="js/jquery.downCount.js"></script>

<script type="text/javascript">
	if (window!=top) // 判断当前的window对象是否是top对象
		top.location.href =window.location.href; 
	var cur_path = "<%=request.getContextPath()%>";
</script>
<script src="<%=request.getContextPath()%>/assets2/artDialog/artDialog.js?skin=green"></script>
<script src="<%=request.getContextPath()%>/assets/artDialog/plugins/iframeTools.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets2/scripts/front.js" charset="utf-8"></script>

<script type="text/javascript" src="js/jquery-scrollable.js" charset="utf-8"></script>
<script type="text/javascript" src="js/jquery.textSearch-1.0.js" charset="utf-8"></script>

<script type="text/javascript" src="js/flow.js" charset="utf-8"></script>
<script type="text/javascript">
	$(function(){
		$(".nav-pills>li:eq(2)").addClass("activ_one");
	});
</script>
<script type="text/javascript" src="js/studentNotice.js?r=su" charset="utf-8"></script>
<jsp:include page="include/weixin.jsp" flush="true" />
</head>

<body>
<jsp:include page="include/header_stu.jsp" flush="true"/>
<div class="job">
    <h1>面试机会</h1>
</div>
<!--job完成-->
<div class="inform">
     <%
        List<HashMap> interviewList = (List<HashMap>)request.getAttribute("interviewList");
        
       if(interviewList!=null && interviewList.size()>0){
       		int status =0;
       		for(HashMap row: interviewList ){
       			status=0;
	       		try{
	       			status = Integer.parseInt( (String)row.get("status") );
	       		}catch(Exception e){}
       		
       	%>
       	<% if(2==status ){%>
<div class="inform_a inform_b">
    	<h2 class="status_<%=status%>">
    		<a style="color:#FFF;" target="_blank"  href="/company/info.do?id=<%=row.get("company_id")%>">
    		<%=row.get("company_name") %>
    		</a>（通知面试）</h2>
        <div class="inform_list">
        	<p>应聘岗位：<%=row.get("job_name")==null?"":row.get("job_name") %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	       通知时间：<%=row.get("add_time") %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
			       通知内容：<%=row.get("remark")%></p>
        </div>
        <div class="mianshi">
        <button type="button" style="background-color:transparent;border:none;"  onclick="IM_contact('<%=row.get("hx_user")%>','','<%=row.get("company_name") %>');"><img src="img/yjms.png" width="120"></button>
        </div>
    </div>
       	<% }else if( 4==status) {%>
	<div class="inform_a">
    	<h2 class="status_<%=status%>">
    		<a style="color:#FFF;" target="_blank"  href="/company/info.do?id=<%=row.get("company_id")%>">
    		<%=row.get("company_name") %>
    		</a>（通知复试）</h2>
        <div class="inform_list">
        	<p>应聘岗位：<%=row.get("job_name")==null?"":row.get("job_name") %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	       通知时间：<%=row.get("add_time") %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
        	       通知内容：<%=row.get("remark")%></p>
        </div>
        <div class="mianshi">
        <button type="button" style="background-color:transparent;border:none;"  onclick="IM_contact('<%=row.get("hx_user")%>','','<%=row.get("company_name") %>');"><img src="img/yjms.png" width="120"></button>
        </div>
    </div>
        <% } %>
       	<%
       		} // for 
       } // if
        %>
	<!--分页-->
	<%=request.getAttribute("pagenation") %>
    
</div>
<jsp:include page="include/easemobim.jsp" flush="true"/>
<jsp:include page="include/footer.jsp" flush="true"/>
</body>
</html>
