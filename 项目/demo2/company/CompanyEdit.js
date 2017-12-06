/////////////////////////////////////////////////////////////////////
/* =======================================================*/
// 函数作用：页面初始化函数
// 输入参数及数据类型：无
// 返回参数及数据类型：无
/* ===================================================== */
$(function () {
	/*linkSelectCode('area','in_shi_id',false,'','');
	linkSelectCode('area','in_qu_id',false,'','');
	linkSelectCodeS('area_id','in_area_id',false,'','',function(){
		$('#in_qu_id').combobox("clear");
		linkSelectCodeS('area','in_shi_id',false,$('#in_area_id').combobox('getValue'),'', function(){
			linkSelectCodeS('area','in_qu_id',false,$('#in_shi_id').combobox('getValue'),'');
		});
	});*/
	linkSelectCode('area_id','in_area_id',true,'','');
	linkSelectCode('company_nature','in_company_nature',true,'','');
	linkSelectCode('company_person_num','in_company_person_num',true,'','');
	linkSelectCode('company_registered_capital','in_company_registered_capital',true,'','');
	setTimeout("setData()", 500);
	//给按钮绑定事件
	$("#btn_save").bind("click", function () {
		edit();
	});
	$("#btn_return").bind("click", function () {
		closePage();
	});
   
});
function initdatetime(){
	var date=new Date();
    var y = date.getFullYear();
    var m = date.getMonth()+1;
   var d = date.getDate();
	var h = date.getHours();
  	var i = date.getMinutes();
    return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d)+' '+ (h<10?('0'+h):h)+':'+(i<10?('0'+i):i);
}
function initdate(){
	var date=new Date();
    var y = date.getFullYear();
    var m = date.getMonth()+1;
   var d = date.getDate();
    return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
}
function editEmail()
{
	$.messager.confirm("提示信息","修改邮箱后，需要重新验证，确定修改吗？",function(r){
		if(r){
			$('#in_email').attr("disabled",false );
			$('#email_tip_2').siblings('label').hide();
			$('#email_tip_2').show();
		}
	});
}
/* =======================================================*/
// 函数作用：加载信息
// 输入参数及数据类型：
// 返回参数及数据类型：
/* ===================================================== */
function setData() {	
	var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=company_04&in_r=ad&in_id="+id+"&date=" + new Date();
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
			if( initdata[0].email_verify=='success' ){
				$('#in_email').attr("disabled",true);
				$('#email_tip_1').show();
			}else{
				$('#email_tip_3').show();
			}
			if( initdata[0].in_company_name!=""&& initdata[0].in_company_name!=null){
				$('#in_company_name').attr("disabled",true);
			}else{
				$("#in_company_name_tip").show();
			}
			if( initdata[0].in_establish_date=="" ||  initdata[0].in_establish_date==null ){
			//	$('#in_establish_date').datebox("setValue",initdate() );
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
	location.reload();
	window.parent.$('body,html').animate({scrollTop:0},200);
}
/* =======================================================*/
// 函数作用：保存数据并返回调用页面
// 输入参数及数据类型：无
// 返回参数及数据类型：无
/* ===================================================== */
function edit() {
	$('#in_company_name').attr("disabled",false);
	var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=company_05&in_r=co&in_id=" + id+"&date=" + new Date();
	   //处理数据 code:数据修改成功
	saveData(ls_url, closePage, "\u6570\u636e\u4fee\u6539\u6210\u529f\uff01");
}