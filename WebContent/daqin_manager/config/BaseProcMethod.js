/* =======================================================*/
// 功能：招聘会管理
/* ===================================================== */
$(function() {
		getData();
		ajaxdata1();
		
			$("#btn_save").bind("click", function () {
				save();
			});
			$("#btn_return").bind("click", function () {
				$('#edit').window('close');
			});
	});
/* =======================================================*/
// 函数作用：绘制页面
/* ===================================================== */
function getData() {
	$('#resultId').datagrid( {
		//title : '招聘会管理',
		toolbar:[{  
            text:'添加',  
            iconCls:'icon-add',  
            handler:function(){
							add();
                         }  
        },{  
            text:'复制',  
            iconCls:'icon-add',  
            handler:function(){
							add2();
                         }  
        },{  
            text:'修改',  
            iconCls:'icon-edit',  
            handler:function(){
							edit();
                         }  
        },{  
            text:'禁用',  
            iconCls:'icon-cancel1',  
            handler:function(){
							del();
                         }  
        }
        ],
		columns : [ [
		{
			field : 'in_method_code',
			title : '方法ID'
		},{
			field : 'in_method_name',
			title : '方法名称',
			width: 120
		},{
			field : 'method_status_name',
			title : '是否可用'
		},{
			field : 'in_method_proc',
			title : '对应存储'
		},{
			field : 'in_method_proc_arguments',
			title : '参数个数'
		},{
			field : 'in_method_proc_in',
			title : '入参名称'
		},{
			field : 'in_method_proc_out_cursor',
			title : '出参名称(游标)'
		},{
			field : 'in_method_proc_out_string',
			title : '出参名称(字符型)'
		},{
			field : 'in_method_mem',
			title : '方法描述'
		},{
			field : 'in_forward',
			title : '页面转向'
		},{
			field : 'in_pageforward',
			title : '类的内部页面转向'
		},{
			field : 'in_forwardtype',
			title : '转向（class/jsp）'
		},{
			field : 'return_type_name',
			title : '返回类型'
		},{
			field : 'in_memo1',
			title : 'memo1'
		},{
			field : 'in_memo2',
			title : 'memo2'
		},{
			field : 'in_memo3',
			title : 'memo3'
		},{
			field : 'in_memo4',
			title : 'memo4'
		},{
			field : 'in_memo5',
			title : 'memo5'
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
		fitColumns:false
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
		ls_url = cur_path + "/esbServer.do?method=execProc&methodId=base_method_query&in_URLEncoding=UTF-8";
	return ls_url;	
	}
/* =======================================================*/
// 函数作用：得到当前被选中行的对象
// 输入参数及数据类型： ins_id   数据显示域id
//					ins_msg  无选中行时提示信息
// 返回参数及数据类型： lo_selected 选中行对象
/* ===================================================== */
	function getCheckObj(ins_id,ins_msg){
		//当前选中行
		if (!$("#"+ins_id).datagrid("getSelections") || $("#"+ins_id).datagrid("getSelections")==""){
			return false;
		}else{
			var lo_selected= $("#"+ins_id).datagrid("getSelections");
			return lo_selected;
		}
		
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
// 函数作用：修改
// 输入参数及数据类型：无
// 返回参数及数据类型：无
/* ===================================================== */
function add() {
 	$('#fm').form('clear');
	 $('#edit').window('open');
	 $('#in_action').val("add");
	 $('#in_method_code').attr("disabled", false); 
}
/* =======================================================*/
// 函数作用：修改
// 输入参数及数据类型：无
// 返回参数及数据类型：无
/* ===================================================== */
function add2() {
	var li_currentnum =0; //当前行
	var li_pagesize   =0; //每页行数
	var li_pagenum    =0; //页码
	
	var lo_selected;      //当前选中行
    var lo_pg;            //分页对象
	var ls_id="";	  //编码

    //得到选中行对象 code:请选择一行用户信息！
    lo_selected   = getCheckObj('resultId','请选择一行信息！');   
    if(lo_selected.length!=1){
    	$.messager.alert('提示信息','请选择一行来进行复制！','info');
    	return false;
    }else{
	    var row = $('#resultId').datagrid('getSelected');
	    $('#fm').form('clear');
	    if (row){
	        $('#edit').window('open');
	        $('#fm').form('load', row);
	        $('#in_action').val("add");
	        $('#in_method_code').attr("disabled", false); 
	    } else {
	        $.messager.show({
	            title:'警告', 
	            msg:'错误'
	        });
	    }
    }
}
/* =======================================================*/
// 函数作用：修改
// 输入参数及数据类型：无
// 返回参数及数据类型：无
/* ===================================================== */
function edit() {
	var li_currentnum =0; //当前行
	var li_pagesize   =0; //每页行数
	var li_pagenum    =0; //页码
	
	var lo_selected;      //当前选中行
    var lo_pg;            //分页对象
	var ls_id="";	  //编码

    //得到选中行对象 code:请选择一行用户信息！
    lo_selected   = getCheckObj('resultId','请选择一行信息！');   
    if(lo_selected.length!=1){
    	$.messager.alert('提示信息','请选择一行来进行修改！','info');
    	return false;
    }else{
	    var row = $('#resultId').datagrid('getSelected');
	    $('#fm').form('clear');
	    if (row){
	    	$('#in_method_code').attr("disabled", true); 
	        $('#edit').window('open');
	        $('#fm').form('load', row);
	        $('#in_action').val("edit");
	    } else {
	        $.messager.show({
	            title:'警告', 
	            msg:'错误'
	        });
	    }
    }
}
/* =======================================================*/
// 函数作用：关闭弹出窗口
// 输入参数及数据类型：
//            ini_pagesize            当前每页行数
//            ini_pagenum             当前页码
//            ini_currentnum          当前行
/* ===================================================== */
function closeEditWin() { 
	$('#edit').window('close');
	
	var ini_pagenum = $('#resultId').datagrid('options').pageNumber;
	var ini_pagesize = $('#resultId').datagrid('options').pageSize;
	var ini_currentnum = $('#resultId').datagrid('getRowIndex', $('#resultId').datagrid('getSelected') );
	
	ajaxData("#resultId", getUrl, getData, ini_pagenum, ini_pagesize, ini_currentnum);
}
/* =======================================================*/
// 函数作用：保存数据并返回调用页面
// 输入参数及数据类型：无
// 返回参数及数据类型：无
/* ===================================================== */
function save() {
	$('#in_method_code').attr("disabled", false); 
	var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=base_method_update&date=" + new Date();
	   //处理数据 code:数据修改成功
	saveData(ls_url, closeEditWin, "\u6570\u636e\u4fee\u6539\u6210\u529f\uff01");
}
/* =======================================================*/
// 函数作用：修改
// 输入参数及数据类型：无
// 返回参数及数据类型：无
/* ===================================================== */
function del() {
	var li_currentnum =0; //当前行
	var li_pagesize   =0; //每页行数
	var li_pagenum    =0; //页码
	
	var lo_selected;      //当前选中行
    var lo_pg;            //分页对象
	var ls_id="";	  //编码

    //得到选中行对象 code:请选择一行用户信息！
    lo_selected   = getCheckObj('resultId','请选择一行信息！');   
    if(lo_selected.length!=1){
    	$.messager.alert('提示信息','请选择一行来进行删除！','info');
    	return false;
    }else{
	    var row = $('#resultId').datagrid('getSelected');
	    $('#fm').form('clear');
	    if (row){
	        $('#fm').form('load', row);
	        $('#in_action').val("del");
	        $('#in_method_code').attr("disabled", false); 
	        $.messager.confirm('提示信息', '您确定要进行删除操作吗?', function(r){
	    	 	if (r){
	    	 		save();
	    	 	}
	    	 });
	    } else {
	        $.messager.show({
	            title:'警告', 
	            msg:'错误'
	        });
	    }
    }
}