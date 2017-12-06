<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="include/initdata.jsp" %>
<%
	ComUserBean company = (ComUserBean)user;
	String company_name = company.getCompanyName();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><%=jobfairMap.get("job_fair_name") %> - <%=com.zhaopin.Config.getSiteTitle() %></title>
<link type="text/css" rel="stylesheet" href="/static/css/font-awesome.min.css" />
<link type="text/css" rel="stylesheet" href="style/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="style/already.css" />
<link type="text/css" rel="stylesheet" href="style/core.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script> 

<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript"  src="js/carousel.js"></script>
<script type="text/javascript" src="js/jquery.downCount.js"></script>


<script src="<%=request.getContextPath()%>/assets/artDialog/artDialog.js?skin=green"></script>
<script src="<%=request.getContextPath()%>/assets/artDialog/plugins/iframeTools.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets2/scripts/front.js" charset="utf-8"></script>
<script type="text/javascript">
	if (window!=top) // 判断当前的window对象是否是top对象
		top.location.href =window.location.href; 
	var cur_path = "<%=request.getContextPath()%>";
</script>
<script type="text/javascript" src="js/flow.js" charset="utf-8"></script>
<script type="text/javascript" src="js/jquery-scrollable.js" charset="utf-8"></script>
<script type="text/javascript">
	$(function(){
		$(".nav-pills>li:eq(1)").addClass("activ_one");
	});
</script>
<script type="text/javascript" src="js/studentNotice.js?r=co" charset="utf-8"></script>
<jsp:include page="include/weixin.jsp" flush="true" />
</head>
<body>
<jsp:include page="include/header_com.jsp" flush="true" />

<div class="job">
    <h1>收到简历</h1>
</div>
<!--job完成-->
<div class="inform">
	<div class="inform_a inform_b">
    	<h2><%=company_name%></h2>
		<table class="table">
           <thead>
              <tr class="active">
                 <th>时间</th>
                 <th>姓名</th>
                 <th>学历</th>
                 <th>专业</th>
                 <th>应聘岗位</th> 
                 <th>在线面试</th>                                                                                  
              </tr>
           </thead>
           <tbody>
        <%
        List<HashMap> resumeList = (List<HashMap>)request.getAttribute("resumeList");
        
       if(resumeList!=null && resumeList.size()>0){
       		int status =0;
       		for(HashMap row: resumeList ){
       			status=0;
	       		try{
	       			status = Integer.parseInt( (String)row.get("status") );
	       		}catch(NumberFormatException e){}
       			String tip="";
       			if( 0==status ){
       				tip="姓名："+row.get("name")+"<br/>投递时间："+row.get("add_time")+"<br/>应聘岗位："+row.get("job_name");
       			}else{
       				tip="姓名："+row.get("name")+"&nbsp;"+
				            	"<br/>时间："+row.get("deal_time")+
				            	"<br/>备注："+row.get("remark");
       			}
       	%>
              <tr>
              	 <td><%=row.get("add_time") %></td> 
                 <td>
                 <a href="javascript:;" onclick="open_resume_layer('/company/resumeDetail.do?netcongress=true&oid=<%=row.get("order_id")%>')">
                 <%=row.get("name") %>
                 
                 <% if(1==status ){%>
            	<span class="red">简历未通过</span>
            	<% }else if(2==status) {%>
            	<span class="green">通知面试</span>
            	<% }else if(0==status) { %>
            	<span class="yellow"><!--待定--></span>
            	<% }else if(3==status) { %>
            	<span class="red" style="background:red;color:#FFF;">面试未通过</span>
            	<% }else if(4==status) { %>
            	<span class="green">通知复试</span>
            	<% }else if(5==status) { %>
            	<span class="green">通知录用</span>
            	<% } %>
                 
                 </a></td>
                 <td><%=row.get("education") %></td>
                 <td><%=row.get("profession") %></td>                                                                        
                 <td><a><%=row.get("job_name") %></a></td>
                 <td>
                 <%--  
                 <a class="can" href="javascript:;" onclick="open_resume_layer('/company/resumeDetail.do?netcongress=true&nid=<%=job_fair_id %>&oid=<%=row.get("order_id")%>&_s=<%=cn.com.zhaopin.util.MD5Util.getMD5String( session.getId()+row.get("order_id") )%>')">
                 	查看简历
                 </a>
                 --%>
                 <% if(request.getAttribute("reserved")!=null){ %>
				 <button type="button" style="background-color:transparent;border:none;" onclick="IM_contact('<%=row.get("hx_user")%>','<%=row.get("head_pic")==null?"":row.get("head_pic") %>','<%=row.get("name")%>');"><img src="img/yjms.png" width="120"></button>
				 <% }else{ %>
				 <button type="button" style="background-color:transparent;border:none;" onclick="msg_alert('提示信息','您没有预定本场招聘会，不能发起在线面试！','face-sad')"><img src="img/yjms.png" width="120"></button>
				 <% } %>
                 </td>
              </tr>       
       	<%
       		}
       }
        %>
           </tbody>
        </table>
        <!--分页-->
        <%=request.getAttribute("pagenation") %>
    </div>
</div>
<jsp:include page="include/easemobim.jsp" flush="true"/>
<jsp:include page="include/footer.jsp" flush="true" />

</body>
</html>
