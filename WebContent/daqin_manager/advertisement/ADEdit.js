/////////////////////////////////////////////////////////////////////
/* =======================================================*/
// 函数作用：页面初始化函数
// 输入参数及数据类型：无
// 返回参数及数据类型：无
/* ===================================================== */
$(function () {
	linkSelectCode('area_station','in_area_id',false,'','');
	/*
	$('#in_school_name').combobox({valueField: 'id',
												textField: 'text',
												data:[{text: '无',id: ''}],
												editable:false,
												disabled:true});

	 $("#in_area_id").combobox({
	   onChange: function(newValue, oldValue) {
	   							$('#in_school_name').combobox("destroy");
	   							
								linkSelectData('area_school','in_owner_id',false,newValue,'');
								// linkSelectCode('area_school','in_school_id',false,newValue,'');
	 					}
	 });
	*/
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
	var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=ad_04&in_id=" + id + "&date=" + new Date();
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
	var file_id = $("#file_id").val();
	var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=ad_05&in_ad_type=friendlink&in_id="+id+"&date=" + new Date()+"&in_file_id="+file_id;
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