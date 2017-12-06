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
		// title : '基础编码管理',
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
            text:'删除',  
            iconCls:'icon-cancel1',  
            handler:function(){
							//del();
							alert("不允许删除");
                  }  
        }
        ],
        frozenColumns : [ [
			{
			field : 'row_no',
			checkbox:true,
			width : 50
			
		}]],
		columns : [ [
		{
			field : 'in_type_code',
			title : '类型编码'
		},{
			field : 'in_type_name',
			title : '会员名称'
		},{
			field : 'in_points1',
			title : '申请招聘会扣点'
		},{
			field : 'in_points2',
			title : '申请失败退点'
		},{
			field : 'in_points3',
			title : '接受招聘会邀请扣点'
		},{
			field : 'in_points4',
			title : '发布招聘会扣点'
		},/*{
			field : 'in_points5',
			title : '信息审核'
		},*/{
			field : 'in_points8',
			title : '发布职位扣点'
		},{
			field : 'in_points9',
			title : '下载简历扣点'
		},{
			field : 'in_chargetype',
			title : '付费方式',
			formatter : function(value,row,index){
				if(value==3){
					return '招聘会套餐会员';
				}else if(value==1){
					return '普通会员';
				}else{
					return value;
				}
			}
		},{
			field : 'in_multiple',
			title : '参加招聘会'
		},{
			field : 'in_organises',
			title : '发布宣讲会'
		},{
			field : 'in_recruit',
			title : '发布职位数'
		},{
			field : 'in_resume',
			title : '下载简历数'
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
		collapsible : true,
		iconCls : 'icon-ok',
		rownumbers : true,
		nowrap : true,
		striped : true,
		border : false
	});
}
/*
* 函数作用：异步加载
*/
function ajaxdata1(){
	ajaxData('#resultId', getUrl, getData, undefined, undefined, undefined);
}
/* =======================================================*/
// 函数作用：得到查询路径
/* ===================================================== */
function getUrl() {
	var ls_url ="";
		ls_url = cur_path + "/esbServer.do?method=execProc&methodId=member_type&in_r=ad&in_URLEncoding=UTF-8";
	return ls_url;	
	}
/* =======================================================*/
// 函数作用：打开新增页面
// 输入参数及数据类型：
//			  无
// 返回参数及数据类型：无
/* ===================================================== */
var blank_form_data={"in_resume":0,"in_organises":0,"in_type_code":"member_type_","in_points3":0,"in_multiple":0,"in_points2":0,"in_chargetype":1,"in_points1":0,"in_points8":0,"in_recruit":0,"in_points5":0,"in_type_name":"会员类型","in_type_no":0,"in_points9":0,"in_points4":0};
function add() {
 	//$('#fm').form('clear');
 	 $('#fm').form('load', blank_form_data );
	 $('#edit').window('open');
	 $('#in_action').val("add");
	 $('#in_type_code').attr("disabled", false); 
}
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
	        $('#in_type_code').attr("disabled", false); 
	    } else {
	        $.messager.show({
	            title:'警告', 
	            msg:'错误'
	        });
	    }
    }
}
/* =======================================================*/
// 函数作用：删除（批量删除）
/* ===================================================== */
   function del() {
		var lo_selected;      //当前选中行
	    var ls_id = "";        //用户id
	    var ls_url;           //url
	    var ls_sign="";
	    lo_selected   = getCheckObj('resultId','请选择要删除的用户选项！'); 
	    if(!lo_selected[0]){
	    	$.messager.alert('提示信息','请选择要删除的文件！','info');
	    	return false;
	    }else{
	    	 $.messager.confirm('提示信息', '您确定要进行删除操作吗?', function(r){
	    	 	if (r){
	    	 		for(var i=0;i< lo_selected.length;i++){
    					ls_id += "&in_base_code_mgr"+i+"="+ lo_selected[i].row_no;
   					}
   					ls_url = cur_path + "/esbServer.do?method=execProc&methodId=base_code_02" + ls_id+"&date="+new Date();
				    ajaxDealUrl(ls_url,'删除文件成功',downOrreloadData);
	    	 	}
	    	 });
		            
      		
        }
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
			pageSize : 10
		    });
		ajaxData('#resultId',getUrl,getData,ini_pagesize,ini_pagenum,ini_currentnum); 
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
	    	$('#in_type_code').attr("disabled", true); 
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


function view() {
	var li_currentnum =0; //当前行
	var li_pagesize   =0; //每页行数
	var li_pagenum    =0; //页码
	
	var lo_selected;      //当前选中行
    var lo_pg;            //分页对象
	var ls_id="";	  //

    //得到选中行对象 code:请选择一行用户信息！
    lo_selected   = getCheckObj('resultId','请选择一行信息！');   
    if(lo_selected.length!=1){
    	$.messager.alert('提示信息','请选择一行来查看！','info');
    	return false;
    }else{
	    li_currentnum = $("#resultId").datagrid("getRowIndex",lo_selected[0]);
	    ls_id     =  lo_selected[0].row_no;
        lo_pg         = $("#resultId").datagrid("getPager");
        li_pagenum    = lo_pg.pagination('options').pageNumber;

        $('#if_deal')[0].src='./jBaseCodeView.jsp?id='+ls_id+'&in_pagesize=' + li_pagesize+'&in_pagenum=' + li_pagenum+'&in_currentnum=' +li_currentnum +"&date="+new Date();
	    $('#dlg_deal').dialog('open').dialog('setTitle','查看'); 
    }
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
function save() {
	$('#in_type_code').attr("disabled", false); 
	var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=member_type&in_r=ad&date=" + new Date();
	   //处理数据 code:数据修改成功
	saveData(ls_url, closeEditWin, "\u6570\u636e\u4fee\u6539\u6210\u529f\uff01");
}
function closeEditWin() { 
	$('#edit').window('close');
	var ini_pagenum = $('#resultId').datagrid('options').pageNumber;
	var ini_pagesize = $('#resultId').datagrid('options').pageSize;
	var ini_currentnum = $('#resultId').datagrid('getRowIndex', $('#resultId').datagrid('getSelected') );
	ajaxData("#resultId", getUrl, getData, ini_pagenum, ini_pagesize, ini_currentnum);
}
 
 
