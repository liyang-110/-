<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理系统</title>
<link rel="stylesheet" type="text/css" href="easyui/1.3.4/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="css/wu.css" />
<link rel="stylesheet" type="text/css" href="css/icon.css" />
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
<div id="win" data-options="top:90" class="easyui-window" draggable="false" modal="false" resizable="false" closable="false" minimizable="false" maximizable="false"  collapsible="false"  title="登录" style="width:300px;height:220px;">
    <form action="<%=request.getContextPath() %>/zk/login.do" method="post" style="padding:10px 20px 10px 40px;" name="login_f">
        <p style="color:red;"><%=( (request.getAttribute("error_msg")!=null)?(String)request.getAttribute("error_msg"):"") %></p>
        <p>用户名: 
        <input class="easyui-validatebox" type="text" id="n" name="user_id" required="true" missingMessage="请输入帐号"/></p>
        <p>密&nbsp;&nbsp;码: 
        <input class="easyui-validatebox"  id="pwd" type="password" name="user_pass" required="true" missingMessage="请输入密码"></p>
        <div style="padding:5px;text-align:center;">
            <a href="#" class="easyui-linkbutton" icon="icon-ok" onclick="check_f()">登录</a>
            <a href="#" class="easyui-linkbutton" icon="icon-cancel" onclick="document.login_f.reset()">重置</a>
        </div>
    </form>
</div>
</div>

</body>
</html>
