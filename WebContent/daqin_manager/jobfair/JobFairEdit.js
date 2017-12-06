/////////////////////////////////////////////////////////////////////
/* =======================================================*/
// 函数作用：页面初始化函数
// 输入参数及数据类型：无
// 返回参数及数据类型：无
/* ===================================================== */
$(function () {
    linkSelectCode('jobfair_type','in_job_fair_type',true,'','organises');
	//linkSelectCode('job_fair_level','in_job_fair_level',true,'','');
	linkSelectCode('job_fair_feature','in_job_fair_feature',true,'','');
    
    
    $("#in_job_fair_type").combobox({
       onChange: function(newValue) {
        	if (newValue=="organises"){
        	
        		// $("#in_job_fair_name").attr("disabled", true); 
        		//$("#in_job_fair_name").val("企业宣讲会");
        		
        		$("#in_job_fair_company_num").attr("disabled", true); 
        		$('#in_job_fair_company_num').numberspinner('setValue', 1);  
        		
        	}else{
        		//$("#in_job_fair_name").attr("disabled", false);
        		$("#in_job_fair_company_num").attr("disabled", false); 
        	}
        	
       }
    });
    
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
	var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=ad_job_fair_view&in_id=" + id + "&date=" + new Date();
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
			$("input[name=job_fair_level]").each(function(){
				if(  initdata[0].in_job_fair_level &&  initdata[0].in_job_fair_level.indexOf( $(this).val() )>=0 ){
					$(this).attr("checked",true);
				}
			});
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
	$("#in_job_fair_name").attr("disabled", false); 
	$("#in_job_fair_company_num").attr("disabled", false);

	var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=ad_job_fair_edit&in_r=ad&in_id=" + id+"&date=" + new Date();
	   //处理数据 code:数据修改成功
	saveData(ls_url, closePage, "\u6570\u636e\u4fee\u6539\u6210\u529f\uff01");
	
	
}