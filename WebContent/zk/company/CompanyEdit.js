/////////////////////////////////////////////////////////////////////
/* =======================================================*/
// 函数作用：页面初始化函数
// 输入参数及数据类型：无
// 返回参数及数据类型：无
/* ===================================================== */
$(function () {
	/*linkSelectCode('area','in_shi_id',false,'','');
	linkSelectCode('area','in_qu_id',false,'','');
	linkSelectCodeS('area_id','in_area_id',false,'','',function(){
		$('#in_qu_id').combobox("clear");
		linkSelectCodeS('area','in_shi_id',false,$('#in_area_id').combobox('getValue'),'', function(){
			linkSelectCodeS('area','in_qu_id',false,$('#in_shi_id').combobox('getValue'),'');
		});
	});*/
	linkSelectCode('area_id','in_area_id',true,'','');
	linkSelectCode('company_nature','in_company_nature',true,'','');
	linkSelectCode('company_person_num','in_company_person_num',true,'','');
	linkSelectCode('company_registered_capital','in_company_registered_capital',true,'','');
    
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
	var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=zk_company_update&in_preview=preview&in_company_id="+id+"&date=" + new Date();
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
			if( initdata[0].in_company_name!=""&& initdata[0].in_company_name!=null){
				// $('#in_company_name').attr("disabled",true);
			}
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
	// $('#in_company_name').attr("disabled",false);
	var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=company_05&in_id=" + id+"&date=" + new Date();
	   //处理数据 code:数据修改成功
	saveData(ls_url, closePage, "\u6570\u636e\u4fee\u6539\u6210\u529f\uff01");
	
	
}