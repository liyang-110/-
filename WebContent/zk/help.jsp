<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>211校招网指导师管理系统</title>
<link href="<%=request.getContextPath() %>/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="easyui/1.3.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="easyui/1.3.4/locale/easyui-lang-zh_CN.js" charset="UTF-8"></script>
		<style type="text/css">
a{text-decoration:none;color:black;}
.main_body{
background:#FFF;
background-image: url(images/t0198aab926a64c1429.png);
background: url(images/t0198aab926a64c1429.png) 0% 100% / cover no-repeat, whiteSmoke;
background-size: cover, 100%;
background-position: 0% 100%;
background-repeat: no-repeat no-repeat;
position: absolute;
z-index: 1;
left: 0;
top: 0;
width: 100%;
height: 100%;
}
		</style>
        <script>
         function check_f(){
         var name=document.login_f.user_id.value;
         var pwd=document.login_f.user_pass.value;
         if(!name||!pwd){alert('请如入完整信息！');return false;}
         document.login_f.submit();
         }
        </script>
</head>
<body>
<div class="main_body" style="margin:0 auto;">
    <div class="modal">
        <div class="modal-header">
        	211校招网指导师管理系统帮助中心
        </div>
    <div class="modal-body">
    	<p>就业指导师管理系统电话：029-88662468,029-87240519</p>
    </div>
	</div>
</div>
<script src="<%=request.getContextPath()%>/assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script> 

</body>
</html>
