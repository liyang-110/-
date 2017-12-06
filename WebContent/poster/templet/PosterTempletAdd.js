/* =======================================================*/
// 函数作用：页面初始化函数
// 输入参数及数据类型：无
// 返回参数及数据类型：无
/* ===================================================== */
$(function () {
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
	var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=poster_templet&in_action=add"+param+"&date=" + new Date();
   //处理数据 调用公用js保存数据函数 code:数据添加成功
	saveData(ls_url, closePage, "\u6570\u636e\u6dfb\u52a0\u6210\u529f\uff01");
}
function linkSelectData(ins_sqlid,ins_id,inb_checkone,ins_ld,ins_checkvalue){
  var ls_url = cur_path + "/esbServer.do?method=execClass&methodId=base_select_001&sqlId="+ins_sqlid+"&arguments="+ins_ld ;
  var ls_return;
  var lo_data;
    $.ajax({
        url: ls_url,
        type: "post",
        dataType: "text",
        success: function(data) {
            if (data) 
            {
            	data = decodeURIComponent(data);
            	ls_return = eval("[" + data + "]");
            	 if (ls_return.length > 0 && ls_return[0].returncode == 'ok') {
	                $("#"+ins_id).combobox({disabled:false});
	                $("#"+ins_id).combobox("clear");
	                $("#"+ins_id).combobox({
	                    valueField: 'id',
	                    textField: 'text'
	                });
            	 	$("#"+ins_id).combobox("loadData",ls_return[0].queryresult);
            	 	 lo_data = $('#'+ins_id).combobox('getData');
            	 	 $("#"+ins_id).combobox('select', lo_data[0]['id']);
            	 }
			}else{
					$("#"+ins_id).combobox({valueField: 'id',
												textField: 'text',
												data:[{text: '无',id: ''}],
												editable:false,
												disabled:true});
            }
        },
		contentType:"application/x-www-form-urlencoded; charset=utf-8"
    });
}