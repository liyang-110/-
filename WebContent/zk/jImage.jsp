<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'jImage.jsp' starting page</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<link href="<%=request.getContextPath()%>/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/styles/global.css">

<script src="<%=request.getContextPath()%>/assets/jquery/jquery.min.js"></script>
<script>
var cur_path="<%=request.getContextPath()%>";
var file_id="<%=request.getParameter("file_id")%>";
$(function(){
	if(file_id!=''){
		var ls_url = cur_path+"/esbServer.do?method=execProc&in_r=ad&methodId=fileid_to_path&in_file_id="+file_id+"&date=" + new Date();
		$.ajax({
			url:ls_url, 
			type:"post", 
			dataType:"text", 
			success:function (data) {
			if (!data) {
				return false;
			}
			data = decodeURIComponent(data);
			var re = eval("[" + data + "]");
		
			if (re.length > 0 && re[0].returncode == "ok") {
				initdata= re[0].queryresult;
				$("img").attr("src",cur_path+'/'+initdata[0].path);
				// $("#file").css("backgroundImage","url("+initdata[0].path+")"); 
			}
		}});
	}
});
</script>
  </head>
  
  <body>
    <img src=""/>
  </body>
</html>
