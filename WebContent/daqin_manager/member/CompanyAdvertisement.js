/////////////////////////////////////////////////////////////////////
/* =======================================================*/
// 函数作用：页面初始化函数
// 输入参数及数据类型：无
// 返回参数及数据类型：无
/* ===================================================== */
$(function () {
	//给按钮绑定事件
	$("#btn_save").bind("click", function () {
		edit();
	});
	$("#btn_return").bind("click", function () {
		closePageCancel();
	});
	$('#in_begindate').datebox({
		value:initdate(),
	    required: true
	});	
	$('#in_enddate').datebox({
		value:initdate(),
	    required: true
	});	
   
});
function initdatetime(){
	var date=new Date();
    var y = date.getFullYear();
    var m = date.getMonth()+1;
   var d = date.getDate();
	var h = date.getHours();
  	var i = date.getMinutes();
    return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d)+' '+ (h<10?('0'+h):h)+':'+(i<10?('0'+i):i);
}
function initdate(){
	var date=new Date();
    var y = date.getFullYear();
    var m = date.getMonth()+1;
   var d = date.getDate();
    return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
}
/* =======================================================*/
// 函数作用：加载信息
// 输入参数及数据类型：
// 返回参数及数据类型：
/* ===================================================== */
function setData() {	
	var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=login_04&in_r=ad&in_id=" + id + "&date=" + new Date();
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
		if (re.length > 0 && re[0].returncode == "ok") {
			initdata= re[0].queryresult;
			$("#fm").form("load", initdata[0]);
		}
	}});
}
/* =======================================================*/
// 函数作用：返回调用页面
// 输入参数及数据类型：无
// 返回参数及数据类型：无
/* ===================================================== */
function closePage() {
	window.parent.closepage(gi_pagesize, gi_pagenum, gi_currentnum);
}
function closePageCancel(){
	window.parent.closePageCancel();
}
/* =======================================================*/
// 函数作用：保存数据并返回调用页面
// 输入参数及数据类型：无
// 返回参数及数据类型：无
/* ===================================================== */
function edit() {
	var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=ad_03&in_r=ad&date=" + new Date();
	saveData(ls_url, closePage, "操作成功！");
}