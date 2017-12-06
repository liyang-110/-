<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="include/initdata.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><%=jobfairMap.get("job_fair_name") %> - <%=com.zhaopin.Config.getSiteTitle() %></title>
<link type="text/css" rel="stylesheet" href="css/core.css" />
<script src="<%=request.getContextPath()%>/assets/jquery/jquery.min.js"></script>
<script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script> 

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
<link rel="stylesheet" href="css/tooltip.css" type="text/css"></link>
<script type="text/javascript" src="js/tooltip.js"></script>
<script>
	$(function(){
		$("#resumeList li").showTip();
	});
	
</script>
</head>

<body>
<jsp:include page="include/header_com.jsp" flush="true" />
<!-----------menu----------------->
<div class="menu">
	<div class="caidan caidan_a">
    	<ul>
       	<li><a href="/netcongress/start.do?id=<%=job_fair_id %>"  >招聘大厅</a></li>
            <li><a href="/netcongress/start.do?id=<%=job_fair_id %>&m=resume" >收到简历</a></li>
            <li><a href="/netcongress/start.do?id=<%=job_fair_id %>&m=interview"  class="on" >等待面试</a></li>
            <li><a href="/netcongress/start.do?id=<%=job_fair_id %>&m=result" >面试结果</a></li>

        </ul>
        <div class="clear"></div>
    </div>
</div>
<!--list_bot开始-->
<div class="list_bot">
	<!--cont开始-->
	<div class="cont_o">
    <!--shang-->
    <div class="cont_b">
        <!--xia-->
    <div class="cont_c">
        <!--zhong-->
           <div class="left_a">  
        	<ul  id="resumeList">
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
            	<li  title="姓名：&nbsp;<%=row.get("name")%>&nbsp;&nbsp;<%=row.get("job_name")==null?"":("应聘岗位："+ row.get("job_name") )%><br/>
            	通知时间：<%=row.get("add_time") %><br/>
            	通知内容：<%=row.get("remark")%>">
            	<p class="left">
            	<a href="javascript:;" onclick="open_deal_resume('<%=row.get("student_id") %>','<%=row.get("order_id") %>')">
				<span><%=row.get("name") %></span>&nbsp;&nbsp;
				<%=row.get("job_name")==null?"":("应聘岗位："+row.get("job_name") ) %>
				</a>
				</p>
            	<p class="qq">
            	<% if(row.get("bind_qq")!=null){ %>
            	<a href="http://wpa.qq.com/msgrd?v=3&uin=<%=row.get("bind_qq")%>&Site=211校招网&Menu=yes" title="QQ：<%=row.get("bind_qq")%>" target="_blank">
            		<img class="qq" src="/netcongress/img/tubiao/qq.png" /></a>
            	<% } %>
            	</p>
				<p class="right">
				<% if(2==status ){%>
            	<span class="yellow">等待面试</span>
            	<% }else if( 4==status) {%>
            	<span class="green">等待复试</span>
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
        	<a href="javascript:;"  onclick="ajaxMore(this);" pageNum="2" pageSize="20">更多</a>
        </div>
    </div>
    </div>
    </div>
</div>
<script type="text/plain" id="interviewLi">
<li title="{{title}}" class="interviewLi">
            	<p class="left">
            	 <a href="javascript:;" onclick="open_resume_layer('/company/resumeDetail.do?netcongress=true&oid={{order_id}}')">
            	{{name}}&nbsp;&nbsp;
            	应聘职位：{{job_name}}
            	</a>
            	</p>
            	<p class="qq">
            	{{bind_qq}}
            	</p>
            	<p class="right">
            	{{status}}
            	</p>
            	</li>
</script>
<script type="text/plain" id="qq_link">
<a href="http://wpa.qq.com/msgrd?v=3&amp;uin={{bind_qq}}&amp;Site=211校招网&Menu=yes" title="QQ：{{bind_qq}}" target="_blank">
            		<img class="qq" src="/netcongress/img/tubiao/qq.png"></a>
</script>
<script type="text/javascript">
function interviewTitle( status ){
	if( status!=0 ){
		var html=     	'姓名：{{name}}&nbsp;&nbsp;应聘岗位：{{job_name}}<br/>'+
					    	'通知时间：{{deal_time}}<br/>'+
			            	'通知内容：{{remark}}';
		return html;
	}else{
		var html='投递时间：{{add_time}}<br/>'+
			           '应聘岗位：{{job_name}}<br/>';
		return html;
	}
}
function interviewLiDom( data ){
	var html = $("#interviewLi").text()
					.replace(/{{title}}/g, interviewTitle( data.status ) )
					.replace(/{{order_id}}/g,data.order_id )
					.replace(/{{name}}/g,data.name )
					.replace(/{{job_name}}/g, (data.job_name)?data.job_name:'' )
					.replace(/{{status}}/g, interviewStatus( data.status ) )
					.replace(/{{bind_qq}}/g, bind_qq( data.bind_qq ) )
					.replace(/{{remark}}/g,  data.remark  )
					.replace(/{{add_time}}/g,data.add_time)
					.replace(/{{deal_time}}/g,data.add_time);
	return html;
}
function interviewStatus( status ){
		switch( status ){
			case '0' :
				return '<span class="yellow">待定</span>';
			case '1' :
				return '<span class="red">简历未通过</span>';
			case '2' :
				return '<span class="yellow">等待面试</span>';
			case '3' :
				return '<span class="red">面试未通过</span>';
			case '4' :
				return '<span class="green">等待复试</span>';
			case '5' :
				return '<span class="green">通知录用</span>';
		}
		return '';
}
function bind_qq( qq ){
	if( !qq )return '';
	var html=$("#qq_link").text()
						.replace(/{{bind_qq}}/g,qq );
	return html;
}
function ajaxMore( dom )
{
	var pageSize=$(dom).attr("pageSize");
	var pageNum= $(dom).attr("pageNum");
	var url = cur_path+"/netcongress/ajaxMore.do?m=interview&p="+pageNum+"&s="+pageSize;
	ajaxMoreJson(url,ajaxMoreHtml);
	$(dom).attr("pageNum",parseInt(pageNum)+1 );
}
function ajaxMoreHtml( data )
{
	var li = $("#resumeList_tpl").text();
	var status='';
	var bg='';
	for(var i=0;i<data.length;i++){
		var newLi = interviewLiDom( data[i] );
		$("#resumeList").append(newLi );
	}
	$("#resumeList li").die();
	$("#resumeList li").showTip();
}
</script> 
<!--yejiao-->
<jsp:include page="include/footer.jsp" flush="true" />
</body>
</html>
