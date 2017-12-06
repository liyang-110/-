<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String base_dir =request.getContextPath()+"/";
	HashMap<String,String> errorMap = (HashMap<String,String>)request.getAttribute("errorMap");
	if( errorMap ==null )errorMap = new HashMap();
	if( errorMap.isEmpty() ){
		response.sendRedirect( request.getContextPath()+"/");
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><%=com.zhaopin.Config.getSiteTitle() %></title>
<link href="/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="/static/css/common-element.css" rel="stylesheet" type="text/css">
<link href="/static/css/index-style.css" rel="stylesheet" type="text/css">
	
<link type="text/css" rel="stylesheet" href="css/errorpage.css" />
<script src="/assets/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/statics/jquery/jquery.form.js" charset="utf-8"></script>
<script src="/statics/jquery/jquery.validate.min.js" type="text/javascript" charset="utf-8"></script> 
<script src="/statics/artDialog/artDialog.js?skin=green" charset="utf-8"></script>

<script type="text/javascript">
var cur_path = "<%=request.getContextPath()%>";
</script>
<script type="text/javascript" src="js/login.js" charset="utf-8"></script>
<style>
<% if ( !"801".equals (errorMap.get ("errorCode") ) ){ %>
.container .left .list
	{
	top: 200px;
}

.container .left  .img {
	padding-top: 25px;
}

.container .right {
	display: none;
}

.container .left {
	float: none !important;
	margin: auto;
}
<% } %>
</style>
</head>
<body>
<jsp:include page="../include/header.jsp" flush="true"></jsp:include>
<!--hengxian-->
<div class="container">
    <div class="left" id="errorMsg">
         <div class="img">
         	<img src="img/cry.png" height="360" width="590">
         </div>
         <div class="list">
         	<p><%=errorMap.get("errorMsg") %></p>
         </div>
    </div>
    <!--right开始-->
    <div class="right">
    	<form class="user_login"  action="<%=request.getContextPath()%>/login.do" method="post" onsubmit="return false;">
        	<ul class="feedform">
                <li>
                    <div class="k">用户名：</div>
                    <div class="c"><input type="text" name="user_id" class="ipt_defa" size="22" /></div>
                </li>
                <li>
                    <div class="k">密码：</div>
                    <div class="c"><input type="password" name="user_pass" class="ipt_defa" size="22" /></div>
                </li>
            </ul>
            <div style="clear:both;"></div>
          <table style="margin:20px auto auto auto;">
          	<tr><td>
          	            <input type="submit" value="登  录" class="yellow"  style="margin:auto;vertical-align: middle;" />
          	
          	</td><td>
          	            <a href="/register.jsp"  target="_blank" class="green" style="margin-left:15px;padding: 1px 10px;vertical-align: middle;">注  册</a>
          	
          	</td><td>
          				<a style="margin-left:15px;" href="/forget.jsp">忘记密码？</a>
          	</td></tr>
          </table>  
            
        
        </form>
        <script type="text/javascript">
			jQuery(document).ready(function() {     
					Login.init();
			});
		</script>
    </div>
    <!--right完成-->
   <div class="clear"></div>
</div>
<!--container完成-->
<div class="fenlan"></div>

<!--footer完成-->
<jsp:include page="../include/footer.jsp" flush="true"></jsp:include>

</body>
</html>