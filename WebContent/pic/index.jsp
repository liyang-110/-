<%@ page language="java" pageEncoding="utf-8"%>
<!doctype html public "-//w3c//dtd xhtml 1.0 transitional//en" "http://www.w3.org/tr/xhtml1/dtd/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title></title>
<script type="text/javascript">
	var cur_path = "<%=request.getContextPath()%>";
	var file_ids = "<%=request.getParameter("file_ids")%>";
</script>
<link href="css/datouwang.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"></script>
<script type="text/javascript" src="js/jquery.DB_gallery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pic/pic.js"></script>

</head>
<body>
<center>

<div id="DB_gallery">
	<div class="DB_imgSet">
		<div class="DB_imgWin"></div>
		<div class="DB_page"><span class="DB_current">0</span>-<span class="DB_total">0</span></div>
		<div class="DB_prevBtn"><img src="images/prev_off.png"/></div>
		<div class="DB_nextBtn"><img src="images/next_off.png"/></div>
	</div>
	<div class="DB_thumSet">
		<ul class="DB_thumMove" id="picstr">	
		</ul>
		<div class="DB_thumLine"></div>
		<div class="DB_prevPageBtn"><img src="images/prev_page.png" alt="上一页"/></div>
		<div class="DB_nextPageBtn"><img src="images/next_page.png" alt="下一页"/></div>
	</div>
</div>

</center>

</body>
</html>