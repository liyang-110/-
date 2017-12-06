<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="TreeTag" prefix="t" %>
<%@ page import="com.zhaopin.dao.factory.BaseCodeModel" %>
<%@ page import="com.zhaopin.dao.factory.StudentResumeModel"%>
<%@ page import="com.zhaopin.bean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title></title>
<script src="<%=request.getContextPath()%>/assets/jquery/jquery.min.js"></script>

<link rel="stylesheet" href="<%=request.getContextPath()%>/statics/css/main4.css" />
<link rel="stylesheet" type="text/css" href="/member/style/zzsc.css">
<script type="text/javascript">
	var cur_path = "<%=request.getContextPath()%>";
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"></script>
<script src="<%=request.getContextPath()%>/assets/artDialog/artDialog.js?skin=aero"></script>
<script src="<%=request.getContextPath()%>/assets/jquery/jquery.form.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/artDialog/plugins/iframeTools.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-easyui/jquery.easyui.min.js"></script>

<script src="/member/js/jquery-pingjia.js" type="text/javascript" charset="utf-8"></script>
<script src="/member/js/zzsc.js" type="text/javascript" charset="utf-8"></script>
<style>

.f_login {background-color:#FFF; width: 350px; height:auto;margin:auto;text-align: center;}
.login4 #login4 .input-prepend {margin:auto;width:auto;}
.login4 #login4 .input-prepend input {
  width:220px;
  }
.f_login .controls {width:290px;margin-left:auto;margin-right:auto;}

body {
	font-family: 'Microsoft YaHei', 微软雅黑, SimSun, 宋体;
}
.f_login .control-group {
	width: auto;
}
.login4 #login4 {
  width: auto;
  height: auto;
  background-color:transparent;
  border-radius: none;
  padding:0;
  box-shadow:none;
}
</style>
</head>
<body style="background-color:#FBA957;padding:0;margin:0;">
		<div class="header-top"><p class="top-icon">招聘顾问评价</p></div>
    	<div class="f_login login4">
            
<!--////////////////////////////////////// JS代码结束 ///////////////////////////////////////-->

<div id="xzw_starSys">
	<div id="xzw_starBox">
	<p class="biaoti">服务态度：</p>
		<ul class="star" id="star1">
			<li><a href="javascript:void(0)" title="1" class="one-star">1</a></li>
			<li><a href="javascript:void(0)" title="2" class="two-stars">2</a></li>
			<li><a href="javascript:void(0)" title="3" class="three-stars">3</a></li>
			<li><a href="javascript:void(0)" title="4" class="four-stars">4</a></li>
			<li><a href="javascript:void(0)" title="5" class="five-stars">5</a></li>
		</ul>
		<input type="hidden" id="star_num_1" name="in_star1" value="0"/>
		<div class="current-rating" id="showb1"></div>
	</div>
	<!---->
	<div class="description dc1"></div>
</div>  
<div id="xzw_starSys">
	<div id="xzw_starBox">
		<p class="biaoti">专业能力：</p>
		<ul class="star" id="star2">
			<li><a href="javascript:void(0)" title="1" class="one-star">1</a></li>
			<li><a href="javascript:void(0)" title="2" class="two-stars">2</a></li>
			<li><a href="javascript:void(0)" title="3" class="three-stars">3</a></li>
			<li><a href="javascript:void(0)" title="4" class="four-stars">4</a></li>
			<li><a href="javascript:void(0)" title="5" class="five-stars">5</a></li>
		</ul>
		<input type="hidden" id="star_num_2" name="in_star2" value="0"/>
		<div class="current-rating" id="showb2"></div>
	</div>
	
	<div class="description dc2"></div>
</div>
<div id="xzw_starSys">
	<div id="xzw_starBox">
		<p class="biaoti">综合素质：</p>
		<ul class="star" id="star3">
			<li><a href="javascript:void(0)" title="1" class="one-star">1</a></li>
			<li><a href="javascript:void(0)" title="2" class="two-stars">2</a></li>
			<li><a href="javascript:void(0)" title="3" class="three-stars">3</a></li>
			<li><a href="javascript:void(0)" title="4" class="four-stars">4</a></li>
			<li><a href="javascript:void(0)" title="5" class="five-stars">5</a></li>
		</ul>
		<input type="hidden" id="star_num_3" name="in_star3" value="0"/>
		<div class="current-rating" id="showb3"></div>
	</div>
	
	<div class="description dc3"></div>
</div>
<div style="clear:both;"></div>

<div class="preview">
	<textarea rows="3" id="introduce" cols="45" style="margin-left:32px;border-radius: 8px;font-size:13px" placeholder="个人意见："></textarea>
</div>
<!--////////////////////////////////////// JS代码结束 ///////////////////////////////////////-->
<div class="btn">
	<button class="commit_btn">确定</button>
	<button class="aui_close_btn" >取消</button>
</div>
<p style="color:#999;font-size:15px;">当前每月只有一次评价的机会哦！</p>
 </div><!-- login -->

<script type="text/javascript">
  $(function(){
		var parent = art.dialog.parent;				// 父页面window对象
		api = art.dialog.open.api ;// 			art.dialog.open扩展方法
		
		$(".aui_main",parent.document ).css({"padding-top":0});  
		$(".aui_inner",parent.document ).css({"border":"none"});  
		
		$(".aui_close_btn").click(function(){
			api.close();
		});
		
		$(".commit_btn").click(function(){
			function msg_alert(title,msg,icon,in_func)
			{
				artDialog({
						title: title , // '提示信息',
						content: msg,
						icon: icon, // 'face-smile',
						fixed: true,
						width:150,
						lock:true,
						id:'alert',
						//time: 10,
						ok: function(){
								if(typeof(in_func) !='undefined'){
									in_func();
				             	}
								this.close();
								api.close();
						}
					});
			}
			var g1=$("#star_num_1").val();
			var g2=$("#star_num_2").val();
			var g3=$("#star_num_3").val();
			if(g1==0||g2==0||g3==0){
				alert("请选择评价！");
				return null;
			}
			var average=eval(g1+"+"+g2+"+"+g3)/3;
			average = parseFloat(average.toFixed(1));
			var introduce=$("#introduce").val();
		
			$.ajax({
		        url: "/member/appraise.do",
		        data:{g1:g1,g2:g2,g3:g3,average:average,introduce:introduce},
		        type: "post",
		        dataType: "text",
		        success: function(data) {
		            if (!data) return;
		            if( data =='error'){
		            	msg_alert('提示信息','评价失败!','error');
		            }else if(data=='yes'){
		            	msg_alert('提示信息','本月已评价!','succeed');
		            }else if(data=='no'){
		            	msg_alert('提示信息','评价成功!','succeed');
		            }
		            return;
		        },
			contentType:"application/x-www-form-urlencoded; charset=utf-8"
		    });
		});
  });
</script>
</body>
</html>
