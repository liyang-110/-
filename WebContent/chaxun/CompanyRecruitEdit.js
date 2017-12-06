/////////////////////////////////////////////////////////////////////
/* =======================================================*/
// 函数作用：页面初始化函数
// 输入参数及数据类型：无
// 返回参数及数据类型：无
/* ===================================================== */
$(function () {
	linkSelectCode('job_fair_level','in_education',true,'','',1);
	//linkSelectCode('money','in_money',true,'','');
	linkSelectCode('sex','in_sex',true,'','',1);
    
	setTimeout("setData()", 500);
	//给按钮绑定事件
	$("#btn_save").bind("click", function () {
		edit();
	});
	$("#btn_return").bind("click", function () {
		closePage();
	});
	$("#areas").bind("click",function(){
		JumpSearchLayer(2,'fm','in_area','areas',1);
	});
	$("#positions").bind("click",function(){
		JumpSearchLayer(1,'fm','in_position','positions',1);
	});
	//工资面议响应事件
	$("#in_money_cus").bind("click",function(){
		$("#in_money_1,#in_money_2").toggle(
				function(){
					$("#in_money_1,#in_money_2").val(0);
					$("#in_money").val("");////初始化<input id=in_money>
				});
		
	});
});
/* =======================================================*/
// 函数作用：加载信息
// 输入参数及数据类型：
// 返回参数及数据类型：
/* ===================================================== */
function setData() {	
	var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=company_recruit_04&in_r=co&in_id=" + id + "&date=" + new Date();
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
			if(initdata[0].in_sex=='' || initdata[0].in_sex==null )
			{
				$("#in_sex").combobox('select',"");
			}
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
	if($("#in_money_1").val()!=0 || $("#in_money_2").val()!=0){
		var in_money=$("#in_money_1").val()+"-"+$("#in_money_2").val();
		$("#in_money").val(in_money);
	}
	var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=company_recruit_05&in_r=ad&in_id=" + id+"&date=" + new Date();
	   //处理数据 code:数据修改成功
	saveData(ls_url, closePage, "\u6570\u636e\u4fee\u6539\u6210\u529f\uff01");
	
	
}