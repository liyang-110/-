<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="include/initdata.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><%=jobfairMap.get("job_fair_name") %> - <%=com.zhaopin.Config.getSiteTitle() %></title>
<link type="text/css" rel="stylesheet" href="css/core.css" />
<script src="<%=request.getContextPath()%>/assets2/jquery/jquery.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets2/jquery/jquery.form.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets2/js/jquery.validate.min.js" type="text/javascript"></script> 
<script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script> 

<script type="text/javascript">
	if (window!=top) // 判断当前的window对象是否是top对象
		top.location.href =window.location.href; 
	var cur_path = "<%=request.getContextPath()%>";
</script>
	
<script src="<%=request.getContextPath()%>/assets2/artDialog/artDialog.js?skin=green"></script>
<script src="<%=request.getContextPath()%>/assets/artDialog/plugins/iframeTools.js"></script>

<script type="text/javascript" src="js/flow.js" charset="utf-8"></script>
<script type="text/javascript" src="js/jquery-scrollable.js" charset="utf-8"></script>

</head>
<body>
<jsp:include page="include/header_sch.jsp" flush="true" />
<div class="menu">
	<div class="caidan">
    	<ul>
        	<li><a href="/netcongress/start.do?id=<%=job_fair_id %>"  >招聘大厅</a></li>
            <li><a href="/netcongress/start.do?id=<%=job_fair_id %>&m=interviewResult"  class="on">面试结果</a></li>
        </ul>
        <div class="clear"></div>
    </div>
</div>
<div class="list_bot">
	<!--cont开始-->
	<div class="cont_a">
    <!--shang-->
    <div class="cont_b">
        <!--xia-->
    <div class="cont_c">
        <!--zhong-->
        <div class="left_a">   
        	<ul  id="resumeList">
        <%
        List<HashMap> interviewResult = (List<HashMap>)request.getAttribute("interviewResult");
        
       if(interviewResult!=null && interviewResult.size()>0){
       		int status =0;
       		for(HashMap row: interviewResult ){
       			status=0;
	       		try{
	       			status = Integer.parseInt( (String)row.get("status") );
	       		}catch(Exception e){}
       		
       	%>
            	<li class="interviewLi">
            	<p class="left">
            	<a href="javascript:;" onclick="open_resume_layer('/company/resumeDetail.do?netcongress=true&oid=<%=row.get("order_id") %>')">
            	<%=row.get("name") %>
            	</a>&nbsp;&nbsp;收到了&nbsp;&nbsp;
            	<a title="<%=row.get("company_name") %>" target="_blank" href="/company/info.do?id=<%=row.get("company_id")%>">
            	<%=row.get("company_name") %>
            	</a>
            	</p>
            	<p class="right">
            	<% if(2==status ){%>
            	<span class="red">面试通知</span>
            	<% }else if( 5==status) {%>
            	<span class="green">录用通知</span>
            	<% }else if( 4==status) {%>
            	<span class="yellow">复试通知</span>
            	<% } %>
            	</p>
            	</li>
       	<%
       		}
       }
        %>
              </ul>
        </div>
        <div class="clear"></div>
        <div class="duo">
        	<a href="javascript:;"  onclick="ajaxMore(this);"  parameter="<%=job_fair_id %>" pageNum="2" pageSize="20">更多</a>
        </div>
    </div>
    </div>
    </div>
</div>
<script type="text/plain" id="resumeList_tpl">
<li class="interviewLi">
            	<p class="left">
            	<a href="javascript:;" onclick="open_resume_layer('/company/resumeDetail.do?netcongress=true&oid={{order_id}}')">
            	{{name}}
            	</a>&nbsp;&nbsp;收到了&nbsp;&nbsp;
				<a target="_blank" href="/company/info.do?id={{company_id}}">
            	{{company_name}}
            	</a>
				</p>
            	<p class="right">
            	<span class="{{bg}}">{{status}}</span>
            	</p>
            	</li>
</script>
<script type="text/javascript">
function ajaxMore( dom )
{
	var pageSize=$(dom).attr("pageSize");
	var pageNum= $(dom).attr("pageNum");
	var job_fair_id = $(dom).attr("parameter");
	var url = cur_path+"/netcongress/ajaxMore.do?m=result&id="+job_fair_id+"&p="+pageNum+"&s="+pageSize;
	ajaxMoreJson(url,ajaxMoreHtml);
	$(dom).attr("pageNum",parseInt(pageNum)+1 );
}
function ajaxMoreHtml( data )
{
	var li = $("#resumeList_tpl").text();
	var status='';
	var bg='';
	for(var i=0;i<data.length;i++){
		switch( data[i].status ){
			case '0' :status='待定';bg='yellow';break;
			case '1' :status='简历未通过';bg='red';break;
			case '2' :status='通知面试';bg='red';break;
			case '3' :status='面试未通过';bg='red';break;
			case '4' :status='通知复试';bg='yellow';break;
			case '5' :status='通知录用';bg='green';break;
		}
		var newLi = li.replace("{{company_id}}",data[i].company_id )
		.replace("{{company_name}}",data[i].company_name )
		.replace("{{status}}", status )
		.replace("{{name}}", data[i].name )
		.replace("{{order_id}}", data[i].order_id )
		.replace("{{bg}}",bg);
		$("#resumeList").append(newLi );
	}
}
</script> 
 <!--yejiao-->
<jsp:include page="include/footer.jsp" flush="true" />
</body>
</html>
