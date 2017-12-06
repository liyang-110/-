<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../auth.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title></title>
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>  
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	<script type="text/javascript">
		var cur_path = "<%=request.getContextPath()%>";
		var param='<%=in_r%>';
	</script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"  charset="UTF-8"></script>
	<script type="text/javascript" src="PosterTemplet.js"  charset="UTF-8"></script>
  <style type="text/css">
  		.tpl_preview {
  			width:150px;
  			height:150px;
  		}
  </style>
  </head>
  
  <body>
  
		<div class="easyui-layout" style="width: 100%; height: 350px;" data-options="fit:true,border : false">
		
			<div data-options="region:'center',border : false">	
				<table id="resultId" name='resultId'>
				</table>
				
			</div>
	
	    </div>

		<div id="dlg_deal" class="easyui-dialog" fit="true" style="width: 100%; height: 100%; padding: 0px 0px" closed="true" buttons="#dlg-buttons">
			<iframe scrolling="auto" id="if_deal" frameborder="0" src="" style="width: 100%; height: 100%;"></iframe>
		</div>
	    
   
  </body>
</html>
