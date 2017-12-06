<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../include/checkLogin.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'jDeal.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
		var cur_path = "<%=request.getContextPath()%>";		
	</script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"></script>
	<script type="text/javascript">
		var gi_pagesize = <%=request.getParameter("pagesize")%>;
		var gi_pagenum = <%=request.getParameter("pagenum")%>;
		var gi_currentnum = <%=request.getParameter("currentnum")%>;
	
		var processid = "<%=request.getParameter("processid")%>";
		var buss_id = "<%=request.getParameter("buss_id")%>";
		var school_id = "<%=request.getParameter("school_id")%>";
		var user_code = "<%=user_code%>";
		var mem = "";
		
   var confirmed=false;

   function sendData(deal_type){
			mem=$("#mem").val();
			if (deal_type=='N' && mem==""){
				$.messager.alert('提示信息','请输入不同意的批注意见','info');
				return;
			}
			if(deal_type=='Y' && !confirmed){
				if(school_id=="" || school_id =="null"){
					confirmed=true;
					sendData('Y');
					return;
				}else{
					confirm('points6');
					return;
				}
			}
			var url= cur_path +"/sheetAction.do?method=dealSheet";
			$.post(url, {processid: processid, buss_id: buss_id, deal_type: deal_type,mem:mem}, function(data){
				if(data=="succ"){
					$.messager.alert('提示信息','审核成功','info',function (){
						window.parent.closepage(gi_pagesize,gi_pagenum,gi_currentnum);
					});
				}else if(data=="nopoints"){
					$.messager.alert('提示信息','您的账户点数不足，无法接受邀请！','info');
				}else{
					$.messager.alert('提示信息','审核失败','info');
				}
			});
	}
	function confirm(points){
		var cur_points=0;
		var set_points=0;
		var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=login_points_confirm&in_add_person="+user_code+"&in_id="+school_id+"&in_r=sc&in_role=school&in_compare="+points+"&date=" + new Date();
		$.post(ls_url,{}
		).done(function(data){
			var data = $.parseJSON( decodeURIComponent(data) );
			/*
			{"returncode":"ok" , "errordesc":"" ,"queryresult":[{"'ok'":"ok"}]} 
			*/			
			if(data.returncode =='ok'){
				cur_points=data.queryresult[0].points;
				set_points=data.queryresult[0].compare;
				
				if( set_points>cur_points ){
					$.messager.alert('提示信息','本操作需要点数'+set_points+'，您当前点数'+cur_points+',点数不足！','error');
				}else{
					$.messager.confirm('提示信息', '当前点数'+cur_points+'<br/>本次将扣除点数'+set_points, function(r){
									if (r){
										confirmed=true;
										sendData('Y');
									}
					});
				}			
			}else{
				$.messager.alert('提示信息',data.errordesc,'error');
				return;
			}
		}).fail(function(){
			$.messager.alert('提示信息','服务器错误，请稍后再试！','info');
			return;
		});
	}
	</script>

  </head>
  
  <body>
 	 批注意见：
 	 <div >
 	 <textarea name="mem" id="mem" cols="50" rows="8"></textarea>
 	 </div>
 	 <a href="javascript:void(0)" class="easyui-linkbutton" onclick="sendData('Y')">同意</a>
 	 <a href="javascript:void(0)" class="easyui-linkbutton" onclick="sendData('N')">不同意</a>
  </body>
</html>
