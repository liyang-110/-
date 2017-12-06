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
	var wellcome="<%=request.getParameter("wellcome")%>";
</script>
<script src="<%=request.getContextPath()%>/assets/artDialog/artDialog.js?skin=green"></script>
<script src="<%=request.getContextPath()%>/assets/artDialog/plugins/iframeTools.js"></script>
<style type="text/css">
span.10 {
	font-family: 'Times New Roman';
}
p.MsoDate {
	text-align: justify;
	text-justify: inter-ideograph;
	font-family: 'Times New Roman';
	font-size: 10.5000pt;
}
span.msoIns {
	text-decoration: underline;
	text-underline: single;
	color: blue;
}
span.msoDel {
	text-decoration: line-through;
	color: red;
}
div.Section0 {
	page: Section0;
}
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

	<h4>211校招网网络招聘会参会须知</h4>
<div  id="agree_textarea"  style="overflow-y:scroll;height:70%;width:80%;margin:auto;border:1px solid #ddd;">
<div class="Section0" style="text-align: justify;text-indent:2em;padding:10px;layout-grid:15.6000pt;background-color:#FFF;margin:auto;">
  <p  style="  line-height:150%;  " ><span style="font-family:'Times New Roman';  color:rgb(255,0,0); font-size:10.5000pt;  " ><span >一．&nbsp;</span></span><span style="'yes'; font-family:宋体; color:rgb(255,0,0); font-size:10.5000pt;  " >申明：</span></p>
  <p  style="  line-height:150%; " ><span style="'yes'; font-family:宋体; font-size:10.5000pt;  " >本网络招聘会管理系统由陕西新才网络技术有限公司自主开发，享有全部版权。</span></p>
  <p  style="  line-height:150%;  " ><span style="font-family:'Times New Roman';  color:rgb(255,0,0); font-size:10.5000pt;  " ><span >二．&nbsp;</span></span><span style="'yes'; font-family:宋体; color:rgb(255,0,0); font-size:10.5000pt;  " >警告：</span></p>
  <p  style="  line-height:150%; " ><span style="'yes'; font-family:宋体; font-size:10.5000pt;  " >进入会场者，需严格遵照本系统操作流程使用。本系统仅供政府机构，高校，企业，个人用于招聘使用，任何个人和组织不得利用本系统从事其他业务或事项。</span></p>
  <p  style="  line-height:150%;  " ><span style="font-family:'Times New Roman';  color:rgb(255,0,0); font-size:10.5000pt;  " ><span >三．&nbsp;</span></span><span style="'yes'; font-family:宋体; color:rgb(255,0,0); font-size:10.5000pt;  " >使用须知：</span></p>
  <p  style="  line-height:150%;  " ><span style="font-family:'Times New Roman';  font-size:10.5000pt;  " ><span >1.&nbsp;</span></span><span style="'yes'; font-family:宋体; font-size:10.5000pt;  " >个人、企业入场以前，请提前登陆<font face="Times New Roman" >QQ</font><font face="宋体" >，并提前准备好视频，耳麦，以便与求职者进行在线视频语音交流；</font></span></p>
  <p  style="  line-height:150%;  " ><span style="font-family:'Times New Roman';  font-size:10.5000pt;  " ><span >2.&nbsp;</span></span><span style="'yes'; font-family:宋体; font-size:10.5000pt;  " >个人、企业入场以前，请确保视频身后为符合商务洽谈的场所和背景，要求干净，整洁，以保证面试洽谈的严肃性。</span></p>
  <p  style="  line-height:150%;  " ><span style="font-family:'Times New Roman';  font-size:10.5000pt;  " ><span >3.&nbsp;</span></span><span style="'yes'; font-family:宋体; font-size:10.5000pt;  " >个人、企业入场前，请自行准备正装或其他得体的服装，不得全裸，半裸，或穿戴不合商务要求的服装或背景，并保持洽谈环境的安静，有序，不被他人干扰。</span></p>
  <p  style="  line-height:150%;  " ><span style="font-family:'Times New Roman';  font-size:10.5000pt;  " ><span >4.&nbsp;</span></span><span style="'yes'; font-family:宋体; font-size:10.5000pt;  " >建议个人、企业使用台式机登录洽谈，因手机晃动厉害，网络信号也不佳，不利于长时间交流。</span></p>
  <p  style="  line-height:150%;  " ><span style="font-family:'Times New Roman';  font-size:10.5000pt;  " ><span >5.&nbsp;</span></span><span style="'yes'; font-family:宋体; font-size:10.5000pt;  " >建议个人在学校宿舍、家中书房，上网比较方便和相对独立的地方面试，面试时不要随意走动，或离座干其他事情。</span></p>
  <p  style="  line-height:150%;  " ><span style="font-family:'Times New Roman';  font-size:10.5000pt;  " ><span >6.&nbsp;</span></span><span style="'yes'; font-family:宋体; font-size:10.5000pt;  " >建议企业在会议室，或独立的办公室启动视频面试，尽量避免其他人走动和大声交谈影响面试效果。</span></p>
  <p  style="  line-height:150%;  " ><span style="font-family:'Times New Roman';  font-size:10.5000pt;  " ><span >7.&nbsp;</span></span><span style="'yes'; font-family:宋体; font-size:10.5000pt;  " >启动面试时，洽谈双方不要打开其他如游戏、视频、音乐、电影页面，更不要边看电影、边听音乐，边面试。</span></p>
  <p  style="  line-height:150%;  " ><span style="font-family:'Times New Roman';  color:rgb(255,0,0); font-size:10.5000pt;  " ><span >四．&nbsp;</span></span><span style="'yes'; font-family:宋体; color:rgb(255,0,0); font-size:10.5000pt;  " >使用方法</span></p>
  <p  style=" line-height:150%; " ><span style="'yes'; font-family:宋体; color:rgb(255,0,0); font-size:10.5000pt;  " >个人使用方法：</span></p>
  <p  style="  line-height:150%;  " ><span style="font-family:'Times New Roman';  font-size:10.5000pt;  " ><span >1.&nbsp;</span></span><span style="'yes'; font-family:宋体; font-size:10.5000pt;  " >个人入场前，必须提前注册简历，确保简历完整度为<font face="Times New Roman" >80%</font><font face="宋体" >以上，否则不能进入会场。</font></span></p>
  <p  style="  line-height:150%;  " ><span style="font-family:'Times New Roman';  font-size:10.5000pt;  " ><span >2.&nbsp;</span></span><span style="'yes'; font-family:宋体; font-size:10.5000pt;  " >个人入场前，或入场后，迅速查询意向岗位，并投递简历给意向企业的职位。</span></p>
  <p  style="  line-height:150%;  " ><span style="font-family:'Times New Roman';  font-size:10.5000pt;  " ><span >3.&nbsp;</span></span><span style="'yes'; font-family:宋体; font-size:10.5000pt;  " >个人入场后，应每<font face="Times New Roman" >10</font><font face="宋体" >分钟刷新一次页面，可及时看到企业发来的面试通知的邀请，根据企业的面试通知要求，添加该企业的</font><font face="Times New Roman" >QQ</font><font face="宋体" >，并与该企业预约时间排队等待面试。</font></span></p>
  <p  style="  line-height:150%;  " ><span style="font-family:'Times New Roman';  font-size:10.5000pt;  " ><span >4.&nbsp;</span></span><span style="'yes'; font-family:宋体; font-size:10.5000pt;  " >个人添加了企业<font face="Times New Roman" >HR</font><font face="宋体" >的</font><font face="Times New Roman" >QQ</font><font face="宋体" >后，应及时在</font><font face="Times New Roman" >QQ</font><font face="宋体" >中创建一个</font><font face="Times New Roman" >QQ</font><font face="宋体" >分组如：&#8220;</font><font face="Times New Roman" >10.15</font><font face="宋体" >网络视频面试组&#8221;。并对每个企业的名称做好备注，如：&#8220;大秦人才</font><font face="Times New Roman" >+</font><font face="宋体" >刘经理&#8221;，这样洽谈会更加顺畅。</font></span></p>
  <p  style="  line-height:150%;  " ><span style="font-family:'Times New Roman';  font-size:10.5000pt;  " ><span >5.&nbsp;</span></span><span style="'yes'; font-family:宋体; font-size:10.5000pt;  " >个人可根据面试邀请，添加多家发来面试通知的<font face="Times New Roman" >QQ</font><font face="宋体" >，并计算好时间，与多家企业逐一进行视频面试。</font></span></p>
  <p  style=" line-height:150%; " ><span style="'yes'; font-family:宋体; color:rgb(255,0,0); font-size:10.5000pt;  " >企业使用方法：</span></p>
  <p  style="  line-height:150%;  " ><span style="font-family:'Times New Roman';  font-size:10.5000pt;  " ><span >6.&nbsp;</span></span><span style="'yes'; font-family:宋体; font-size:10.5000pt;  " >企业入场前，应提前报名参会，并完善好企业相关资料，发布招聘职位，上传营业执照，代码证，以便主办方审核。</span></p>
  <p  style="  line-height:150%;  " ><span style="font-family:'Times New Roman';  font-size:10.5000pt;  " ><span >7.&nbsp;</span></span><span style="'yes'; font-family:宋体; font-size:10.5000pt;  " >企业入场前，应提前登录面试<font face="Times New Roman" >QQ</font><font face="宋体" >，如果面试的</font><font face="Times New Roman" >HR</font><font face="宋体" >有两位，可告知求职人员，添加另外一个</font><font face="Times New Roman" >HR</font><font face="宋体" >的</font><font face="Times New Roman" >QQ</font><font face="宋体" >面试。</font></span></p>
  <p  style="  line-height:150%;  " ><span style="font-family:'Times New Roman';  font-size:10.5000pt;  " ><span >8.&nbsp;</span></span><span style="'yes'; font-family:宋体; font-size:10.5000pt;  " >企业入场后，根据求职者发来的简历，应及时查看并在求职者简历上，确定是否发放面试通知。企业每<font face="Times New Roman" >10</font><font face="宋体" >分钟应刷新一次页面，可及时看到求职者投递来的简历。</font></span></p>
  <p  style="  line-height:150%;  " ><span style="font-family:'Times New Roman';  font-size:10.5000pt;  " ><span >9.&nbsp;</span></span><span style="'yes'; font-family:宋体; font-size:10.5000pt;  " >QQ<font face="宋体" >面试结束以后，需要点击该求职者的简历，并继续发放&#8220;面试未通过&#8221;或&#8220;复试通知&#8221;或&#8220;录用通知&#8221;，如果发放了录用通知，企业必须按约定录用该学生，并与之商量签订纸质版的三方协议，商定到岗时间。</font></span></p>
  <p  style="  line-height:150%;  " ><span style="font-family:'Times New Roman';  font-size:10.5000pt;  " ><span >10.&nbsp;</span></span><span style="'yes'; font-family:宋体; font-size:10.5000pt;  " >企业通过系统发放的录用通知，同步发放到该求职者所读高校就业办会员中心，企业方也可以致电该校，确认录用事宜。以便求职者办理离校手续。</span></p>
  <p  style="  line-height:150%;  " ><span style="font-family:'Times New Roman';  color:rgb(255,0,0); font-size:10.5000pt;  " ><span >五．&nbsp;</span></span><span style="'yes'; font-family:宋体; color:rgb(255,0,0); font-size:10.5000pt;  " >招聘会时效性</span></p>
  <p  style="  line-height:150%;  " ><span style="font-family:'Times New Roman';  font-size:10.5000pt;  " ><span >1.&nbsp;</span></span><span style="'yes'; font-family:宋体; font-size:10.5000pt;  " >网络招聘会开始前<font face="Times New Roman" >30</font><font face="宋体" >分钟，个人和企业方可入场。招聘结束后，个人和企业一经退出，就不能再入场，网络招聘会结束。企业和个人可在自己会员中心查看面试通知和录用通知，自行协商后续事宜。</font></span></p>
  <p  style="  line-height:150%;  " ><span style="font-family:'Times New Roman';  font-size:10.5000pt;  " ><span >2.&nbsp;</span></span><span style="'yes'; font-family:宋体; font-size:10.5000pt;  " >招聘会举行期间，个人和企业不得随意将<font face="Times New Roman" >QQ</font><font face="宋体" >离线、或退出网络招聘会页面会场，招聘会时间一般为一天</font><font face="Times New Roman" >8</font><font face="宋体" >小时：早</font><font face="Times New Roman" >9</font><font face="宋体" >点&#8212;</font><font face="Times New Roman" >12</font><font face="宋体" >点，下午</font><font face="Times New Roman" >2</font><font face="宋体" >点&#8212;</font><font face="Times New Roman" >6</font><font face="宋体" >点。中间休息</font><font face="Times New Roman" >2</font><font face="宋体" >小时。如确需离场，请及时处理完面试通知。</font></span></p>
  <p  style="  line-height:150%;  " ><span style="font-family:'Times New Roman';  font-size:10.5000pt;  " ><span >3.&nbsp;</span></span><span style="'yes'; font-family:宋体; font-size:10.5000pt;  " >企业中途离场，需在网络招聘会页面，点击&#8220;一键屏蔽招聘岗位&#8221;，至此不再接收到该会场求职者投递来的简历；</span></p>
  <p  style="  line-height:150%;  " ><span style="font-family:'Times New Roman';  font-size:10.5000pt;  " ><span >4.&nbsp;</span></span><span style="'yes'; font-family:宋体; font-size:10.5000pt;  " >个人中途离场，需在会员中心点击&#8220;一键屏蔽求职状态&#8221;，至此不再接收到该会场企业发来的面试邀请。</span></p>
  <p  style="  line-height:150%;  " ><span style="font-family:'Times New Roman';  color:rgb(255,0,0); font-size:10.5000pt;  " ><span >六．&nbsp;</span></span><span style="'yes'; font-family:宋体; color:rgb(255,0,0); font-size:10.5000pt;  " >违规处罚</span></p>
  <p  style="  line-height:150%; " ><span style="'yes'; font-family:宋体; font-size:10.5000pt;  " >以上规则，请参会企业与个人严格遵守。</span></p>
  <p  style="  line-height:150%;  " ><span style="font-family:'Times New Roman';  font-size:10.5000pt;  " ><span >1.&nbsp;</span></span><span style="'yes'; font-family:宋体; font-size:10.5000pt;  " >如求职者违反，企业可在&#8220;个人简历&#8221;页面点击&#8220;投诉&#8221;&nbsp;并写明投诉内容。</span></p>
  <p  style="  line-height:150%;  " ><span style="font-family:'Times New Roman';  font-size:10.5000pt;  " ><span >2.&nbsp;</span></span><span style="'yes'; font-family:宋体; font-size:10.5000pt;  " >如企业违反，求职者可在&#8220;企业简介&#8221;页面点击&#8220;投诉&#8221;，&nbsp;并写明投诉内容。</span></p>
  <p  style="  line-height:150%;  " ><span style="font-family:'Times New Roman';  font-size:10.5000pt;  " ><span >3.&nbsp;</span></span><span style="'yes'; font-family:宋体; font-size:10.5000pt;  " >投诉内容，将发至我站管理中心。违规行为一经查实，本站有权删除违规者账号，并列入黑名单。</span></p>
  <p  style="  line-height:150%;  " ><span style="font-family:'Times New Roman';  font-size:10.5000pt;  " ><span >4.&nbsp;</span></span><span style="'yes'; font-family:宋体; font-size:10.5000pt;  " >违反法律法规者，本站将向公安机关举报，当事人需自负后果。</span></p>
  <p  style="line-height:150%; " ><span style="'yes'; font-family:宋体; font-size:10.5000pt;  " >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;211<font face="宋体" >校招网</font></span></p>
  <p  style="line-height:150%; " ><span style="'yes'; font-family:宋体; font-size:10.5000pt;  " >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;陕西新才网络技术有限公司</span></p>
  <p  style="text-align:right;padding-right:260px;line-height:150%; " ><span style="'yes'; font-family:'Times New Roman';  font-size:10.5000pt;  " >2015-10-17</span></p>
