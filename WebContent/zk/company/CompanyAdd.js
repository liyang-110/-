/* =======================================================*/
// 函数作用：页面初始化函数
// 输入参数及数据类型：无
// 返回参数及数据类型：无
/* ===================================================== */
$(function () {
	linkSelectCode('area_id','in_area_id',true,'','');
	linkSelectCode('company_nature','in_company_nature',true,'','');
	linkSelectCode('company_person_num','in_company_person_num',true,'','');
	linkSelectCode('company_registered_capital','in_company_registered_capital',true,'','');
	//绑定按钮相应事件
	$("#btn_save").click(function(){
		save();
	});
	$("#btn_return").click(function(){
		closePage();
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
/* =======================================================*/
// 函数作用：保存数据并返回调用页面
// 输入参数及数据类型：无
// 返回参数及数据类型：无
/* ===================================================== */
function save() {
	var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=zk_company_add&in_r=zk&date=" + new Date();
	   //处理数据 code:数据修改成功
	zk_saveData(ls_url, closePage, "保存成功！");
}
function zk_saveData(ins_url,ins_upFun,ins_msg) {
	if($("#btn_save").attr("disabled")){
		return false;
	}
    $('#fm').form('submit', {
        url: ins_url,
        onSubmit: function() {
        	if($(this).form('validate')){
        		$("#btn_save").attr("disabled","disabled");
        	}
            return $(this).form('validate');
        },
        success: function(data) {
        	$("#btn_save").removeAttr("disabled");
        	data = decodeURIComponent(data);
            var re = eval("[" + data + "]");
            //console.info(re);
            if (re.length > 0 && re[0].returncode == 'ok') {
            	 var queryresult =re[0].queryresult;
            	if(queryresult[0].ok=='ok'){ 
		                 $.messager.alert('\u63d0\u793a\u4fe1\u606f',ins_msg,'info',function(){//提示信息
		                 	if(typeof(ins_upFun) !='undefined'){
		                 		ins_upFun();
		                 	}
		            	});
		          }else{
                		$.messager.alert('\u9519\u8bef\u4fe1\u606f', queryresult[0].msg, 'alert');//错误信息
		          }
            } else {
                $.messager.alert('\u9519\u8bef\u4fe1\u606f', data, 'alert');//错误信息
            }
        }
    });
}