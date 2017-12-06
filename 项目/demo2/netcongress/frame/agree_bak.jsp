<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title></title>
<link href="<%=request.getContextPath()%>/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath()%>/assets/styles/global.css" rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath()%>/assets/jquery/jquery.min.js"></script>

<script type="text/javascript">
	var cur_path = "<%=request.getContextPath()%>";
	var job_fair_id= "<%=request.getParameter("job_fair_id")%>";
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"></script>
<script src="<%=request.getContextPath()%>/assets/artDialog/artDialog.js?skin=green"></script>
<script src="<%=request.getContextPath()%>/assets/jquery/jquery.form.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/media/js/jquery.validate.min.js" type="text/javascript"></script> 
<script src="<%=request.getContextPath()%>/assets/artDialog/plugins/iframeTools.js"></script>

<style>
.panel.combo-p { height:120px;}
#person-order-form {
	width:300px;font-size:14px;padding:10px 0 10px 20px;height:260px; overflow:hidden;
	background-color:#F7F7F7;
}
#person-order-form .control-label {display: inline;}
#person-order-form .controls{width:260px;display: inline;}
#person-order-form .form-error {border-color: #b94a48;box-shadow: inset 0 1px 1px rgba(0,0,0,0.075);background-color:#EAFDBE;}
.control-group {margin-bottom:0;}
</style>
</head>
<body style="background-color:#F7F7F7;padding:0">
	<div style="text-align:center;margin:auto;">
	<label>
		<h2>参会须知</h2>
	</label>
	<textarea class="textarea" id="agree_textarea"  readonly="readonly" rows="" cols=""  style="background-color:#FFF;margin:auto;cursor:default;height:80%;width:80%;">
		西安培华学院招聘会邀请函

尊敬的用人单位：

衷心感谢贵单位多年来对我校毕业生就业工作的大力支持！

为充分发挥校园人才市场资源优势，搭建好毕业生与用人单位招聘的服务平台，促进毕业生充分就业，诚挚邀请贵单位来校选聘英才。

一、	招聘会信息：

1、招聘会时间：2015年10月16日 09:00-15:30

2、招聘会地点：西安培华学院长安校区明德楼二楼招聘大厅

3、主办单位：西安培华学院招生与就业指导中心

4、承办单位：211校招网

5、招聘会类型：综合类类

6、招聘会规模：100家企事业单位

二、	参会流程：

1、参会企业需提前致电预定展位，上211校招网上在线直接预定展位

2、预订展位后请将营业执照、组织机构代码证，等文件加盖公司以后电子版形式于招聘信息一起，发邮件到邮箱2623706797@qq.com

联 系 人：赵老师

联系电话：15771763275

最后，祝各企事业单位能在我校招收到满意的毕业生，共同搭建校企合作的桥梁。同时祝各位工作顺利，身体健康！

西安培华学院招生与就业指导中心

2015年8月31日
	</textarea>
	</div>
	<div style="text-align:center;padding:10px;">
		<button id="send_btn" class="btn btn-success btn-large">已阅读关闭</button><span id="send_msg"></span>
	</div>
<script>
var wait=60;//时间 
function time(o,p) {//o为按钮的对象，p为可选，这里是60秒过后，提示文字的改变 
	if (wait == 0) { 
		o.removeAttr("disabled"); 
		o.text("关闭");//改变按钮中value的值 
		p.html(""); 
		wait = 60; 
	} else { 
		o.attr("disabled", true);//倒计时过程中禁止点击按钮 
		p.html("请仔细阅读参会须知（"+wait+"秒)");//改变按钮中value的值 
		wait--; 
		setTimeout(function() { 
			time(o,p);//循环调用 
		}, 
		1000) ;
	} 
} 
$(function () {
		var height =window.screen.availHeight-350;
		$("#agree_textarea").css({width:750,height:height});
		
		var parent = art.dialog.parent,				// 父页面window对象
		api = art.dialog.open.api;	// 			art.dialog.open扩展方法
		if (!api) return;
		$("#send_btn").bind("click",function(){
			art.dialog.close();
		});
		$("#agree_textarea").bind("scroll",function(e ){
			$this= $(this);
			if(  $this.scrollTop()>= ($this.height()-10) ){
				wait=0;
				o.attr("disabled", true);//倒计时过程中禁止点击按钮 
				p.html("请仔细阅读参会须知（"+wait+"秒)");//改变按钮中value的值 

			}
	
		});
		// parent.document.title = 'iframe中的javascirpt到此一游';
		// 操作对话框
		api.title('参会须知');
		
		var o=$("#send_btn");
		var p=$("#send_msg");
		time(o,p);
})();

</script>
</body>
</html>
