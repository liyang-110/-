/////////////////////////////////////////////////////////////////////
/* =======================================================*/
// 函数作用：页面初始化函数
// 输入参数及数据类型：无
// 返回参数及数据类型：无
/* ===================================================== */
$(function () {
	linkSelectCode('member_type','in_member_type',false,'','');
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
	var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=ad_user_query&in_id=" + id + "&in_user_type="+user_type+"&date=" + new Date();
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
	window.parent.closepage(gi_pagesize, gi_pagenum, gi_currentnum);
}
/* =======================================================*/
// 函数作用：保存数据并返回调用页面
// 输入参数及数据类型：无
// 返回参数及数据类型：无
/* ===================================================== */
function edit() {
	var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=ad_modify_member_type&in_id=" + id+"&date=" + new Date();
	   //处理数据 code:数据修改成功
	// saveData(ls_url, closePage, "\u6570\u636e\u4fee\u6539\u6210\u529f\uff01");
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
        	//console.info(data);
            var re = eval("[" + data + "]");
            if (re.length > 0 && re[0].returncode == 'ok') {
            	 var record = re[0].queryresult;
            	 if( record[0].status =='fail'){
                 	$.messager.alert('\u63d0\u793a\u4fe1\u606f',record[0].msg,'info');
				}else{
					$.messager.alert('\u63d0\u793a\u4fe1\u606f','操作成功','info',function(){
						 closePage();
					});
				}                 
            } else {
                $.messager.alert('\u9519\u8bef\u4fe1\u606f', '通讯错误，请稍后重试', 'alert');//错误信息
            }
        }
    });
	
}