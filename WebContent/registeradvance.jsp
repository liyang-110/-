<%@ page language="java" pageEncoding="UTF-8"%>
<% com.zhaopin.zk.ZkTools.newRegister(session,request); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta name="Keywords" content="<%=com.zhaopin.Config.getSiteKeywords() %>" />
<meta name="Description" content="<%=com.zhaopin.Config.getSiteDescription() %>" />
<title>用户注册-- <%=com.zhaopin.Config.getSiteTitle() %></title>

<link rel="stylesheet" href="/statics/bootstrap/2.3.2/css/bootstrap.min.css"/>
<link rel="stylesheet" href="/statics/bootstrap/2.3.2/css/bootstrap-theme.min.css"/>
<link rel="stylesheet" href="/statics/css/main.css" type="text/css" />
<link rel="stylesheet" href="/statics/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" type="text/css"></link>


<script type="text/javascript">
	var cur_path ="<%=request.getContextPath()%>";
</script>
<script src="assets/jquery/jquery.min.js"></script>
<script src="media/js/jquery.validate.min.js" type="text/javascript"></script> 
<script type="text/javascript" src="assets/jquery/jquery.form.js"></script>
<script type="text/javascript" src="assets/scripts/register.js" charset="utf-8"></script>

<link href="js/layer/skins/default.css" rel="stylesheet" />
<script src="js/layer/artDialog.min.js" type="text/javascript"></script>
<script type="text/javascript" src="js/layer/getprovince211.js" charset="utf-8"></script>
<script type="text/javascript" src="js/layer/getposition.js" charset="utf-8"></script>
<script type="text/javascript" src="js/layer/jobjss.js" charset="utf-8"></script>
<script type="text/javascript" src="assets/My97DatePicker/WdatePicker.js"  charset="utf-8"></script>
<script type="text/javascript" src="js/school_data_js_array.js" charset="utf-8"></script>

<link rel="shortcut icon" href="media/image/favicon.ico" />
<style type="text/css">
	.select_user_type {	height:80px;	}
	.select_user_type li{float:left;margin:0 5px;box-shadow: 1px 1px 1px;}
	.select_user_type li a{	display:block;width:291px;height:38px;	color:#929292;font-size:20px;
		background:#EDEDED;line-height:38px;text-align:center;text-decoration:none;	font-weight:bolder;	}
	.select_user_type li a.stu:hover{background:#65CC33;color:#FFF;}
	.select_user_type li a.com:hover{background:#00ACEC;color:#FFF;}
	.select_user_type li a.sch:hover{background:#FF6600;color:#FFF;}
	.select_user_type li.active a.stu{background:#65CC33;color:#FFF;}
	.select_user_type li.active a.com{background:#00ACEC;color:#FFF;}
	.select_user_type li.active a.sch{background:#FF6600;color:#FFF;}
</style>
            <script>
			  $(function () {
				$('.select_user_type a').click(function (e) {
				  		e.preventDefault();
				  		
				  		var target=$(this).attr("target");
				  		/*
				  		if(target=="_sch"){
				  			alert("院校/机构暂停注册,如需帮助请拨打电话:029-88662468咨询!");
				  			return;
				  		}
				  		*/
						$(this).parent("li").siblings().removeClass("active");
						$(this).parent("li").addClass("active");
						
						$.dialog({
						        id: 'Tips',
						        esc:false,
						        width:200,
						        height:100,
						        title: false,
						        content:'<div>正在加载数据……</div>',
						        cancel: false,
						        fixed: true,
						        lock: true,
						        modal: true,
						        close:false
						    });
						$("#ajax-form").load("register"+$(this).attr("target")+".jsp #register_form",function(){
								$.dialog({id: 'Tips'}).close();
								$('.register-form').validate( eval("options"+target ));
						});
				});
			  });
			function isIE() { //ie?  
				if (!!window.ActiveXObject || "ActiveXObject" in window)  
				  return true;  
				else  
				  return false;  
			}  
			</script>
    
    </head>
	<body>
	<jsp:include  page="include3/head_hr_reg.jsp" flush="true"/>
    <div class="container" id="register-form">
            <ul class="tabs" id="reg_tab">
              <li class="active"><a href="#register_form">1、填写账户信息</a></li>
              <li class=""><a href="#register_success">2、注册成功</a></li>
            </ul>
    <div style="width:920px; margin:auto;">
		<ul class="select_user_type">
		<li class="active"><a class="stu" href="javascript:;" target="_stu">我是学生</a></li>
		<li><a class="com" href="javascript:;" target="_com">我是企业</a></li>
		<li><a class="sch" href="javascript:;" target="_sch_ok">我是院校/机构</a></li>
		</ul>
    </div>             
     <div style="clear:both;"></div>
      <div id="ajax-form">
      </div> <!-- ajax-form -->
      	<script type="text/javascript">
      		$("#ajax-form").load("register_stu.jsp #register_form",function(){
      			$('.register-form').validate(options_stu);
      		});
      	</script>
</div>
<jsp:include page="include3/bottom.jsp" flush="true" />

<script src="assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script> 
<script type="text/javascript" src="statics/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>

	</body>
</html>

