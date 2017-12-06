/* =======================================================*/
// 函数作用：页面初始化函数
// 输入参数及数据类型：无
// 返回参数及数据类型：无
/* ===================================================== */
$(function () {
	/*
	linkSelectCodeS('area_station','in_area_id',false,'','',function(){
		linkSelectCodeS('school','in_owner_id',false,$('#in_area_id').combobox('getValue'),'');
	});
	*/
	linkSelectCode('area_station','in_area_id',false,'','');
	//绑定按钮相应事件
	$("#btn_save").click(function(){
		save();
	});
	$("#btn_return").click(function(){
		closePage();
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
// 函数作用：返回调用页面
// 输入参数及数据类型：无
// 返回参数及数据类型：无
/* ===================================================== */
function closePage() {
	window.parent.closepage(gi_pagesize, gi_pagenum, gi_currentnum);
}
/* =======================================================*/
// 函数作用：保存数据并返回调用页面
// 输入参数及数据类型：无
// 返回参数及数据类型：无
/* ===================================================== */
function save() {
	var file_id = $("#file_id").val();
	var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=ad_03&in_ad_type=friendlink&date=" + new Date()+"&in_file_id="+file_id;
   //处理数据 调用公用js保存数据函数 code:数据添加成功
	saveData(ls_url, closePage, "\u6570\u636e\u6dfb\u52a0\u6210\u529f\uff01");
}