<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="checkLogin.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page"/>
	<script type="text/javascript">
		var cur_path = "<%=request.getContextPath()%>";
		var school_id ="<%=request.getParameter("school_id")!=null ?request.getParameter("school_id") :""%>";
		var job_fair_id="<%=request.getParameter("id")!=null ?request.getParameter("id") :""%>";
	</script>
	<script type="text/javascript" src="/js/js_common.js"></script>
	<script type="text/javascript" src="Company.js" charset="UTF-8"></script>
   <link rel="stylesheet" href="/js/jquery-easyui/themes/bootstrap/panel.css" type="text/css"></link>
   <link rel="stylesheet" href="/js/jquery-easyui/themes/bootstrap/window.css" type="text/css"></link>
 	<script type="text/javascript">
	 $(function(){
	 		if( window!=top ){
	 			window.parent.$('body,html').animate({scrollTop:0},200);
	 		}
			var ifram = parent.document.getElementById("rightFrm");
			$(ifram).attr("height",622); 
	 });
	</script>
  </head>
  
  <body>
		<div class="easyui-layout" style="width: 100%; height: 350px;" data-options="fit:true,border:false">
			<div data-options="region:'center',split:true,border:false">
				<table id="resultId" name='resultId'>
				</table>
			</div>
	    </div>
		<div id="dlg_deal" class="easyui-dialog" fit="true" style="width: 100%; height: 100%; padding: 0px 0px" closed="true" buttons="#dlg-buttons">
			<iframe scrolling="auto" id="if_deal" frameborder="0" src="" style="width: 100%; height: 100%;"></iframe>
		</div>
		
		<div id="dlg_check" style="display:none">
				<div style="text-align:center; margin-bottom:12px;">
					<div style="text-align:left;width:290px;margin:auto;">备注：<span style="color:red;">(仅对本场招聘会有效)</span></div>
				 	 <textarea name="mem" id="mem" cols="45" rows="5"></textarea>
				</div>
		</div>
  </body>
</html>
