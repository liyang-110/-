/////////////////////////////////////////////////////////////////////
/* =======================================================*/
// 函数作用：页面初始化函数
// 输入参数及数据类型：无
// 返回参数及数据类型：无
/* ===================================================== */
$(function () {
	setTimeout("setData()", 500);
	
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
	var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=zk_pay_query&in_buss_id=zk_points&in_zk_id=" + user_code + "&date=" + new Date();
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
			
		}
	}});
	
}
/* =======================================================*/
// 函数作用：返回调用页面
// 输入参数及数据类型：无
// 返回参数及数据类型：无
/* ===================================================== */
function closePage() {
	window.parent.closepage();
}
/* =======================================================*/
// 函数作用：保存数据并返回调用页面
// 输入参数及数据类型：无
// 返回参数及数据类型：无
/* ===================================================== */
function edit() {
	var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=zk_pay_query&in_buss_id=zk_points_charge&in_zk_id=" + user_code + "&date=" + new Date();
	   //处理数据 code:数据修改成功
	// saveData(ls_url, closePage, "\u6570\u636e\u4fee\u6539\u6210\u529f\uff01");
 	var cur_points = $("#in_shift_points").text();
 	var charge_points = $("#in_recharge").val();
 	if(cur_points<charge_points){
 		$.messager.alert("错误信息","提现点数不能超过当前账户余额！","error");
 		return;
 	}
 	$('#fm').form('submit', {
        url: ls_url,
        onSubmit: function() {
        	if($(this).form('validate')){
        		$("#btn_save").attr("disabled","disabled");
        	}
            return $(this).form('validate');
        },
        success: function(data) {
			
        	data = decodeURIComponent(data);
            var re = eval("[" + data + "]");
            //console.info(re);
            if (re.length > 0 && re[0].returncode == 'ok') {
            	 var record = re[0].queryresult;
            	 if( record[0].ok =='fail'){
                 	$.messager.alert('\u63d0\u793a\u4fe1\u606f',record[0].msg,'info',function(){
                 		 // closePage();
                 	});
				}else{
					$.messager.alert('\u63d0\u793a\u4fe1\u606f','提交申请成功！','info',function(){
						 closePage();
					});
				}                 
            } else {
                $.messager.alert('\u9519\u8bef\u4fe1\u606f', '通讯错误，请稍后重试', 'alert');//错误信息
            }
        }
    });
}