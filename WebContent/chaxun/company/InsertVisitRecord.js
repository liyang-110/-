/////////////////////////////////////////////////////////////////////
/* =======================================================*/
// 函数作用：页面初始化函数
// 输入参数及数据类型：无
// 返回参数及数据类型：无
/* ===================================================== */
$(function () {   
	//setTimeout("setData()", 500);
	//给按钮绑定事件
	$("#btn_save").bind("click", function () {
		add();
	});
	$("#btn_return").bind("click", function () {
		closePage();
	});
});
$.extend($.fn.validatebox.defaults.rules, {  
    /*必须和某个字段相等*/
    equalTo: {
    	validator:function(value,param){
    		return $(param[0]).val() == value;
    	},
    	message:'确认密码不一致'
    }
          
});
/* =======================================================*/
// 函数作用：返回调用页面
// 输入参数及数据类型：无
// 返回参数及数据类型：无
/* ===================================================== */
function closePage() {
	window.parent.closePageCancel();
}
/* =======================================================*/
// 函数作用：保存数据并返回调用页面
// 输入参数及数据类型：无
// 返回参数及数据类型：无
/* ===================================================== */
function add() {
    $.ajax({
        url: "/daqin_manager/visitRecord.do?type=update",
        data : $("#fm").serialize(),
        type: "post",
        dataType: "text",
        success: function(data) {
            if( data =='1'){
            	$.messager.alert('提示信息','录入成功！','info',function(){
            		parent.window.closepage();
            	});
            }else{
            	$.messager.alert('提示信息','录入失败！','info');
            }
            return;
        },
        complete: function () {//完成响应
        },
        contentType:"application/x-www-form-urlencoded; charset=utf-8"
    });
}