</div>
</div><!-- agree_textarea -->
	</div>
	<div style="line-height:1.5em;text-align:center;padding-top:15px;">
  <label><input type="checkbox" checked="checked" id="checkbox_agree"/><span style="font-family:宋体; font-size:10.5000pt;  " >我已详细阅读本参会须知，并承诺严格遵守，如有违反，将接受<font face="Times New Roman" >211</font><font face="宋体" >校招网所有处罚措施。</font></span>
  </label>
	</div>
	<div style="text-align:center;padding:10px;">
		<button id="send_btn" class="btn btn-success btn-large">关闭</button><span id="send_msg"></span>
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
		var height =window.screen.availHeight-320;
		$("#agree_textarea").css({width:750,height:height});

		var parent = art.dialog.parent,				// 父页面window对象
		api = art.dialog.open.api;	// 			art.dialog.open扩展方法
		if (!api) return;
		$("#send_btn").bind("click",function(){
			art.dialog.close();
		});
		if( wellcome=='wellcome'){
			$("#checkbox_agree").attr("disabled",true);
			var contentHeight=$(".Section0").height();
			$("#agree_textarea").bind("scroll",function(e ){
				$this= $(this);
				if(  $this.scrollTop()>= (contentHeight-500) ){
					$("#checkbox_agree").attr("disabled",false);
					wait=0;
					o.attr("disabled", false);//倒计时过程中禁止点击按钮 
					o.text("关闭");//改变按钮中value的值 
					p.html(""); 
					$(this).die();
				}
			});
			var o=$("#send_btn");
			var p=$("#send_msg");
			time(o,p);
		}
		$("#checkbox_agree").click(function(){
			 if( $(this).attr("checked") ){
			 	$("#send_btn").attr("disabled",false);
			 }else{
			 	$("#send_btn").attr("disabled",true);
			 }
		});
		// parent.document.title = 'iframe中的javascirpt到此一游';
		// 操作对话框
		//api.title('参会须知');
})();

</script>
</body>
</html>
