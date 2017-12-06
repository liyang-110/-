<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.bean.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
SchUserBean user=(SchUserBean)User.getUser("school",session);
if( user ==null ){
	response.sendRedirect( request.getContextPath()+"/");
	return;
}
%>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>修改密码</title>
<link type="text/css" rel="stylesheet" href="style/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="style/core.css" />
<link type="text/css" rel="stylesheet" href="style/all.css" />
<link type="text/css" rel="stylesheet" href="style/form.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/adddate.js"></script>

<link rel="stylesheet" href="/js/jquery-easyui/themes/metro/validatebox.css" type="text/css"></link>
<script type="text/javascript" src="/js/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript">
	$.extend($.fn.validatebox.defaults.rules, {  
	    /*必须和某个字段相等*/
	    equalTo: {
	    	validator:function(value,param){
	    		return $(param[0]).val() == value;
	    	},
	    	message:'确认密码不一致'
	    }
	          
	});
	var cur_path ="<%=request.getContextPath()%>";
	var id = '<%=user.getUserCode()%>';
	$(function () { 
		setTimeout("setData()", 500);
		$(".submit_btn").bind("click",function(e){
			e.preventDefault();
			var form =$(this).parents("form");
			var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=login_update&in_r=sc&in_id=" + id+"&date=" + new Date();
			form.form("submit",{
				url : ls_url,
				onSubmit:function(){
					return $(this).form("validate");
				},
				success :function(data){
					data = decodeURIComponent(data);
					var re = $.parseJSON( data );
					console.info(re);
					if( re && re.returncode=='ok'&& re.queryresult[0].msg ){
						alert( re.queryresult[0].msg );
					}else{
						alert("操作失败");
					}
				}
			});
		});
	});
	function setData() {	
		var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=login_04&in_r=sc&in_id=" + id + "&date=" + new Date();
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
			if (re.length > 0 && re[0].returncode == "ok"  ) {
				initdata= re[0].queryresult;
				$("#fm").form("load", initdata[0]);
				
			}
		}});
	}
</script>
</head>

<body>
<jsp:include page="include/head.jsp" flush="true"/>

<!--menu完成-->
<div class="hy">
	<p>当前位置：首页 &gt; <a href="/member/sc/home.do" style="color:#5a9707;">会员中心</a> </p>
</div>
<!--当前位置-->
<div class="header_main">
	<div class="clearfix">
        <div class="pull-left">
            <div class="pull_left">
                <!--折叠-->
                <jsp:include page="include/menu.jsp" flush="true"/>

            </div>
        </div>
    	<!--pull-left结束-->
        <div class="pull-right">
            <div class="pull_right">
                <div class="biankuang">
                	<div class="list_alter">
                    	<span style="color:#FFF; font-weight:bold; font-size:16px;">修改密码</span>
                    </div>
                    <!----------------------------标题------------------------------------->
                    <div class="form">
                    	<form id="fm" name="fm" method="post" action="">
                    	<table class="table">
                           <tbody>
                              <tr>
                                 <td class="text_right">用户账户：</td>
                                 <td class="text_left">
                                 	<input type="text" readonly="readonly" name="in_user_id"  class="form-control width easyui-validatebox" placeholder="">
                                 	<!--<input type="number" class="bg" name="points" min="0" max="500" step="1"/>-->
                                 </td>
                              </tr>
                              <tr>
                                 <td class="text_right">用户密码：</td>
                                 <td class="text_left">
                                 	<input name="eq_user_pass" type="password" class="form-control width easyui-validatebox" data-options="required:true,missingMessage:'请输入密码' "/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="text_right">确认密码：</td>
                                 <td class="text_left">
                                 	<input  id="in_user_pass" name="in_user_pass" type="password"  class="form-control width" placeholder=""
                                 	data-options="validType:'equalTo[\'#in_user_pass\']',required:true,missingMessage:'请输入确认密码' " />
                                 </td>
                              </tr>
                              <tr>
                                 <td class="text_right">用户邮箱：</td>
                                 <td class="text_left">
                                 	<input type="text" placeholder=""
                                 	name="in_user_email" class="form-control width easyui-validatebox" 
                        	data-options="required:true,validType:'email',missingMessage:'请输入电子邮箱',invalidMessage:'请输入正确的电子邮箱地址' ">
                                 	<!--<input type="number" class="bg" name="points" min="0" max="500" step="1"/>-->
                                 </td>
                              </tr>
                              <tr>
                              	 <td class="text_right"></td>
                                 <td class="text_left">
                                 	<button type="button" class="btn btn-default anniu_a submit_btn">确定</button>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                        </form>
                    </div>
                    <!--form------>
                </div>
            </div>
            <!--pull-right结束-->
        </div>
	</div>	
</div>
<!--footer-->
<jsp:include page="include/foot.jsp" flush="true" />

</body>
</html>
