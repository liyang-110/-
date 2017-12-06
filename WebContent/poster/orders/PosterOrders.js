/* =======================================================*/
// 功能：招聘会管理
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
		title : '在线制作海报',
		toolbar:[{  
            text:'添加',  
            iconCls:'icon-add',
            handler:function(){
						add();
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
            	$.messager.alert("提示信息","正在开发！","info",function(){
            		scrollTop();
            	});
						//	del();
            	}  
        },{  
            text:'预览',  
            iconCls:'icon-view',  
            handler:function(){
					view();
				}
        },{  
            text:'提交打印',  
            iconCls:'icon-add',  
            handler:function(){
            	$.messager.alert("提示信息","正在开发！","info",function(){
            		scrollTop();
            	});
            	}  
        }
        ],
        frozenColumns : [ [
		{
			field : 'ck',
			checkbox:true,
			width : 50
			
		}]],
		
		columns : [ [ {
			field : 'add_time',
			title : '创建时间'
		},{
			field : 'remark',
			title : '说明',
			formatter : function(value,row,index){
				return '<a href="'+cur_path+'/poster/index.jsp?oid='+row.order_id+'" target="_blank">'+value+'</a>';
			}
		},{
			field : 'status',
			title : '状态'
		}
		] ], 

		type : 'GET',
		nowrap : true,
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
	var cur_page_size = $('#resultId').datagrid('options').pageSize;
	ajaxData('#resultId', getUrl, getData, undefined, cur_page_size, undefined);
}
/* =======================================================*/
// 函数作用：得到查询路径
/* ===================================================== */
function getUrl() {
	var ls_url ="";
		ls_url = cur_path + "/esbServer.do?method=execProc&methodId=poster_orders&in_URLEncoding=UTF-8"+param;
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
	
function view() {
	var li_currentnum =0; //当前行
	var li_pagesize   =0; //每页行数
	var li_pagenum    =0; //页码
	
	var lo_selected;      //当前选中行
    var lo_pg;            //分页对象
	var ls_id="";	  //

    //得到选中行对象 code:请选择一行用户信息！
    lo_selected   = getCheckObj('resultId','请选择一行！');   
    if(lo_selected.length!=1){
    	$.messager.alert('提示信息','请选择一行！','info',function(){
            		scrollTop();
            	});
    	return false;
    }else{
	    li_currentnum = $("#resultId").datagrid("getRowIndex",lo_selected[0]);
	    ls_id     = lo_selected[0].order_id;
        lo_pg         = $("#resultId").datagrid("getPager");
        li_pagenum    = lo_pg.pagination('options').pageNumber;
    	window.open( cur_path+'/poster/index.jsp?oid='+ls_id);
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
function closetemplet(ini_pagesize,ini_pagenum,ini_currentnum) {
	$('#dlg_deal').dialog('close') ;
	$.messager.confirm("提示信息","海报保存成功！",function(r){
		if(r){
			ajaxData("#resultId", getUrl, getData, ini_pagenum, ini_pagesize, ini_currentnum);
		}
	});
}
/* =======================================================*/
// 函数作用：按条件搜索招聘会
// 输入参数及数据类型： 
//            ini_pagesize            当前每页行数
//            ini_pagenum             当前页码
//            ini_currentnum          当前行
// 返回参数及数据类型： 无
/* ===================================================== */
	function searchAndreloadData(){
		var cur_page_size = $('#resultId').datagrid('options').pageSize;
		ajaxData('#resultId',getSearchUrl,getData,undefined,cur_page_size,undefined); 
	}
	function getSearchUrl()
	{
		var in_title=  $('#in_title').val() ;
		var in_type_id=$('input[name=in_type_id]').val();
		var url = getUrl();
		return url+"&in_title="+in_title+
				        "&in_type_id="+in_type_id;
	}
/* =======================================================*/
// 函数作用：打开新增页面
// 输入参数及数据类型：
//			  无
// 返回参数及数据类型：无
/* ===================================================== */
function add(){
	var li_currentnum = 0; //当前行
	var li_pagesize = 0; //每页行数
	var li_pagenum = 0; //页码
	var lo_selected;          //当前选中行
	var lo_pg;                //分页对象
	lo_selected = $("#resultId").datagrid("getSelected");                                               
	if (lo_selected) {
		li_currentnum = $("#resultId").datagrid("getRowIndex", lo_selected);
	}
	lo_pg = $("#resultId").datagrid("getPager");
	li_pagenum = lo_pg.pagination("options").pageNumber;
	li_pagesize = lo_pg.pagination("options").pageSize;
	$("#if_deal")[0].src = "../templet/jPosterTemplet.jsp?pagesize=" + li_pagesize + "&pagenum=" + li_pagenum + "&currentnum=" + li_currentnum;
	$("#dlg_deal").dialog("open").dialog("setTitle", "新选择模板");
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
    					ls_id += "&in_content_mgr"+i+"="+ lo_selected[i].id;
   					}
   					ls_url = cur_path + "/esbServer.do?method=execProc&methodId=bottom_content_del" + ls_id+param+"&date="+new Date();
				    ajaxDealUrl(ls_url,'删除文件成功',downOrreloadData);
	    	 	}
	    	 });
		            
      		
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
	    li_currentnum = $("#resultId").datagrid("getRowIndex",lo_selected[0]);
	    ls_id     = lo_selected[0].order_id;
        lo_pg         = $("#resultId").datagrid("getPager");
        li_pagenum    = lo_pg.pagination('options').pageNumber;
		/*
        $('#if_deal')[0].src='./jPosterOrdersEdit.jsp?id='+ls_id+'&in_pagesize=' + li_pagesize+'&in_pagenum=' + li_pagenum+'&in_currentnum=' +li_currentnum +param+"&date="+new Date();
		$('#dlg_deal').dialog('open').dialog('setTitle','编辑'); 
    	*/
    	$.messager.confirm("提示信息","请在新页面中修改并保存。保存成功请点击确定！",function(r){
    		ajaxData("#resultId", getUrl, getData, li_pagenum, li_pagesize, li_currentnum);
    		window.parent.$('body,html').animate({scrollTop:0},200);
    	});
    	window.open( './jPosterOrdersEdit.jsp?id='+ls_id);
    }
}
function scrollTop()
{
	  window.parent.$('body,html').animate({scrollTop:0},200);
}