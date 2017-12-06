/////////////////////////////////////////////////////////////////////
/* =======================================================*/
// 函数作用：页面初始化函数
// 输入参数及数据类型：无
// 返回参数及数据类型：无
/* ===================================================== */
$(function () {
	$("#btn_save").click(function(){
		save();
	});
	$("#btn_return").click(function(){
		closePage();
	});
	$("#in_shift_points").bind("blur",function(){

		if( parseFloat( $(this).val())>parseFloat(  $("#shift_points").text() ) ) {
			$(this).val(  $("#shift_points").text() );
		}else if(  parseFloat( $(this).val())<0 ){
			$(this).val(  0 );
		}
		var shift_points=parseFloat( $(this).val() );
		var pay_fee=parseFloat( $("#in_pay_fee").val());
		var pay_price=parseFloat( $("#in_pay_price").val());
		var pay_amount= shift_points*pay_price*(1-pay_fee); 
		$("#in_pay_amount").val( Math.round(pay_amount*100)/100 );
	});
	setTimeout("setData()", 500);
});
/* =======================================================*/
// 函数作用：加载信息
// 输入参数及数据类型：
// 返回参数及数据类型：
/* ===================================================== */
function setData() {	
	var ls_url = cur_path + "/esbServer.do?method=execProc&r=ad&methodId=zk_user_query&in_action=view_zk&in_user_code=" + user_code + "&date=" + new Date();

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
			 showData(initdata[0]);
			 $("#in_zk_id").val(initdata[0].in_user_code);
			 $("#in_pay_fee").val(initdata[0].pay_fee);
			 $("#in_pay_price").val(initdata[0].pay_price);
			 $("#expression").val("×"+initdata[0].pay_price+"×"+(1-parseFloat(initdata[0].pay_fee)) )
		}
	}});
	
}
function closePage() {
	window.parent.closepage(gi_pagesize, gi_pagenum, gi_currentnum);
}
/* =======================================================*/
// 函数作用：保存数据并返回调用页面
// 输入参数及数据类型：无
// 返回参数及数据类型：无
/* ===================================================== */
function save() {
	if( $("#in_pay_amount").val() <= 0 ){
		$.messager.alert("提示信息","支付金额必须大于0！","info");
		return;
	}
	var ls_url = cur_path + "/esbServer.do?method=execProc&r=ad&in_action=pay_amount&methodId=zk_user_query&date=" + new Date();
   //处理数据 调用公用js保存数据函数 code:数据添加成功
	saveData(ls_url, closePage, "\u6570\u636e\u6dfb\u52a0\u6210\u529f\uff01");
}
