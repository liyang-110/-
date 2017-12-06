<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="inc/checkLogin_c.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><%=company_name %> - 账户管理</title>
<link rel="stylesheet" href="style/bootstrap.nav.css" type="text/css"></link>

<link type="text/css" rel="stylesheet" href="style/core.css" />
<link type="text/css" rel="stylesheet" href="style/upload_general.css" />
<link type="text/css" rel="stylesheet" href="img2/core.css" />

<script type="text/javascript" src="js/jquery-1.11.3.js"></script>

<link rel="stylesheet" href="../js/jquery-easyui/themes/metro/validatebox.css" type="text/css"></link>
<script type="text/javascript" src="../js/jquery-easyui/jquery.easyui.min.js"></script>
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
			var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=login_update&in_r=co&in_id=" + id+"&date=" + new Date();
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
		var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=login_04&in_r=su&in_id=" + id + "&date=" + new Date();
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
<style>
input.readonly {border:none;}
input.readonly:focus {box-shadow:none;}
</style>
<script type="text/javascript">
	$(function(){
		$("#menu_1_4").addClass("on");
		$("#menu_1_4 a").addClass("one");
		
	});
</script>
<script src="/statics/artDialog/artDialog.js?skin=green"></script>

<script src="/statics/artDialog/plugins/iframeTools.js"></script>
<script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script> 
<script type="text/javascript" src="js/artDialog.notice.js?r=co" charset="utf-8"></script>

</head>

<body>
<jsp:include page="inc/header_c2.jsp" flush="true" />
<div class="container">
    <div class="cont">
    	<jsp:include page="inc/menu_c.jsp" flush="true" />
    	
        <div class="right">
        	<div class="right_top">
            	<h1 class="account">账户管理</h1>
                <div class="xian"></div>
                <form id="fm" name="fm" method="post" action="">
                <div class="table">
                	<table width="560" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td class="r_align">账户:</td>
                        <td class="l_align"><input readonly="readonly" name="in_user_id" type="text" value="" class="text readonly  easyui-validatebox" data-options="required:true"></td>
                      </tr>
                      <tr>
                        <td class="r_align">邮箱:</td>
                        <td class="l_align"><input name="in_user_email" type="text" value="" class="text easyui-validatebox" 
                        	data-options="required:true,validType:'email',missingMessage:'请输入电子邮箱',invalidMessage:'请输入正确的电子邮箱地址' "></td>
                      </tr>
                      <tr>
                        <td class="r_align">新密码:</td>
                        <td class="l_align"><input id="in_user_pass" name="in_user_pass" type="password" value="" class="text easyui-validatebox" data-options="required:true,missingMessage:'请输入密码' "></td>
                      </tr>
                      <tr>
                        <td class="r_align">再次输入密码:</td>
                        <td class="l_align"><input name="eq_user_pass" type="password" value="" class="text easyui-validatebox" 
                        	data-options="validType:'equalTo[\'#in_user_pass\']',required:true,missingMessage:'请输入确认密码' "></td>
                      </tr>
                      <tr>
                        <td class="r_align"></td>
                        <td class="l_align"><a href="javascript:;" class="upload submit_btn">确定</a></td>
                      </tr>
                    </table>
                </div>
                </form>
            </div>
            <!--right_top完成-->  
        </div>
        <!--right完成-->
        <div class="clear"></div>	
    </div>
    <!--cont完成-->
</div>
<!--footer开始-->
<jsp:include page="inc/footer_c.jsp" flush="true"  />
<!--footer完成-->
</body>
</html>
