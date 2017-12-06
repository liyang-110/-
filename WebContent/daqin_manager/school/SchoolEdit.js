/////////////////////////////////////////////////////////////////////
/* =======================================================*/
// 函数作用：页面初始化函数
// 输入参数及数据类型：无
// 返回参数及数据类型：无
/* ===================================================== */
$(function () {
	linkSelectCode('area_id','in_area_id',true,'','');
	/*$('#in_shi_id').combobox();
	$('#in_qu_id').combobox();
	linkSelectCode('area','in_shi_id',false,'','');
	linkSelectCode('area','in_qu_id',false,'','');
	linkSelectCodeS('area_id','in_area_id',false,'','',function(){
		$('#in_qu_id').combobox("clear");
		linkSelectCodeS('area','in_shi_id',false,$('#in_area_id').combobox('getValue'),'', function(){
			linkSelectCodeS('area','in_qu_id',false,$('#in_shi_id').combobox('getValue'),'');
		});
	});*/
	
	setTimeout("setData()", 500);
	//给按钮绑定事件
	$("#btn_save").bind("click", function () {
		edit();
	});
	$("#btn_return").bind("click", function () {
		closePage();
	});
   
});
/* =======================================================*/
// 函数作用：加载信息
// 输入参数及数据类型：
// 返回参数及数据类型：
/* ===================================================== */
function setData() {	
	var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=school_04&in_id=" + id + "&date=" + new Date();
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
			if( initdata[0].in_school_name!=""&& initdata[0].in_school_name!=null){
				// $('#in_school_name').attr("disabled",true);
			}
			$("#pic1").val(initdata[0].in_school_logo);
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
/* =======================================================*/
// 函数作用：保存数据并返回调用页面
// 输入参数及数据类型：无
// 返回参数及数据类型：无
/* ===================================================== */
function edit() {
	// $('#in_school_name').attr("disabled",false);
	var file_id = $("#file_id").val();
	var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=school_05&in_id=" + id+"&date=" + new Date()+"&in_file_id="+file_id;
	   //处理数据 code:数据修改成功
	saveData(ls_url, closePage, "\u6570\u636e\u4fee\u6539\u6210\u529f\uff01");
	
	
}