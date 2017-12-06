<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String job_fair_id = request.getParameter("id")==null?"":request.getParameter("id");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'jSmsNotice.jsp' starting page</title>
	<script type="text/javascript">
		var cur_path = "<%=request.getContextPath()%>";
		var job_fair_id = "<%=job_fair_id%>";
	</script>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="/js/js_common.js"  charset="UTF-8"></script>
   <link rel="stylesheet" href="/js/jquery-easyui/themes/bootstrap/panel.css" type="text/css"></link>
   <link rel="stylesheet" href="/js/jquery-easyui/themes/bootstrap/window.css" type="text/css"></link>
  
  <script type="text/javascript">
  	$(function(){
  		setTimeout("initData();",500);
  	});
  	function initData(){
  		var ls_url="/esbServer.do?method=execProc&methodId=ad_job_fair_query&in_URLEncoding=UTF-8&in_r=ad&in_action=sms_notice&in_job_fair_id="+job_fair_id;
  		$.ajax({
  	        url: ls_url,
  	        type: "post",
  	        dataType: "text",
  	        success: function(data) {
  	            if (!data) return;
  	            data = decodeURIComponent(data);
  	            var re = eval("[" + data + "]");
  	            if (re.length > 0 && re[0].returncode == 'ok') {
  	            	var queryresult = re[0].queryresult;
  	            	if( queryresult[0].ok = 'ok'){
  	            		var company_num = queryresult[0].company_num;
  	  	            	var student_num = queryresult[0].student_num;
  	  	            	if(company_num>0 ){
  	  	            		$("#company_num").parent().find("input").removeAttr("disabled");
  	  	            		$("#in_company_num").val( company_num );
  	  	            		$("#company_num").text( company_num );
  	  	            	}
  	  	            	if(student_num>0 ){
  	  	            		$("#student_num").parent().find("input").removeAttr("disabled");
	  	  	            	$("#in_student_num").val( student_num );
	  	  	            	$("#student_num").text( student_num );
  	  	            	}
  	            	}
  	            }
  	        },
  	      	contentType:"application/x-www-form-urlencoded; charset=utf-8"
  		});
  	}
  	function sendSms(){
  	   $("#btn_save") && $("#btn_save").linkbutton('disable');
  	   var ls_url="/esbServer.do?method=execProc&methodId=short_message&in_URLEncoding=UTF-8&in_r=ad&in_action=job_fair_notice&_t="+new Date();
  	   $('#fm').form('submit', {
  	        url: ls_url,
  	        onSubmit: function() {
  	        	if( $(this).form('validate') ){
  	        		return true;
  	        	}else{
  	        		$("#btn_save") && $("#btn_save").linkbutton('enable');
  	        		return false;
  	        	}
  	        },
  	        success: function(data) {
  	        	$("#btn_save") && $("#btn_save").linkbutton('enable');
  	        	data = decodeURIComponent(data);
  	            var re = eval("[" + data + "]");
  	            console.info( re );
  	            if (re.length > 0 && re[0].returncode == 'ok') {
  	            	var queryresult =re[0].queryresult;
  	            	if( queryresult[0].ok!='ok' && queryresult[0].msg ){
  	            	 	$.messager.alert('\u63d0\u793a\u4fe1\u606f',queryresult[0].msg,'error');
  	            	}else if(queryresult[0].ok=='ok'){
  	            		$.messager.alert('\u63d0\u793a\u4fe1\u606f',queryresult[0].msg,'info');
  	            	}
  	            } else {
  	                $.messager.alert('\u9519\u8bef\u4fe1\u606f', data, 'alert');//错误信息
  	            }
  	        }
  	    });
  	}
  </script>
  </head>
  <body>
    <form name="fm" id="fm" method="post">
    	<input type="hidden" name="in_job_fair_id" value="<%=job_fair_id %>" />
    	<div><p>
    	<label>
    	<input type="checkbox" id="in_company_num" name="in_company_num" value="0" disabled="disabled"/>
    	参会企业(<span id="company_num">0</span>)</label></p>
    	<p>
    	<label>
    	<input type="checkbox" id="in_student_num" name="in_student_num" value="0" disabled="disabled" />
    	关注学生(<span id="student_num">0</span>)</label>
    	</p></div>
    	<div>
    	<textarea id="in_sms_content" name="in_sms_content" style="width:280px;height:70px;"></textarea>
    	</div>
    	<div><p>
    	<a class="easyui-linkbutton" id="btn_save" onclick="sendSms();">发送</a>
    	<a class="easyui-linkbutton" onclick="parent.closeSmsNotice();">取消</a>
    	</p></div>
    </form>
  </body>
</html>
