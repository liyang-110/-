/* =======================================================*/
// 函数作用：页面初始化函数
// 输入参数及数据类型：无
// 返回参数及数据类型：无
/* ===================================================== */
$(function () {
	linkSelectCode('job_fair_level','in_education',true,'','',1);
	//linkSelectCode('money','in_money',true ,'','money_02');
	linkSelectCode('sex','in_sex',true,'','',1);
	
	//绑定按钮相应事件
	$("#btn_save").click(function(){
		save();
	});
	$("#btn_return").click(function(){
		closePage();
	});
	$("#areas").bind("click",function(){
		JumpSearchLayer(2,'fm','in_area','areas',1);
	});
	$("#positions").bind("click",function(){
		JumpSearchLayer(1,'fm','in_position','positions',1);
	});
	/*
	$("#in_job_name").focus(function(){

		if( $("#in_job_name").val()=='' ){
			$("#in_job_name").val( $("#positions").val() );
		}
	});
	*/
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
	if( $("#in_job_name").val()=='' ){
		$("#in_job_name").val( $("#positions").val() );
	}
	
	if($("#in_money_1").val()!=0 || $("#in_money_2").val()!=0){
		var in_money=$("#in_money_1").val()+"-"+$("#in_money_2").val();
		$("#in_money").val(in_money);
	}
	
	if( !$('#fm').form("validate") )return;
	/* 已审核会员发布职位无限制 */
	saveFmData();
	return;
	/* 已审核会员发布职位无限制 */
	if(chargetype ==2 ){
		saveFmData();
		return;
	}
	var cur_points=0;
	var set_points=0;
	var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=login_points_confirm&in_add_person="+user_code+"&in_id="+company_id+"&in_r=co&in_role=company&in_compare=points8&date=" + new Date();
	$.post(ls_url,{}
	).done(function(data){
		var data = $.parseJSON( decodeURIComponent(data) );
		/*
		{"returncode":"ok" , "errordesc":"" ,"queryresult":[{"'ok'":"ok"}]} 
		*/
		if(data.returncode =='ok'){
			cur_points=data.queryresult[0].points;
			set_points=data.queryresult[0].compare;
			if(set_points>cur_points){
				$.messager.alert('提示信息','本操作需要点数'+set_points+'，您当前点数'+cur_points+',点数不足！','error');
			}else{
				confirmed(cur_points,set_points);
			}			
		}else{
			$.messager.alert('提示信息',data.errordesc,'error');
			return;
		}
	}).fail(function(){
		$.messager.alert('提示信息','服务器错误，请稍后再试！','info');
		return;
	});
}
function confirmed(points,compare){
	$.messager.confirm('提示信息', '当前点数'+points+'<br/>本次将扣除点数'+compare, function(r){
		if (r){		
			saveFmData();
		}
	});
}
function saveFmData()
{
	var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=company_recruit_03&in_r=ad&in_company_id="+company_id+"&date=" + new Date();
   //处理数据 调用公用js保存数据函数 code:数据添加成功
	saveData(ls_url, closePage, "\u6570\u636e\u6dfb\u52a0\u6210\u529f\uff01");

}
