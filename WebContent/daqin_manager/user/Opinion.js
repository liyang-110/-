/* =======================================================*/
// 功能：意见反馈
/* ===================================================== */
$(function() {
		getData();
		//ajaxdata1();
		searchForm("#resultId", getUrl, getData);
		linkSelectCode('area_id','in_area_id',false,'','',1);
		$('#searchAndreloadData').bind("click",function(){
			searchForm("#resultId", getUrl, getData);
		});
		typeSelectCombobox();
	});
function typeSelectCombobox()
{
		$("#in_type").combobox({
			                    valueField: 'id',
			                    textField: 'text',
			                    panelHeight: 'auto',
			                    width:60
			                });
		 $("#in_type").combobox('loadData', [{ "text": "全部", "id": "" },
		 { "text": "企业", "id": "company" },{ "text": "分站", "id": "substation" }
		 ] );
		 $("#in_type").combobox('select', "");
}
/* =======================================================*/
// 函数作用：绘制页面
/* ===================================================== */
function getData() {
	$('#resultId').datagrid( {
		//title : '招聘会管理',
		columns : [ [
		{
			field : 'add_time',
			title : ' 时间',
			width:60
		},{
			field : 'user_type',
			title : ' 用户类型',
			width:30
		},{
			field : 'names',
			title : '用户名称',
			width:100
		},{
			field : 'introduce',
			title : '反馈内容',
			width:230
		},{
			field : 'tel',
			title : '联系电话',
			width:40
		},{
			field : 'provenance',
			title : ' 反馈类型',
			width:30
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
/*
* 函数作用：异步加载
*/
function ajaxdata1(){
	var cur_page_size = $('#resultId').datagrid('options').pageSize;
	ajaxData('#resultId', getUrl, getData, undefined, cur_page_size, undefined);
}
/* =======================================================*/
// 函数作用：得到查询路径
/* ===================================================== */
function getUrl() {
	var ls_url ="";
		ls_url = cur_path + "/esbServer.do?method=execProc&methodId=ad_opinion_query&in_r=ad&in_role_id="+role_id;
	return ls_url;	
	}
/* =======================================================*/
// 函数作用：加载或刷新数据
// 输入参数及数据类型： 
//            ini_pagesize            当前每页行数
//            ini_pagenum             当前页码
//            ini_currentnum          当前行
// 返回参数及数据类型： 无
/* ===================================================== */
	function downOrreloadData(ini_pagesize,ini_pagenum,ini_currentnum){
		$('#resultId').datagrid( {
			pageNumber : 1,
			pageSize : ini_pagesize
		    });
		ajaxData('#resultId',getUrl,getData,ini_pagenum,ini_pagesize,ini_currentnum); 
	}
/* =======================================================*/
// 函数作用：关闭弹出窗口
// 输入参数及数据类型：
//            ini_pagesize            当前每页行数
//            ini_pagenum             当前页码
//            ini_currentnum          当前行
/* ===================================================== */
function closepage(ini_pagesize,ini_pagenum,ini_currentnum) { 
	$('#dlg_deal').dialog('close') ;
	ajaxData("#resultId", getUrl, getData, ini_pagenum, ini_pagesize, ini_currentnum);
}