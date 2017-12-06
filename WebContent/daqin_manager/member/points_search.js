/* =======================================================*/
// 功能：企业点数消耗明细查询
/* ===================================================== */
$(function() {
		getData();
		ajaxdata1();
	});
/* =======================================================*/
// 函数作用：绘制页面
/* ===================================================== */
function getData() {
	$('#resultId').datagrid( {
		title :false,
		columns : [ [{
			field : 'add_time',
			title : '时间'
		},{
			field : 'points',
			title : '点数' ,
			formatter : function(value,row,index){
								value=-value;
								if(value>=0)
									return "<span style='color:green;'>"+value+"</span>";
								else
									return "<span style='color:red;'>"+value+"</span>";
							}
		},{
			field : 'curr_points',
			title : '剩余'
		},{
			field : 'reason',
			title : '说明'
		},{
			field : 'job_fair_name',
			title : '招聘会名称',
			formatter: function(value,row,index){
								if(value=='' || value==null ) 
									return '';
								else 
									return '<a href="'+cur_path+'/jobfairInfo.do?id='+row.job_fair_id+'" target="_blank">'+value+'</a>';
							}
		}
		] ],

		type : 'POST',
		nowrap : true,
		striped : false,
		fit : true,
		width : 500,
		height : 'auto',
		url : '',
		pageSize : 10,
		remoteSort : false,
		pagination : true,
		rownumbers : true,
		singleSelect : true,
		collapsible : false,
		rownumbers : true,
		nowrap : true,
		striped : true
	});
}
/*
* 函数作用：异步加载
*/
function ajaxdata1(){
	ajaxData('#resultId', getUrl, getData, undefined, 20, undefined);
}
/* =======================================================*/
// 函数作用：得到查询路径
/* ===================================================== */
function getUrl() {
	var ls_url ="";
		ls_url = cur_path + "/esbServer.do?method=execProc&methodId=points_01&in_URLEncoding=UTF-8&in_r=ad&in_company_id="+company_id;
	return ls_url;	
	}