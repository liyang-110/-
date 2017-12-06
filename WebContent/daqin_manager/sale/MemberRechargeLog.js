/* =======================================================*/
// 功能：会员套餐充值记录,初始化
$(function() {
		getData();
		ajaxdata1();
		$('#searchAndreloadData').bind("click",function(){
			searchJobfair();
		});
	});
/* =======================================================*/
// 函数作用：绘制页面
function getData() {
	$('#resultId').datagrid( {
		//title : '招聘会管理',
		columns : [ [
		{
			field : 'add_time',
			title : '操作时间',
			width:100
		},{
			field : 'admin_name',
			title : '管理员',
			width:80
		}/*,{
			field : 'user_type',
			title : '用户类型',
			width:50
		}*/,{
			field : 'user_name',
			title : '用户名称',
			width:120
		},{
			field :'member_types',
			title :'会员类型',
			width:100
		},{
			field :'begin_date',
			title :'开始时间',
			width:100
		},{
			field :'end_date',
			title :'结束时间',
			width:100
		},{
			field :'recharge',
			title :'充值点数',
			width:80
		},{
			field :'multiple',
			title :'现场招聘会',
			width:80
		},{
			field :'netcongress',
			title :'网络招聘会',
			width:80
		},{
			field :'sms_add',
			title :'短信',
			width:40
		},{
			field :'weixin',
			title :'微信推广',
			width:80
		},{
			field :'recruit_issue',
			title :'发布职位',
			width:80
		},{
			field :'recruit_refresh',
			title :'职位刷新',
			width:80
		},{
			field :'recruit_hot',
			title :'职位急聘',
			width:80
		}
		] ],
		type : 'POST',
		nowrap : true,
		striped : false,
		fit : true,
		width : 500,
		height : 'auto',
		url : '',
		pageSize : 20,
		remoteSort : false,
		pagination : true,
		rownumbers : true,
		singleSelect : true,
		collapsible : false,
		iconCls : 'icon-ok',
		nowrap : false,
		striped : true,
		border:false,
		fitColumns:true
	});
}
/* =======================================================*/
// 函数作用：异步数据加载
function ajaxdata1(){
	var cur_page_size = $('#resultId').datagrid('options').pageSize;
	ajaxData('#resultId', getUrl, getData, undefined, cur_page_size, undefined);
}
/* =======================================================*/
// 函数作用：得到查询路径
function getUrl() {
	var ls_url ="";
		ls_url = cur_path + "/esbServer.do?method=execProc&methodId=admin_recharge_query&r=ad&date="+new Date();
	return ls_url;	
	}
/* =======================================================*/
//搜索函数
function searchJobfair(){
	var cur_page_size = $('#resultId').datagrid('options').pageSize;
	searchForm("#resultId", getUrl, getData,1,cur_page_size);
}