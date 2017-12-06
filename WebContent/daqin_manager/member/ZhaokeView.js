/////////////////////////////////////////////////////////////////////
/* =======================================================*/
// 函数作用：页面初始化函数
// 输入参数及数据类型：无
// 返回参数及数据类型：无
/* ===================================================== */
$(function () {
	setTimeout("setData()", 500);
	$("#btn_save").click(function(){
		save();
	});
	$("#btn_return").click(function(){
		closePage();
	});
});
/* =======================================================*/
// 函数作用：加载信息
// 输入参数及数据类型：
// 返回参数及数据类型：
/* ===================================================== */
function setData() {	
	var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=zk_user_update&in_action=view&in_user_code=" + user_code + "&date=" + new Date();

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
function closePage() {
	//window.parent.closepage(gi_pagesize, gi_pagenum, gi_currentnum);
	window.parent.closePageCancel();
}
function save() {
	if( $("#in_message").val() == '' ){
		$.messager.alert("提示信息","消息内容不能为空！","info");
		return;
	}
	var mems=$("#in_message").val();
	var send_type='ad';
	var read_type="zk";
	
    var ls_url = cur_path + "/esbServer.do?in_URLEncoding=UTF-8&method=execProc&methodId=zk_message_query&in_r=ad&in_read_person="+user_code+"&in_action=send&in_sms_type=zk_area&in_user_code="+operuser+"&in_memo1="+area_id+"&in_memo2="+company_id+"&in_read_person="+user_code+"&in_read_type="+read_type+"&in_message="+mems+"&date="+new Date();
	ajaxDealUrl(ls_url,'操作成功',closePage);
}
function sendShotMessageTo(){
	var contact_tel=$('#in_user_tel').text();
	parent.sendShotMessageTo(contact_tel);
}