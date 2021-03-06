/* =======================================================*/
// 函数作用：页面初始化函数   daqin_manager/member
// 输入参数及数据类型：无
// 返回参数及数据类型：无
/* ===================================================== */
$(function () { 
	linkSelectCode('member_type','in_member_type',true,'','');
	linkSelectCode('area_id','in_area_id',true,'','');
	linkSelectCode('company_nature','in_company_nature',true,'','');
	linkSelectCode('company_person_num','in_company_person_num',true,'','');
	linkSelectCode('company_registered_capital','in_company_registered_capital',true,'','');
	
	//二级行业下拉框
	linkSelectCode('industry','in_big',false,'','');
	 $("#in_big").combobox({
		   onChange: function(newValue, oldValue) {
			   $("#in_industry").val( newValue );
			   linkSelectCode(newValue,'in_small',false,'','');
		 	}
	});
	$("#in_small").combobox({
		   onChange: function(newValue, oldValue){
						if( newValue !='' ){
							$("#in_industry").val( newValue );
						}else{
							$("#in_industry").val( $("#in_big").combobox("getValue") );
						}
		   }
	});				
	//绑定按钮相应事件
	$("#btn_save").click(function(){
		save();
	});
	$("#btn_return").click(function(){
		closePageCancel();
	});
});
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
function save() {
	var ls_url = cur_path + "/esbServer.do?method=execProc&in_r=ad&methodId=ad_user_company_add&date=" + new Date();
   //处理数据 调用公用js保存数据函数 code:数据添加成功
	saveData(ls_url, closePage, "\u6570\u636e\u6dfb\u52a0\u6210\u529f\uff01");
}